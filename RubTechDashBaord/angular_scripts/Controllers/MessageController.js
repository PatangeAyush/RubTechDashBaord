var app = angular.module("dashboardApp");

app.controller('MessageController', function ($scope, $http) {

    // Fetch Message Details
    $scope.getMessageDetails = function () {
        $http.post('https://api-test2.salesgenx.in/Messege/GetMessege')
            .then(function (response) {
                console.log('API Response:', response.data);

                if (Array.isArray(response.data)) {
                    $scope.messages = response.data.map(message => ({
                        ID: message.Id,
                        Name: message.Name,
                        Position: message.Position,
                        Paragraph: message.Paragraph,
                        MessegeFrom: message.MessegeFrom,
                        ImagePath: message.ImagePath
                            ? 'https://api-test2.salesgenx.in/' + message.ImagePath.replace(/\\/g, '/')
                            : null
                    }));
                } else {
                    console.error("Invalid response format:", response.data);
                    $scope.messages = [];
                }
            })
            .catch(function (error) {
                console.error('Error fetching message details:', error);
            });
    };

    // Call API on Controller Load
    $scope.getMessageDetails();


    $scope.uploadMessageImage = function (files) {
        if (files.length > 0) {
            let selectedFile = files[0];

            if (selectedFile.size > 50 * 1024) { // 50KB validation
                $scope.$applyAsync(() => {
                    $scope.ErrorMessage = "Each image must be less than 50KB.";
                    $scope.messageImage = null; // Reset the file
                    document.getElementById("messageImageUpload").value = ""; // Clear file input
                });
                return;
            }

            $scope.$applyAsync(() => {
                $scope.ErrorMessage = ""; // Clear any previous errors
                $scope.messageImage = selectedFile; // Store the valid image
                console.log("Selected Image:", $scope.messageImage);
            });
        }
    };

    $scope.InsertMessage = function () {
        $scope.ErrorMessage = "";

        // Form Validation
        if (!$scope.messageName?.trim()) {
            $scope.ErrorMessage = "Please enter the Message Name";
            return;
        }
        if (!$scope.messagePosition?.trim()) {
            $scope.ErrorMessage = "Please enter the Designation";
            return;
        }
        if (!$scope.messageParagraph?.trim()) {
            $scope.ErrorMessage = "Please enter the Message Content";
            return;
        }
        if (!$scope.messageFrom?.trim()) {
            $scope.ErrorMessage = "Please enter the Sender's Name";
            return;
        }
        if (!$scope.messageImage) {
            $scope.ErrorMessage = "Please upload an Image.";
            return;
        }

        let formData = new FormData();
        formData.append("Name", $scope.messageName.trim());
        formData.append("Position", $scope.messagePosition.trim());
        formData.append("Paragraph", $scope.messageParagraph.trim());
        formData.append("MessegeFrom", $scope.messageFrom.trim());
        formData.append("Image", $scope.messageImage);

        console.log("Sending Data:", formData);

        $http.post('https://api-test2.salesgenx.in/Messege/AddMessege', formData, {
            headers: { 'Content-Type': undefined },
            transformRequest: angular.identity
        })
            .then(response => {
                console.log("Response:", response.data);

                if (response.status === 200) {
                    Swal.fire({
                        title: "Success!",
                        text: "Message Inserted Successfully",
                        icon: "success",
                        confirmButtonText: "OK"
                    }).then(() => {
                        $scope.getMessageDetails(); // Refresh the list

                        // Clear form fields
                        $scope.messageName = "";
                        $scope.messagePosition = "";
                        $scope.messageParagraph = "";
                        $scope.messageFrom = "";
                        $scope.messageImage = null;

                        // Properly reset the file input
                        let fileInput = document.getElementById("messageImageUpload");
                        if (fileInput) {
                            fileInput.value = ""; // Clear the file input field
                        }

                        $scope.$apply();
                    });
                } else {
                    Swal.fire({
                        title: "Error!",
                        text: response.data.Message || "Message upload failed. Please try again.",
                        icon: "error",
                        confirmButtonText: "OK"
                    });
                }
            })
            .catch(error => {
                console.error("Error inserting message:", error);
                Swal.fire({
                    title: "Error!",
                    text: error.message || "Error inserting message.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
                $scope.$apply();
            });
    };



    $scope.uploadMessageImage = function (files) {
        $scope.messageImage = files[0];
        $scope.$apply();
    };

    $scope.updateMessage = function () {
        $scope.UpdateErrorMessage = "";

        if (!$scope.popupMessageName?.trim()) {
            $scope.UpdateErrorMessage = "Please enter the Name.";
            return;
        }
        if (!$scope.popupMessageParagraph?.trim()) {
            $scope.UpdateErrorMessage = "Please enter the Message.";
            return;
        }
        if (!$scope.popupMessagePosition?.trim()) {
            $scope.UpdateErrorMessage = "Please enter the Designation.";
            return;
        }
        if (!$scope.popupMessageFrom?.trim()) {
            $scope.UpdateErrorMessage = "Please enter 'Message From'.";
            return;
        }

        let formData = new FormData();
        formData.append("ID", $scope.popupMessageId);
        formData.append("Name", $scope.popupMessageName.trim());
        formData.append("Paragraph", $scope.popupMessageParagraph.trim());
        formData.append("Position", $scope.popupMessagePosition.trim());
        formData.append("MessegeFrom", $scope.popupMessageFrom.trim());

        if ($scope.messageImage) {
            formData.append("Image", $scope.messageImage); // Append new image if selected
        }

        console.log("Updating message with data:", formData);

        $http.post('https://api-test2.salesgenx.in/Messege/UpdateMessege', formData, {
            headers: { 'Content-Type': undefined },
            transformRequest: angular.identity
        })
            .then(response => {
                console.log("Update Response:", response.data);

                if (response.status === 200) {
                    Swal.fire({
                        title: "Success!",
                        text: "Message Updated Successfully",
                        icon: "success",
                        confirmButtonText: "OK"
                    }).then(() => {
                        $scope.getMessageDetails(); // Refresh the list immediately
                        $('#addMessagemodal').modal('hide');

                        // Reset fields after update
                        $scope.popupMessageId = "";
                        $scope.popupMessageName = "";
                        $scope.popupMessageParagraph = "";
                        $scope.popupMessagePosition = "";
                        $scope.popupMessageFrom = "";
                        $scope.popupMessageImage = null;
                        $scope.messageImage = null;

                        // Reset file input
                        let fileInput = document.getElementById("messageImageUpload");
                        if (fileInput) {
                            fileInput.value = "";
                        }

                        $scope.$apply();
                    });
                } else {
                    Swal.fire({
                        title: "Error!",
                        text: response.data.Message || "Failed to update message.",
                        icon: "error",
                        confirmButtonText: "OK"
                    });
                }
            })
            .catch(error => {
                console.error("Error updating message:", error);
                Swal.fire({
                    title: "Error!",
                    text: "Failed to update message.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
            });
    };

    $scope.editMessageModal = function (message) {
        $scope.popupMessageId = message.ID;
        $scope.popupMessageName = message.Name;
        $scope.popupMessageParagraph = message.Paragraph;
        $scope.popupMessagePosition = message.Position;
        $scope.popupMessageFrom = message.MessegeFrom;
        $scope.popupMessageImage = message.ImagePath;

        $scope.messageImage = null; // Reset image selection

        $('#addMessagemodal').modal('show');
    };

    $scope.deleteMessage = function ($event, message) {
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to recover this message!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            cancelButtonColor: "#6c757d",
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel!",
        }).then((result) => {
            if (result.isConfirmed) {
                var jdata = { Id: message.ID };
                console.log("Deleting message:", jdata);

                $http.post("https://api-test2.salesgenx.in/Messege/DeleteMessege", jdata)
                    .then(function (response) {
                        console.log("Delete API Response:", response.data);

                        if (response.data.Message === "Messege deleted successfully") {
                            Swal.fire({
                                title: "Deleted!",
                                text: "Message has been deleted.",
                                icon: "success",
                            }).then(() => {
                                $scope.getMessageDetails();
                            });
                        } else {
                            Swal.fire("Error", "Unexpected API response: " + response.data.Messege, "error");
                        }
                    })
                    .catch(function (error) {
                        console.error("Error deleting message:", error);
                        Swal.fire("Error", "Failed to delete message. Check console for details.", "error");
                    });
            } else {
                Swal.fire("Cancelled", "Message is safe :)", "info");
            }
        });
    };


});
