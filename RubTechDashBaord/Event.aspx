<%@ Page Title="" Language="C#" MasterPageFile="~/Rubtech.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="RubTechDashBaord.Event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
   <script src="angular_scripts/app.js"></script>
   <script src="angular_scripts/Controllers/GalleryEventController.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                    <div ng-controller="GalleryEventController">

    <!-- Add Event Popup Modal Start-->
    <div class="modal fade" id="addEventtModal" tabindex="-1" aria-labelledby="addEventtModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header p-4 pb-0 m-2">
                    <h1 class="modal-title fs-4 fw-medium">Edit Event</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" id="addEvent-btnClose" aria-label="Close"></button>
                </div>
                <div class="modal-body pt-0 p-4">
                    <form id="Eventlist-form" class="needs-validation p-2">
                        <div class="d-flex flex-column gap-3">
                            <div>
                                <label for="v-heading" class="form-label">Event Heading</label>
                                <input type="text" class="form-control rounded-pill" id="heading" ng-model="selectedEvent.Title" placeholder="Enter Event Heading">
                            </div>
                            
                            <div class="text-end">
                                <button type="button" class="btn btn-success btn-label right ms-auto" id="updateEvent" ng-click="updateEvent()">
                                    <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Update
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="page-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0">Add Events</h4>
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="dashboard.aspx">Dashboard</a></li>
                                <li class="breadcrumb-item active">Events</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Page Title -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row gy-4">
                                <!-- Event Title and Image Submission -->
                                <div class="col-xxl-12 col-md-12">
                                    <!-- Event Heading -->
                                    <div>
                                        <label for="eventTitle" class="form-label">Add Event Heading</label>
                                        <input type="text" class="form-control rounded-pill" id="eventTitle" ng-model="eventTitle" placeholder="Enter Event Heading">
                                    </div>

                                    <!-- Event Images -->
                                    <div class="mt-4">
                                        <label for="eventImageUpload" class="form-label">Add Event Images</label>
                                        <p class="text-format">Upload Image <code>jpg, jpeg, png</code> Format Only.</p>
                                        <p class="text-format">Maximum Upload Image Size - <code>20kb</code></p>
                                        <input type="file" class="form-control rounded-pill" id="eventImageUpload" multiple onchange="angular.element(this).scope().uploadFiles(this.files)">
                                    </div>

                                    <!-- Insert Button -->
                                    <div class="text-start mt-3">
                                        <button type="button" class="btn btn-success btn-label" ng-click="insertEvent()">
                                            <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Insert Event
                                        </button>
                                    </div>

                                    <!-- Single Error Message Div -->
                                    <div class="alert alert-danger w-100 mt-3" ng-show="ErrorMessage">
                                        {{ErrorMessage}}
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
                                <input type="text" class="form-control" placeholder="Search..." ng-model="searchText">
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered dt-responsive" datatable="ng" dt-options="dtOptionsAdmin" dt-column-def="dtColumnDefs">
                                    <thead class="table-success">
                                        <tr>
                                            <th class="d-none">ID</th>
                                            <th class="d-none">EventId</th>
                                            <th>Event Title</th>
                                            <th>Event Images</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="event in events | filter:searchText">
                                            <td class="d-none">{{ event.ID }}</td>
                                            <td class="d-none">{{ event.EventId }}</td>
                                            <td>{{ event.Title }}</td>
                                            <td>
                                                <div class="d-flex flex-wrap">
                                                    <span ng-if="!event.ImagePaths || event.ImagePaths.length === 0" class="text-muted">No Images</span>
                                                    <img ng-repeat="image in event.ImagePaths track by $index"
                                                        ng-src="{{ 'https://api-test2.salesgenx.in/Content/Uploads/' + (image.includes('\\') ? image.split('\\').pop() : image.split('/').pop()) }}"
                                                        alt="Event Image"
                                                        class="rounded me-1"
                                                        style="width: 50px; height: 50px; object-fit: cover;">
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <a href="#addEventtModal" data-bs-toggle="modal" ng-click="addEventModal(event)"
                                                    class="link-success fs-20 me-2" title="Edit">
                                                    <i class="ri-edit-2-line"></i>
                                                </a>
                                                <a href="#" ng-click="deleteEvent($event, event)" class="link-danger fs-20" title="Delete">
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

