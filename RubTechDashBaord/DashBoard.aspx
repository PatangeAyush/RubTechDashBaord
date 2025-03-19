<%@ Page Title="" Language="C#" MasterPageFile="~/Rubtech.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="RubTechDashBaord.DashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <script src="angular_scripts/app.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="assets/js/toggle.js"></script>
    <script src="angular_scripts/Controllers/BannerController.js"></script>
    <script src="angular_scripts/Controllers/AdvertisementController.js"></script>
    <script src="angular_scripts/Controllers/TeamController.js"></script>
    <script src="angular_scripts/Controllers/MagzineController.js"></script>
    <script src="angular_scripts/Controllers/MessageController.js"></script>
    <script src="angular_scripts/Controllers/NewsLetterController.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div ng-controller="BannerController">
    <!-- Update Banner Modal -->
   <div class="modal fade" id="editBannerModal" tabindex="-1" aria-labelledby="editBannerLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header p-4 pb-0 m-2">
                <h1 class="modal-title fs-4 fw-medium" id="editBannerLabel">Edit Banner</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body pt-0 p-4">
                <form id="updateBannerForm" class="needs-validation p-2">
                    <div class="d-flex flex-column gap-3">
                        <div>
                            <label for="editBannerImage" class="form-label">Banner</label>
                            <p class="text-format">Upload Image <code>jpg, jpeg</code> Format Only.</p>

                            <!-- Image Preview -->
                            <div class="mb-2 text-center">
                                <img src="" ng-if="previewImage" ng-src="{{previewImage}}" alt="Banner Preview"
                                    class="img-fluid rounded" style="max-height: 150px;">
                            </div>

                            <input type="file" class="form-control rounded-pill"
                                id="editBannerImage"
                                
                                onchange="angular.element(this).scope().uploadBannerImages(event)">
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-success btn-label right ms-auto" ng-click="updateBanner()">
                                <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Update
                            </button>
                        </div>
                        <div class="col-md-12">
                            <div class="alert alert-danger" ng-show="UpdateErrorMessage">
                                {{ UpdateErrorMessage }}
                               
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


    <!-- Insert Banner Section -->
    <div class="page-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h1 class="mb-sm-0">Banner</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row gy-4">
                                <div class="col-xxl-6 col-md-6">
                                    <label for="bannerImage" class="form-label">Add Banner</label>
                                    <p class="text-format">Upload Image <code>jpg, jpeg</code> Format Only.</p>
                                    <p class="text-format">Maximum Upload Image Size - <code>100kb</code></p>

                                    <input type="file"
                                        class="form-control rounded-pill"
                                        id="bannerImage"
                                        multiple
                                        onchange="angular.element(this).scope().uploadBannerFiles(this.files)">
                                </div>

                                <div class="col-12 text-start mt-3">
                                    <button type="button" class="btn btn-success squared-pill px-4" ng-click="insertBanner()">
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
            <!-- Banner List Table -->
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped align-middle">
                                    <thead class="table-success">
                                        <tr>
                                            <th class="d-none">ID</th>
                                            <th>Banner</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="banner in banners">
                                            <td class="d-none">{{ banner.Id }}</td>
                                            <td>
                                                <img  ng-if="banner.ImagePath && banner.ImagePath !== ''"
                                                    ng-src="{{ banner.ImagePath }}"
                                                    alt="Banner Image"
                                                    class="avatar-lg">
                                                <span ng-if="!banner.ImagePath || banner.ImagePath === ''" class="text-muted">No Image</span>
                                            </td>

                                            <td class="text-center">
                                                <a href="#editBannerModal" data-bs-toggle="modal" ng-click="editBannerModal(banner)" class="link-success fs-20 me-2" style="font-size:30px !important" title="Edit">
                                                    <i class="ri-edit-2-line"></i>
                                                </a>
                                                <a href="#" ng-click="deleteBanner(banner, banner.Id)" class="link-danger fs-20" style="font-size:30px !important" title="Delete">
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
</div>

                                                                <%--BANNER ENDS--%>

                                                             <%--ADVERTISEMENT STARTS--%>


  <div ng-controller="AdvertisementController">
    <div class="card">
        <div class="card-body">
            <!-- Advertisement Edit Modal -->
            <div class="modal fade" id="editAdvertisementModal" tabindex="-1" aria-labelledby="editAdvertisementModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header p-4 pb-0 m-2">
                            <h1 class="modal-title fs-4 fw-medium" id="editAdvertisementModalLabel">Edit Advertisement</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body pt-0 p-4">
                            <form id="editAdvertisementForm" class="needs-validation p-2">
                                <div class="d-flex flex-column gap-3">
                                    <div>
                                        <label for="popupTeamName" class="form-label">Name</label>
                                        <input type="text" class="form-control rounded-pill" id="popupAddLink" ng-model="popupAddLink" placeholder="Enter Link">
                                    </div>
                                    <div>
                                        <label for="editAdvertisementImage" class="form-label">Advertisement</label>
                                        <p class="text-format">Upload Image <code>jpg, jpeg, png</code> Format Only.</p>
                                        <p class="text-format">Maximum Upload Image Size - <code>20kb</code></p>
                                        <input type="file" class="form-control rounded-pill" id="editAdvertisementImage" 
                                               onchange="angular.element(this).scope().uploadAdvertisementImage(event, 'edit')">
                                        <img ng-if="previewEditAdImage" ng-src="{{ previewEditAdImage }}" 
                                             class="rounded mt-2" style="width: 100px; height: 100px; object-fit: cover;">
                                    </div>
                                </div>
                                <div class="text-end">
                                    <button type="button" class="btn btn-success btn-label right ms-auto" ng-click="updateAdvertisement()">
                                        <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i> Update
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Modal -->

            <div class="page-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h1 class="mb-sm-0">Advertisements</h1>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <div class="row gy-4">
                                        <div>
                                            <label for="MainAddLink" class="form-label">Advertisement Link (URL)</label>
                                            <input type="text" class="form-control rounded-pill" id="MainAddLink" ng-model="MainAddLink" placeholder="Enter Advertisement Link">
                                        </div>
                                        <div class="col-xxl-6 col-md-6">
                                            <label for="addImageMain" class="form-label">Add Advertisement</label>
                                            <p class="text-format">Upload Image <code>jpg, jpeg</code> Format Only.</p>
                                            <p class="text-format">Maximum Upload Image Size - <code>50kb</code></p>
                                            <input type="file" class="form-control rounded-pill" id="addImageMain" 
                                                   onchange="angular.element(this).scope().uploadAdvertisementImage(event, 'new')">
                                            
                                        </div>
                                        <div class="col-12 text-start mt-3">
                                            <button type="button" class="btn btn-success squared-pill px-4" ng-click="insertAdvertisement()">
                                                <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i> Insert
                                            </button>
                                        </div>
                                        <div class="col-12">
                                            <div class="alert alert-danger w-100 mt-3" ng-show="ErrorMessage">
                                                {{ ErrorMessage }}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Advertisements Table -->
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h4 class="card-title mb-0 flex-grow-1">Advertisements</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped align-middle">
                                            <thead class="table-success">
                                                <tr>
                                                    <th class="d-none">ID</th>
                                                    <th>Advertisement</th>
                                                    <th>Advertisement Link</th>
                                                    <th class="text-center">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr ng-repeat="ad in advertisements">
                                                    <td class="d-none">{{ ad.ID }}</td>
                                                    <td>
                                                        <img ng-if="ad.ImagePath" ng-src="{{ ad.ImagePath }}" 
                                                             class="avatar-lg">
                                                        <span ng-if="!ad.ImagePath" class="text-muted">No Image</span>
                                                    </td>
                                                    <td>{{ ad.URL }}</td>
                                                    <td class="text-center">
                                                        <%--<a href="#editAdvertisementModal" data-bs-toggle="modal" 
                                                           ng-click="editAdvertisement(ad)" class="link-success fs-20 me-2" 
                                                           title="Edit">
                                                            <i class="ri-edit-2-line"></i>
                                                        </a>--%>
                                                        <a href="#" ng-click="deleteAdvertisement($event, ad)" 
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
        </div>
    </div>
