<%@ Page Title="" Language="C#" MasterPageFile="~/Rubtech.Master" AutoEventWireup="true" CodeBehind="NRCK.aspx.cs" Inherits="RubTechDashBaord.NRCK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          
        
    <!--start back-to-top-->
<button onClick="topFunction()" class="btn btn-danger btn-icon" id="back-to-top">
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


            <!-- Add National Ruber Conference 2023 Kolkata Popup Modal Start-->

<div class="modal fade" id="addContactModal" tabindex="-1" aria-labelledby="addContactModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header p-4 pb-0 m-2">
                <h1 class="modal-title fs-4 fw-medium" id="addContactModalLabel">Edit National Ruber Conference 2023 Kolkata</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" id="addContact-btnClose" aria-label="Close"></button>
            </div>
            <div class="modal-body pt-0 p-4">
                <form id="contactlist-form" class="needs-validation p-2" >
                 
                    
                    <div class="d-flex flex-column gap-3">
                        <div>
                           <label for="basiInput" class="form-label"> Heading </label>
                           <input type="text" class="form-control rounded-pill" id="v-heading" placeholder="Enter  Heading">
                        </div>
                        
                        <div>
                         <label for="labelInput" class="form-label"> Icon</label>
                         <p class="text-format">Upload Image <code>jpg, jpeg, png</code> Format Only.</p>
                         <p class="text-format"> Maximum Upload Image Size - <code>20kb</code></p>
                         <input type="file" class="form-control rounded-pill" id="icon">
                         </div>
                        
                         <div>
                         <label for="placeholderInput" class="form-label"> Document</label>
                          <p class="text-format">Upload Image <code>pdf, xlsx, docs</code> Format Only.</p>
                          <p class="text-format"> Maximum Upload Image Size - <code>1mb</code></p>
                          <input type="file" class="form-control rounded-pill" id="document">
                          </div>
                        
                        <div>
                          
                            <div class="invalid-feedback">
                                Please enter Report Heading. 
                                 </div>
                        </div>
                        
                        
                        
                        <div class="text-end">
                         <button type="button" class="btn btn-success btn-label right ms-auto" id="addNewContact"> <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Update</button>
                           
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



 <!-- Add National Ruber Conference 2023 Kolkata Popup Modal End-->


            <div class="page-content">
    <div class="container-fluid">
    
         <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                    <h4 class="mb-sm-0">National Ruber Conference 2023 Kolkata</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="dashboard.aspx">Dashboard</a></li>
                            <li class="breadcrumb-item active">National Ruber Conference 2023 Kolkata </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                
                   <!-- <div class="card-header">
                        <h4 class="card-title mb-0">Input Example</h4>
                    </div>-->
                    
                    <!-- end card header -->
                    <div class="card-body">
                        <div class="row gy-4">
                            <div class="col-xxl-12 col-md-12">
                                <div>
                                    <label for="basiInput" class="form-label">National Ruber Conference 2023 Kolkata </label>
                                    <input type="text" class="form-control rounded-pill" id="v-heading" placeholder="Enter Heading">
                                </div>
                            </div>
                            <!--end col-->
                            <div class="col-xxl-6 col-md-6">
                                <div>
                                    <label for="labelInput" class="form-label">Insert Icon</label>
                                    <p class="text-format">Upload Image <code>jpg, jpeg, png</code> Format Only.</p>
                                   <p class="text-format"> Maximum Upload Image Size - <code>20kb</code></p>
                                    <input type="file" class="form-control rounded-pill" id="icon">
                                </div>
                            </div>
                            <!--end col-->
                            <div class="col-xxl-6 col-md-6">
                                <div>
                                   <label for="placeholderInput" class="form-label">Insert Document</label>
                                   <p class="text-format">Upload Image <code>pdf, xlsx, docs</code> Format Only.</p>
                                   <p class="text-format"> Maximum Upload Image Size - <code>1mb</code></p>
                                    <input type="file" class="form-control rounded-pill" id="document">
                                </div>
                            </div>
                            <!--end col-->
                            <div class="col-xxl-6 col-md-6">
                               <button type="button" class="btn btn-success btn-label right ms-auto"><i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Submit</button>
                            </div>
                            <!--end col-->
                           
                        </div>
                        <!--end row-->
                    </div>
                    
                </div>
            </div>
            <!--end col-->
        </div>
        <!--end row-->

        
     


        <div class="row">
            <div class="col">

                <div class="h-100">
                    

                    <div class="row">
                        
                        <!-- end col -->

                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">National Ruber Conference 2023 Kolkata</h4>
                                    <div class="flex-shrink-0">
                                        <div class="dropdown card-header-dropdown">
                                            <a class="text-reset dropdown-btn" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="fw-semibold text-uppercase fs-12">Sort by:
                                                </span><span class="text-muted">Today<i class="mdi mdi-chevron-down ms-1"></i></span>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a class="dropdown-item" href="#">Today</a>
                                                <a class="dropdown-item" href="#">Yesterday</a>
                                                <a class="dropdown-item" href="#">Last 7 Days</a>
                                                <a class="dropdown-item" href="#">Last 30 Days</a>
                                                <a class="dropdown-item" href="#">This Month</a>
                                                <a class="dropdown-item" href="#">Last Month</a>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card header -->
                            
                                <div class="card-body">
                                    <div class="table-responsive table-card">
                                        <table class="table table-success table-striped align-middle table-nowrap mb-0">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Icon</th>
                                                    <th scope="col">Document</th>
                                                    <th scope="col">Action</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Project Coordinator (Contract basis)</td>
                                                    
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                      <img src="assets/images/icons/tender-quotation.png" alt="Report" class="avatar-md img-thumbnail" />  
                                                        </div>
                                                    </td>
                                                    <td>Project-Manager.pdf</td>
                                                    
                                                    <td><div class="hstack gap-3 flex-wrap">
                                                 
                            <a href="#addContactModal" data-bs-toggle="modal" class="link-success fs-24" title="Edit"><i class="ri-edit-2-line"></i></a>
                            <a href="#" class="link-danger fs-24" title="Delete"><i class="ri-delete-bin-line"></i></a>
                                                    </div>
                                                    </td>
                                                   
                                                </tr>
                                                <!-- end tr -->
                                                
                                                 <tr>
                                                    <td>Junior Laboratory Assistant exam syllabus</td>
                                                    
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                      <img src="assets/images/icons/tender-quotation.png" alt="Report" class="avatar-md img-thumbnail" /> 
                                                        </div>
                                                    </td>
                                                    <td>Project-Manager.pdf</td>
                                                    
                                                    <td><div class="hstack gap-3 flex-wrap">
                                                        <a href="#" class="link-success fs-24" title="Edit"><i class="ri-edit-2-line"></i></a>
                                                        <a href="#" class="link-danger fs-24" title="Delete"><i class="ri-delete-bin-line"></i></a>
                                                    </div>
                                                    </td>
                                                   
                                                </tr>
                                                <!-- end tr -->
                                                
                                                 <tr>
                                                    <td>Senior executive(CSC) exam syllabus</td>
                                                    
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                      <img src="assets/images/icons/tender-quotation.png" alt="Report" class="avatar-md img-thumbnail" /> 
                                                        </div>
                                                    </td>
                                                    <td>Project-Manager.pdf</td>
                                                    
                                                    <td><div class="hstack gap-3 flex-wrap">
                                                        <a href="#" class="link-success fs-24" title="Edit"><i class="ri-edit-2-line"></i></a>
                                                        <a href="#" class="link-danger fs-24" title="Delete"><i class="ri-delete-bin-line"></i></a>
                                                    </div>
                                                    </td>
                                                   
                                                </tr>
                                                <!-- end tr -->
                                                
                                                 <tr>
                                                    <td>Result for the Post of Sr. Deputy Director</td>
                                                    
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                              <img src="assets/images/icons/tender-quotation.png" alt="Report" class="avatar-md img-thumbnail" />  
                                                        </div>
                                                    </td>
                                                    <td>Project-Manager.pdf</td>
                                                    
                                                    <td><div class="hstack gap-3 flex-wrap">
                                                        <a href="#" class="link-success fs-24" title="Edit"><i class="ri-edit-2-line"></i></a>
                                                        <a href="#" class="link-danger fs-24" title="Delete"><i class="ri-delete-bin-line"></i></a>
                                                    </div>
                                                    </td>
                                                   
                                                </tr>
                                                <!-- end tr -->
                                                
                                                 <tr>
                                                    <td>Notice of extension for Project Manager</td>
                                                    
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                         <img src="assets/images/icons/tender-quotation.png" alt="Report" class="avatar-md img-thumbnail" />  
                                                        </div>
                                                    </td>
                                                    <td>Project-Manager.pdf</td>
                                                    
                                                    <td><div class="hstack gap-3 flex-wrap">
                                                        <a href="#" class="link-success fs-24" title="Edit"><i class="ri-edit-2-line"></i></a>
                                                        <a href="#" class="link-danger fs-24" title="Delete"><i class="ri-delete-bin-line"></i></a>
                                                    </div>
                                                    </td>
                                                   
                                                </tr>
                                                <!-- end tr -->
                                                
                                                 <tr>
                                                    <td>Application Form for Project Manager</td>
                                                    
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                              <img src="assets/images/icons/tender-quotation.png" alt="Report" class="avatar-md img-thumbnail" /> 
                                                        </div>
                                                    </td>
                                                    <td>Project-Manager.pdf</td>
                                                    
                                                    <td><div class="hstack gap-3 flex-wrap">
                                                        <a href="#" class="link-success fs-24" title="Edit"><i class="ri-edit-2-line"></i></a>
                                                        <a href="#" class="link-danger fs-24" title="Delete"><i class="ri-delete-bin-line"></i></a>
                                                    </div>
                                                    </td>
                                                   
                                                </tr>
                                                <!-- end tr -->
                                                
                                                 <tr>
                                                    <td>Project Manager</td>
                                                    
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                               <img src="assets/images/icons/tender-quotation.png" alt="Report" class="avatar-md img-thumbnail" />  
                                                        </div>
                                                    </td>
                                                    <td>Project-Manager.pdf</td>
                                                    
                                                    <td><div class="hstack gap-3 flex-wrap">
                                                        <a href="#" class="link-success fs-24" title="Edit"><i class="ri-edit-2-line"></i></a>
                                                        <a href="#" class="link-danger fs-24" title="Delete"><i class="ri-delete-bin-line"></i></a>
                                                    </div>
                                                    </td>
                                                   
                                                </tr>
                                                <!-- end tr -->
                                                
                                                 <tr>
                                                    <td>Customer Service Executive</td>
                                                    
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                    <img src="assets/images/icons/tender-quotation.png" alt="Report" class="avatar-md img-thumbnail" />  
                                                        </div>
                                                    </td>
                                                    <td>Project-Manager.pdf</td>
                                                    
                                                    <td><div class="hstack gap-3 flex-wrap">
                                                        <a href="#" class="link-success fs-24" title="Edit"><i class="ri-edit-2-line"></i></a>
                                                        <a href="#" class="link-danger fs-24" title="Delete"><i class="ri-delete-bin-line"></i></a>
                                                    </div>
                                                    </td>
                                                   
                                                </tr>
                                                <!-- end tr -->
                                                
                                                 <tr>
                                                    <td>Admin Executive</td>
                                                    
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                      <img src="assets/images/icons/tender-quotation.png" alt="Report" class="avatar-md img-thumbnail" /> 
                                                        </div>
                                                    </td>
                                                    <td>Project-Manager.pdf</td>
                                                    
                                                    <td><div class="hstack gap-3 flex-wrap">
                                                        <a href="#" class="link-success fs-24" title="Edit"><i class="ri-edit-2-line"></i></a>
                                                        <a href="#" class="link-danger fs-24" title="Delete"><i class="ri-delete-bin-line"></i></a>
                                                    </div>
                                                    </td>
                                                   
                                                </tr>
                                                <!-- end tr -->
                                                
                                                 <tr>
                                                    <td>Advertisement for Sr.Officer Technical South Centre</td>
                                                    
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                              <img src="assets/images/icons/tender-quotation.png" alt="Report" class="avatar-md img-thumbnail" />  
                                                        </div>
                                                    </td>
                                                    <td>Project-Manager.pdf</td>
                                                    
                                                    <td><div class="hstack gap-3 flex-wrap">
                                                        <a href="#" class="link-success fs-24" title="Edit"><i class="ri-edit-2-line"></i></a>
                                                        <a href="#" class="link-danger fs-24" title="Delete"><i class="ri-delete-bin-line"></i></a>
                                                    </div>
                                                    </td>
                                                   
                                                </tr>
                                                <!-- end tr -->
                                                
                                             
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row align-items-center mt-4 pt-2 gy-2 text-center text-sm-start">
                                        <div class="col-sm">
                                            <div class="text-muted">
                                                Showing <span class="fw-semibold">6</span> of <span class="fw-semibold">25</span> Results
                                            </div>
                                        </div>
                                        <div class="col-sm-auto">
                                            <ul class="pagination pagination-separated pagination-sm mb-0 justify-content-center justify-content-sm-start">
                                            <li class="page-item disabled">
                                                <a href="#" class="page-link">←</a>
                                            </li>
                                            <li class="page-item active">
                                                <a href="#" class="page-link">1</a>
                                            </li>
                                            <li class="page-item">
                                                <a href="#" class="page-link">2</a>
                                            </li>
                                            <li class="page-item">
                                                <a href="#" class="page-link">3</a>
                                            </li>
                                            <li class="page-item">
                                                <a href="#" class="page-link">→</a>
                                            </li>
                                        </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div> <!-- end .h-100-->

            </div> <!-- end col -->

          
        </div>

    </div>
    <!-- container-fluid -->
</div>
</asp:Content>
