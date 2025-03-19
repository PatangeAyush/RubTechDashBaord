

var app = angular.module("dashboardApp", []);

app.controller('DashboardController', function ($scope, $http) {

    $scope.test="akdmk"



    // API Call to fetch events
    $http.post('https://bbtestapi.salesgenie.in/Gallery/GetGalleryEvent')
    //$http.post('https://localhost:44320/Gallery/GetGalleryEvent')
        .then(function (response) {
            /*$scope.events = response.data;*/
            $scope.events = Array.isArray(response.data) ? response.data : [response.data];

            console.log('API is Called', $scope.events);
              // AngularJS UI update karne ke liye apply() use karein
                setTimeout(function () {
                    $scope.$apply();
                }, 100);
        })
        .catch(function (error) {
            console.log('Error in Fetching Events : ' + error);
        });

    $scope.formatLink = function (event) {
        return event.replace(/ /g, '') + '.aspx';
    };
});


app.controller('GalleryEventController', ['$scope', '$http', function ($scope, $http) {
    $scope.uploadFiles = function (files) {
        $scope.files = files;
    };

    $scope.submitEvent = function () {
        if ($scope.eventTitle && $scope.files && $scope.files.length > 0) {
            var formData = new FormData();
            formData.append('eventTitle', $scope.eventTitle);

            angular.forEach($scope.files, function (file) {
                formData.append('files', file);
            });

            $http.post('https://bbtestapi.salesgenie.in/Gallery/AddGalleryEvent', formData, {
                headers: { 'Content-Type': undefined },
                transformRequest: angular.identity
            }).then(function (response) {
                console.log(response);
                alert("Event added successfully!");
            }, function (error) {
                console.log(error);
                alert("Error adding event.");
            });
        } else {
            alert("Please fill all fields.");
        }
    };
}]);




