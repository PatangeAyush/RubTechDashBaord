var app = angular.module("dashboardApp");

app.controller('ContactController', function ($scope, $http) {
    // Fetch registered users
    $scope.getData = function () {
        $http.post('https://api-test2.salesgenx.in/Contact/GetContact')
            .then(function (response) {
                console.log('API Response:', response.data);

                if (Array.isArray(response.data)) {
                    $scope.events = response.data;
                } else {
                    console.error("Expected an array but received:", response.data);
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

        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        var phonePattern = /^[6-9]\d{9}$/; // Ensures a valid 10-digit phone number

        if (!$scope.contact1 || !phonePattern.test($scope.contact1)) {
            $scope.InsertErrorMessage = "Please enter a valid Primary Contact Number";

        } else if (!$scope.email || !emailPattern.test($scope.email)) {
            $scope.InsertErrorMessage = "Please enter a valid Email ID";
        } else if (!$scope.addressInput) {
            $scope.InsertErrorMessage = "Please enter your Address";
        }

        if ($scope.InsertErrorMessage) {
            return false;
        }

        var jdata = {
            Contact: $scope.contact1,
            Alternative_Contact: $scope.contact2,
            Email: $scope.email,
            Address: $scope.addressInput
        };

        console.log("Data to be inserted:", jdata);

        $http.post('https://api-test2.salesgenx.in/Contact/AddContact', jdata)
            .then(function (response) {
                Swal.fire({
                    title: "Success!",
                    text: "User Inserted Successfully",
                    icon: "success",
                    confirmButtonText: "OK"
                }).then(() => {
                    // ✅ Reload the entire page
                    location.reload();
                });
            })
            .catch(function (error) {
                console.error("Error inserting user:", error);
                Swal.fire({
                    title: "Error!",
                    text: "Error inserting user.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
            });
    };


    //Update user details
    $scope.update = function () {

        $scope.UpdateErrorMessage = "";


        if (!$scope.popupcontact) {
            $scope.UpdateErrorMessage = "Please enter valid Primary Contact Number.";
            return;
        }
        if (!$scope.popupalternatecontact) {
            $scope.UpdateErrorMessage = "Please enter the vaild Alternate Contact Number.";
            return;
        }
        if (!$scope.popupemail || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test($scope.popupemail)) {
            $scope.UpdateErrorMessage = "Please enter a valid email.";
            return;
        }
        if (!$scope.popupaddressInput) {
            $scope.UpdateErrorMessage = "Please Enter the Address";
            return;
        }

        var jdata = {
            Id: $scope.Id,
            Contact: $scope.popupcontact,
            Alternative_Contact: $scope.popupalternatecontact,
            Email: $scope.popupemail,
            Address: $scope.popupaddressInput
        };


        console.log("Updating user with data:", jdata);

        $http.post('https://api-test2.salesgenx.in/Contact/UpdateContact', jdata)
            .then(function (response) {
                Swal.fire({
                    title: "Success!",
                    text: "Contact Updated Successfully",
                    icon: "success",
                    confirmButtonText: "OK"
                }).then(() => {
                    $scope.getData();
                    $('#addContactModal').modal('hide');
                });
            })
            .catch(function (error) {
                console.error("Error updating user:", error);
                Swal.fire({
                    title: "Error!",
                    text: "Error updating user.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
            });
    };


    $scope.addContactModal = function (data) {
        $scope.Id = data.Id;
        $scope.popupcontact = data.Contact;
        $scope.popupalternatecontact = data.Alternative_Contact;
        $scope.popupemail = data.Email;
        $scope.popupaddressInput = data.Address;
        $('#addContactModal').modal('show');
    };


    //Delete user
    $scope.deleteContact = function ($event, event) {
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to recover this user!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            cancelButtonColor: "#6c757d",
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel!",
        }).then((result) => {
            if (result.isConfirmed) {
                var jdata = { Id: event };
                console.log("Deleting user:", jdata);

                $http.post("https://api-test2.salesgenx.in/Contact/DeleteContact", jdata)
                    .then(function (response) {
                        console.log("Delete API Response:", response.data);

                        if (response.data.message == "Contact added successfully") {
                            Swal.fire({
                                title: "Deleted!",
                                text: "Contact has been deleted.",
                                icon: "success",
                            }).then(() => {
                                $scope.getData();
                            });
                        } else {
                            Swal.fire("Error", "Unexpected API response: " + response.data, "error");
                        }
                    })
                    .catch(function (error) {
                        console.error("Error deleting user:", error);
                        Swal.fire("Error", "Failed to delete user. Check console for details.", "error");
                    });
            } else {
                Swal.fire("Cancelled", "User is safe :)", "error");
            }
        });
    };

});