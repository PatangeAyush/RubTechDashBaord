var app = angular.module("dashboardApp"); // Do not redefine []

app.controller('ReportdetailsController', function ($scope, $http) {

    // Fetch Report Details
    $scope.getReportDetails = function () {
        $http.post('https://api-test2.salesgenx.in/Report/GetReport')
            .then(function (response) {
                console.log('API Response:', response.data);

                if (Array.isArray(response.data)) {
                    $scope.reports = response.data.map(report => ({
                        ID: report.ID,
                        ReportName: report.ReportName,
                        ReportSubParagraph: report.ReportSubParagraph,
                        Report_Description: report.Report_Description,
                        ReportImage: report.ReportImage
                            ? 'https://api-test2.salesgenx.in/Content/Uploads/' +
                            (report.ReportImage.includes('\\') ? report.ReportImage.split('\\').pop() : report.ReportImage.split('/').pop())
                            : null
                    }));
                } else {
                    console.error("Invalid response format:", response.data);
                    $scope.reports = [];
                }
            })
            .catch(function (error) {
                console.error('Error fetching report details:', error);
            });
    };


    $scope.getReportDetails();

    // Upload Files with 20 KB Size Validation
    $scope.uploadFiles = function (files) {
        $scope.reportImages = []; // Clear previous images
        $scope.ErrorMessage = ""; // Clear previous errors

        var maxSize = 20 * 1024; // 20 KB

        for (let i = 0; i < files.length; i++) {
            let file = files[i];

            // Size validation
            if (file.size > maxSize) {
                $scope.$applyAsync(() => {
                    $scope.ErrorMessage = "Image size should not exceed 20 KB.";
                    $scope.reportImages = []; // Clear invalid images
                    document.getElementById("reportImageUpload").value = ""; // Reset file input
                });
                return; // Stop further processing
            }

            // If valid, push image
            $scope.reportImages.push(file);
        }

        $scope.$applyAsync(); // Update view
    };


    // Insert Report
    $scope.Insert = function () {
        $scope.ErrorMessage = "";

        if (!$scope.reportHeading || $scope.reportHeading.trim() === "") {
            $scope.ErrorMessage = "Please enter the Report Heading";
            return;
        }
        if (!$scope.reportParagraph || $scope.reportParagraph.trim() === "") {
            $scope.ErrorMessage = "Please enter the Report Description";
            return;
        }
        if (!$scope.reportImages || $scope.reportImages.length === 0) {
            $scope.ErrorMessage = "Please upload Report Images.";
            return;
        }

        let formData = new FormData();
        formData.append("ReportName", $scope.reportHeading.trim());
        formData.append("ReportSubParagraph", $scope.reportsubHeading ? $scope.reportsubHeading.trim() : "");
        formData.append("Report_Description", $scope.reportParagraph.trim());

        for (let i = 0; i < $scope.reportImages.length; i++) {
            formData.append("reportImages", $scope.reportImages[i]);
        }

        console.log("Sending Data:", formData);

        $http.post('https://api-test2.salesgenx.in/Report/AddReport', formData, {
            headers: { 'Content-Type': undefined },
            transformRequest: angular.identity
        })
            .then(response => {
                console.log("Response:", response.data);

                if (response.data.Message === "Report Added Successfully") {
                    Swal.fire({
                        title: "Success!",
                        text: "Report Inserted Successfully",
                        icon: "success",
                        confirmButtonText: "OK"
                    }).then(() => {
                        $scope.getReportDetails();
                        $scope.reportHeading = "";
                        $scope.reportsubHeading = "";
                        $scope.reportParagraph = "";
                        $scope.reportImages = [];
                        document.getElementById("reportImageUpload").value = "";
                        $scope.$apply();
                    });
                } else {
                    Swal.fire({
                        title: "Error!",
                        text: response.data.Message || "Report upload failed. Please try again.",
                        icon: "error",
                        confirmButtonText: "OK"
                    });
                }
            })
            .catch(error => {
                console.error("Error inserting report:", error);
                Swal.fire({
                    title: "Error!",
                    text: error.message || "Error inserting report.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
                $scope.$apply();
            });
    };


    //$scope.uploadReportImages = function (files) {
    //    $scope.reportImages = files;
    //    $scope.$apply();
    //};

    // Upload Images for Update (with 20 KB validation)
    $scope.uploadReportImages = function (files) {
        $scope.reportImages = []; // Clear old images
        $scope.UpdateErrorMessage = ""; // Clear previous errors

        var maxSize = 20 * 1024; // 20 KB

        for (let i = 0; i < files.length; i++) {
            let file = files[i];

            // Check file size
            if (file.size > maxSize) {
                $scope.$applyAsync(() => {
                    $scope.UpdateErrorMessage = "Image size should not exceed 20 KB.";
                    $scope.reportImages = []; // Clear invalid images
                    document.getElementById("popupReportImageUpload").value = ""; // Reset input
                });
                return; // Stop loop on first invalid image
            }

            // If valid, store image
            $scope.reportImages.push(file);
        }

        $scope.$applyAsync(); // Update the view
    };





    // Update Report
    $scope.updateReport = function () {
        $scope.UpdateErrorMessage = "";


        if (!$scope.popheading) {
            $scope.UpdateErrorMessage = "Please enter the report heading.";
            return;
        } else if (!$scope.popupparagraph) {
            $scope.UpdateErrorMessage = "Please enter the report description.";
            return;
        }


        var formData = new FormData();
        formData.append("Id", $scope.popupReportId);
        formData.append("ReportName", $scope.popheading.trim());
        formData.append("ReportSubParagraph", $scope.popsubheading ? $scope.popsubheading.trim() : "");
        formData.append("Report_Description", $scope.popupparagraph.trim());


        if ($scope.reportImages && $scope.reportImages.length > 0) {
            formData.append("ReportImage", $scope.reportImages[0]);
        }

        console.log("Updating report with data:", formData);

        $http.post('https://api-test2.salesgenx.in/Report/UpdateReport', formData, {
            headers: { 'Content-Type': undefined },
            transformRequest: angular.identity
        })
            .then(response => {
                Swal.fire({
                    title: "Success!",
                    text: "Report Updated Successfully",
                    icon: "success",
                    confirmButtonText: "OK"
                }).then(() => {
                    $scope.getReportDetails();
                    $('#addReportModal').modal('hide');
                });
            })
            .catch(error => {
                console.error("Error updating report:", error);
                Swal.fire({
                    title: "Error!",
                    text: "Failed to update report.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
            });
    };

    $scope.addReportModal = function (report) {
        $scope.popupReportId = report.ID;
        $scope.popheading = report.ReportName;
        $scope.popsubheading = report.ReportSubParagraph;
        $scope.popupparagraph = report.Report_Description;
        $scope.popupReportImage = report.ReportImage;

        $('#addReportModal').modal('show');
    };


    $scope.deleteReport = function ($event, report) {
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to recover this report!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            cancelButtonColor: "#6c757d",
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel!",
        }).then((result) => {
            if (result.isConfirmed) {
                var jdata = { Id: report.ID };
                console.log("Deleting report:", jdata);

                $http.post("https://api-test2.salesgenx.in/Report/DeleteReport", jdata)
                    .then(function (response) {
                        console.log("Delete API Response:", response.data);

                        if (response.data.Messege === "Report Deleted Successfully") {
                            Swal.fire({
                                title: "Deleted!",
                                text: "Report has been deleted.",
                                icon: "success",
                            }).then(() => {
                                $scope.getReportDetails();
                            });
                        } else {
                            Swal.fire("Error", "Unexpected API response: " + response.data.Message, "error");
                        }
                    })
                    .catch(function (error) {
                        console.error("Error deleting report:", error);
                        Swal.fire("Error", "Failed to delete report. Check console for details.", "error");
                    });
            } else {
                Swal.fire("Cancelled", "Report is safe :)", "info");
            }
        });
    };

});
