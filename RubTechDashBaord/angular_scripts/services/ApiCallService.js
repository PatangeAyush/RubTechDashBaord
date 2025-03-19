MRAI.service('ApiCall', ['$http', function ($http) {
    var result;
    var retResult;
    var data;

    // This is used for calling post methods from web api with passing some data to the web api controller
    this.PostApiCall = function (controller, method, jData) {
        jData = JSON.stringify(jData);
  
        
  //result = $http.post('http://localhost:51884/' + controller + '/' + method, jData).success(function (data, status) {
        result = $http.post('https://bbtestapi.salesgenie.in/' + controller + '/' + method, jData).success(function (data, status) {

            result = data;

        }).error(function (data, status) {
            console.error("CustomError:" + data);
        });

        return result;
    };

    this.getUrlParameters = function () {
        var pairs = window.location.search.substring(1).split(/[&?]/);
        var res = {}, i, pair;
        for (i = 0; i < pairs.length; i++) {
            pair = pairs[i].split('=');
            if (pair[1])
                res[decodeURIComponent(pair[0])] = decodeURIComponent(pair[1]);
        }
        return res;
    };

    this.SaveFile = function (file, savePath, fileName) {
        var obj = new FormData();
        obj.append("FileSavePath", savePath);
        obj.append("FileName", fileName);
        obj.append("File", file);

        result = $http.post('https://bbtestapi.salesgenie.in/ImageUpload/SaveFiles', obj,
   
   //result = $http.post('http://localhost:51884/ImageUpload/SaveFiles', obj,
      
                        {
                withCredentials: false,
                headers: { 'Content-Type': undefined },
                transformRequest: angular.identity
            }).success(function (data) {
                result = data;
            }).error(function (data) {
                result = data;

            });

        return result;

    };


}]);

