<%@ Page Title="" Language="C#" MasterPageFile="~/Rubtech.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="RubTechDashBaord.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script src="angular_scripts/app.js"></script>
<script src="angular_scripts/Controllers/GalleryReportController.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
     <div ng-controller="GalleryReportController">
     <!-- Add Report Modal -->
     <%--<div class="modal fade" id="addReportModal" tabindex="-1" aria-labelledby="addReportModal" aria-hidden="true">
     <div class="modal-dialog">
         <div class="modal-content">
             <div class="modal-header p-4 pb-0 m-2">
                 <h1 class="modal-title fs-4 fw-medium">Edit Report</h1>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body pt-0 p-4">
                 <form id="EditReportform" class="needs-validation p-2">
                     <div class="d-flex flex-column gap-3">
                         <div>
                             <label for="reportTitle" class="form-label">Report Title</label>
                             <input type="text" class="form-control rounded-pill" id="reportTitle" ng-model="selectedReport.Title" placeholder="Enter Report Title">
                         </div>
                         <%--<div>
                             <label for="reportImage" class="form-label">Report Image</label>
                             <p class="text-format">Upload Image <code>jpg, jpeg, png</code> Format Only.</p>
                             <p class="text-format">Maximum Upload Image Size - <code>20kb</code></p>
                             <input type="file" class="form-control rounded-pill" id="reportImage" ng-model="reportImage" onchange="angular.element(this).scope().uploadReportImage(this.files)">
                         </div>
                         <div class="text-end">
                             <button type="button" class="btn btn-success btn-label right ms-auto" ng-click="updateReport()">
                                 <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Update
                            
                             </button>
                         </div>
                     </div>
                 </form>
             </div>
         </div>
     </div>
 </div>--%>

     <!-- Page Content -->
     <div class="page-content">
         <div class="container-fluid">
             <div class="row">
                 <div class="col-12">
                     <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                         <h4 class="mb-sm-0">Manage Reports</h4>
                         <div class="page-title-right">
                             <ol class="breadcrumb m-0">
                                 <li class="breadcrumb-item"><a href="dashboard.aspx">Dashboard</a></li>
                                 <li class="breadcrumb-item active">Reports</li>
                             </ol>
                         </div>
                     </div>
                 </div>
             </div>
             <%--Main Adding Gallery Report Form --%>
             <div class="row">
                 <div class="col-lg-12">
                     <div class="card">
                         <div class="card-body">
                             <div class="row gy-4">
                                 <div class="col-xxl-12 col-md-12">
                                     <label for="reportTitle" class="form-label">Report Title</label>
                                     <input type="text" class="form-control rounded-pill" id="reportTitleInput" ng-model="reportTitle" placeholder="Enter Report Title">
                                 </div>
                                 <div class="col-xxl-6 col-md-6">
                                     <label for="reportImageUpload" class="form-label">Report Images</label>
                                     <p class="text-format">Upload Image <code>jpg, jpeg, png</code> Format Only.</p>
                                     <p class="text-format">Maximum Upload Image Size - <code>100 KB</code></p>
                                     <input type="file" class="form-control rounded-pill" id="reportImageUpload" ng-model="reportImage" multiple onchange="angular.element(this).scope().uploadFiles(this.files)">
                                 </div>
                                 <div class="text-start mt-3">
                                     <button type="button" class="btn btn-success btn-label right ms-auto" ng-click="Insert()">
                                         <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Insert
                                
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

             <%-- hello MF--%>
             <!-- Dropdown to Select Report -->
             <div class="row mt-3">
                 <div class="col-md-6">
                     <label for="reportDropdown" class="form-label">Select Report</label>
                     <select class="form-control" id="reportDropdown" ng-model="selectedReport" ng-options="report as report.ReportName for report in reports track by report.ID" ng-change="fetchReportImages()">
                         <option value="">-- Select Report --</option>
                     </select>
                 </div>
             </div>
             <!-- Report Images Table -->
             <div class="row mt-4" ng-if="selectedReport">
                 <div class="col-xl-12">
                     <div class="card">
                         <div class="card-header d-flex align-items-center">
                             <h4 class="card-title mb-0 flex-grow-1">Report Images</h4>
                         </div>
                         <div class="card-body">
                             <table class="table table-striped align-middle">
                                 <thead>
                                     <tr>
                                         <th class="d-none">ID</th>
                                         <th>Gallery Report Name
                                         </th>
                                         <th class="text-middle"></th>
                                     </tr>
                                 </thead>
                                 <tbody>
                                     <tr>
                                         <td class="d-none">{{selectedReport.ID}}</td>
                                         <td>{{selectedReport.ReportName}}</td>
                                         <td class="text-end">
                                             <%--<button class="btn btn-danger" ng-click="openRenameModal(selectedReport)">Rename Gallery Report</button>--%>
                                             <button type="button" href="javascript:void(0);" class="btn btn-info" ng-click="OpenAddImage(selectedReport, $event)">Add Image</button>
                                             <button type="button" href="javascript:void(0);" class="btn btn-danger" ng-click="OpenRename(selectedReport, $event)">Rename</button>
                                             <button class="btn btn-primary" ng-click="deleteReport(selectedReport, $event)">Delete Gallery Report</button>

                                         </td>
                                     </tr>
                                 </tbody>
                             </table>
                             <br />
                             <br />
                             <table class="table table-striped align-middle">
                                 <thead>
                                     <tr>
                                         <th colspan="4" class="text-start">
                                             <h3>Gallery Images</h3>
                                         </th>
                                     </tr>
                                 </thead>
                                 <tbody>
                                     <tr ng-repeat="row in chunkedImages">
                                         <td ng-repeat="image in row">
                                             <div ng-mouseover="isHovered = true" ng-mouseleave="isHovered = false" style="position: relative; display: inline-block;">
                                                 <img ng-src="{{ image }}"
                                                     style="width: 100px; height: 100px; border-radius: 8px; cursor: pointer;"
                                                     ng-click="openLightbox(image)">
                                                 <!-- Image click to open lightbox -->

                                                 <!-- Delete button centered on hover -->
                                                 <button ng-show="isHovered"
                                                     style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); border: none; color: white; padding: 10px; border-radius: 50%; cursor: pointer;" ng-click="deleteImage(image, $event)">
                                                     <i class="fa-solid text-danger fa-trash"></i>
                                                 </button>
                                             </div>
                                         </td>
                                     </tr>
                                 </tbody>
                             </table>


                             <!-- 🔥 Lightbox (Popup) for Enlarged Image -->
                             <div ng-show="lightboxVisible" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.8); display: flex; align-items: center; justify-content: center; z-index: 1000;">
                                 <span style="position: absolute; top: 90px; right: 40px; font-size: 30px; color: white; cursor: pointer;" ng-click="closeLightbox()">✖</span>

                                 <!-- Left Arrow -->
                                 <span ng-click="prevImage()" style="position: absolute; left: 300px; font-size: 40px; color: white; cursor: pointer;">❮</span>

                                 <img ng-src="{{ selectedImage }}" style="width: 40%; height: 40%; border-radius: 10px;">

                                 <!-- Right Arrow -->
                                 <span ng-click="nextImage()" style="position: absolute; right: 10px; font-size: 40px; color: white; cursor: pointer;">❯</span>
                             </div>


                         </div>
                     </div>
                 </div>
             </div>
             <%-- <div class="modal fade" id="renameReportModal" tabindex="-1" role="dialog" aria-labelledby="renameReportModalLabel" aria-hidden="true">
             <div class="modal-dialog" role="document">
                 <div class="modal-content">
                     <div class="modal-header">
                         <h5 class="modal-title" id="renameReportModalLabel">Rename Gallery Report</h5>
                         <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                             <span>&times;</span>
                         </button>
                     </div>
                     <div class="modal-body">
                         <form id="renameReportForm" ng-submit="renameReport(selectedReport, $event)">
                             <div class="d-none">
                                 <input type="text" id="ReportId" class="form-control" ng-model="selectedReport.ID" required>
                             </div>
                             <div class="form-group">
                                 <label for="newReportName">New Report Name</label>
                                 <input type="text" id="newReportName" class="form-control" ng-model="selectedReport.ReportName" required>
                             </div>
                             <button type="submit" class="btn btn-primary">Save Changes</button>
                         </form>
                     </div>
                 </div>
             </div>
         </div>--%>

             <%--Rename Pop Up Model--%>
             <div id="renameReportModal" class="modal fade" tabindex="-1">
                 <div class="modal-dialog">
                     <div class="modal-content">
                         <div class="modal-header">
                             <h5 class="modal-title">Rename Report</h5>
                             <%--                                <button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                         </div>
                         <div class="modal-body">
                             <label>Report Name:</label>
                             <input type="text" class="form-control" ng-model="selectedReport.ReportName">
                         </div>
                         <div class="modal-footer">
                             <button class="btn btn-success" ng-click="renameReport($event)">Save</button>
                             <button class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                         </div>
                     </div>
                 </div>
             </div>

             <!-- Add Image Pop Up Modal -->
             <div id="addGalleryReportImage" class="modal fade" tabindex="-1" aria-hidden="true">
                 <div class="modal-dialog">
                     <div class="modal-content">
                         <div class="modal-header">
                             <h5 class="modal-title">Add Report Image</h5>
                         </div>
                         <div class="modal-body">
                             <input type="file" class="form-control rounded-pill" id="reportImageUpload"
                                 onchange="angular.element(this).scope().fileChanged(this)">
                         </div>
                         <div class="modal-footer">
                             <button class="btn btn-success" ng-click="addreportimage($event)">Submit</button>
                             <button class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                         </div>
                     </div>
                 </div>
             </div>


         </div>
     </div>
</asp:Content>

