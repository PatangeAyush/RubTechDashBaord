var app = angular.module("dashboardApp");

app.controller('BannerController', function ($scope, $http) {

    // Fetch Banner Details
    $scope.getBanners = function () {
        $http.post('https://api-test2.salesgenx.in/Banner/GetBanner')
            .then(function (response) {
                console.log('API Response:', response.data);

                if (Array.isArray(response.data)) {
                    $scope.banners = response.data.map(banner => ({
                        ID: banner.Id,
                        ImagePath: banner.ImagePath ? 'https://api-test2.salesgenx.in/Content/Uploads/' + banner.ImagePath.split('\\').pop() : ''
                    }));
                } else {
                    console.error("Invalid response format:", response.data);
                    $scope.banners = [];
                }
            })
            .catch(function (error) {
                console.error('Error fetching banner details:', error);
            });
    };

    $scope.getBanners();



    $scope.uploadBannerFiles = function (files) {
        $scope.InsertErrorMessage = ""; // Reset any previous error message

        if (files.length > 0) {
            $scope.$applyAsync(() => {
                $scope.bannerImages = []; // Clear previous images

                let fileSizeExceeded = false;

                for (let i = 0; i < files.length; i++) {
                    let file = files[i];
                    let fileSizeInKB = file.size / 1024; // Convert to KB

                    if (fileSizeInKB > 100) {
                        fileSizeExceeded = true;
                        break; // Stop checking if any file exceeds the limit
                    } else {
                        $scope.bannerImages.push(file); // Add only valid files
                    }
                }

                if (fileSizeExceeded) {
                    $scope.InsertErrorMessage = "Each image must be less than 100 KB.";
                    $scope.bannerImages = []; // Clear invalid files
                    document.getElementById("bannerImageUpload").value = ""; // Reset file input
                    Swal.fire({
                        title: "File Too Large!",
                        text: "Please upload images smaller than 100 KB.",
                        icon: "warning",
                        confirmButtonText: "OK"
                    });
                }

                console.log("Selected Valid Banner Images:", $scope.bannerImages);
            });
        }
    };


    $scope.insertBanner = function () {
        $scope.InsertErrorMessage = "";


        if (!$scope.bannerImages || $scope.bannerImages.length === 0) {
            $scope.InsertErrorMessage = "Please upload Banner Images.";
            return;
        }

        let formData = new FormData();


        for (let i = 0; i < $scope.bannerImages.length; i++) {
            formData.append("bannerImages", $scope.bannerImages[i]);
        }

        console.log("Sending Banner Data:", formData);

        $http.post('https://api-test2.salesgenx.in/Banner/AddBanner', formData, {
            headers: { 'Content-Type': undefined },
            transformRequest: angular.identity
        })
            .then(response => {
                console.log("Response:", response.data);

                if (response.status === 200) {
                    Swal.fire({
                        title: "Success!",
                        text: "Banner Inserted Successfully",
                        icon: "success",
                        confirmButtonText: "OK"
                    }).then(() => {
                        $scope.getBanners();


                        $scope.bannerImages = [];
                        document.getElementById("bannerImageUpload").value = "";

                        $scope.$apply();
                    });
                } else {
                    Swal.fire({
                        title: "Error!",
                        text: response.data.Message || "Image upload failed. Please try again.",
                        icon: "error",
                        confirmButtonText: "OK"
                    });
                }
            })
            .catch(error => {
                console.error("Error inserting banner:", error);

                Swal.fire({
                    title: "Error!",
                    text: error.message || "Error inserting banner.",
                    icon: "error",
                    confirmButtonText: "OK"
                });

                $scope.$apply();
            });
    };


    $scope.uploadBannerImages = function (event) {
        let files = event.target.files;
        if (files.length > 0) {
            let file = files[0];

            let reader = new FileReader();
            reader.onload = function (e) {
                $scope.$apply(function () {
                    $scope.previewImage = e.target.result; // Show preview
                    $scope.bannerImages = [file]; // Store the file for upload
                });
            };
            reader.readAsDataURL(file);
        }
    };

    $scope.updateBanner = function () {
        $scope.UpdateErrorMessage = "";

        if (!$scope.bannerImages || $scope.bannerImages.length === 0) {
            $scope.UpdateErrorMessage = "Please upload an image before updating.";
            return;
        }

        var formData = new FormData();
        formData.append("Id", $scope.popupBannerId); // Banner ID

        // Append selected image
        if ($scope.bannerImages && $scope.bannerImages.length > 0) {
            formData.append("BannerImage", $scope.bannerImages[0]);
        }

        console.log("Updating banner with data:", formData);

        $http.post('https://api-test2.salesgenx.in/Banner/UpdateBanner', formData, {
            headers: { 'Content-Type': undefined },
            transformRequest: angular.identity
        }).then(response => {
            Swal.fire({
                title: "Success!",
                text: "Banner Updated Successfully",
                icon: "success",
                confirmButtonText: "OK"
            }).then(() => {
                $scope.getBanners();
                $('#editBannerModal').modal('hide');
            });
        }).catch(error => {
            console.error("Error updating banner:", error);
            Swal.fire({
                title: "Error!",
                text: "Error updating banner.",
                icon: "error",
                confirmButtonText: "OK"
            });
        });
    };

    $scope.editBannerModal = function (banner) {
        $scope.popupBannerId = banner.ID;
        $scope.popupBannerImage = banner.ImagePath;
        $scope.previewImage = banner.ImagePath;

        $('#editBannerModal').modal('show');
    };



    $scope.deleteBanner = function ($event, banner) {
        console.log("Banner ID to delete:", $event.ID);

        $scope.EventId = $event.ID
        console.log($scope.EventId)

        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to recover this banner!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            cancelButtonColor: "#6c757d",
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel!",
        }).then((result) => {
            if (result.isConfirmed) {
                var jdata = { ID: $scope.EventId }; // Correctly passing bannerID


                $http.post("https://api-test2.salesgenx.in/Banner/DeleteBanner", jdata)
                    .then(function (response) {


                        if (response.data.Message === "Banner deleted successfully") {
                            Swal.fire({
                                title: "Deleted!",
                                text: "Banner has been deleted.",
                                icon: "success",
                            }).then(() => {
                                $scope.getBanners(); // Refresh banner list
                            });
                        } else {
                            Swal.fire("Error", "Unexpected API response: " + response.data, "error");
                        }
                    })
                    .catch(function (error) {
                        console.error("Error deleting banner:", error);
                        Swal.fire("Error", "Failed to delete banner. Check console for details.", "error");
                    });
            } else {
                Swal.fire("Cancelled", "Banner is safe :)", "error");
            }
        });
    };




});
