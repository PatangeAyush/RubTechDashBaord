var app = angular.module("dashboardApp");

app.controller('RegisterPageController', function ($scope, $http) {
    $scope.events = [];
    $scope.searchText = '';
    $scope.pageSize = 10; // Per page data
    $scope.currentPage = 1;

    // ✅ Fetch registered users
    $scope.getData = function () {
        $http.post('https://api-test2.salesgenx.in/Register/GetRegisteredUsers')
            .then(function (response) {
                console.log('API Response:', response.data);

                if (response.data && Array.isArray(response.data.RegisterList)) {
                    $scope.events = response.data.RegisterList;
                } else {
                    console.error("Invalid response format:", response.data);
                    $scope.events = [];
                }
            })
            .catch(function (error) {
                console.error('Error fetching data:', error);
            });
    };

    // Initial data load
    $scope.getData();

    // ✅ Delete user function
    $scope.deleteUser = function ($event, user) {
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to recover this user!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            cancelButtonColor: "#6c757d",
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel!"
        }).then((result) => {
            if (result.isConfirmed) {
                var jdata = { Id: user.Id }; // Correct user ID
                console.log("Deleting user:", jdata);

                $http.post("https://api-test2.salesgenx.in/Register/DeleteUser", jdata)
                    .then(function (response) {
                        console.log("Delete API Response:", response.data);

                        if (response.data.message === "User deleted successfully.") {
                            Swal.fire("Deleted!", "User has been deleted.", "success")
                                .then(() => $scope.getData()); // Refresh data
                        } else {
                            Swal.fire("Error", "Unexpected API response: " + response.data, "error");
                        }
                    })
                    .catch(function (error) {
                        console.error("Error deleting user:", error);
                        Swal.fire("Error", "Failed to delete user. Check console for details.", "error");
                    });
            } else {
                Swal.fire("Cancelled", "User is safe :)", "info");
            }
        });
    };

    // ✅ Export to Excel Function
    $scope.exportToExcel = function () {
        let csvContent = "data:text/csv;charset=utf-8,";
        let headerRow = [
            "Full Name", "Company Name", "Phone Number", "Email", "Magazine", "Duration", "Address", "City_State",
            "Zip_Postal", "Country", "Payment_Info", "Promotional_Preference", "IRMRA_Membership", "Registration Date & Time"
        ];
        csvContent += headerRow.join(",") + "\n";

        $scope.events.forEach(event => {
            let row = [
                event.name || '', event.company || '', event.phoneNumber || '', event.email || '', event.magazine || '', event.duration || '',
                event.Address || '', event.City_State || '', event.Zip_Postal || '', event.Country || '', event.Payment_Info || '',
                event.Promotional_Preference || '', event.IRMRA_Membership || '', event.User_Registration_Date || ''
            ];
            csvContent += row.join(",") + "\n";
        });

        // Trigger download
        let encodedUri = encodeURI(csvContent);
        let link = document.createElement("a");
        link.setAttribute("href", encodedUri);
        link.setAttribute("download", "RegistrationDetails.csv");
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    };

    // ✅ Pagination total pages calculation
    $scope.totalPages = function () {
        let filteredData = $scope.events.filter(function (item) {
            return !$scope.searchText || JSON.stringify(item).toLowerCase().includes($scope.searchText.toLowerCase());
        });
        return Math.ceil(filteredData.length / $scope.pageSize) || 1;
    };

    // ✅ Go to previous page
    $scope.prevPage = function () {
        if ($scope.currentPage > 1) {
            $scope.currentPage--;
        }
    };

    // ✅ Go to next page
    $scope.nextPage = function () {
        if ($scope.currentPage < $scope.totalPages()) {
            $scope.currentPage++;
        }
    };

    // ✅ For reset page when search text changes
    $scope.$watch('searchText', function () {
        $scope.currentPage = 1;
    });

});
