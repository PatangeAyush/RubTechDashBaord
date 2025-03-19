<%@ Page Title="" Language="C#" MasterPageFile="~/Rubtech.Master" AutoEventWireup="true" CodeBehind="Registrations.aspx.cs" Inherits="RubTechDashBaord.Registrations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <script src="angular_scripts/app.js"></script>
    <script src="angular_scripts/Controllers/RegisterPageController.js"></script>

<%--    sweeet alert--%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <button onclick="topFunction()" class="btn btn-danger btn-icon" id="back-to-top">
        <i class="ri-arrow-up-line"></i>
    </button>

    <!-- Preloader -->
    <div id="preloader">
        <div id="status">
            <div class="spinner-border text-primary avatar-sm" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    </div>

    <div ng-controller="RegisterPageController">

      <%--  Registration Popupmodal --%>


        <div class="modal fade" id="addRegistrationModalLabel" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header p-4 pb-0 m-2">
                        <h1 class="modal-title fs-4 fw-medium">Edit Registration</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body p-4">
                        <form class="needs-validation p-2">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="popupFullName" class="form-label">Full Name</label>
                                    <input type="text" class="form-control rounded-pill" id="popupFullName"
                                        ng-model="popupFullName" placeholder="Enter Full Name">
                                </div>
                                <div class="col-md-6">
                                    <label for="popupCompanyName" class="form-label">Company Name</label>
                                    <input type="text" class="form-control rounded-pill" id="popupCompanyName"
                                        ng-model="popupCompanyName" placeholder="Enter Company Name">
                                </div>
                                <div class="col-md-6">
                                    <label for="popupEmail" class="form-label">Email Id</label>
                                    <input type="text" class="form-control rounded-pill" id="popupEmail"
                                        ng-model="popupEmail" placeholder="Enter Valid Email">
                                </div>

                                <div class="col-md-6">
                                    <label for="popupPhoneNumber" class="form-label">Phone Number</label>
                                    <input type="text" class="form-control rounded-pill" id="popupPhoneNumber"
                                        ng-model="popupPhoneNumber" placeholder="Enter Phone Number">
                                </div>
                                <div class="col-md-6">
                                    <label for="popupCityState" class="form-label">City/State</label>
                                    <input type="text" class="form-control rounded-pill" id="popupCityState"
                                        ng-model="popupCityState" placeholder="Enter City/State">
                                </div>

                                <div class="col-md-12">
                                    <label for="popupAddress" class="form-label">Address</label>
                                    <textarea class="form-control rounded" id="popupAddress"
                                        ng-model="popupAddress" rows="3" placeholder="Enter Your Address"></textarea>
                                </div>

                                <div class="col-md-6">
                                    <label for="popupCountry" class="form-label">Country</label>
                                    <input type="text" class="form-control rounded-pill" id="popupCountry"
                                        ng-model="popupCountry" placeholder="Enter Country">
                                </div>
                                <div class="col-md-6">
                                    <label for="popupZipPostal" class="form-label">Zip/Postal Code</label>
                                    <input type="text" class="form-control rounded-pill" id="popupZipPostal"
                                        ng-model="popupZipPostal" placeholder="Enter Zip/Postal Code">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Magazine Subscription</label>
                                    <div class="d-flex gap-3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" id="popupPrint" name="popupSubscription"
                                                value="Print" ng-model="popupSubscription">
                                            <label class="form-check-label" for="popupPrint">Print</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" id="popupDigital" name="popupSubscription"
                                                value="Digital" ng-model="popupSubscription">
                                            <label class="form-check-label" for="popupDigital">Digital</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" id="popupBoth" name="popupSubscription"
                                                value="Both" ng-model="popupSubscription">
                                            <label class="form-check-label" for="popupBoth">Both</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Subscription Duration</label>
                                    <div class="d-flex gap-3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" id="popupOneYear" name="popupDuration"
                                                value="1 Year" ng-model="popupDuration">
                                            <label class="form-check-label" for="popupOneYear">1 Year</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" id="popupTwoYears" name="popupDuration"
                                                value="2 Years" ng-model="popupDuration">
                                            <label class="form-check-label" for="popupTwoYears">2 Years</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Payment Information</label>
                                    <div class="d-flex gap-3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" id="popupOnlinePayment" name="popupPayment"
                                                value="Online" ng-model="popupPayment">
                                            <label class="form-check-label" for="popupOnlinePayment">Online</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" id="popupChequePayment" name="popupPayment"
                                                value="Cheque" ng-model="popupPayment">
                                            <label class="form-check-label" for="popupChequePayment">Cheque</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12 mt-3">
                                    <button type="button" class="btn btn-success squared-pill px-4" ng-click="updateRegistration()">
                                        <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Update
                                    </button>
                                </div>
                                <div class="col-md-12">
                                    <div class="alert alert-danger" ng-show="InsertErrorMessage">
                                        {{ InsertErrorMessage }}
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!-- Page Content -->
       <div class="page-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                   <%-- <h4 class="mb-sm-0">Add Registration</h4>--%>
                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                            <li class="breadcrumb-item active">Registration Details.</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <!-- end page title -->

        <%--<div class="row">
            <div class="col-lg-12">
                <div class="card p-4 shadow-sm">
                    <div class="card-body">
                        <div class="row gy-3">

                            <!-- Full Name & Company Name & Email-->
                            <div class="col-md-6">
                                <label for="fullName" class="form-label">Full Name</label>
                                <input type="text" class="form-control rounded-pill" id="fullName"
                                    ng-model="fullName" placeholder="Enter Full Name">
                            </div>
                            <div class="col-md-6">
                                <label for="companyName" class="form-label">Company Name</label>
                                <input type="text" class="form-control rounded-pill" id="companyName"
                                    ng-model="companyName" placeholder="Enter Company Name">
                            </div>
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email Id</label>
                                <input type="text" class="form-control rounded-pill" id="email"
                                    ng-model="email" placeholder="Enter Valid Email">
                            </div>

                            <!-- Phone Number & City/State -->
                            <div class="col-md-6">
                                <label for="phoneNumber" class="form-label">Phone Number</label>
                                <input type="text" class="form-control rounded-pill" id="phoneNumber"
                                    ng-model="phoneNumber" placeholder="Enter Phone Number">
                            </div>
                            <div class="col-md-6">
                                <label for="City_State" class="form-label">City/State</label>
                                <input type="text" class="form-control rounded-pill" id="City_State"
                                    ng-model="City_State" placeholder="Enter City/State">
                            </div>

                            <!-- Address -->
                            <div class="col-md-12">
                                <label for="addressInput" class="form-label">Address</label>
                                <textarea class="form-control rounded" id="addressInput"
                                    ng-model="addressInput" rows="3" placeholder="Enter Your Address"></textarea>
                            </div>

                            <!-- Country & Zip/Postal -->
                            <div class="col-md-6">
                                <label for="country" class="form-label">Country</label>
                                <input type="text" class="form-control rounded-pill" id="country"
                                    ng-model="country" placeholder="Enter Country">
                            </div>
                            <div class="col-md-6">
                                <label for="Zip_Postal" class="form-label">Zip/Postal Code</label>
                                <input type="text" class="form-control rounded-pill" id="Zip_Postal"
                                    ng-model="Zip_Postal" placeholder="Enter Zip/Postal Code">
                            </div>

                            <!-- Magazine Subscription & Subscription Duration -->
                            <div class="col-md-6">
                                <label class="form-label">Magazine Subscription</label>
                                <div class="d-flex gap-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" id="Print" name="subscription"
                                            value="Print" ng-model="subscription">
                                        <label class="form-check-label" for="Print">Print</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" id="Digital" name="subscription"
                                            value="Digital" ng-model="subscription">
                                        <label class="form-check-label" for="Digital">Digital</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" id="Both" name="subscription"
                                            value="Both" ng-model="subscription">
                                        <label class="form-check-label" for="Both">Both</label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Subscription Duration</label>
                                <div class="d-flex gap-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" id="oneYear" name="duration"
                                            value="1 Year" ng-model="duration">
                                        <label class="form-check-label" for="oneYear">1 Year</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" id="twoYears" name="duration"
                                            value="2 Years" ng-model="duration">
                                        <label class="form-check-label" for="twoYears">2 Years</label>
                                    </div>
                                </div>
                            </div>

                            <!-- Payment Information & Promotional Preference -->
                            <div class="col-md-6">
                                <label class="form-label">Payment Information</label>
                                <div class="d-flex gap-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" id="onlinePayment" name="payment"
                                            value="Online" ng-model="payment">
                                        <label class="form-check-label" for="onlinePayment">Online</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" id="chequePayment" name="payment"
                                            value="Cheque" ng-model="payment">
                                        <label class="form-check-label" for="chequePayment">Cheque</label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Promotional Preference</label>
                                <h5>Do you want to receive promotional offers & updates?</h5>
                                <div class="d-flex gap-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" id="preferenceYes" name="preference"
                                            value="Yes" ng-model="preference">
                                        <label class="form-check-label" for="preferenceYes">Yes</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" id="preferenceNo" name="preference"
                                            value="No" ng-model="preference">
                                        <label class="form-check-label" for="preferenceNo">No</label>
                                    </div>
                                </div>
                            </div>

                            <!-- IRMRA Membership -->
                            <div class="col-md-6">
                                <label class="form-label">IRMRA Membership</label>
                                <h5>IRMRA Membership Status</h5>
                                <div class="d-flex gap-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" id="member" name="membership"
                                            value="Member" ng-model="membership">
                                        <label class="form-check-label" for="member">Member</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" id="nonMember" name="membership"
                                            value="Non-Member" ng-model="membership">
                                        <label class="form-check-label" for="nonMember">Non-Member</label>
                                    </div>
                                </div>
                            </div>


                            <!-- Submit Button & Error Message -->
                            <div class="col-md-12 mt-3">
                                <button type="button" class="btn btn-success squared-pill px-4" ng-click="Insert()">
                                    <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Insert
                                </button>
                            </div>
                            <div class="col-md-12">
                                <div class="alert alert-danger" ng-show="ErrorMessage">
                                    {{ ErrorMessage }}
                                </div>
                            </div>

                        </div>
                        <!-- End Row -->
                    </div>
                    <!-- End Card Body -->
                </div>
                <!-- End Card -->
            </div>
            <!-- End Col -->
        </div>
        <!-- End Row -->--%>

