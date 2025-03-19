var app = angular.module("dashboardApp");

app.controller('FooterMenuController', function ($scope, $http) {

    $scope.getData = function () {
        $http.post('https://api-test2.salesgenx.in/AboutCompany/GetAboutCompany')
            .then(function (response) {
                console.log('API Response:', response.data);

                if (Array.isArray(response.data)) {
                    $scope.events = response.data; // Since response itself is an array
                } else {
                    console.error("Invalid response format:", response.data);
                    $scope.events = [];
                }
            })
            .catch(function (error) {
                console.error('Error fetching data:', error);
            });
    };

    $scope.getData();


    $scope.Insert = function () {
        $scope.InsertErrorMessage = "";

        if (!$scope.aboutCompany || $scope.aboutCompany.trim() === "") {
            $scope.InsertErrorMessage = "Please enter About Company details.";
            return false;
        }

        var jdata = {
            CompanyAddress: $scope.aboutCompany
        };

        console.log("Data to be inserted:", jdata);

        $http.post('https://api-test2.salesgenx.in/AboutCompany/AddCompanyAddress', jdata)
            .then(function (response) {
                Swal.fire({
                    title: "Success!",
                    text: "About Company Inserted Successfully",
                    icon: "success",
                    confirmButtonText: "OK"
                }).then(() => {
                    location.reload();
                });
            })
            .catch(function (error) {
                console.error("Error inserting About Company:", error);
                Swal.fire({
                    title: "Error!",
                    text: "Error inserting About Company.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
            });
    };

    $scope.update = function () {
        $scope.UpdateErrorMessage = "";

        if (!$scope.popupAboutCompany || $scope.popupAboutCompany.trim() === "") {
            $scope.UpdateErrorMessage = "Please enter About Company details.";
            return;
        }

        $scope.UpdateErrorMessage = null;

        var jdata = {
            Id: $scope.Id,
            CompanyAddress: $scope.popupAboutCompany
        };

        console.log("Updating About Company with data:", jdata);

        $http.post('https://api-test2.salesgenx.in/AboutCompany/UpdateCompanyAddress', jdata)
            .then(function (response) {
                Swal.fire({
                    title: "Success!",
                    text: "About Company Updated Successfully",
                    icon: "success",
                    confirmButtonText: "OK"
                }).then(() => {
                    location.reload(); // ✅ This will reload the page automatically after success
                });
            })
            .catch(function (error) {
                console.error("Error updating About Company:", error);
                Swal.fire({
                    title: "Error!",
                    text: "Error updating About Company.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
            });
    };


    $scope.addFooterMenuModal = function (data) {
        $scope.Id = data.Id;
        $scope.popupAboutCompany = data.CompanyAddress;
        $('#addFooterMenuModal').modal('show');
    };


});

