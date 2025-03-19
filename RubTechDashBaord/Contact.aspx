<%@ Page Title="" Language="C#" MasterPageFile="~/Rubtech.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="RubTechDashBaord.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

       <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script src="angular_scripts/app.js"></script>
<script src="angular_scripts/Controllers/ContactController.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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


<!-- Add  Contact Popup Modal Start-->

<div ng-controller="ContactController">
    <div class="modal fade" id="addContactModal" tabindex="-1" aria-labelledby="addContactModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header p-4 pb-0 m-2">
                    <h1 class="modal-title fs-4 fw-medium" id="addContactModalLabel">Edit Contact</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" id="addContact-btnClose" aria-label="Close"></button>
                </div>
                <div class="modal-body pt-0 p-4">
                    <form id="contactlist-form" class="needs-validation p-2">


                        <div class="d-flex flex-column gap-3">
                            <div>
                                <label for="basiInput" class="form-label">Contact </label>
                                <input type="text" class="form-control rounded-pill" id="popupcontact" ng-model="popupcontact" placeholder="Enter Contact Number">
                            </div>

                            <div>
                                <label for="basiInput" class="form-label">Alternate Contact </label>
                                <input type="text" class="form-control rounded-pill" id="popupalternatecontact" ng-model="popupalternatecontact" placeholder="Enter Alternative Contact Number">
                            </div>


                            <div>
                                <label for="basiInput" class="form-label">Email</label>
                                <input type="text" class="form-control rounded-pill" id="popupemail" ng-model="popupemail" placeholder="Enter Vaild Email ID">
                            </div>
                            <div>
                                <label for="basiInput" class="form-label">Address</label>
                                <input type="text" class="form-control rounded-pill" id="popupaddressInput" ng-model="popupaddressInput" placeholder="Enter Address">
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

    <!-- Add Technical Abstract Popup Modal End-->

    <div class="page-content">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0">Add Contact</h4>

                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                                <li class="breadcrumb-item active">Contact</li>
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
                                        <label for="contact1" class="form-label">Contact</label>
                                        <input type="text" class="form-control rounded-pill" id="contact1" ng-model="contact1" placeholder ="Enter Contact Number">
                                    </div>
                                </div>

                                
                                <div class="col-xxl-6 col-md-6">
                                    <div>
                                        <label for="contact2" class="form-label">Alternate Contact</label>
                                        <input type="text" class="form-control rounded-pill" id="contact2" ng-model="contact2" placeholder="Enter Contact Number">
                                    </div>
                                </div>

                               
                                <div class="col-xxl-6 col-md-6">
                                    <div>
                                        <label for="email" class="form-label">Email ID</label>
                                        <input type="email" class="form-control rounded-pill" id="email" ng-model="email" placeholder="Enter Valid Email ID">
                                    </div>
                                </div>

                               
                                <div class="col-xxl-6 col-md-6">
                                    <div>
                                        <label for="addressInput" class="form-label">Address</label>
                                        <textarea class="form-control squared-pill" id="addressInput" rows="4" ng-model="addressInput" placeholder="Enter Your Address"></textarea>
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
                            <h4 class="card-title mb-0 flex-grow-1">CONTACT Details</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped align-middle">
                                    <thead class="table-success">
                                        <tr>
                                            <th class="d-none">ID</th>
                                            <th>Contact</th>
                                            <th>Alternate Contact</th>
                                            <th>Email ID</th>
                                            <th>Address</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="event in events">
                                            <td class="d-none">{{ event.Id }}</td>
                                            <td>{{ event.Contact }}</td>
                                            <td>{{ event.Alternative_Contact }}</td>
                                            <td>{{ event.Email }}</td>
                                            <td>{{ event.Address }}</td>
                                            <td class="text-center">
                                                <a href="#addContactModal" data-bs-toggle="modal" ng-click="addContactModal(event)" class="link-success fs-20 me-2" title="Edit">
                                                    <i class="ri-edit-2-line"></i>
                                                </a>
                                                <a href="#" ng-click="deleteContact(event, event.Id)" class="link-danger fs-20" title="Delete">
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
        <!-- container-fluid -->
    </div>
</div>


</asp:Content>