</div>

                                                                           <%--ADVERTISEMENT ENDS--%>

                                                                            <%--Magzine Starts--%>

      <div ng-controller="MagzineController">
    <div class="card">
        <div class="card-body">
            <!-- Advertisement Edit Modal -->
            <div class="modal fade" id="editMagzineModal" tabindex="-1" aria-labelledby="editMagzineModal" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header p-4 pb-0 m-2">
                            <h1 class="modal-title fs-4 fw-medium" id="editMagzineModalLabel">Edit Magazine</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body pt-0 p-4">
                            <form id="editMagzineModalForm" class="needs-validation p-2">
                                <div class="d-flex flex-column gap-3">
                                    <div>
                                        <label for="editMagzineImage" class="form-label">Magazine</label>
                                        <p class="text-format">Upload Image <code>jpg, jpeg, png</code> Format Only.</p>
                                        <p class="text-format">Maximum Upload Image Size - <code>20kb</code></p>
                                        <input type="file" class="form-control rounded-pill" id="editMagzineModalImage" 
                                               onchange="angular.element(this).scope().uploadAdvertisementImage(event, 'edit')">
                                        <img ng-if="previewEditAdImage" ng-src="{{ previewEditAdImage }}" 
                                             class="rounded mt-2" style="width: 100px; height: 100px; object-fit: cover;">
                                    </div>
                                </div>
                                <div class="text-end">
                                    <button type="button" class="btn btn-success btn-label right ms-auto" ng-click="updateMagzine()">
                                        <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i> Update
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Modal -->

            <div class="page-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h1 class="mb-sm-0">Magazine</h1>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <div class="row gy-4">
                                        <div class="col-xxl-6 col-md-6">
                                            <label for="addImageMain" class="form-label">Add Magazine</label>
                                            <p class="text-format">Upload Image <code>jpg, jpeg</code> Format Only.</p>
                                            <p class="text-format">Maximum Upload Image Size - <code>50kb</code></p>
                                            <input type="file" class="form-control rounded-pill" id="addImageMain"
                                                onchange="angular.element(this).scope().uploadMagzineImage(event)">
                                        </div>
                                        <div class="col-12 text-start mt-3">
                                            <button type="button" class="btn btn-success squared-pill px-4" ng-click="insertMagzine()">
                                                <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i> Insert
                                            </button>
                                        </div>
                                        <div class="col-12">
                                            <div class="alert alert-danger w-100 mt-3" ng-show="ErrorMessage">
                                                {{ ErrorMessage }}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Magzine Table -->
                    <div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header d-flex align-items-center">
                <h4 class="card-title mb-0 flex-grow-1">Magazines</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped align-middle">
                        <thead class="table-success">
                            <tr>
                                <th class="d-none">ID</th>
                                <th>Magzine</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="mag in magzines">
                                <td class="d-none">{{ mag.ID }}</td>
                                <td>
                                    <img ng-if="mag.ImagePath" ng-src="{{ mag.ImagePath }}" 
                                         class="avatar-lg">
                                    <span ng-if="!mag.ImagePath" class="text-muted">No Image</span>
                                </td>
                                <td class="text-center">
                                    <!-- Edit Icon -->
                                 <%--   <a href="#" class="link-success fs-20 me-2" 
                                       data-bs-toggle="modal" data-bs-target="#editMagzineModal"
                                       ng-click="editMagzine(mag)" title="Edit">
                                        <i class="ri-edit-2-line"></i>
                                    </a>--%>
                                    
                                    <!-- Delete Icon -->
                                    <a href="#" class="link-danger fs-20" 
                                       ng-click="deleteMagzine(mag.ID)" title="Delete">
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
</div> <!-- End Table -->

                </div>
            </div>
        </div>
    </div>
