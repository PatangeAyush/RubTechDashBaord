app.controller('NewsLetterController', function ($scope, $http) {
    $scope.newsletters = []; // Newsletter data list
    $scope.searchText = ""; // For search
    $scope.currentPage = 1; // For pagination
    $scope.itemsPerPage = 10; // Items per page

    // Function to convert JSON date to readable format
    function parseJsonDate(jsonDate) {
        var timestamp = parseInt(jsonDate.replace(/\/Date\((\d+)\)\//, '$1'));
        var date = new Date(timestamp);
        return date.toLocaleDateString(); // You can use toLocaleString() for full datetime
    }

    // Fetch newsletters from API
    $scope.getNewsletters = function () {
        $http.post('https://api-test2.salesgenx.in/NewsLetter/GetNewsLetter')
            .then(function (response) {
                console.log('API Response:', response.data);

                if (response.data && Array.isArray(response.data)) {
                    // Parse DateTime to readable date
                    $scope.newsletters = response.data.map(function (item) {
                        return {
                            Email: item.Email,
                            DateTime: parseJsonDate(item.DateTime), // Convert date
                        };
                    });
                } else {
                    console.error("Invalid response format:", response.data);
                    $scope.newsletters = [];
                }
            })
            .catch(function (error) {
                console.error('Error fetching newsletters:', error);
            });
    };

    // Call API on load
    $scope.getNewsletters();

    // Filter and paginate combined
    $scope.paginatedItems = function () {
        var filtered = $scope.newsletters.filter(function (item) {
            return item.Email.toLowerCase().includes($scope.searchText.toLowerCase());
        });

        var begin = ($scope.currentPage - 1) * $scope.itemsPerPage;
        var end = begin + $scope.itemsPerPage;
        return filtered.slice(begin, end);
    };

    // Count pages
    $scope.pageCount = function () {
        var filtered = $scope.newsletters.filter(function (item) {
            return item.Email.toLowerCase().includes($scope.searchText.toLowerCase());
        });
        return Math.ceil(filtered.length / $scope.itemsPerPage) || 1;
    };

    // Set page
    $scope.setPage = function (page) {
        if (page >= 1 && page <= $scope.pageCount()) {
            $scope.currentPage = page;
        }
    };
});
