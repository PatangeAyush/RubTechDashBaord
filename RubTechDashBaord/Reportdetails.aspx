<%@ Page Title="" Language="C#" MasterPageFile="~/Rubtech.Master" AutoEventWireup="true" CodeBehind="Reportdetails.aspx.cs" Inherits="RubTechDashBaord.Reportdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="angular_scripts/Controllers/GalleryEventController.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <script src="angular_scripts/app.js"></script>
    <script src="angular_scripts/Controllers/ReportdetailsController.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div ng-controller="ReportdetailsController">

    <div class="modal fade" id="addReportModal" tabindex="-1" aria-labelledby="addReportModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header p-4 pb-0 m-2">
                    <h1 class="modal-title fs-4 fw-medium">Edit Report</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" id="addReport-btnClose" aria-label="Close"></button>
                </div>
                <div class="modal-body pt-0 p-4">
                    <form id="ReportForm" class="needs-validation p-2">
                        <script src="angular_scripts/Controllers/ReportdetailsController.js"></script>
                        <div class="d-flex flex-column gap-3">
                            <div>
                                <label for="popupHeading" class="form-label">Report Heading</label>
                                <input type="text" class="form-control rounded-pill" id="popupHeading" ng-model="popheading" placeholder="Enter Report Heading">
                            </div>
                            <div>
                                <label for="popupSubheading" class="form-label">Report Subheading</label>
                                <input type="text" class="form-control rounded-pill" id="popupSubheading" ng-model="popsubheading" placeholder="Enter Report Subheading">
                            </div>
                            <div>
                                <label for="popupParagraph" class="form-label">Report Description</label>
                                <textarea class="form-control" id="popupParagraph" ng-model="popupparagraph" placeholder="Enter Report Description" rows="4"></textarea>
                            </div>
                            <div>
                                <label for="reporttImageUpload" class="form-label">Upload Report Image</label>
                                <p class="text-muted">Accepted formats: <code>JPG, JPEG, PNG</code></p>
                                <p class="text-muted">Maximum file size: <code>20KB</code></p>
                                <input type="file" class="form-control rounded-pill" id="reportImageUpload"
                                    onchange="angular.element(this).scope().uploadReportImages(this.files)">
                            </div>
                            <div class="text-end">
                                <button type="button" class="btn btn-success btn-label right ms-auto" id="updateReport" ng-click="updateReport()">
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
    <!-- Edit Report Popup Modal End -->

    <div class="page-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0">Add Report Details</h4>
                        <div class="ms-auto">
                            <input type="text" class="form-control" placeholder="Search..." ng-model="searchText">
                        </div>
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="dashboard.aspx">Dashboard</a></li>
                                <li class="breadcrumb-item active">Reports</li>
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

                                <div class="col-12">
                                    <label for="reportHeading" class="form-label">Enter Report Heading</label>
                                    <input type="text" class="form-control rounded-pill" id="reportHeading" ng-model="reportHeading" placeholder="Enter Report Heading">
                                </div>

                                <div class="col-12">
                                    <label for="reportSubheading" class="form-label">Enter Report Subheading</label>
                                    <input type="text" class="form-control rounded-pill" id="reportsubHeading" ng-model="reportsubHeading" placeholder="Enter Report Sub-heading">
                                </div>

                                <div class="col-12">
                                    <label for="reportDescription" class="form-label">Report Description</label>
                                    <textarea class="form-control rounded" id="reportParagraph" ng-model="reportParagraph" rows="4" placeholder="Enter Report Description"></textarea>
                                </div>

                                <div class="col-md-6">
                                    <label for="reportImageUploadMain" class="form-label">Upload Report Image</label>
                                    <p class="text-muted">Accepted formats: <code>JPG, JPEG, PNG</code></p>
                                    <p class="text-muted">Maximum file size: <code>20KB</code></p>
                                    <input type="file" class="form-control rounded-pill" id="reportImage" ng-model="reportImage" multiple onchange="angular.element(this).scope().uploadFiles(this.files)">
                                </div>

                                <div class="text-start mt-3">
                                    <button type="button" class="btn btn-success btn-label right ms-auto" ng-click="Insert()">
                                        <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Insert
                                    </button>
                                </div>
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
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h4 class="card-title mb-0 flex-grow-1">Report Details</h4>
                            <div class="ms-auto">
                                <input type="text" class="form-control" placeholder="Search..." ng-model="searchText">
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered dt-responsive" datatable="ng" dt-options="dtOptionsAdmin" dt-column-defs="dtColumnDefs">
                                    <thead class="table-success">
                                        <tr>
                                            <th class="d-none">ID</th>
                                            <th style="width: 20%;">Report Title</th>
                                            <th style="width: 20%;">Report Sub-Title</th>
                                            <th style="width: 40%;">Report Paragraph</th>
                                            <th style="width: 15%;">Report Image</th>
                                            <th class="text-center" style="width: 5%;">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="report in reports | filter:searchText">
                                            <td class="d-none">{{ report.ID }}</td>
                                            <td>{{ report.ReportName }}</td>
                                            <td>{{ report.ReportSubParagraph }}</td>
                                            <td>{{ report.Report_Description }}</td>
                                            <td class="text-center">
                                                <div class="d-flex justify-content-center">
                                                    <span ng-if="!report.ReportImage" class="text-muted">No Image Available</span>
                                                    <img ng-if="report.ReportImage"
                                                        ng-src="{{ 'https://api-test2.salesgenx.in/Content/Uploads/' + (report.ReportImage.includes('\\') ? report.ReportImage.split('\\').pop() : report.ReportImage.split('/').pop()) }}"
                                                        alt="Report Image"
                                                        class="rounded border"
                                                        style="width: 80px; height: 80px; object-fit: cover; margin: 2px;">
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <a href="#addReportModal" data-bs-toggle="modal" ng-click="addReportModal(report)"
                                                    class="link-success fs-20 me-2" title="Edit">
                                                    <i class="ri-edit-2-line"></i>
                                                </a>
                                                <a href="#" ng-click="deleteReport($event, report)"
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


</asp:Content>