</div>

                                                                                <%--Magzine Ends--%>

                                                                                <%--Teams Starts--%>


   <div ng-controller="TeamController">
<div class="card">
    <div class="card-body">
        <!-- Edit Team Modal -->
        <div class="modal fade" id="addTeamModal" tabindex="-1" aria-labelledby="addTeamModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header p-4 pb-0 m-2">
                        <h1 class="modal-title fs-4 fw-medium">Edit Team Member</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" id="addTeamModal-btnClose" aria-label="Close"></button>
                    </div>
                    <div class="modal-body pt-0 p-4">
                        <form id="TeamForm" class="needs-validation p-2">
                            <div class="d-flex flex-column gap-3">
                                <div>
                                    <label for="popupTeamName" class="form-label">Name</label>
                                    <input type="text" class="form-control rounded-pill" id="popupTeamName" ng-model="popupTeamName" placeholder="Enter Name">
                                </div>
                                <div>
                                    <label for="popupTeamPosition" class="form-label">Designation</label>
                                    <input type="text" class="form-control rounded-pill" id="popupTeamPosition" ng-model="popupTeamPosition" placeholder="Enter Designation">
                                </div>
                                <div>
                                    <label for="teamImageUpload" class="form-label">Upload Image</label>
                                    <p class="text-muted">Accepted formats: <code>JPG, JPEG</code></p>
                                    <input type="file" class="form-control rounded-pill" id="teamImageUpload" onchange="angular.element(this).scope().uploadTeamImage(this.files)">
                                </div>
                                <div>
                                    <img ng-if="popupTeamImage" ng-src="{{popupTeamImage}}" class="img-fluid rounded mt-2" style="max-height: 100px;" />
                                </div>
                                <div class="text-end">
                                    <button type="button" class="btn btn-success" ng-click="updateTeamMember()">Update</button>
                                </div>
                                <div class="alert alert-danger w-100 mt-3" ng-show="UpdateErrorMessage">{{ UpdateErrorMessage }}</div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> 
    </div>