<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header d-flex align-items-center">
                <h4 class="card-title mb-0 flex-grow-1">Registration Details</h4>
                <div class="ms-auto d-flex gap-2">
                    <input type="text" class="form-control" placeholder="Search..." ng-model="searchText">
                    <button class="btn btn-success" ng-click="exportToExcel()">Download Excel</button>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered dt-responsive">
                        <thead class="table-success">
                            <tr>
                                <th class="d-none">ID</th>
                                <th>Full Name</th>
                                <th>Company Name</th>
                                <th>Phone Number</th>
                                <th>Email</th>
                                <th>Magazine</th>
                                <th>Duration</th>
                                <th>Address</th>
                                <th>City_State</th>
                                <th>Zip_Postal</th>
                                <th>Country</th>
                                <th>Payment_Info</th>
                                <th>Promotional_Preference</th>
                                <th>IRMRA_Membership</th>
                                <th>Registration Date & Time</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="event in filteredEvents = (events | filter:searchText) | limitTo: pageSize : (currentPage-1)*pageSize">
                                <td class="d-none">{{ event.Id }}</td>
                                <td>{{ event.name }}</td>
                                <td>{{ event.company }}</td>
                                <td>{{ event.phoneNumber }}</td>
                                <td>{{ event.email }}</td>
                                <td>{{ event.magazine }}</td>
                                <td>{{ event.duration }}</td>
                                <td>{{ event.Address }}</td>
                                <td>{{ event.City_State }}</td>
                                <td>{{ event.Zip_Postal }}</td>
                                <td>{{ event.Country }}</td>
                                <td>{{ event.Payment_Info }}</td>
                                <td>{{ event.Promotional_Preference }}</td>
                                <td>{{ event.IRMRA_Membership }}</td>
                                <td>{{ event.User_Registration_Date }}</td>
                                <td class="text-center">
                                    <%--<a href="#addRegistrationModalLabel" data-bs-toggle="modal" ng-click="addRegistrationModalLabel(event)" class="link-success fs-20 me-2" title="Edit">
                                        <i class="ri-edit-2-line"></i>
                                    </a>--%>
                                    <a href="#" ng-click="deleteUser(event, event.Id)" class="link-danger fs-20" title="Delete">
                                        <i class="ri-delete-bin-line"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- Pagination Controls -->
                    <nav>
                        <ul class="pagination justify-content-center">
                            <li class="page-item" ng-class="{disabled: currentPage === 1}">
                                <a class="page-link" href="#" ng-click="prevPage()">Previous</a>
                            </li>
                            <li class="page-item disabled">
                                <span class="page-link">Page {{ currentPage }} of {{ totalPages() }}</span>
                            </li>
                            <li class="page-item" ng-class="{disabled: currentPage === totalPages()}">
                                <a class="page-link" href="#" ng-click="nextPage()">Next</a>
                            </li>
                        </ul>
                    </nav>

                </div>
            </div>
        </div>
    </div>
</div>

        </div>
        <!-- Footer -->
        <footer class="footer text-center py-3">
            <div class="container">
                <span class="text-muted">&copy; 2025 RubTech Dashboard. All rights reserved.</span>
            </div>
        </footer>
    </div>
</div>
    
</asp:Content>
