<%@ Page Title="" Language="C#" MasterPageFile="~/Rubtech.Master" AutoEventWireup="true" CodeBehind="Foot-MenuList.aspx.cs" Inherits="RubTechDashBaord.FooterMenuController" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="angular_scripts/Controllers/FooterMenuController.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <div ng-controller="FooterMenuController">
     <div class="modal fade" id="addFooterMenuModal" tabindex="-1" aria-labelledby="addFooterMenuModal" aria-hidden="true">
     <div class="modal-dialog">
         <div class="modal-content">
             <div class="modal-header p-4 pb-0 m-2">
                 <h1 class="modal-title fs-4 fw-medium" id="addFooterMenuModal">Edit Footer-Menu</h1>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" id="addFooterMenuModal-btnClose" aria-label="Close"></button>
             </div>
             <div class="modal-body pt-0 p-4">
                 <form id="addFooterMenuModal-form" class="needs-validation p-2">


                     <div class="d-flex flex-column gap-3">
                         <div>
                             <label for="basiInput" class="form-label">About Company</label>
                             <textarea class="form-control squared-pill" id="popupAboutCompany" ng-model="popupAboutCompany" placeholder="Enter About Company"></textarea>
                         </div>
                   <div class="col-md-12">
                             <div class="alert alert-danger" ng-show="UpdateErrorMessage">
                                 {{ UpdateErrorMessage }}
                        
                             </div>
                         </div>
                         <div class="text-end">
                             <button type="button" class="btn btn-success squared-pill px-4" ng-click="update()">
                                 <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Update
                    
                             </button>

                         </div>
                     </div>
                 </form>
             </div>
         </div>
     </div>
 </div>

                                                                 <!-- Add Footer-Menu Popup Modal End-->


                                                                         <%--Main Content Starts--%>

 <div class="page-content">
     <div class="container-fluid">

         <!-- start page title -->
         <div class="row">
             <div class="col-12">
                 <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                     <h4 class="mb-sm-0">Add About Company</h4>

                     <div class="page-title-right">
                         <ol class="breadcrumb m-0">
                             <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                             <li class="breadcrumb-item active">About Company</li>
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
                             
                             <div class="col-xxl-12 col-md-12">
                                 <div>
                                     <label for="contact1" class="form-label">About Company</label>
                                     <textarea class="form-control squared-pill" id="aboutCompany" ng-model="aboutCompany" placeholder ="Enter About Company" rows="4"></textarea>
                                 </div>
                             </div>
                             <div class="col-12 text-start mt-3">
                                 <button type="button" class="btn btn-success squared-pill px-4" ng-click="Insert()">
                                     <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Insert
                                 </button>
                             </div>
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
                     <div class="card-header d-flex align-items-center">
                         <h4 class="card-title mb-0 flex-grow-1">About Company Details</h4>
                             <input type="text" class="form-control" placeholder="Search..." ng-model="searchText">
                     </div>
                     <div class="card-body">
                         <div class="table-responsive">
                            <table class="table table-bordered dt-responsive" datatable="ng" dt-options="dtOptionsAdmin" dt-column-def="dtColumnDefs">
                                 <thead class="table-success">
                                     <tr>
                                         <th class="d-none">ID</th>
                                         <th>About Company</th>
                                         <th class="text-center">Actions</th>
                                     </tr>
                                 </thead>
                                 <tbody>
                                     <tr ng-repeat="event in events | filter:searchText"">
                                         <td class="d-none">{{ event.Id }}</td>
                                         <td style="word-break: break-all;">{{ event.CompanyAddress }}</td>
                                         <td class="text-center">
                                             <a href="#addFooterMenuModal" data-bs-toggle="modal" ng-click="addFooterMenuModal(event)" class="link-success fs-20 me-2" title="Edit">
                                                 <i class="ri-edit-2-line"></i>
                                             </a>
                                             <%--<a href="#" ng-click="deleteAboutCompany(event, event.Id)" class="link-danger fs-20" title="Delete">
                                                 <i class="ri-delete-bin-line"></i>
                                             </a>--%>
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
</div>
</asp:Content>
