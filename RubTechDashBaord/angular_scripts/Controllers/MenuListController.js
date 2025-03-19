var app = angular.module("dashboardApp");

app.controller("MenuController", function ($scope, $http) {

    $scope.menuList = [];

    function GetMenus() {
        $http.post("https://api-test2.salesgenx.in/MenuBar/GetMenuBar")
            .then(function (response) {

                $scope.menuList = response.data;
            },
                function (error) {

                    console.log("Error Occured While Fetching Menu Items : ", error);

                });
    }

    GetMenus();


    // Menu Add Karne Ke liye hai Ye .

    $scope.newMenu = {}; // Object to hold new menu data

    $scope.Insert = function () {
        if (!$scope.newMenu.MenuName) {
            Swal.fire("Error!", "Please enter Menu Name.", "error");
            return;
        }

        $http.post("https://api-test2.salesgenx.in/MenuBar/AddMenuBar", $scope.newMenu)
            .then(function (response) {
                Swal.fire({
                    title: "Success!",
                    text: "Menu Inserted Successfully",
                    icon: "success",
                    timer: 500,
                    timeProgressBar: true
                });
                $scope.newMenu = {};
                GetMenus();
            }, function (error) {
                Swal.fire("Error", "Error Occurred While Inserting Menu.", "error");
                return;
            });
    };



    // Update Menu Ka code hai

    $scope.addMenuModal = function (menu) {
        $scope.SelectedMenu = angular.copy(menu);
        $scope.SelectedMenu.Link = angular.copy(menu);
    };

    $scope.updateMenu = function () {

        // 🛑 Validation: Empty field check
        if (!$scope.SelectedMenu.MenuName) {
            Swal.fire("Error!", "Menu Name Cannot Be Empty.", "error");
            return;
        }

        var updateData = {
            MenuID: $scope.SelectedMenu.MenuID,
            MenuName: $scope.SelectedMenu.MenuName,
            MenuURL: $scope.SelectedMenu.Link
        };


        // ✅ API call with complete object
        $http.post("https://api-test2.salesgenx.in/MenuBar/UpdateMenuBar", updateData)
            .then(function (response) {

                Swal.fire({
                    title: "Success!",
                    text: "Menu Updated Successfully",
                    icon: "success",
                    timer: 2000,
                    timerProgressBar: true  // ✅ Corrected spelling
                });

                $("#addMenuModal").modal("hide"); // ✅ Modal close after success
                GetMenus(); // ✅ Refresh list after update

            }, function (error) {
                Swal.fire("Error", "Error Occurred While Updating Menu.", "error");
            });

    };

    // Menu Ko Delete karne ka code hai..

    $scope.deleteMenu = function (menuID) {

        // 🛑 Validation: Check if menuID is valid
        if (!menuID) {
            Swal.fire("Error", "Error Occurred While Deleting Menu", "error");
            return;
        }

        // 🛑 Confirmation Dialog Before Deleting
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!"
        }).then((result) => {

            if (result.isConfirmed) {
                // ✅ Correct API Call with Object Payload
                $http.post("https://api-test2.salesgenx.in/MenuBar/DeleteMenuBar", { MenuID: menuID })
                    .then(function (response) {
                        Swal.fire({
                            title: "Deleted!",
                            text: "Menu has been deleted.",
                            icon: "success",
                            timer: 1000,
                            timerProgressBar: true
                        });

                        GetMenus(); // ✅ Refresh List After Deletion
                    }, function (error) {
                        Swal.fire("Error", "Error Occurred While Deleting Menu.", "error");
                    });
            }
        });
    };


    // Sub Menu Ka Code hai

    $scope.insertSubMenu = function () {
        if (!$scope.editSelectedMenu || !$scope.editSelectedMenu.MenuID || !$scope.subMenuName) {
            $scope.InsertSubMenuErrorMessage = "Please select a menu and enter a sub-menu name.";
            return;
        }

        var subMenuData = {
            MenuID: $scope.editSelectedMenu.MenuID, // Selected Menu ki ID
            SubMenu: $scope.subMenuName, // Sub Menu Name
            SubMenuURL: $scope.SubMenuURL
        };

        $http.post("https://api-test2.salesgenx.in/MenuBar/AddSubMenuBar", subMenuData)
            .then(function (response) {

                Swal.fire({
                    title: "Success!",
                    text: "Sub Menu Added Successfully",
                    icon: "success",
                    confirmButtonText: "OK",
                    timer: 1000,
                    showConfirmButton: false
                }).then(() => {
                    $scope.subMenuName = ""; // Clear input after success
                    GetMenus();
                    location.reload(); // ✅ Page refresh
                });

            })
            .catch(function (error) {
                console.error("Error inserting sub-menu:", error);
                $scope.InsertSubMenuErrorMessage = "Failed to insert sub-menu.";
            });
    };


    //modal me data bind kare.
    $scope.editSubMenu = function (menu) {
        $scope.editSubMenu.SubMenuID = menu.SubMenuID;
        $scope.editSubMenu.SubMenu = menu.SubMenu;
        $scope.editSubMenu.SubMenuURL = menu.SubMenuURL;
        console.log("Sub Menu Data For Editing", $scope.editSubMenu);
    };



    //$scope.editSubMenu = function (menu) {
    //    $scope.editSubMenu = {
    //       /* MenuID: menu.MenuID,*/
    //        SubMenuID: menu.SubMenuID,
    //        SubMenu: menu.SubMenu
    //    };

    //    console.log("Sub Menu Data For Editing", menu);
    //};

    $scope.updateSubMenu = function () {

        // 🛑 Validation: Agar SubMenuName empty hai
        if (!$scope.editSubMenu.SubMenu) {
            Swal.fire("Error!", "Sub-Menu Name Cannot Be Empty.", "error");
            return;
        }

        // ✅ Correct Data Object
        var subMenuData = {
            /* MenuID: $scope.editSubMenu.MenuID,*/
            SubMenuID: $scope.editSubMenu.SubMenuID,  // Sub-Menu ki ID
            SubMenu: $scope.editSubMenu.SubMenu,
            SubMenuURL: $scope.editSubMenu.SubMenuURL
        };

        console.log("Updating Sub-Menu:", subMenuData);

        // ✅ API Call
        $http.post("https://api-test2.salesgenx.in/MenuBar/UpdateMenuBar", subMenuData)
            .then(function (response) {
                Swal.fire({
                    title: "Success!",
                    text: "Sub-Menu Updated Successfully",
                    icon: "success",
                    timer: 2000
                });

                // Delay modal close to allow SweetAlert to show
                setTimeout(function () {
                    $("#editSubMenuModal").modal("hide");
                    GetMenus();
                }, 2500); // Wait 2.5 seconds before closing modal
            }, function (error) {
                Swal.fire("Error", "Error Occurred While Updating Sub-Menu.", "error");
                console.log("Update Error:", error);
            });
    };

    $scope.deleteSubMenu = function (submenuId) {
        if (!submenuId) {
            console.error("SubMenuID is undefined!");
            return;
        }

        // 🛑 Confirmation Dialog Before Deleting
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!"
        }).then((result) => {
            if (result.isConfirmed) {
                // ✅ API call with correct data
                $http.post("https://api-test2.salesgenx.in/MenuBar/DeleteMenuBar", { SubMenuID: submenuId })
                    .then(function (response) {
                        Swal.fire("Deleted!", "Sub Menu has been deleted.", "success");
                        GetMenus(); // Table refresh
                    })
                    .catch(function (error) {
                        Swal.fire("Error!", "Failed to delete Sub-Menu.", "error");
                        console.error("Error Deleting Sub-Menu:", error);
                    });
            }
        });
    };


});