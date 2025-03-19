var app = angular.module("dashboardApp");

app.controller('TeamController', function ($scope, $http) {

    // Fetch Team Details
    $scope.getTeamDetails = function () {
        $http.post('https://api-test2.salesgenx.in/Mentor/GetMentor')
            .then(function (response) {
                console.log('API Response:', response.data);

                if (Array.isArray(response.data)) {
                    $scope.teams = response.data.map(team => ({
                        ID: team.ID,
                        Name: team.Name,
                        Position: team.Position,
                        ImagePath: team.ImagePath
                            ? 'https://api-test2.salesgenx.in/' + team.ImagePath.replace(/\\/g, '/')
                            : null
                    }));
                } else {
                    console.error("Invalid response format:", response.data);
                    $scope.teams = [];
                }
            })
            .catch(function (error) {
                console.error('Error fetching team details:', error);
            });
    };

    $scope.getTeamDetails();



    $scope.uploadTeamImage = function (files) {
        if (files.length > 0) {
            let file = files[0];


            if (file.size > 50 * 1024) {
                Swal.fire({
                    title: "Error!",
                    text: "Image size should not exceed 50KB.",
                    icon: "error",
                    confirmButtonText: "OK"
                });


                document.getElementById("teamImageUploadMain").value = "";
                return;
            }

            $scope.$applyAsync(() => {
                $scope.teamImage = file;
                console.log("Selected Image:", $scope.teamImage);
            });
        }
    };


    // Insert Team Member
    $scope.insertTeamMember = function () {
        $scope.ErrorMessage = "";

        if (!$scope.teamName?.trim()) {
            $scope.ErrorMessage = "Please enter the Team Member's Name";
            return;
        }
        if (!$scope.teamPosition?.trim()) {
            $scope.ErrorMessage = "Please enter the Team Member's Designation";
            return;
        }
        if (!$scope.teamImage) {
            $scope.ErrorMessage = "Please upload an Image.";
            return;
        }

        let formData = new FormData();
        formData.append("Name", $scope.teamName.trim());
        formData.append("Position", $scope.teamPosition.trim());
        formData.append("Image", $scope.teamImage);

        console.log("Sending Data:", formData);

        $http.post('https://api-test2.salesgenx.in/Mentor/AddMentor', formData, {
            headers: { 'Content-Type': undefined },
            transformRequest: angular.identity
        })
            .then(response => {
                console.log("Response:", response.data);

                if (response.data.Messege === "Mentor Added Successfully") {
                    Swal.fire({
                        title: "Success!",
                        text: "Team Member Inserted Successfully",
                        icon: "success",
                        confirmButtonText: "OK"
                    }).then(() => {
                        $scope.getTeamDetails(); // Refresh the list
                        $scope.teamName = "";
                        $scope.teamPosition = "";
                        $scope.teamImage = null;
                        document.getElementById("teamImageUploadMain").value = ""; // Clear file input
                        $scope.$apply();
                    });
                } else {
                    Swal.fire({
                        title: "Error!",
                        text: response.data.Message || "Team member upload failed. Please try again.",
                        icon: "error",
                        confirmButtonText: "OK"
                    });
                }
            })
            .catch(error => {
                console.error("Error inserting team member:", error);
                Swal.fire({
                    title: "Error!",
                    text: error.message || "Error inserting team member.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
                $scope.$apply();
            });
    };


    $scope.uploadTeamImage = function (files) {
        $scope.teamImage = files[0];
        $scope.$apply();
    };


    $scope.updateTeamMember = function () {
        $scope.UpdateErrorMessage = "";

        if (!$scope.popupTeamName?.trim()) {
            $scope.UpdateErrorMessage = "Please enter the Team Member's Name.";
            return;
        }
        if (!$scope.popupTeamPosition?.trim()) {
            $scope.UpdateErrorMessage = "Please enter the Team Member's Designation.";
            return;
        }

        let formData = new FormData();
        formData.append("ID", $scope.popupTeamId);
        formData.append("Name", $scope.popupTeamName.trim());
        formData.append("Position", $scope.popupTeamPosition.trim());

        if ($scope.teamImage) {
            formData.append("Image", $scope.teamImage);
        }

        console.log("Updating team member with data:", formData);

        $http.post('https://api-test2.salesgenx.in/Mentor/UpdateMentor', formData, {
            headers: { 'Content-Type': undefined },
            transformRequest: angular.identity
        })
            .then(response => {
                Swal.fire({
                    title: "Success!",
                    text: "Team Member Updated Successfully",
                    icon: "success",
                    confirmButtonText: "OK"
                }).then(() => {
                    $scope.getTeamDetails();
                    $('#addTeamModal').modal('hide');
                });
            })
            .catch(error => {
                console.error("Error updating team member:", error);
                Swal.fire({
                    title: "Error!",
                    text: "Failed to update team member.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
            });
    };

    $scope.editTeam = function (team) {
        $scope.popupTeamId = team.ID;
        $scope.popupTeamName = team.Name;
        $scope.popupTeamPosition = team.Position;
        $scope.popupTeamImage = team.ImagePath;

        $('#addTeamModal').modal('show');
    };

    $scope.deleteTeamMember = function ($event, teamMember) {
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to recover this team member!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            cancelButtonColor: "#6c757d",
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel!",
        }).then((result) => {
            if (result.isConfirmed) {
                var jdata = { Id: teamMember.ID };
                console.log("Deleting team member:", jdata);

                $http.post("https://api-test2.salesgenx.in/Mentor/DeleteMentor", jdata)
                    .then(function (response) {
                        console.log("Delete API Response:", response.data);

                        if (response.data.Messege === "Event Deleted Successfully") {
                            Swal.fire({
                                title: "Deleted!",
                                text: "Team member has been deleted.",
                                icon: "success",
                            }).then(() => {
                                $scope.getTeamDetails(); // Refresh the team list
                            });
                        } else {
                            Swal.fire("Error", "Unexpected API response: " + response.data.Message, "error");
                        }
                    })
                    .catch(function (error) {
                        console.error("Error deleting team member:", error);
                        Swal.fire("Error", "Failed to delete team member. Check console for details.", "error");
                    });
            } else {
                Swal.fire("Cancelled", "Team member is safe :)", "info");
            }
        });
    };



});
