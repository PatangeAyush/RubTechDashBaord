var app = angular.module("dashboardApp");

app.controller("MagzineController", function ($scope, $http) {
    $scope.magzines = [];
    $scope.magzineImages = [];
    $scope.previewNewMagzineImage = null;
    $scope.ErrorMessage = "";

    // 🟢 Fetch Magzines from API
    $scope.getMagzines = function () {
        $http.post("https://api-test2.salesgenx.in/Magzine/GetMagzine")
            .then(function (response) {
                console.log("API Response:", response.data);

                if (Array.isArray(response.data)) {
                    $scope.magzines = response.data.map(mag => ({
                        ID: mag.Id,
                        ImagePath: mag.ImagePath
                            ? "https://api-test2.salesgenx.in/Content/Uploads/" +
                            (mag.ImagePath.includes("\\") ? mag.ImagePath.split("\\").pop() : mag.ImagePath.split("/").pop())
                            : null
                    }));
                } else {
                    console.error("Invalid response format:", response.data);
                    $scope.magzines = [];
                }
            })
            .catch(function (error) {
                console.error("Error fetching magzines:", error);
            });
    };
    $scope.getMagzines();


    $scope.uploadMagzineImage = function (event) {
        let files = event.target.files;
        if (files.length > 0) {
            $scope.$applyAsync(() => {
                $scope.magzineImages = []; // Reset images array
                $scope.ErrorMessage = "";

                for (let i = 0; i < files.length; i++) {
                    if (files[i].size > 500 * 1024) { // Ensure 50KB limit
                        $scope.ErrorMessage = "Each image must be less than 50KB.";
                        return;
                    }
                    $scope.magzineImages.push(files[i]); // Store file
                }

                // Preview image
                let reader = new FileReader();
                reader.onload = function (e) {
                    $scope.$apply(() => {
                        $scope.previewNewMagzineImage = e.target.result;
                    });
                };
                reader.readAsDataURL(files[0]);
            });
        }
    };

    $scope.insertMagzine = function () {
        $scope.ErrorMessage = "";

        if (!$scope.magzineImages || $scope.magzineImages.length === 0) {
            $scope.ErrorMessage = "Please upload a Magzine Image.";
            return;
        }

        let formData = new FormData();
        for (let i = 0; i < $scope.magzineImages.length; i++) {
            console.log("Appending File:", $scope.magzineImages[i]);
            formData.append("magzineImages", $scope.magzineImages[i]);  // Append file
        }

        console.log("FormData Content:", formData.getAll("magzineImages")); // Debugging

        $http.post('https://api-test2.salesgenx.in/Magzine/AddMagzine', formData, {
            headers: { 'Content-Type': undefined },
            transformRequest: angular.identity
        })
            .then(response => {
                console.log("Response:", response.data);
                if (response.status === 200) {
                    Swal.fire({
                        title: "Success!",
                        text: "Magzine Inserted Successfully",
                        icon: "success",
                        confirmButtonText: "OK"
                    }).then(() => {
                        $scope.getMagzines();
                        $scope.magzineImages = [];
                        document.getElementById("addImageMain").value = "";
                        $scope.previewNewMagzineImage = null;
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
                console.error("Error inserting magzine:", error);
                Swal.fire({
                    title: "Error!",
                    text: error.message || "Error inserting magzine.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
                $scope.$apply();
            });
    };



    // Delete Magzine (Calls API)
    $scope.deleteMagzine = function (id) {
        Swal.fire({

            title: "Are you sure?",
            text: "You won’t be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#d33",
            cancelButtonColor: "#3085d6",
            confirmButtonText: "Yes, delete it!"
        }).then((result) => {
            if (result.isConfirmed) {
                $http.post('https://api-test2.salesgenx.in/Magzine/DeleteMagzine', { ID: id })
                    .then(response => {
                        Swal.fire("Deleted!", "The magzine has been deleted.", "success");
                        $scope.getMagzines();
                    })
                    .catch(error => {
                        Swal.fire("Error!", "Could not delete magzine.", "error");
                    });
            }
        });
    };
});