</div>


            <!-- Insert Team Member Section -->
            <div class="page-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h1 class="mb-sm-0">Team</h1>
                            </div>
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h1 class="card-title mb-0 flex-grow-1">Team</h1>
                                </div>
                                <div class="card-body">
                                    <div class="row gy-4">
                                        <div class="col-12">
                                            <label for="teamName" class="form-label">Name</label>
                                            <input type="text" class="form-control rounded-pill" id="teamName" ng-model="teamName" placeholder="Enter Name">
                                        </div>
                                        <div class="col-12">
                                            <label for="teamPosition" class="form-label">Designation</label>
                                            <input type="text" class="form-control rounded-pill" id="teamPosition" ng-model="teamPosition" placeholder="Enter Designation">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="teamImageUploadMain" class="form-label">Upload Image</label>
                                            <p class="text-format">Upload Image <code>jpg, jpeg</code> Format Only.</p>
                                            <p class="text-format">Maximum Upload Image Size - <code>50kb</code></p>
                                            <input type="file" class="form-control rounded-pill" id="teamImageUploadMain"
                                                onchange="angular.element(this).scope().uploadTeamImage(this.files)">
                                        </div>

                                        <div class="text-start mt-3">
                                            <button type="button" class="btn btn-success" ng-click="insertTeamMember()">Insert</button>
                                        </div>
                                        <div class="alert alert-danger w-100 mt-3" ng-show="ErrorMessage">{{ ErrorMessage }}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Team Table -->
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h4 class="card-title mb-0 flex-grow-1">Team Details</h4>
                                    <input type="text" class="form-control" placeholder="Search..." ng-model="searchText">
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <thead class="table-success">
                                                <tr>
                                                    <th class="d-none">ID</th>
                                                    <th>Name</th>
                                                    <th>Designation</th>
                                                    <th>Image</th>
                                                    <th class="text-center">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr ng-repeat="team in teams | filter:searchText">
                                                    <td class="d-none">{{ team.ID }}</td>
                                                    <td>{{ team.Name }}</td>
                                                    <td>{{ team.Position }}</td>
                                                    <td class="text-center">
                                                        <img ng-if="team.ImagePath" ng-src="{{ team.ImagePath }}" class="avatar-lg">
                                                        <span ng-if="!team.ImagePath" class="text-muted">No Image</span>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="#addTeamModal" data-bs-toggle="modal" ng-click="editTeam(team)" class="link-success me-2" title="Edit">
                                                            <i class="ri-edit-2-line"></i>
                                                        </a>
                                                        <a href="#" ng-click="deleteTeamMember($event, team)" class="link-danger" title="Delete">
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
        </div>
                                                                            <%--Teams ENDS--%>


                                                                        <%-- Message Starts --%>

      <div ng-controller="MessageController">
    <div class="card">
        <div class="card-body">

            <!-- Edit Message Modal -->
            <div class="modal fade" id="addMessagemodal" tabindex="-1" aria-labelledby="addMessagemodalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header p-4 pb-0 m-2">
                            <h1 class="modal-title fs-4 fw-medium">Edit Message</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body pt-0 p-4">
                            <form id="MessageForm" class="needs-validation p-2">
                                <div class="d-flex flex-column gap-3">
                                    <!-- Name -->
                                    <div>
                                        <label for="messageName" class="form-label">Name</label>
                                        <input type="text" class="form-control rounded-pill" id="popupMessageName" ng-model="popupMessageName" placeholder="Enter Name">
                                    </div>

                                    <!-- Message -->
                                    <div>
                                        <label for="messageParagraph" class="form-label">Message</label>
                                        <textarea class="form-control rounded" id="popupMessageParagraph" ng-model="popupMessageParagraph" rows="4" placeholder="Enter Message"></textarea>
                                    </div>

                                    <!-- Position -->
                                    <div>
                                        <label for="messagePosition" class="form-label">Designation</label>
                                        <input type="text" class="form-control" id="popupMessagePosition" ng-model="popupMessagePosition" placeholder="Enter Designation">
                                    </div>

                                    <!-- Message From -->
                                    <div>
                                        <label for="messageFrom" class="form-label">Message From</label>
                                        <input type="text" class="form-control" id="popupMessageFrom" ng-model="popupMessageFrom" placeholder="Message From">
                                    </div>

                                <%--    <!-- Message Brief Page Link -->
                                    <div>
                                        <label for="popupMessageBriefPageLink" class="form-label">Message Brief Page Link</label>
                                        <input type="text" class="form-control" id="popup" ng-model="popupMessageBriefPageLink" placeholder="Message Brief Page Link">
                                    </div>--%>

                                    <!-- image upload -->
                                    <div class="mb-3">
                                        <label for="messageImageUpload" class="form-label fw-bold">Upload Image</label>
                                        <p class="text-muted small mb-1">Accepted formats: <code>jpg, jpeg</code></p>
                                        <p class="text-muted small">Maximum file size: <code>50KB</code></p>

                                        <div class="input-group">
                                            <input type="file" class="form-control" id="messageImageUpload"
                                                onchange="angular.element(this).scope().uploadMessageImage(this.files)">
                                        </div>

                                        <div ng-if="popupMessageImage" class="mt-3">
                                            <p class="fw-bold">Preview:</p>
                                            <img ng-src="{{popupMessageImage}}" alt="Message Image"
                                                class="img-thumbnail shadow-sm border rounded" width="120">
                                        </div>
                                    </div>

                                    <!-- Update Button -->
                                    <div class="text-end">
                                        <button type="button" class="btn btn-success btn-label right ms-auto" ng-click="updateMessage()">
                                            <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i> Update
                                        </button>
                                    </div>

                                    <!-- Error Message -->
                                    <div class="col-12">
                                        <div class="alert alert-danger w-100 mt-3" ng-if="UpdateErrorMessage && UpdateErrorMessage.length > 0">
                                            {{ UpdateErrorMessage }}
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
                    <!-- Page Header -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h1 class="mb-sm-0">Message</h1>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="dashboard.aspx">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Message</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Add New Message Form -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row gy-4">
                                        <!-- Name -->
                                        <div class="col-12">
                                            <label for="messageName" class="form-label">Enter Name</label>
                                            <input type="text" class="form-control rounded-pill" ng-model="messageName" placeholder="Enter Name">
                                        </div>

                                        <!-- Position -->
                                        <div class="col-12">
                                            <label for="messagePosition" class="form-label">Enter Designation</label>
                                            <input type="text" class="form-control rounded-pill" ng-model="messagePosition" placeholder="Enter Designation">
                                        </div>

                                        <!-- Message -->
                                        <div class="col-12">
                                            <label for="messageParagraph" class="form-label">Enter Message</label>
                                            <textarea class="form-control rounded" ng-model="messageParagraph" rows="4" placeholder="Enter Message"></textarea>
                                        </div>

                                        <!-- Message From -->
                                        <div class="col-12">
                                            <label for="messageFrom" class="form-label">Message From</label>
                                            <input type="text" class="form-control rounded" ng-model="messageFrom" placeholder="Message From">
                                        </div>


                                       <%-- <!-- Message Brief Page Link -->
                                        <div class="col-12">
                                            <label for="messageBriefPageLink" class="form-label">Message Brief Page Link</label>
                                            <input type="text" class="form-control rounded" ng-model="messageBriefPageLink" placeholder="Message Brief Page Link">
                                        </div>--%>

                                        <!-- Image Upload -->
                                        <div class="col-md-6">
                                            <label for="messageImageUpload" class="form-label">Upload Image</label>
                                            <p class="text-muted">Accepted formats: <code>JPG, JPEG</code></p>
                                            <p class="text-muted">Maximum file size: <code>50KB</code></p>
                                            <input type="file" class="form-control rounded-pill" onchange="angular.element(this).scope().uploadMessageImage(this.files)">
                                        </div>

                                        <!-- Insert Button -->
                                        <div class="text-start mt-3">
                                            <button type="button" class="btn btn-success btn-label right ms-auto" ng-click="InsertMessage()">
                                                <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Insert
                                            </button>
                                        </div>

                                        <!-- Error Message -->
                                        <div class="col-12">
                                            <div class="alert alert-danger w-100 mt-3" ng-if="ErrorMessage && ErrorMessage.length > 0">
                                                {{ ErrorMessage }}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Message Details Table -->
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h4 class="card-title mb-0 flex-grow-1">Message Details</h4>
                                    
                                        <input type="text" class="form-control" placeholder="Search..." ng-model="searchText">
                                    
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered dt-responsive">
                                            <thead class="table-success">
                                                <tr>
                                                    <th class="d-none">ID</th>
                                                    <th>Name</th>
                                                    <th >Designation</th>
                                                    <th >Message</th>
                                                    <th >From</th>
                                                   <%-- <th >Message Brief Page Link</th>--%>
                                                    <th >Image</th>
                                                    <th class="text-center" >Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr ng-repeat="message in messages | filter:searchText">
                                                    <td class="d-none">{{ message.Id }}</td>
                                                    <td style="width: 15%">{{ message.Name }}</td>
                                                    <td style="width: 15%">{{ message.Position }}</td>
                                                    <td style="word-break: break-all;">{{ message.Paragraph }}</td>
                                                    <td style="width: 15%">{{ message.MessegeFrom }}</td>
                                                    <%--<td style="width: 10%">{{ message.MessageBriefPageLink }}</td>--%>
                                                    <td class="text-center" style="width: 5%">
                                                        <img src="" ng-if="message.ImagePath" ng-src="{{ message.ImagePath }}" alt="Message Image" class="avatar-lg">
                                                        <span ng-if="!message.ImagePath">No Image</span>
                                                    </td>
                                                    <td class="text-center" style="text-wrap: nowrap;">
                                                        <a href="#addMessagemodal" data-bs-toggle="modal" ng-click="editMessageModal(message)" class="link-success fs-20 me-2" title="Edit">
                                                            <i class="ri-edit-2-line"></i>
                                                        </a>
                                                        <a href="#" ng-click="deleteMessage($event, message)" class="link-danger fs-20" title="Delete">
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
        </div>
                                                                         <%-- Message Ends --%>
    </div>
