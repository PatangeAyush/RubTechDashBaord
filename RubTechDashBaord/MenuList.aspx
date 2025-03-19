<%@ Page Title="" Language="C#" MasterPageFile="~/Rubtech.Master" AutoEventWireup="true" CodeBehind="MenuList.aspx.cs" Inherits="RubTechDashBaord.MenuList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="angular_scripts/Controllers/MenuListController.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div ng-controller="MenuController">
     <%--Menu List --%>

     <button onclick="topFunction()" class="btn btn-danger btn-icon" id="back-to-top">
         <i class="ri-arrow-up-line"></i>
     </button>
     <!--end back-to-top-->

     <!--preloader-->
     <div id="preloader">
         <div id="status">
             <div class="spinner-border text-primary avatar-sm" role="status">
                 <span class="visually-hidden">Loading...</span>
             </div>
         </div>
     </div>


     <!-- Add  Menu Popup Modal Start-->


     <div class="modal fade" id="addMenuModal" tabindex="-1" aria-labelledby="addMenuModal" aria-hidden="true">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header p-4 pb-0 m-2">
                     <h1 class="modal-title fs-4 fw-medium" id="addContactModalLabel">Edit Menu</h1>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" id="addMenuModal-btnClose" aria-label="Close"></button>
                 </div>
                 <div class="modal-body pt-0 p-4">
                     <form id="contactlist-form" class="needs-validation p-2">


                         <div class="d-flex flex-column gap-3">
                             <input type="hidden" ng-model="SelectedMenu.MenuID" />
                             <div>
                                 <label for="basiInput" class="form-label">Menu</label>
                                 <input type="text" class="form-control rounded-pill" id="SelectedMenu.MenuName" ng-model="SelectedMenu.MenuName" placeholder="Enter Menu">
                             </div>
                             <div>
                                 <label for="basiInput" class="form-label">Link</label>
                                 <input type="text" class="form-control rounded-pill" id="SelectedMenu.Link" ng-model="SelectedMenu.Link" placeholder="Enter Link">
                             </div>
                             <div class="col-md-12">
                                 <div class="alert alert-danger" ng-show="UpdateErrorMessage">
                                     {{ UpdateErrorMessage }}
                         
                                 </div>
                             </div>
                             <div class="text-end">
                                 <button type="button" class="btn btn-success squared-pill px-4" ng-click="updateMenu()">
                                     <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Update
                     
                                 </button>

                             </div>
                         </div>
                     </form>
                 </div>
             </div>
         </div>
     </div>

     <!-- Add Menu Popup Modal End-->

     <div class="page-content">
         <div class="container-fluid">

             <!-- start page title -->
             <div class="row">
                 <div class="col-12">
                     <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                         <h1 class="mb-sm-0">Add Menu</h1>

                         <div class="page-title-right">
                             <ol class="breadcrumb m-0">
                                 <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                                 <li class="breadcrumb-item active">Menu</li>
                             </ol>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="row">
                 <div class="col-lg-12">
                     <div class="card">
                         <div class="card-body">
                             <div class="row gy-4">

                                 <div class="col-xxl-6 col-md-6">
                                     <div>
                                         <label for="contact1" class="form-label">Menu</label>
                                     </div>
                                 </div>
                                 <div class="col-12 text-start mt-3">
                                     <input type="text" class="form-control rounded-pill" id="mainMenu" ng-model="newMenu.MenuName" placeholder="Enter Menu Name">
                                     <br />
                                     <input type="text" class="form-control rounded-pill" id="mainMenuLink" ng-model="newMenu.MenuURL" placeholder="Enter Menu Link">
                                     <br />
                                     <button type="button" class="btn btn-success squared-pill px-4" ng-click="Insert()">
                                         <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Insert
                                     </button>

                                 </div>

                                 <!-- Error Message Show -->
                                 <div class="col-md-12">
                                     <div class="alert alert-danger" ng-show="InsertErrorMessage">
                                         {{ InsertErrorMessage }}
                                     </div>
                                 </div>


                             </div>
                         </div>
                     </div>
                 </div>
             </div>

             <div class="row">
                 <div class="col-xl-12">
                     <div class="card">
                         <%--  Search Bar--%>
                         <%-- <div class="card-header d-flex align-items-center">
                          <h4 class="card-title mb-0 flex-grow-1">Menu Details</h4>
                          <input type="text" class="form-control" placeholder="Search..." ng-model="searchText">
                      </div>--%>
                         <div class="card-body">
                             <div class="table-responsive">
                                 <table class="table table-bordered dt-responsive" datatable="ng" dt-options="dtOptionsAdmin" dt-column-def="dtColumnDefs">
                                     <thead class="table-success">
                                         <tr>
                                             <th class="d-none">ID</th>
                                             <th>Menu</th>
                                             <th>Link</th>
                                             <th class="text-center">Actions</th>
                                         </tr>
                                     </thead>
                                     <tbody>
                                         <tr ng-repeat="menu in menuList">
                                             <td class="d-none">{{ menu.MenuID }}</td>
                                             <td>{{ menu.MenuName }}</td>
                                             <td>{{ menu.MenuURL }}</td>
                                             <%--<td>{{ menu.SubMenus }}</td>--%>
                                             <!-- Submenus comma separated aa jayenge -->
                                             <td class="text-center">
                                                 <a href="#addMenuModal" data-bs-toggle="modal" ng-click="addMenuModal(menu)" class="link-success fs-20 me-2" title="Edit">
                                                     <i class="ri-edit-2-line"></i>
                                                 </a>
                                                 <a href="#" ng-click="deleteMenu(menu.MenuID)" class="link-danger fs-20" title="Delete">
                                                     <i class="ri-delete-bin-line"></i>
                                                 </a>
                                             </td>
                                         </tr>
                                     </tbody>

                                 </table>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>

         </div>
     </div>


     <%--Menu List Ends --%>

     <%--Sub-Menu--%>

     <div class="modal fade" id="editSubMenuModal" tabindex="-1" aria-labelledby="editSubMenuModal" aria-hidden="true">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header p-4 pb-0 m-2">
                     <h1 class="modal-title fs-4 fw-medium">Edit Sub-Menu</h1>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" id="editSubMenuModal-btnClose"
                         aria-label="Close">
                     </button>
                 </div>
                 <div class="modal-body pt-0 p-4">
                     <form id="editSubMenuForm" class="needs-validation p-2">
                         <div class="d-flex flex-column gap-3">

                             <!-- Auto-bind hone wala sub-menu name -->
                             <%--<div class="d-none">
                                 <label class="form-label">Menu ID</label>
                                 <input type="text" class="form-control rounded-pill" id="editMenuID"
                                     ng-model="editSubMenu.MenuID" readonly>
                             </div>--%>
                             <div class="d-none">
                                 <label class="form-label">Sub-Menu ID</label>
                                 <input type="text" class="form-control rounded-pill" id="editSubMenuID"
                                     ng-model="editSubMenu.SubMenuID" readonly>
                             </div>

                             <div>
                                 <label class="form-label">Sub-Menu Name</label>
                                 <input type="text" class="form-control rounded-pill" id="editSubMenuName"
                                     ng-model="editSubMenu.SubMenu" placeholder="Enter Sub-Menu">
                             </div>
                             <div>
                                 <label class="form-label">Sub-Menu Link</label>
                                 <input type="text" class="form-control rounded-pill" id="editSubURL"
                                     ng-model="editSubMenu.SubMenuURL" placeholder="Enter Sub-Menu">
                             </div>

                             <div class="col-md-12">
                                 <div class="alert alert-danger" ng-show="UpdateSubMenuErrorMessage">
                                     {{ UpdateSubMenuErrorMessage }}
                                 </div>
                             </div>

                             <div class="text-end">
                                 <button type="button" class="btn btn-success squared-pill px-4"
                                     ng-click="updateSubMenu()">
                                     <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Update
                                 </button>
                             </div>
                         </div>
                     </form>
                 </div>
             </div>
         </div>
     </div>

     <%--Sub-Menu List--%>

     <div class="page-content">
         <div class="container-fluid">

             <!-- start page title -->
             <div class="row">
                 <div class="col-12">
                     <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                         <h1 class="mb-sm-0">Add Sub-Menu</h1>

                         <div class="page-title-right">
                             <ol class="breadcrumb m-0">
                                 <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                                 <li class="breadcrumb-item active">Sub-Menu</li>
                             </ol>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="col-lg-12">
                 <div class="card">
                     <div class="card-body">
                         <div class="row gy-4">
                             <div class="col-xxl-6 col-md-6">
                                 <label class="form-label">Select Menu</label>
                                 <select class="form-control rounded-pill" id="editMenuDropdown"
                                     ng-model="editSelectedMenu"
                                     ng-options="menu as menu.MenuName for menu in menuList track by menu.MenuID">
                                     <option value="">-- Select Menu --</option>
                                 </select>
                             </div>
                             <div class="col-xxl-6 col-md-6">
                                 <label class="form-label">Sub-Menu</label>
                                 <input type="text" class="form-control rounded-pill" id="subMenuName" ng-model="subMenuName"
                                     placeholder="Enter Sub-Menu">
                             </div>
                             <div class="col-xxl-6 col-md-6">
                                 <label class="form-label">Sub-Menu Link</label>
                                 <input type="text" class="form-control rounded-pill" id="SubMenuURL" ng-model="SubMenuURL"
                                     placeholder="Enter Sub-Menu Link">
                             </div>
                             <%--<div class="col-xxl-6 col-md-6">
                                 <label class="form-label">Sub-Menu Link</label>
                                 <input type="text" class="form-control rounded-pill" id="subMenuLink" ng-model="subMenuLink"
                                     placeholder="Enter Link">
                             </div>--%>
                             <div class="col-12 text-start mt-3">
                                 <button type="button" class="btn btn-success squared-pill px-4" ng-click="insertSubMenu()">
                                     <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Insert
                                 </button>
                             </div>
                             <div class="col-md-12">
                                 <div class="alert alert-danger" ng-show="InsertSubMenuErrorMessage">
                                     {{ InsertSubMenuErrorMessage }}
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>

             <div class="row">
                 <div class="col-xl-12">
                     <div class="card">
                         <%--Search Bar--%>
                         <%--  <div class="card-header d-flex align-items-center">
                         <h4 class="card-title mb-0 flex-grow-1">Sub-Menu Details</h4>
                             <input type="text" class="form-control" placeholder="Search..." ng-model="searchText">
                     </div>--%>
                         <div class="card-body">
                             <div class="table-responsive">
                                 <table class="table table-bordered dt-responsive" datatable="ng" dt-options="dtOptionsAdmin"
                                     dt-column-def="dtColumnDefs">
                                     <thead class="table-success">
                                         <tr>
                                             <th class="d-none">ID</th>
                                             <th>Menu</th>
                                             <th class="d-none">SubMenuID</th>
                                             <th>Sub-Menu</th>
                                             <th>Link</th>
                                             <th class="text-center">Actions</th>
                                         </tr>
                                     </thead>
                                     <tbody>
                                         <tr ng-repeat="menu in menuList">
                                             <td class="d-none">{{ menu.MenuID }}</td>
                                             <td>{{ menu.MenuName }}</td>
                                            
                                             <td class="d-none">{{ menu.SubMenuID }}</td>
                                             <td>{{ menu.SubMenu }}</td>
                                              <td>{{ menu.SubMenuURL }}</td>
                                             <td class="text-center">
                                                 <a href="#editSubMenuModal" data-bs-toggle="modal" ng-click="editSubMenu(menu)"
                                                     class="link-success fs-20 me-2" title="Edit">
                                                     <i class="ri-edit-2-line"></i>
                                                 </a>
                                                 <a href="#" ng-click="deleteSubMenu(menu.SubMenuID)"
                                                     class="link-danger fs-20" title="Delete">
                                                     <i class="ri-delete-bin-line"></i>
                                                 </a>
                                             </td>
                                         </tr>
                                     </tbody>
                                 </table>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
     <%--Sub-Menu List--%>
 </div>


</asp:Content>
