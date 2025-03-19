var app = angular.module("dashboardApp");

app.controller('GalleryEventController', function ($scope, $http) {

    // Initialize events array
    $scope.events = [];

    // Fetch the events
    $scope.getEvents = function () {
        $http.post('https://api-test2.salesgenx.in/GalleryEvent/GetGallery')
            .then(function (response) {
                console.log('API Response:', response.data);

                if (Array.isArray(response.data)) {
                    $scope.events = response.data.map(event => ({
                        ID: event.ID,
                        Title: event.Title,
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
                console.error('Error fetching events:', error);
            });
    };

    $scope.getEvents();

    // Upload images and title
    //$scope.uploadFiles = function (files) {
    //    if (!files || files.length === 0) {
    //        console.warn("No files selected.");
    //        return;
    //    }
    //    $scope.$apply(function () {
    //        $scope.eventImages = files;
    //    });
    //    console.log("Selected Images:", $scope.eventImages);
    //};

    $scope.uploadFiles = function (files) {
        $scope.eventImages = []; // Clear previous
        $scope.ErrorMessage = ""; // Clear previous error

        var maxSize = 20 * 1024; // 20 KB

        if (!files || files.length === 0) {
            console.warn("No files selected.");
            return;
        }

        for (let i = 0; i < files.length; i++) {
            let file = files[i];

            // Check file size
            if (file.size > maxSize) {
                $scope.$applyAsync(() => {
                    $scope.ErrorMessage = "Image must be less than or equal to 20 KB."; // Unified error
                    $scope.eventImages = []; // Clear invalid selection
                    document.getElementById("eventImageUpload").value = ""; // Reset file input
                });
                return;
            }

            // Push valid file
            $scope.eventImages.push(file);
        }

        console.log("Selected Images:", $scope.eventImages);
        $scope.$applyAsync(); // Ensure update
    };

    $scope.insertEvent = function () {
        $scope.ErrorMessage = ""; // Clear previous error

        // Field validation
        if (!$scope.eventTitle || !$scope.eventTitle.trim()) {
            $scope.ErrorMessage = "Please enter a Event title.";
            return;
        }

        if (!$scope.eventImages || $scope.eventImages.length === 0) {
            $scope.ErrorMessage = "Please upload Event image.";
            return;
        }

        // Prepare FormData
        var formData = new FormData();
        formData.append("Title", $scope.eventTitle.trim());

        // Append images
        for (let i = 0; i < $scope.eventImages.length; i++) {
            formData.append("ImagePaths", $scope.eventImages[i]);
        }

        console.log("Sending Data:", formData);

        // API Call
        $http.post('https://api-test2.salesgenx.in/GalleryEvent/AddEvent', formData, {
            transformRequest: angular.identity,
            headers: {
                'Content-Type': undefined,
                'Accept': 'application/json'
            }
        }).then(function (response) {
            console.log("Response:", response.data);

            if (response.data.Message === "Event added successfully") {
                Swal.fire({
                    title: "Success!",
                    text: "Event Inserted Successfully",
                    icon: "success",
                    confirmButtonText: "OK"
                }).then(() => {
                    $scope.getEvents();

                    // Reset fields
                    $scope.eventTitle = "";
                    $scope.eventImages = [];
                    document.getElementById("eventImageUpload").value = "";
                    $scope.ErrorMessage = "";
                    $scope.$applyAsync(); // Update view
                });
            } else {
                Swal.fire({
                    title: "Error!",
                    text: "Image upload failed. Please try again.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
            }
        }).catch(function (error) {
            console.error("Error inserting event:", error);
            Swal.fire({
                title: "Error!",
                text: "Error inserting event.",
                icon: "error",
                confirmButtonText: "OK"
            });
        });
    };


    $scope.updateEvent = function () {
        if (!$scope.selectedEvent || !$scope.selectedEvent.Title) {
            Swal.fire({
                title: "Error!",
                text: "Please enter the event heading.",
                icon: "error",
                confirmButtonText: "OK"
            });
            return;
        }

        var eventData = {
            Id: $scope.selectedEvent.Id,
            EventName: $scope.selectedEvent.Title.trim()
        };

        console.log("Updating event with data:", eventData);

        $http.post('https://api-test2.salesgenx.in/GalleryEvent/RenameEvent', eventData)
            .then(response => {
                Swal.fire({
                    title: "Success!",
                    text: "Event Updated Successfully",
                    icon: "success",
                    confirmButtonText: "OK"
                }).then(() => {
                    $scope.getEvents();
                    $('#addEventtModal').modal('hide');
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
        $scope.selectedEvent = {
            Id: event.ID,
            Title: event.Title
        };
        $('#addEventtModal').modal('show');
    };

    $scope.deleteEvent = function ($event, event) {
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
                var jdata = { id: event.ID };
                console.log("Deleting event:", jdata);

                $http.post("https://api-test2.salesgenx.in/GalleryEvent/DeleteEvent", jdata)
                    .then(function (response) {
                        console.log("Delete API Response:", response.data);

                        if (response.data.message === "Event deleted successfully.") {
                            Swal.fire({
                                title: "Deleted!",
                                text: "Event has been deleted.",
                                icon: "success",
                            }).then(() => {
                                $scope.getEvents();
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
