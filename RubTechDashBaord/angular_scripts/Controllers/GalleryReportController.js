var app = angular.module("dashboardApp"); // Do not redefine []

app.controller('GalleryReportController', function ($scope, $http) {

    $scope.getReports = function () {
        $http.post('https://api-test2.salesgenx.in/GalleryReport/GetGalleryReport')
            .then(function (response) {
                console.log('API Response:', response.data);

                if (Array.isArray(response.data)) {
                    console.log("Gallery Report Api Response : ", response.data);
                    $scope.reports = response.data.map(report => ({
                        ID: report.ID,
                        ReportName: report.ReportName,
                        ImagePaths: report.ImagePaths ? report.ImagePaths.map(image => {
                            return 'https://api-test2.salesgenx.in/Content/Uploads/' +
                                (image.includes('\\') ? image.split('\\').pop() : image.split('/').pop());
                        }) : []

                    }));
                } else {
                    console.error("Invalid response format:", response.data);
                    $scope.reports = [];
                }
            })
            .catch(function (error) {
                console.error('Error fetching reports:', error);
            });
    };

    $scope.getReports();

    //$scope.uploadFiles = function (files) {
    //    if (files.length > 0) {
    //        $scope.$applyAsync(() => {
    //            $scope.reportImages = [];

    //            for (let i = 0; i < files.length; i++) {
    //                $scope.reportImages.push(files[i]);
    //            }

    //            console.log("Selected Images:", $scope.reportImages);
    //        });
    //    }
    //};

    // Insert Report
    $scope.uploadFiles = function (files) { // This Function Handles Multiple images type and size validation  

        $scope.reportImages = []; // ✅ Valid images ko store karne ke liye array
        $scope.ErrorMessage = ""; // ✅ Error message clear karenge

        var maxSize = 40 * 1024 * 1024; // ✅ 100 KB max size
        var allowedTypes = ['image/jpeg', 'image/png', 'image/jpg']; // ✅ Allowed formats

        for (let i = 0; i < files.length; i++) {
            let file = files[i];

            if (allowedTypes.indexOf(file.type) === -1) {
                Swal.fire("Error!", "Invalid File Type! Only JPG, PNG, and JPEG Allowed", "error");
                document.getElementById("reportImageUpload").value = ""; // ✅ Reset file input
                return;
            }

            if (file.size > maxSize) {
                Swal.fire("Error!", "File size too large! Max allowed size is 100 KB.", "error");
                document.getElementById("reportImageUpload").value = ""; // ✅ Reset file input
                return;
            }

            $scope.reportImages.push(file); // ✅ Valid image add ho jayegi array me
        }

        //if ($scope.reportImages.length > 0) {
        //    //Swal.fire({
        //    //    title: "Success!",
        //    //    text: "All images are valid and ready for upload!",
        //    //    icon: "success",
        //    //    timer: 500, // ✅ 0.5 sec auto close
        //    //    showConfirmButton: false
        //    //});
        //}

        $scope.$apply(); // ✅ UI update ke liye apply karna padega
    };
    $scope.Insert = function () {
        $scope.ErrorMessage = "";

        if (!$scope.reportTitle) {
            $scope.ErrorMessage = "Please enter the Report Title";
            return false;
        }

        if (!$scope.reportImages || $scope.reportImages.length === 0) {
            $scope.ErrorMessage = "Please upload Report Images.";
            return false;
        }

        var formData = new FormData();
        formData.append("ReportName", $scope.reportTitle);

        for (let i = 0; i < $scope.reportImages.length; i++) {
            formData.append("ImagePaths[]", $scope.reportImages[i]);
        }

        $http.post('https://api-test2.salesgenx.in/GalleryReport/AddGalleryReport', formData, {
            transformRequest: angular.identity,
            headers: {
                'Content-Type': undefined,
                'Accept': 'application/json'
            }
        })
            .then(function (response) {
                console.log("Response:", response.data);

                if (response.data.Messege == "Gallery Report Added Successfully") {
                    Swal.fire({
                        title: "Success!",
                        text: "Report Inserted Successfully",
                        icon: "success",
                        confirmButtonText: "OK"
                    }).then(() => {
                        $scope.getReports();

                        // ✅ Reset input fields
                        $scope.reportTitle = "";
                        $scope.reportImages = [];
                        document.getElementById("reportImageUpload").value = ""; // ✅ Reset file input
                        $scope.$apply();
                    });
                } else {
                    Swal.fire("Error!", "Image upload failed. Please try again.", "error");
                }
            })
            .catch(function (error) {
                console.error("Error inserting report:", error);
                Swal.fire("Error!", "Error inserting report.", "error");
            });
    };

    // Function to open modal and set the selected report
    $scope.OpenRename = function (selectedReport, $event) {
        if ($event) $event.preventDefault();  // Refresh hone se rokne ke liye

        if (!selectedReport || !selectedReport.ReportName) {  // ✅ Correct parameter name
            console.error("❌ Report data not found:", selectedReport);
            return;
        }
        console.log('✅ Selected Gallery Report Name:', selectedReport);
        $scope.selectedReport = angular.copy(selectedReport);
        $('#renameReportModal').modal('show');
    };

    $scope.OpenAddImage = function (selectedReport, $event) {
        if ($event) $event.preventDefault();

        if (!selectedReport || !selectedReport.ID) {
            console.log("Report ID Not Found");
            return;
        }

        console.log("✅ Selected Report ID :", selectedReport.ID);
        $('#addGalleryReportImage').modal('show');
    }

    // Function to close the modal
    $scope.closeRenameModal = function () {
        $scope.showRenameModal = false;
    };

    $scope.OpenAddImage
    // Function to save the renamed report
    $scope.renameReport = function ($event) {

        if ($event) $event.preventDefault();

        console.log("🔍 Checking selectedReport in renameReport:", $scope.selectedReport);

        if (!$scope.selectedReport || !$scope.selectedReport.ReportName) {
            Swal.fire("Error", "Report Name cannot be empty!", "error");
            return;
        }

        var data = {
            ID: $scope.selectedReport.ID,
            ReportName: $scope.selectedReport.ReportName
        };

        console.log("🚀 Sending Data:", data);

        $http.post('https://api-test2.salesgenx.in/GalleryReport/RenameGalleryReport', data, {
            headers: { 'Content-Type': 'application/json' }
        })
            .then(function (response) {
                console.log("✅ API Response:", response);
                if (response.data.Messege === "Report Renamed Successfully") {
                    Swal.fire("Success", "Report renamed successfully!", "success")
                        .then(() => {
                            $scope.getReports(); // Refresh reports list
                            $scope.closeRenameModal();
                            $('#renameReportModal').modal('hide');
                        });
                } else {
                    Swal.fire("Error", "Failed to rename report", "error");
                }
            })
            .catch(function (error) {
                console.error("Rename error:", error);
                Swal.fire("Error", "Error renaming report", "error");
            });
    };

    //$scope.fileChanged = function (input) {
    //    if (input.files && input.files.length > 0) {
    //        $scope.singlereportimage = input.files[0]; // File store ho jayegi
    //        console.log("✅ Selected File:", $scope.singlereportimage);
    //        $scope.$apply(); // Changes ko manually apply karna padega
    //    }
    //};

    // Reset file input after upload

    $scope.fileChanged = function (element) {
        var file = element.files[0];
        if (file) {
            $scope.singlereportimage = file;
        } else {
            $scope.singlereportimage = null;
        }
        $scope.$apply();
    };
    $scope.resetFileInput = function () {
        var fileInput = document.getElementById("reportImageUpload");
        if (fileInput) {
            fileInput.value = "";
            fileInput.type = "text";
            fileInput.type = "file";
        }
        $scope.singlereportimage = null;
        $scope.$apply();
    };

    //$scope.addreportimage = function ($event) {
    //    if ($event) $event.preventDefault();

    //    if (!$scope.selectedReport || !$scope.selectedReport.ID) {
    //        Swal.fire("Error!", "Report ID Not Found!", "error");
    //        return;
    //    }

    //    if (!$scope.singlereportimage) {
    //        Swal.fire("Error!", "Please select an image!", "error");
    //        return;
    //    }

    //    var formData = new FormData();
    //    formData.append("id", $scope.selectedReport.ID);  // ✅ Report ID bind ho rahi hai
    //    formData.append("imagePath", $scope.singlereportimage);  // ✅ File bhi bind ho rahi hai

    //    console.log("✅ Form Data Sent:", formData);

    //    $http.post('api-rubtech.designaccentindia.comGalleryReport/AddGalleryReportSingleImage', formData, {
    //        transformRequest: angular.identity,
    //        headers: {
    //            'Content-Type': undefined,
    //            'Accept': 'application/json'
    //        }
    //    })
    //        .then(function (response) {
    //            console.log("✅ Response:", response.data);

    //            if (response.data.Messege == "Gallery Report Image Added Successfully") {
    //                Swal.fire({
    //                    title: "Success!",
    //                    text: "Report Inserted Successfully",
    //                    icon: "success",
    //                    confirmButtonText: "OK",
    //                    timer: 1000,
    //                    showConfirmButton: false
    //                }).then(() => {
    //                    $scope.getReports();

    //                    $scope.resetFileInput();  // ✅ File input reset properly hoga

    //                    // ✅ AngularJS ko manually trigger karna padega UI update ke liye
    //                    $scope.$apply();
    //                });
    //            } else {
    //                Swal.fire("Error!", "Image upload failed. Please try again.", "error");
    //            }
    //        })
    //        .catch(function (error) {
    //            console.error("❌ Error inserting report Image:", error);
    //            Swal.fire("Error!", "Error inserting report.", "error");
    //        });
    //};


    $scope.fileChanged = function (input) {
        var file = input.files[0]; // Single file
        var maxSize = 10 * 1024 * 1024; // 100 KB limit (change as needed)
        var allowedTypes = ['image/jpeg', 'image/png', 'image/jpg']; // ✅ Allowed formats

        if (!file) {
            Swal.fire("Error!", "Please select an image!", "error");
            return;
        }

        if (allowedTypes.indexOf(file.type) === -1) {
            Swal.fire("Error!", "Invalid File Type! Only JPG, PNG, and JPEG Allowed", "error");
            input.value = ""; // ✅ Reset file input
            return;
        }

        if (file.size > maxSize) {
            Swal.fire("Error!", "File size too large! Max allowed size is 100KB.", "error");
            input.value = ""; // ✅ Reset file input
            return;
        }

        $scope.singlereportimage = file; // ✅ Store valid image
        $scope.$apply();
        //Swal.fire({
        //    title: "Success!",
        //    text: "Image is valid and ready for upload!",
        //    icon: "success",
        //    timer: 700,  // ✅ 0.5 second (500ms) auto close
        //    showConfirmButton: false
        //});
    }; // This function is Used For adding single Report Image (Size & Type Validation)

    $scope.addreportimage = function ($event) {
        if ($event) $event.preventDefault();

        if (!$scope.selectedReport || !$scope.selectedReport.ID) {
            Swal.fire("Error!", "Report ID Not Found!", "error");
            return;
        }

        if (!$scope.singlereportimage) {
            Swal.fire("Error!", "Please select a valid image!", "error");
            return;
        }

        var formData = new FormData();
        formData.append("id", $scope.selectedReport.ID);  // ✅ Report ID bind ho rahi hai
        formData.append("imagePath", $scope.singlereportimage);  // ✅ File bhi bind ho rahi hai

        console.log("✅ Form Data Sent:", formData);

        $http.post('https://api-test2.salesgenx.in/GalleryReport/AddGalleryReportSingleImage', formData, {
            transformRequest: angular.identity,
            headers: {
                'Content-Type': undefined,
                'Accept': 'application/json'
            }
        })
            .then(function (response) {
                console.log("✅ Response:", response.data);

                if (response.data.Messege === "Gallery Report Image Added Successfully") {
                    Swal.fire({
                        title: "Success!",
                        text: "Report Inserted Successfully",
                        icon: "success",
                        confirmButtonText: "OK",
                        timer: 1000,
                        showConfirmButton: false
                    }).then(() => {
                        window.location.reload();  // ✅ Full page will reload here
                    });
                } else {
                    Swal.fire("Error!", "Image upload failed. Please try again.", "error");
                }
            })
            .catch(function (error) {
                console.error("❌ Error inserting report Image:", error);
                Swal.fire("Error!", "Error inserting report.", "error");
            });
    };

    $scope.deleteReport = function (selectedReport, $event) {
        if ($event) $event.preventDefault(); // Prevent default event behavior

        if (!selectedReport || !selectedReport.ID) {
            Swal.fire("Error", "Invalid report selected!", "error");
            return;
        }

        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#d33",
            cancelButtonColor: "#3085d6",
            confirmButtonText: "Yes, delete it!"
        }).then((result) => {
            if (result.isConfirmed) {

                var data = {
                    Id: $scope.selectedReport.ID
                };

                $http.post('https://api-test2.salesgenx.in/GalleryReport/DeleteGalleryReport', data, {
                    headers: { 'Content-Type': 'application/json' }
                })
                    .then(function (response) {
                        console.log("Delete API Response:", response);
                        if (response.data.Messege === "Report Deleted Successfully") {
                            Swal.fire("Deleted!", "Your Report has been deleted.", "success")
                                .then(() => {
                                    window.location.reload();
                                    /*$scope.getReports();*/ // Refresh report list
                                });
                        } else {
                            Swal.fire("Error", "Failed to delete report", "error");
                        }
                    })
                    .catch(function (error) {
                        console.error("Delete error:", error);
                        Swal.fire("Error", "Error deleting report", "error");
                    });
            }
        });
    };
    $scope.deleteImage = function (imagePath, $event) {  // ✅ Event object add kiya
        if ($event) {
            $event.preventDefault(); // ✅ Page reload hone se rokta hai
            $event.stopPropagation(); // ✅ Extra event execution ko rokta hai
        }

        if (!imagePath) {
            Swal.fire("Error!", "Invalid Image Path!", "error");
            return;
        }

        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!"
        }).then((result) => {
            if (result.isConfirmed) {
                var imageName = imagePath.split('/').pop(); // ✅ Extract image name
                var data = { imagePath: imageName };

                console.log("🔥 Sending API Request with Image Name:", data);

                $http.post('https://api-test2.salesgenx.in/GalleryReport/DeleteGalleryReportImage', data, {
                    headers: { 'Content-Type': 'application/json' }
                }).then(function (response) {
                    console.log("✅ Response:", response.data);

                    if (response.data.Messege == "Gallery Report Image Deleted Successfully") {
                        Swal.fire({
                            title: "Deleted!",
                            text: "Image has been deleted.",
                            icon: "success",
                            confirmButtonText: "OK",
                            timer: 1000,
                            showConfirmButton: false
                        }).then(() => {
                            // ✅ Remove image from UI
                            $scope.chunkedImages = $scope.chunkedImages.map(row =>
                                row.filter(img => img !== imagePath)
                            ).filter(row => row.length > 0);

                            // ✅ Force UI update
                            $scope.$apply();
                        });
                    } else {
                        Swal.fire("Error!", "Failed to delete image. Please try again.", "error");
                    }
                }).catch(function (error) {
                    console.error("❌ Error deleting image:", error);
                    Swal.fire("Error!", "Something went wrong.", "error");
                });
            }
        });
    };





    // Image Hovering Ka Code Hai

    $scope.lightboxVisible = false; // Initially popup hidden
    $scope.selectedImage = ""; // Current enlarged image
    $scope.currentIndex = 0; // Current index in image list

    $scope.lightboxVisible = false;
    $scope.selectedImage = "";
    $scope.currentIndex = 0;
    $scope.chunkedImages = [];

    $scope.openLightbox = function (image) {
        $scope.selectedImage = image;
        $scope.currentIndex = $scope.imagePaths.indexOf(image);
        $scope.lightboxVisible = true;
    };

    $scope.closeLightbox = function () {
        $scope.lightboxVisible = false;
    };

    // Navigate to Previous Image
    $scope.prevImage = function () {
        if ($scope.currentIndex > 0) {
            $scope.currentIndex--;
            $scope.selectedImage = $scope.imagePaths[$scope.currentIndex];
        }
    };

    // Navigate to Next Image
    $scope.nextImage = function () {
        if ($scope.currentIndex < $scope.imagePaths.length - 1) {
            $scope.currentIndex++;
            $scope.selectedImage = $scope.imagePaths[$scope.currentIndex];
        }
    };

    // 🔥 Single Watcher for Image Paths
    $scope.$watch("selectedReport.ImagePaths", function (newImages) {
        if (newImages) {
            $scope.imagePaths = newImages;
            $scope.chunkedImages = chunkArray(newImages, 4); // Create chunks of 4 images per row
        }
    });

    // Function to Split Images into Rows (4 per Row)
    function chunkArray(arr, chunkSize) {
        let result = [];
        for (let i = 0; i < arr.length; i += chunkSize) {
            result.push(arr.slice(i, i + chunkSize));
        }
        return result;
    }



});
