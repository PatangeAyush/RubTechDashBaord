<%@ Page Title="" Language="C#" MasterPageFile="~/Rubtech.Master" AutoEventWireup="true" CodeBehind="Eventdetails.aspx.cs" Inherits="RubTechDashBaord.Eventdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../angular_scripts/Controllers/GalleryEventController.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <script src="angular_scripts/app.js"></script>
    <script src="angular_scripts/Controllers/EventDetailsController.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div ng-controller="EventDetailsController">

    <!-- Add Event Popup Modal Start -->
    <div class="modal fade" id="addEventModal" tabindex="-1" aria-labelledby="addEventModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header p-4 pb-0 m-2">
                    <h1 class="modal-title fs-4 fw-medium">Edit Event</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" id="addEvent-btnClose" aria-label="Close"></button>
                </div>
                <div class="modal-body pt-0 p-4">
                    <form id="EventForm" class="needs-validation p-2">
                        <div class="d-flex flex-column gap-3">
                            <div>
                                <label for="popupHeading" class="form-label">Event Heading</label>
                                <input type="text" class="form-control rounded-pill" id="popupHeading" ng-model="popheading" placeholder="Enter Event Heading">
                            </div>
                            <div>
                                <label for="popupSubheading" class="form-label">Event Subheading</label>
                                <input type="text" class="form-control rounded-pill" id="popupSubheading" ng-model="popsubheading" placeholder="Enter Subheading">
                            </div>
                            <div>
                                <label for="popupParagraph" class="form-label">Event Description</label>
                                <textarea class="form-control" id="popupParagraph" ng-model="popupparagraph" placeholder="Enter Event Description" rows="4"></textarea>
                            </div>
                            <div>
                                <label for="eventImageUpload" class="form-label">Upload Event Image</label>
                                <p class="text-muted">Accepted formats: <code>JPG, JPEG, PNG</code></p>
                                <p class="text-muted">Maximum file size: <code>20KB</code></p>
                               
                               <input type="file" class="form-control rounded-pill" id="eventImageUpload" ng-model="image" onchange="angular.element(this).scope().uploadEventImage(this.files)">
<img ng-repeat="image in event.ImagePaths track by $index"
    ng-src="{{ image }}"
    alt="Event Image"
    class="rounded border"
    style="width: 80px; height: 80px; object-fit: cover; margin: 2px;">                               

                                <%--<input type="file" class="form-control rounded-pill" id="eventImageUpload" ng-model="image" onchange="angular.element(this).scope().uploadEventImage(this.files)">--%>
                            </div>
                            <div class="text-end">
                                <button type="button" class="btn btn-success btn-label right ms-auto" id="updateEvent" ng-click="updateEvent()">
                                    <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Update
                                </button>
                            </div>

                            <div class="alert alert-danger w-100 mt-3" ng-show="UpdateErrorMessage">
                                {{ UpdateErrorMessage }}
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Add Event Details Popup Modal End -->

    <div class="page-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0">Add Event Details</h4>
                        <%--<div class="ms-auto">
                            <input type="text" class="form-control" placeholder="Search..." ng-model="searchText">
                        </div>--%>
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="dashboard.aspx">Dashboard</a></li>
                                <li class="breadcrumb-item active">Events</li>
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
                                    <label for="eventHeading" class="form-label">Event Heading</label>
                                    <input type="text" class="form-control rounded-pill" id="eventHeading" ng-model="eventHeading" placeholder="Enter Event Heading">
                                </div>

                                <div class="col-12">
                                    <label for="eventSubheading" class="form-label">Event Subheading</label>
                                    <input type="text" class="form-control rounded-pill" id="eventSubheading" ng-model="eventsubHeading" placeholder="Enter Event Sub-heading">
                                </div>

                                <div class="col-12">
                                    <label for="eventDescription" class="form-label">Event Description</label>
                                    <textarea class="form-control rounded" id="eventDescription" ng-model="eventParagraph" rows="4" placeholder="Enter Event Description"></textarea>
                                </div>

                                <div class="col-md-6">
                                    <label for="eventImageUploadMain" class="form-label">Upload Event Image</label>
                                    <p class="text-muted">Accepted formats: <code>JPG, JPEG, PNG</code></p>
                                    <p class="text-muted">Maximum file size: <code>20KB</code></p>
                                    <input type="file" class="form-control rounded-pill" id="eventImageUploadMain" ng-model="eventImage" multiple onchange="angular.element(this).scope().uploadFiles(this.files)">
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
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h4 class="card-title mb-0 flex-grow-1">Event Details</h4>
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
                                            <th style="width: 20%;">Event Title</th>
                                            <th style="width: 20%;">Event Sub-Title</th>
                                            <th style="width: 40%;">Event Paragraph</th>
                                            <th style="width: 15%;">Event Images</th>
                                            <th class="text-center" style="width: 5%;">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="event in events | filter:searchText">
                                            <td class="d-none">{{ event.ID }}</td>
                                            <td>{{ event.EventTitle }}</td>
                                            <td>{{ event.SubTitle }}</td>
                                            <td>{{ event.Paragraph }}</td>
                                            <td class="text-center">
                                                <div class="d-flex flex-wrap justify-content-center">
                                                    <span ng-if="!event.ImagePaths || event.ImagePaths.length === 0" class="text-muted">No Images Available</span>
                                                    <img ng-repeat="image in event.ImagePaths track by $index"
                                                        ng-src="{{ image }}"
                                                        alt="Event Image"
                                                        class="rounded border"
                                                        style="width: 80px; height: 80px; object-fit: cover; margin: 2px;">
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <a href="#addEventModal" data-bs-toggle="modal" ng-click="addEventModal(event)"
                                                    class="link-success fs-20 me-2" title="Edit">
                                                    <i class="ri-edit-2-line"></i>
                                                </a>
                                                <a href="#" ng-click="deleteEvent($event, event)"
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
