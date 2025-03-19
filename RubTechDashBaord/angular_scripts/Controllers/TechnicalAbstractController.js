var app = angular.module("dashboardApp"); // Do not redefine []

app.controller('TechnicalAbstractController', function ($scope, $http) {
    // Fetch Technical Abstract Data
    $scope.getTechnicalAbstracts = function () {
        $http.post('https://api-test2.salesgenx.in/TechnicalAbstract/GetTechnicalAbstracts')
            .then(function (response) {
                console.log('API Response:', response.data);

                if (Array.isArray(response.data)) {
                    $scope.technicalAbstracts = response.data; // Assigning data to scope variable
                } else {
                    console.error("Invalid response format:", response.data);
                    $scope.technicalAbstracts = [];
                }
            })
            .catch(function (error) {
                console.error('Error fetching data:', error);
            });
    };

    $scope.getTechnicalAbstracts();

    $scope.editTechnicalAbstract = function (abstract) {
        console.log("Selected Abstract:", abstract);
        $scope.technicalAbstract = angular.copy(abstract); // Existing data ko copy karo
        document.getElementById("abstractId").value = abstract.Id;

        $scope.$apply();

        $("#addTechicalAbstract").modal("show"); // Modal open karo
    };

    //$scope.technicalAbstract = {}; // Object initialize karo
    //$scope.technicalAbstract.files = {}; // Files store karne ke liye object

    //$scope.onFileChange = function (event, fileType) {
    //    var file = event.target.files[0];
    //    if (file) {
    //        console.log("File selected for " + fileType + ":", file);
    //        $scope.technicalAbstract[fileType] = file; // Directly object me store karo
    //    }
    //};


    //$scope.updateTechnicalAbstract = function () {
    //    var formData = new FormData();

    //    // Text fields ko append karo
    //    formData.append("Name", $scope.technicalAbstract.Name);
    //    formData.append("Author_Name", $scope.technicalAbstract.Author_Name);
    //    formData.append("Author_Description", $scope.technicalAbstract.Author_Description);
    //    formData.append("Abstract_Paragraph", $scope.technicalAbstract.Abstract_Paragraph);

    //    // File fields ko append karo agar available hain
    //    if ($scope.technicalAbstract.files.abstractImage) {
    //        formData.append("AbstractImage", $scope.technicalAbstract.files.abstractImage);
    //    }
    //    if ($scope.technicalAbstract.files.authorImage) {
    //        formData.append("AuthorImage", $scope.technicalAbstract.files.authorImage);
    //    }

    //    // API Call with FormData
    //    $http.post('https://api-test2.salesgenx.in/TechnicalAbstract/UpdateTechnicalAbstract', formData, {
    //        transformRequest: angular.identity,
    //        headers: { 'Content-Type': undefined } // Let Angular handle the content type
    //    }).then(function (response) {
    //        console.log("Update Technical Abstract Data : ", response);
    //        Swal.fire("Success", "Technical Abstract Updated Successfully!", "success");
    //        $("#addTechicalAbstract").modal("hide"); // Modal close karo
    //        $scope.getTechnicalAbstracts(); // Data refresh karo
    //    }).catch(function (error) {
    //        Swal.fire("Error", "Failed to update Technical Abstract!", "error");
    //        console.error(error);
    //    });
    //};



    $scope.deleteTechnicalAbstract = function ($event, abstract) {
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to recover this abstract!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            cancelButtonColor: "#6c757d",
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel!",
        }).then((result) => {
            if (result.isConfirmed) {
                var jdata = { id: abstract.Id };  // Pass the correct ID for the abstract
                console.log("Deleting abstract:", jdata);

                $http.post("https://api-test2.salesgenx.in/TechnicalAbstract/DeleteTechnicalAbstract", jdata)
                    .then(function (response) {
                        console.log("Delete API Response:", response.data);

                        if (response.data.Message === "Technical Abstract Deleted Successfully") {
                            Swal.fire({
                                title: "Deleted!",
                                text: "Abstract has been deleted.",
                                icon: "success",
                            }).then(() => {
                                $scope.getTechnicalAbstracts();  // Refresh the list after deletion
                            });
                        } else {
                            Swal.fire("Error", "Unexpected API response: " + response.data, "error");
                        }
                    })
                    .catch(function (error) {
                        console.error("Error deleting abstract:", error);
                        Swal.fire("Error", "Failed to delete abstract. Check console for details.", "error");
                    });
            } else {
                Swal.fire("Cancelled", "Abstract is safe :)", "error");
            }
        });
    };


});