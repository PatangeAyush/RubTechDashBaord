var app = angular.module("dashboardApp"); // Do not redefine []

app.controller('EventDetailsController', function ($scope, $http) {

    // Fetch Event Details
    $scope.getEventDetails = function () {
        $http.post('https://api-test2.salesgenx.in/Event/GetEvents')
            .then(function (response) {
                console.log('API Response:', response.data);

                if (Array.isArray(response.data)) {
                    $scope.events = response.data.map(event => ({
                        ID: event.ID,
                        EventTitle: event.EventTitle,
                        SubTitle: event.SubTitle,
                        Paragraph: event.Paragraph,
                        ImagePaths: event.ImagePaths ? event.ImagePaths.map(image => {
                            return 'https://api-test2.salesgenx.in/Content/Uploads/' +
                                (image.includes('\\') ? image.split('\\').pop() : image.split('/').pop());
                        }) : []
                    }));
                } else {
                    console.error("Invalid response format:", response.data);
                    $scope.events = [];
                }
            })
            .catch(function (error) {
                console.error('Error fetching event details:', error);
            });
    };

    $scope.getEventDetails();

    // Handle File Upload
    //$scope.uploadFiles = function (files) {
    //    if (files.length > 0) {
    //        $scope.$applyAsync(() => {
    //            $scope.eventImages = [];
    //            for (let i = 0; i < files.length; i++) {
    //                $scope.eventImages.push(files[i]);
    //            }
    //            console.log("Selected Images:", $scope.eventImages);
    //        });
    //    }
    //};



    // Upload Event Images with 20 KB validation
    $scope.uploadFiles = function (files) {
        $scope.eventImages = []; // Clear previous images
        $scope.ErrorMessage = ""; // Clear previous error

        var maxSize = 20 * 1024; // 20 KB

        for (let i = 0; i < files.length; i++) {
            let file = files[i];

            // Check file size
            if (file.size > maxSize) {
                $scope.$applyAsync(() => {
                    $scope.ErrorMessage = "Image size should not exceed 20 KB.";
                    $scope.eventImages = []; // Clear invalid images
                    document.getElementById("eventImageUpload").value = ""; // Clear file input
                });
                return; // Stop further processing on first invalid image
            }

            // If valid, add to array
            $scope.eventImages.push(file);
        }

        $scope.$applyAsync(); // Update view
    };



    $scope.Insert = function () {
        $scope.ErrorMessage = "";

        if (!$scope.eventHeading || $scope.eventHeading.trim() === "") {
            $scope.ErrorMessage = "Please enter the Event Heading";
            return;
        }
        if (!$scope.eventParagraph || $scope.eventParagraph.trim() === "") {
            $scope.ErrorMessage = "Please enter the Event Description";
            return;
        }
        if (!$scope.eventImages || $scope.eventImages.length === 0) {
            $scope.ErrorMessage = "Please upload Event Images.";
            return;
        }

        // Create FormData for file upload
        let formData = new FormData();
        formData.append("EventTitle", $scope.eventHeading.trim());
        formData.append("SubTitle", $scope.eventsubHeading ? $scope.eventsubHeading.trim() : "");
        formData.append("Paragraph", $scope.eventParagraph.trim());

        // Append files
        for (let i = 0; i < $scope.eventImages.length; i++) {
            formData.append("eventImages", $scope.eventImages[i]);
        }

        console.log("Sending Data:", formData);

        // Send HTTP request
        $http.post('https://api-test2.salesgenx.in/Event/AddEvent', formData, {
            headers: { 'Content-Type': undefined },
            transformRequest: angular.identity
        })
            .then(response => {
                console.log("Response:", response.data);

                if (response.data.Message === "Event added successfully") {
                    Swal.fire({
                        title: "Success!",
                        text: "Event Inserted Successfully",
                        icon: "success",
                        confirmButtonText: "OK"
                    }).then(() => {
                        $scope.getEventDetails();

                        $scope.eventHeading = "";
                        $scope.eventsubHeading = "";
                        $scope.eventParagraph = "";
                        $scope.eventImages = [];


                        document.getElementById("eventImageUpload").value = "";

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
                console.error("Error inserting event:", error);

                Swal.fire({
                    title: "Error!",
                    text: error.message || "Error inserting event.",
                    icon: "error",
                    confirmButtonText: "OK"
                });

                $scope.$apply();
            });
    };


    $scope.uploadEventImages = function (files) {
        $scope.eventImages = files;
        $scope.$apply(); // Ensure Angular updates UI
    };



    //function sendEventData(eventData) {
    //    $http.post('api-rubtech.designaccentindia.comEvent/AddEvent', eventData, {
    //        headers: {
    //            'Content-Type': 'application/json',
    //            'Accept': 'application/json'
    //        }
    //    })
    //    console.log("inserted data", eventData)
    //        .then(function (response) {
    //            console.log("Response:", response.data);

    //            if (response.data.Messege === "Event Added Successfully") {
    //                Swal.fire({
    //                    title: "Success!",
    //                    text: "Event Inserted Successfully",
    //                    icon: "success",
    //                    confirmButtonText: "OK"
    //                }).then(() => {
    //                    $scope.getEventDetails();


    //                    $scope.eventHeading = "";
    //                    $scope.eventsubHeading = "";
    //                    $scope.eventParagraph = "";
    //                    $scope.eventImages = [];
    //                    document.getElementById("eventImageUpload").value = "";

    //                    $scope.$applyAsync();
    //                });
    //            } else {
    //                Swal.fire({
    //                    title: "Error!",
    //                    text: "Image upload failed. Please try again.",
    //                    icon: "error",
    //                    confirmButtonText: "OK"
    //                });
    //            }
    //        })
    //        .catch(function (error) {
    //            console.error("Error inserting event:", error);
    //            Swal.fire({
    //                title: "Error!",
    //                text: "Error inserting event.",
    //                icon: "error",
    //                confirmButtonText: "OK"
    //            });
    //        });
    //}



    $scope.updateEvent = function () {

        $scope.UpdateErrorMessage = "";


        if (!$scope.popheading) {
            $scope.UpdateErrorMessage = "Please enter the event heading.";
            return;
        } else if (!$scope.popsubheading) {
            $scope.UpdateErrorMessage = "Please enter the event subheading.";
            return;
        } else if (!$scope.popupparagraph) {
            $scope.UpdateErrorMessage = "Please enter the event description.";
            return;
        }

        var eventData = {
            Id: $scope.popupEventId,
            EventTitle: $scope.popheading.trim(),
            SubTitle: $scope.popsubheading ? $scope.popsubheading.trim() : "",
            Paragraph: $scope.popupparagraph.trim()
        };


        console.log("Updating event with data:", eventData);

        $http.post('https://api-test2.salesgenx.in/Event/UpdateEvent', eventData)
            .then(response => {
                Swal.fire({
                    title: "Success!",
                    text: "Event Updated Successfully",
                    icon: "success",
                    confirmButtonText: "OK"
                }).then(() => {
                    $scope.getEventDetails();
                    $('#addEventModal').modal('hide');
                });
            })
            .catch(error => {
                console.error("Error updating event:", error);
                Swal.fire({
                    title: "Error!",
                    text: "Error updating event.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
            });
    };


    $scope.addEventModal = function (event) {
        $scope.popupEventId = event.ID;
        $scope.popheading = event.EventTitle;
        $scope.popsubheading = event.SubTitle;
        $scope.popupparagraph = event.Paragraph;

        $('#addEventModal').modal('show'); // Show the modal
    };




    $scope.deleteEvent = function ($event, event) {
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to recover this event!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            cancelButtonColor: "#6c757d",
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel!",
        }).then((result) => {
            if (result.isConfirmed) {
                var jdata = { Id: event.ID }; // Sending event ID
                console.log("Deleting event:", jdata);

                $http.post("https://api-test2.salesgenx.in/Event/DeleteEvent", jdata)
                    .then(function (response) {
                        console.log("Delete API Response:", response.data);

                        if (response.data.Messege === "Event Deleted Successfully") {
                            Swal.fire({
                                title: "Deleted!",
                                text: "Event has been deleted.",
                                icon: "success",
                            }).then(() => {
                                $scope.getEventDetails();
                            });
                        } else {
                            Swal.fire("Error", "Unexpected API response: " + response.data, "error");
                        }
                    })
                    .catch(function (error) {
                        console.error("Error deleting event:", error);
                        Swal.fire("Error", "Failed to delete event. Check console for details.", "error");
                    });
            } else {
                Swal.fire("Cancelled", "Event is safe :)", "error");
            }
        });
    };



});
