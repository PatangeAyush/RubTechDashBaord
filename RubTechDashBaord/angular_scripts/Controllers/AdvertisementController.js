var app = angular.module("dashboardApp");

app.controller("AdvertisementController", function ($scope, $http) {
    // Initialize advertisements array
    $scope.advertisements = [];

    // Fetch advertisements from API
    $scope.getAdvertisements = function () {
        $http.post("https://api-test2.salesgenx.in/Advertisement/GetAdvertisement")
            .then(function (response) {
                console.log("API Response:", response.data);

                if (Array.isArray(response.data)) {
                    $scope.advertisements = response.data.map(ad => ({
                        ID: ad.Id,
                        URL: ad.URL,
                        ImagePath: ad.ImagePath
                            ? "https://api-test2.salesgenx.in/Content/Uploads/" +
                            (ad.ImagePath.includes("\\") ? ad.ImagePath.split("\\").pop() : ad.ImagePath.split("/").pop())
                            : null
                    }));
                } else {
                    console.error("Invalid response format:", response.data);
                    $scope.advertisements = [];
                }
            })
            .catch(function (error) {
                console.error("Error fetching advertisements:", error);
            });
    };
    $scope.getAdvertisements();


    $scope.uploadAdvertisementImage = function (event) {
        let files = event.target.files;

        if (files.length > 0) {
            let file = files[0]; // Take only one image for now (first one)
            let fileSizeInKB = file.size / 1024; // Convert to KB

            if (fileSizeInKB > 50) { // 50 KB validation
                $scope.$applyAsync(() => {
                    $scope.ErrorMessage = "Please upload an image smaller than 50 KB.";
                    $scope.advertisementImages = []; // Clear file
                    $scope.previewNewAdImage = null; // Clear preview
                    document.getElementById("addImageMain").value = ""; // Reset input field (make sure this ID is correct)
                });
                return;
            }

            // If valid image
            $scope.$applyAsync(() => {
                $scope.ErrorMessage = ""; // Clear previous error
                $scope.advertisementImages = [file]; // Store file

                // Preview
                let reader = new FileReader();
                reader.onload = function (e) {
                    $scope.$apply(() => {
                        $scope.previewNewAdImage = e.target.result;
                    });
                };
                reader.readAsDataURL(file); // Preview
            });
        }
    };

    // Insert Advertisement
    $scope.insertAdvertisement = function () {
        $scope.ErrorMessage = "";

        // ✅ Validation for image
        if (!$scope.advertisementImages || $scope.advertisementImages.length === 0) {
            $scope.ErrorMessage = "Please upload an Advertisement Image.";
            return;
        }

        // ✅ Validation for URL
        //if (!$scope.MainAddLink || $scope.MainAddLink.trim() === "") {
        //    $scope.ErrorMessage = "Please enter Advertisement URL.";
        //    return;
        //}

        let formData = new FormData();


        for (let i = 0; i < $scope.advertisementImages.length; i++) {
            formData.append("advertisementImages", $scope.advertisementImages[i]);
        }


        formData.append("URL", $scope.MainAddLink);

        console.log("Sending Advertisement Data:", formData);


        $http.post('https://api-test2.salesgenx.in/Advertisement/AddAdvertisement', formData, {
            headers: { 'Content-Type': undefined },
            transformRequest: angular.identity
        })
            .then(response => {
                console.log("Response:", response.data);

                if (response.status === 200) {
                    Swal.fire({
                        title: "Success!",
                        text: "Advertisement Inserted Successfully",
                        icon: "success",
                        confirmButtonText: "OK"
                    }).then(() => {
                        // ✅ Refresh Data
                        $scope.getAdvertisements();

                        // ✅ Reset Form
                        $scope.advertisementImages = [];
                        $scope.MainAddLink = "";
                        document.getElementById("addImageMain").value = "";
                        $scope.previewNewAdImage = null;

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
                console.error("Error inserting advertisement:", error);

                Swal.fire({
                    title: "Error!",
                    text: error.message || "Error inserting advertisement.",
                    icon: "error",
                    confirmButtonText: "OK"
                });

                $scope.$apply();
            });
    };


    $scope.deleteAdvertisement = function ($event, ad) {
        console.log("Advertisement ID to delete:", ad.ID);


        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to recover this advertisement!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            cancelButtonColor: "#6c757d",
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel!",
        }).then((result) => {
            if (result.isConfirmed) {
                var jdata = { ID: ad.ID };
                console.log(jdata)

                $http.post("https://api-test2.salesgenx.in/Advertisement/DeleteAdvertisement", jdata)
                    .then(function (response) {
                        if (response.data.Messege === "Advertisement Deleted Succsessfully") {
                            Swal.fire({
                                title: "Deleted!",
                                text: "Advertisement has been deleted.",
                                icon: "success",
                            }).then(() => {
                                $scope.getAdvertisements();
                            });
                        } else {
                            Swal.fire("Error", "Unexpected API response: " + response.data.Message, "error");
                        }
                    })
                    .catch(function (error) {
                        console.error("Error deleting advertisement:", error);
                        Swal.fire("Error", "Failed to delete advertisement. Check console for details.", "error");
                    });
            } else {
                Swal.fire("Cancelled", "Advertisement is safe :)", "error");
            }
        });
    };



});