</div>
                                                                                    
                                                                             <%-- GetEmail Starts --%>


<div ng-controller="NewsLetterController">
    <div class="page-content">
        <div class="container-fluid">
            <!-- NewsLetter Table -->
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h4 class="card-title mb-0 flex-grow-1">News Letter Details</h4>
                            <input type="text" class="form-control w-auto ms-2" placeholder="Search..." ng-model="searchText">
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="table-success">
                                        <tr>
                                            <th class="d-none">ID</th>
                                            <th>Emails</th>
                                            <th>Registered Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="team in paginatedItems()">
                                            <td class="d-none">{{ team.ID }}</td>
                                            <td>{{ team.Email }}</td>
                                            <td>{{ team.DateTime }}</td>
                                        </tr>
                                        <tr ng-if="paginatedItems().length === 0">
                                            <td colspan="3" class="text-center">No data available</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Pagination Controls -->
                            <nav aria-label="Page navigation" class="mt-3">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item" ng-class="{disabled: currentPage === 1}">
                                        <a class="page-link" href="javascript:void(0)" ng-click="setPage(currentPage - 1)">Previous</a>
                                    </li>
                                    <li class="page-item" ng-repeat="n in [].constructor(pageCount()) track by $index"
                                        ng-class="{active: $index + 1 === currentPage}">
                                        <a class="page-link" href="javascript:void(0)" ng-click="setPage($index + 1)">{{$index + 1}}</a>
                                    </li>
                                    <li class="page-item" ng-class="{disabled: currentPage === pageCount()}">
                                        <a class="page-link" href="javascript:void(0)" ng-click="setPage(currentPage + 1)">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


                                                     <%-- GetEmail Ends --%>

</asp:Content>
