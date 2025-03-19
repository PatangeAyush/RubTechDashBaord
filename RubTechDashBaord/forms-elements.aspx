<%@ Page Title="" Language="C#" MasterPageFile="~/Rubtech.Master" AutoEventWireup="true" CodeBehind="forms-elements.aspx.cs" Inherits="RubTechDashBaord.forms_elements" %>
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
    <!-- Add Vacancy Popup Modal Start-->

<div class="modal fade" id="addContactModal" tabindex="-1" aria-labelledby="addContactModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header p-4 pb-0 m-2">
                <h1 class="modal-title fs-4 fw-medium" id="addContactModalLabel">Edit Tender & Quotation</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" id="addContact-btnClose" aria-label="Close"></button>
            </div>
            <div class="modal-body pt-0 p-4">
                <form id="contactlist-form" class="needs-validation p-2" >
                 
                    
                    <div class="d-flex flex-column gap-3">
                        <div>
                           <label for="basiInput" class="form-label">Tender & Quotation Heading </label>
                           <input type="text" class="form-control rounded-pill" id="v-heading" placeholder="Enter Tender & Quotation Heading">
                        </div>
                        
                        <div>
                         <label for="labelInput" class="form-label">Tender & Quotation Icon</label>
                         <p class="text-format">Upload Image <code>jpg, jpeg, png</code> Format Only.</p>
                         <p class="text-format"> Maximum Upload Image Size - <code>20kb</code></p>
                         <input type="file" class="form-control rounded-pill" id="icon">
                         </div>
                        
                         <div>
                         <label for="placeholderInput" class="form-label">Tender & Quotation Document</label>
                          <p class="text-format">Upload Image <code>pdf, xlsx, docs</code> Format Only.</p>
                          <p class="text-format"> Maximum Upload Image Size - <code>1mb</code></p>
                          <input type="file" class="form-control rounded-pill" id="document">
                          </div>
                        
                        <div>
                          
                            <div class="invalid-feedback">
                                Please enter Tender & Quotation Heading. 
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

 <!-- Add Vacancy Popup Modal End-->

     <div class="page-content">
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">Basic Elements</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="dashboard.html">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Basic Elements</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Input Example</h4>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <div class="row gy-4">
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="basiInput" class="form-label">Basic Input</label>
                                                <input type="password" class="form-control" id="basiInput">
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="labelInput" class="form-label">Input with Label</label>
                                                <input type="password" class="form-control" id="labelInput">
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="placeholderInput" class="form-label">Input with Placeholder</label>
                                                <input type="password" class="form-control" id="placeholderInput" placeholder="Placeholder">
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="valueInput" class="form-label">Input with Value</label>
                                                <input type="text" class="form-control" id="valueInput" value="Input value">
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="readonlyPlaintext" class="form-label">Readonly Plain Text Input</label>
                                                <input type="text" class="form-control-plaintext" id="readonlyPlaintext" value="Readonly input" readonly>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="readonlyInput" class="form-label">Readonly Input</label>
                                                <input type="text" class="form-control" id="readonlyInput" value="Readonly input" readonly>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="disabledInput" class="form-label">Disabled Input</label>
                                                <input type="text" class="form-control" id="disabledInput" value="Disabled input" disabled>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="iconInput" class="form-label">Input with Icon</label>
                                                <div class="form-icon">
                                                    <input type="email" class="form-control form-control-icon" id="iconInput" placeholder="example@gmail.com">
                                                    <i class="ri-mail-unread-line"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="iconrightInput" class="form-label">Input with Icon Right</label>
                                                <div class="form-icon right">
                                                    <input type="email" class="form-control form-control-icon" id="iconrightInput" placeholder="example@gmail.com">
                                                    <i class="ri-mail-unread-line"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="exampleInputdate" class="form-label">Input Date</label>
                                                <input type="date" class="form-control" id="exampleInputdate">
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="exampleInputtime" class="form-label">Input Time</label>
                                                <input type="time" class="form-control" id="exampleInputtime">
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="exampleInputpassword" class="form-label">Input Password</label>
                                                <input type="password" class="form-control" id="exampleInputpassword" value="44512465">
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="exampleFormControlTextarea5" class="form-label">Example Textarea</label>
                                                <textarea class="form-control" id="exampleFormControlTextarea5" rows="3"></textarea>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="formtextInput" class="form-label">Form Text</label>
                                                <input type="password" class="form-control" id="formtextInput">
                                                <div id="passwordHelpBlock" class="form-text">
                                                    Must be 8-20 characters long.
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="colorPicker" class="form-label">Color Picker</label>
                                                <input type="color" class="form-control form-control-color w-100" id="colorPicker" value="#364574">
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="borderInput" class="form-label">Input Border Style</label>
                                                <input type="text" class="form-control border-dashed" id="borderInput" placeholder="Enter your name">
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <label for="exampleDataList" class="form-label">Datalist example</label>
                                            <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="Search your country...">
                                            <datalist id="datalistOptions">
                                                <option value="Switzerland">
                                                <option value="New York">
                                                <option value="France">
                                                <option value="Spain">
                                                <option value="Chicago">
                                                <option value="Bulgaria">
                                                <option value="Hong Kong">
                                            </datalist>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="exampleInputrounded" class="form-label">Rounded Input</label>
                                                <input type="text" class="form-control rounded-pill" id="exampleInputrounded" placeholder="Enter your name">
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="firstnamefloatingInput" placeholder="Enter your firstname">
                                                <label for="firstnamefloatingInput">Floating Input</label>
                                            </div>
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
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Input Sizing</h4>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <p class="text-muted">Use <code>form-control-lg</code> class to set large size input and Use <code>form-control-sm</code> class to set small size input. No class is needed for default size input.</p>
                                    <div class="row align-items-center g-3">
                                        <div class="col-lg-4">
                                            <input class="form-control form-control-sm" type="text" placeholder=".form-control-sm">
                                        </div>
                                        <!--end col-->
                                        <div class="col-lg-4">
                                            <input class="form-control" type="text" placeholder=".form-control">
                                        </div>
                                        <!--end col-->
                                        <div class="col-lg-4">
                                            <input class="form-control form-control-lg" type="text" placeholder=".form-control-lg">
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
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">File Input</h4>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <div class="row align-items-center g-3">
                                        <div class="col-lg-4">
                                            <div>
                                                <label for="formFile" class="form-label">Default File Input Example</label>
                                                <p class="text-muted">Use <code>input</code> attribute with <code>type="file"</code> tag for default file input</p>
                                                <input class="form-control" type="file" id="formFile">
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-lg-4">
                                            <div>
                                                <label for="formFileMultiple" class="form-label">Multiple Files Input Example</label>
                                                <p class="text-muted">Use <code>multiple</code> attribute within the input attribute to select multiple files.</p>
                                                <input class="form-control" type="file" id="formFileMultiple" multiple>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-lg-4">
                                            <div>
                                                <label for="formFileDisabled" class="form-label">Disabled File Input Example</label>
                                                <p class="text-muted">Use <code>disabled</code> attribute within the input attribute to disable the file input.</p>
                                                <input class="form-control" type="file" id="formFileDisabled" disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end row-->
                                    <div class="row mt-4 align-items-center g-3">
                                        <h5 class="fs-14">File Input Sizing</h5>
                                        <div class="col-lg-4">
                                            <div>
                                                <label for="formSizeSmall" class="form-label">Small Size File Input Example</label>
                                                <p class="text-muted">Use <code>form-control-sm</code> class within the form-control class to set a small size file input.</p>
                                                <input class="form-control form-control-sm" id="formSizeSmall" type="file">
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div>
                                                <label for="formSizeDefault" class="form-label">Default Size File Input Example</label>
                                                <p class="text-muted">Use <code>form-control </code>class and <code>type="file"</code> attribute within the input attribute to set a default size file input.</p>
                                                <input class="form-control" id="formSizeDefault" type="file">
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div>
                                                <label for="formSizeLarge" class="form-label">Large Size File Input Example</label>
                                                <p class="text-muted">Use <code>form-control-lg</code> class within the form-control class to set a large size file input.</p>

                                                <input class="form-control form-control-lg" id="formSizeLarge" type="file">
                                            </div>
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
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Input Group</h4>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <div>
                                        <h5 class="fs-15">Basic example</h5>
                                        <p class="text-muted">Use <code>input-group</code> class to div element which contains input attribute to wrap a default input in the group.</p>
                                        <div class="row g-3">
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">@</span>
                                                    <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                                    <span class="input-group-text" id="basic-addon2">@example.com</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <span class="input-group-text">$</span>
                                                    <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
                                                    <span class="input-group-text">.00</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="Username" aria-label="Username">
                                                    <span class="input-group-text">@</span>
                                                    <input type="text" class="form-control" placeholder="Server" aria-label="Server">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <span class="input-group-text">With textarea</span>
                                                    <textarea class="form-control" aria-label="With textarea" rows="2"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <label for="basic-url" class="form-label">Your vanity URL</label>
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon3">https://example.com/users/</span>
                                                    <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mt-4">
                                        <h5 class="fs-15">Wrapping</h5>
                                        <p class="text-muted">Input groups wrap by default via <code>flex-wrap: wrap</code> in order to accommodate custom form field validation within an input group. You may disable this with <code>flex-nowrap</code> class.</p>
                                        <div class="input-group flex-nowrap">
                                            <span class="input-group-text" id="addon-wrapping">@</span>
                                            <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Input Group Sizing</h4>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <p class="text-muted">Use <code>input-group-sm</code> class to set a small size input group and <code>input-group-lg</code> class to input-group class to set a large size input group respectively. no such class is required for a default size input group.</p>
                                    <div class="row align-items-center g-3">
                                        <div class="col-lg-4">
                                            <div class="input-group input-group-sm">
                                                <span class="input-group-text" id="inputGroup-sizing-sm">Small</span>
                                                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="input-group">
                                                <span class="input-group-text" id="inputGroup-sizing-default">Default</span>
                                                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="input-group input-group-lg">
                                                <span class="input-group-text" id="inputGroup-sizing-lg">Large</span>
                                                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Multiple Inputs</h4>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <p class="text-muted">While multiple <code>&lt;input&gt;</code>s are supported visually, validation styles are only available for input groups with a single <code>&lt;input&gt;</code>.</p>
                                    <div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">First and last name</span>
                                            <input type="text" aria-label="First name" class="form-control">
                                            <input type="text" aria-label="Last name" class="form-control">
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text">$</span>
                                            <span class="input-group-text">0.00</span>
                                            <input type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
                                        </div>

                                        <div class="input-group">
                                            <input type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
                                            <span class="input-group-text">$</span>
                                            <span class="input-group-text">0.00</span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Buttons, Checkboxs and Radios Group</h4>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <div>
                                        <p class="text-muted">Use any checkbox, radio, or button option within an input group’s addon instead of text. We recommend adding <code>mt-0</code> class to the <code>form-check-input</code> when there’s no visible text next to the input.</p>
                                        <div class="row g-3">
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <div class="input-group-text">
                                                        <input class="form-check-input mt-0" type="checkbox" value="" aria-label="Checkbox for following text input">
                                                    </div>
                                                    <input type="text" class="form-control" aria-label="Text input with checkbox">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <div class="input-group-text">
                                                        <input class="form-check-input mt-0" type="radio" value="" aria-label="Radio button for following text input">
                                                    </div>
                                                    <input type="text" class="form-control" aria-label="Text input with radio button">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <button class="btn btn-outline-primary" type="button" id="button-addon1">Button</button>
                                                    <input type="text" class="form-control" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                                                    <button class="btn btn-outline-success" type="button" id="button-addon2">Button</button>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <button class="btn btn-primary" type="button">Button</button>
                                                    <button class="btn btn-success" type="button">Button</button>
                                                    <input type="text" class="form-control" placeholder="" aria-label="Example text with two button addons">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" aria-label="Recipient's username with two button addons">
                                                    <button class="btn btn-primary" type="button">Button</button>
                                                    <button class="btn btn-success" type="button">Button</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Buttons with dropdowns</h4>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <div>
                                        <p class="text-muted">You can use a button with the dropdown toggle to set the file input group.</p>
                                        <div class="row g-3">
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</button>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="#">Action</a></li>
                                                        <li><a class="dropdown-item" href="#">Another action</a></li>
                                                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                                                        <li>
                                                            <hr class="dropdown-divider">
                                                        </li>
                                                        <li><a class="dropdown-item" href="#">Separated link</a></li>
                                                    </ul>
                                                    <input type="text" class="form-control" aria-label="Text input with dropdown button">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" aria-label="Text input with dropdown button">
                                                    <button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</button>
                                                    <ul class="dropdown-menu dropdown-menu-end">
                                                        <li><a class="dropdown-item" href="#">Action</a></li>
                                                        <li><a class="dropdown-item" href="#">Another action</a></li>
                                                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                                                        <li>
                                                            <hr class="dropdown-divider">
                                                        </li>
                                                        <li><a class="dropdown-item" href="#">Separated link</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</button>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="#">Action before</a></li>
                                                        <li><a class="dropdown-item" href="#">Another action before</a></li>
                                                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                                                        <li>
                                                            <hr class="dropdown-divider">
                                                        </li>
                                                        <li><a class="dropdown-item" href="#">Separated link</a></li>
                                                    </ul>
                                                    <input type="text" class="form-control" aria-label="Text input with 2 dropdown buttons">
                                                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</button>
                                                    <ul class="dropdown-menu dropdown-menu-end">
                                                        <li><a class="dropdown-item" href="#">Action</a></li>
                                                        <li><a class="dropdown-item" href="#">Another action</a></li>
                                                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                                                        <li>
                                                            <hr class="dropdown-divider">
                                                        </li>
                                                        <li><a class="dropdown-item" href="#">Separated link</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Custom Forms</h4>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <p class="text-muted">Input groups include support for custom selects and custom file inputs. Browser default versions of these are not supported.</p>
                                    <div>
                                        <h5 class="fs-15 mb-3">Select</h5>
                                        <div class="row g-3">
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <label class="input-group-text" for="inputGroupSelect01">Options</label>
                                                    <select class="form-select" id="inputGroupSelect01">
                                                        <option selected>Choose...</option>
                                                        <option value="1">One</option>
                                                        <option value="2">Two</option>
                                                        <option value="3">Three</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <select class="form-select" id="inputGroupSelect02">
                                                        <option selected>Choose...</option>
                                                        <option value="1">One</option>
                                                        <option value="2">Two</option>
                                                        <option value="3">Three</option>
                                                    </select>
                                                    <label class="input-group-text" for="inputGroupSelect02">Options</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <button class="btn btn-outline-primary" type="button">Button</button>
                                                    <select class="form-select" id="inputGroupSelect03" aria-label="Example select with button addon">
                                                        <option selected>Choose...</option>
                                                        <option value="1">One</option>
                                                        <option value="2">Two</option>
                                                        <option value="3">Three</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <select class="form-select" id="inputGroupSelect04" aria-label="Example select with button addon">
                                                        <option selected>Choose...</option>
                                                        <option value="1">One</option>
                                                        <option value="2">Two</option>
                                                        <option value="3">Three</option>
                                                    </select>
                                                    <button class="btn btn-outline-secondary" type="button">Button</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mt-4">
                                        <h5 class="fs-15 mb-3">File Input</h5>
                                        <div class="row g-3">
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <label class="input-group-text" for="inputGroupFile01">Upload</label>
                                                    <input type="file" class="form-control" id="inputGroupFile01">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <input type="file" class="form-control" id="inputGroupFile02">
                                                    <label class="input-group-text" for="inputGroupFile02">Upload</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <button class="btn btn-outline-primary" type="button" id="inputGroupFileAddon03">Button</button>
                                                    <input type="file" class="form-control" id="inputGroupFile03" aria-describedby="inputGroupFileAddon03" aria-label="Upload">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                                    <button class="btn btn-outline-success" type="button" id="inputGroupFileAddon04">Button</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->


                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Checkbox</h4>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6">
                                            <div>
                                                <p class="text-muted fw-medium">Default Checkbox</p>
                                                <p class="text-muted">Use <code>type="checkbox"</code> attribute to set a checkbox and add <code>checked</code>attribute to set a checkbox checked by default.</p>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" id="formCheck1">
                                                    <label class="form-check-label" for="formCheck1">
                                                        Default checkbox
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="formCheck2" checked>
                                                    <label class="form-check-label" for="formCheck2">
                                                        Checked checkbox
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-4 col-md-6">
                                            <div class="mt-4 mt-md-0">
                                                <p class="text-muted fw-medium">Disabled Checkbox</p>
                                                <p class="text-muted">Use <code>disabled</code> attribute to set a checkbox disabled and add <code>checked</code> attribute to set a checkbox checked by default.</p>
                                                <div>
                                                    <div class="form-check form-check-right mb-2">
                                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled>
                                                        <label class="form-check-label" for="flexCheckDisabled">
                                                            Disabled checkbox
                                                        </label>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="form-check form-check-right">
                                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedDisabled" checked disabled>
                                                        <label class="form-check-label" for="flexCheckCheckedDisabled">
                                                            Disabled checked checkbox
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-4 col-md-6">
                                            <div class="mt-4 mt-md-0">
                                                <p class="text-muted fw-medium">Checkbox Right</p>
                                                <p class="text-muted">Use <code>form-check-right</code> class to form-check class to set a checkbox on the right side.</p>
                                                <div class="form-check form-check-right mb-2">
                                                    <input class="form-check-input" type="checkbox" name="formCheckboxRight" id="formCheckboxRight1" checked="">
                                                    <label class="form-check-label" for="formCheckboxRight1">
                                                        Form Radio Right
                                                    </label>
                                                </div>
                                                <div>
                                                    <div class="form-check form-check-right">
                                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedRightDisabled" checked disabled>
                                                        <label class="form-check-label" for="flexCheckCheckedRightDisabled">
                                                            Disabled checked checkbox
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-6">
                                            <div class="mt-3">
                                                <p class="text-muted fw-medium">Indeterminate</p>
                                                <div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value="" id="defaultIndeterminateCheck">
                                                        <label class="form-check-label" for="defaultIndeterminateCheck">
                                                            Indeterminate checkbox
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->
                                </div>


                            </div>
                        </div> <!-- end col -->
                    </div>


                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Custom Checkboxes</h4>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div>

                                                <p class="text-muted">Use <code>form-check-</code> class with below-mentioned color variation to set a color checkbox.</p>
                                                <!-- Bootstrap Custom Checkboxes color -->
                                                <div>
                                                    <div class="form-check mb-3">
                                                        <input class="form-check-input" type="checkbox" id="formCheck6" checked>
                                                        <label class="form-check-label" for="formCheck6">
                                                            Checkbox Primary
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-secondary mb-3">
                                                        <input class="form-check-input" type="checkbox" id="formCheck7" checked>
                                                        <label class="form-check-label" for="formCheck7">
                                                            Checkbox Secondary
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-success mb-3">
                                                        <input class="form-check-input" type="checkbox" id="formCheck8" checked>
                                                        <label class="form-check-label" for="formCheck8">
                                                            Checkbox Success
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-warning mb-3">
                                                        <input class="form-check-input" type="checkbox" id="formCheck9" checked>
                                                        <label class="form-check-label" for="formCheck9">
                                                            Checkbox Warning
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-danger mb-3">
                                                        <input class="form-check-input" type="checkbox" id="formCheck10" checked>
                                                        <label class="form-check-label" for="formCheck10">
                                                            Checkbox Danger
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-info mb-3">
                                                        <input class="form-check-input" type="checkbox" id="formCheck11" checked>
                                                        <label class="form-check-label" for="formCheck11">
                                                            Checkbox Info
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-dark">
                                                        <input class="form-check-input" type="checkbox" id="formCheck12" checked>
                                                        <label class="form-check-label" for="formCheck12">
                                                            Checkbox Dark
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-6">
                                            <div class="mt-4 mt-md-0">
                                                <p class="text-muted">Use <code>form-check-outline</code> class and <code>form-check-</code> class with below-mentioned color variation to set a color checkbox with outline.</p>
                                                <!-- Bootstrap Custom Outline Checkboxes -->
                                                <div>
                                                    <div class="form-check form-check-outline form-check-primary mb-3">
                                                        <input class="form-check-input" type="checkbox" id="formCheck13" checked>
                                                        <label class="form-check-label" for="formCheck13">
                                                            Checkbox Outline Primary
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-outline form-check-secondary mb-3">
                                                        <input class="form-check-input" type="checkbox" id="formCheck14" checked>
                                                        <label class="form-check-label" for="formCheck14">
                                                            Checkbox Outline Secondary
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-outline form-check-success mb-3">
                                                        <input class="form-check-input" type="checkbox" id="formCheck15" checked>
                                                        <label class="form-check-label" for="formCheck15">
                                                            Checkbox Outline Success
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-outline form-check-warning mb-3">
                                                        <input class="form-check-input" type="checkbox" id="formCheck16" checked>
                                                        <label class="form-check-label" for="formCheck16">
                                                            Checkbox Outline Warning
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-outline form-check-danger mb-3">
                                                        <input class="form-check-input" type="checkbox" id="formCheck17" checked>
                                                        <label class="form-check-label" for="formCheck17">
                                                            Checkbox Outline Danger
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-outline form-check-info mb-3">
                                                        <input class="form-check-input" type="checkbox" id="formCheck18" checked>
                                                        <label class="form-check-label" for="formCheck18">
                                                            Checkbox Outline Info
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-outline form-check-dark">
                                                        <input class="form-check-input" type="checkbox" id="formCheck19" checked>
                                                        <label class="form-check-label" for="formCheck19">
                                                            Checkbox Outline Dark
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
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
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Radios</h4>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6">
                                            <div>
                                                <p class="text-muted fw-medium">Default Radios</p>
                                                <p class="text-muted">Use <code>type="radio"</code> attribute to set a radio button and add <code>checked</code> attribute to set a radio checked by default.</p>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                                                    <label class="form-check-label" for="flexRadioDefault1">
                                                        Default radio
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                                                    <label class="form-check-label" for="flexRadioDefault2">
                                                        Default checked radio
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-lg-4 col-md-6">
                                            <div class="mt-4 mt-md-0">
                                                <p class="text-muted fw-medium">Disabled Radios</p>
                                                <p class="text-muted">Use <code>disabled</code> attribute to set a radio button disabled and add <code>checked</code> attribute to set a radio checked by default.</p>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="radio" name="flexRadioDisabled" id="flexRadioDisabled" disabled>
                                                    <label class="form-check-label" for="flexRadioDisabled">
                                                        Disabled radio
                                                    </label>
                                                </div>
                                                <div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="flexRadioDisabled" id="flexRadioCheckedDisabled" checked disabled>
                                                        <label class="form-check-label" for="flexRadioCheckedDisabled">
                                                            Disabled checked radio
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-4 col-md-6">
                                            <div class="mt-4 mt-md-0">
                                                <p class="text-muted fw-medium">Radio Right</p>
                                                <p class="text-muted">Use <code>form-check-right</code> class to form-check class to set a radio button on the right side.</p>
                                                <div class="form-check form-check-right mb-2">
                                                    <input class="form-check-input" type="radio" name="formradioRight" id="formradioRight1">
                                                    <label class="form-check-label" for="formradioRight1">
                                                        Form Radio Right
                                                    </label>
                                                </div>
                                                <div>
                                                    <div class="form-check form-check-right">
                                                        <input class="form-check-input" type="radio" value="" name="formradioRight" id="flexCheckCheckedDisabled2" checked disabled>
                                                        <label class="form-check-label" for="flexCheckCheckedDisabled2">
                                                            Disabled checked radio
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->
                                </div>


                            </div>
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Custom Radio</h4>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div>
                                                <p class="text-muted">Use <code>form-check-</code> class with below-mentioned color variation to set a color radio.</p>

                                                <div class="form-check form-radio-primary mb-3">
                                                    <input class="form-check-input" type="radio" name="formradiocolor1" id="formradioRight5" checked>
                                                    <label class="form-check-label" for="formradioRight5">
                                                        Radio Primary
                                                    </label>
                                                </div>

                                                <div class="form-check form-radio-secondary mb-3">
                                                    <input class="form-check-input" type="radio" name="formradiocolor2" id="formradioRight6" checked>
                                                    <label class="form-check-label" for="formradioRight6">
                                                        Radio Secondary
                                                    </label>
                                                </div>

                                                <div class="form-check form-radio-success mb-3">
                                                    <input class="form-check-input" type="radio" name="formradiocolor3" id="formradioRight7" checked>
                                                    <label class="form-check-label" for="formradioRight7">
                                                        Radio Success
                                                    </label>
                                                </div>

                                                <div class="form-check form-radio-warning mb-3">
                                                    <input class="form-check-input" type="radio" name="formradiocolor4" id="formradioRight8" checked>
                                                    <label class="form-check-label" for="formradioRight8">
                                                        Radio Warning
                                                    </label>
                                                </div>

                                                <div class="form-check form-radio-danger mb-3">
                                                    <input class="form-check-input" type="radio" name="formradiocolor5" id="formradioRight9" checked>
                                                    <label class="form-check-label" for="formradioRight9">
                                                        Radio Danger
                                                    </label>
                                                </div>

                                                <div class="form-check form-radio-info mb-3">
                                                    <input class="form-check-input" type="radio" name="formradiocolor6" id="formradioRight10" checked>
                                                    <label class="form-check-label" for="formradioRight10">
                                                        Radio Info
                                                    </label>
                                                </div>

                                                <div class="form-check form-radio-dark">
                                                    <input class="form-check-input" type="radio" name="formradiocolor7" id="formradioRight11" checked>
                                                    <label class="form-check-label" for="formradioRight11">
                                                        Radio Dark
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-6">
                                            <div class="mt-4 mt-md-0">
                                                <p class="text-muted">Use <code>form-check-outline</code> class and <code>form-check-</code> class with below-mentioned color variation to set a color radio with outline.</p>

                                                <div class="form-check form-radio-outline form-radio-primary mb-3">
                                                    <input class="form-check-input" type="radio" name="formradiocolor9" id="formradioRight13" checked>
                                                    <label class="form-check-label" for="formradioRight13">
                                                        Radio Outline Primary
                                                    </label>
                                                </div>

                                                <div class="form-check form-radio-outline form-radio-secondary mb-3">
                                                    <input class="form-check-input" type="radio" name="formradiocolor10" id="formradioRight14" checked>
                                                    <label class="form-check-label" for="formradioRight14">
                                                        Radio Outline Secondary
                                                    </label>
                                                </div>

                                                <div class="form-check form-radio-outline form-radio-success mb-3">
                                                    <input class="form-check-input" type="radio" name="formradiocolor11" id="formradioRight15" checked>
                                                    <label class="form-check-label" for="formradioRight15">
                                                        Radio Outline Success
                                                    </label>
                                                </div>

                                                <div class="form-check form-radio-outline form-radio-warning mb-3">
                                                    <input class="form-check-input" type="radio" name="formradiocolor12" id="formradioRight16" checked>
                                                    <label class="form-check-label" for="formradioRight16">
                                                        Radio Outline Warning
                                                    </label>
                                                </div>

                                                <div class="form-check form-radio-outline form-radio-danger mb-3">
                                                    <input class="form-check-input" type="radio" name="formradiocolor13" id="formradioRight17" checked>
                                                    <label class="form-check-label" for="formradioRight17">
                                                        Radio Outline Danger
                                                    </label>
                                                </div>

                                                <div class="form-check form-radio-outline form-radio-info mb-3">
                                                    <input class="form-check-input" type="radio" name="formradiocolor14" id="formradioRight18" checked>
                                                    <label class="form-check-label" for="formradioRight18">
                                                        Radio Outline Info
                                                    </label>
                                                </div>

                                                <div class="form-check form-radio-outline form-radio-dark">
                                                    <input class="form-check-input" type="radio" name="formradiocolor15" id="formradioRight19" checked>
                                                    <label class="form-check-label" for="formradioRight19">
                                                        Radio Outline Dark
                                                    </label>
                                                </div>
                                            </div>
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
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Switches</h4>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6">
                                            <div>
                                                <p class="text-muted fw-medium">Deafult Switchs</p>
                                                <p class="text-muted">Use <code>form-switch</code> class to form-check class to set a switch and add <code>checked</code> attribute to set a switch checked by default.</p>
                                                <div class="form-check form-switch mb-2">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                    <label class="form-check-label" for="flexSwitchCheckDefault">Default switch input</label>
                                                </div>

                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
                                                    <label class="form-check-label" for="flexSwitchCheckChecked">Checked switch input</label>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-4 col-md-6">
                                            <div class="mt-4 mt-md-0">
                                                <p class="text-muted fw-medium">Disabled Switchs</p>
                                                <p class="text-muted">Use <code>disabled</code> attribute to set a radio button disabled and add <code>checked</code> attribute to set a switch checked by default.</p>
                                                <div class="form-check form-switch mb-2">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDisabled" disabled>
                                                    <label class="form-check-label" for="flexSwitchCheckDisabled">Switch input</label>
                                                </div>

                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckCheckedDisabled1" checked disabled>
                                                    <label class="form-check-label" for="flexSwitchCheckCheckedDisabled1">Disabled checked switch input</label>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-4 col-md-6">
                                            <div class="mt-4 mt-md-0">
                                                <p class="text-muted fw-medium">Switch Right</p>
                                                <p class="text-muted">Use <code>form-check-right</code> class to form-check class to set a switch button on the right side.</p>
                                                <div>
                                                    <div class="form-check form-switch form-check-right mb-2">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckRightDisabled" checked>
                                                        <label class="form-check-label" for="flexSwitchCheckRightDisabled">Switch Right input</label>
                                                    </div>
                                                </div>

                                                <div>
                                                    <div class="form-check form-switch form-check-right">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckCheckedDisabled2" disabled>
                                                        <label class="form-check-label" for="flexSwitchCheckCheckedDisabled2">Disabled checked switch input</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-4 col-md-6">
                                            <div class="mt-3">
                                                <p class="text-muted fw-medium">Switch sizes</p>
                                                <p class="text-muted">Use <code>form-switch-md</code> class to set a medium size switch button and <code>form-switch-lg</code> class to form-check class to set a large size switch button respectively. No such class is required for small size switch button.</p>

                                                <div class="form-check form-switch mb-3" dir="ltr">
                                                    <input type="checkbox" class="form-check-input" id="customSwitchsizesm" checked="">
                                                    <label class="form-check-label" for="customSwitchsizesm">Small Size Switch</label>
                                                </div>

                                                <div class="form-check form-switch form-switch-md mb-3" dir="ltr">
                                                    <input type="checkbox" class="form-check-input" id="customSwitchsizemd">
                                                    <label class="form-check-label" for="customSwitchsizemd">Medium Size Switch</label>
                                                </div>

                                                <div class="form-check form-switch form-switch-lg" dir="ltr">
                                                    <input type="checkbox" class="form-check-input" id="customSwitchsizelg" checked="">
                                                    <label class="form-check-label" for="customSwitchsizelg">Large Size Switch</label>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->
                                </div>


                            </div>
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Switches Color</h4>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>form-check-</code> class with below-mentioned color variation to set a color switch.</p>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div>
                                                <div class="form-check form-switch mb-3">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck1" checked>
                                                    <label class="form-check-label" for="SwitchCheck1">Switch Default</label>
                                                </div>

                                                <div class="form-check form-switch form-switch-secondary mb-3">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck2" checked>
                                                    <label class="form-check-label" for="SwitchCheck2">Switch Secondary</label>
                                                </div>

                                                <div class="form-check form-switch form-switch-success mb-3">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck3" checked>
                                                    <label class="form-check-label" for="SwitchCheck3">Switch Success</label>
                                                </div>

                                                <div class="form-check form-switch form-switch-warning mb-2 mb-md-0">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck4" checked>
                                                    <label class="form-check-label" for="SwitchCheck4">Switch Warning</label>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-6">
                                            <div>
                                                <div class="form-check form-switch form-switch-danger mb-3">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck5" checked>
                                                    <label class="form-check-label" for="SwitchCheck5">Switch Danger</label>
                                                </div>

                                                <div class="form-check form-switch form-switch-info mb-3">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck6" checked>
                                                    <label class="form-check-label" for="SwitchCheck6">Switch Info</label>
                                                </div>

                                                <div class="form-check form-switch form-switch-dark mb-3">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck7" checked>
                                                    <label class="form-check-label" for="SwitchCheck7">Switch Dark</label>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->
                                </div>


                                <!--end card-body-->
                            </div>
                            <!--end card-->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Custom Switches</h4>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>form-switch-custom</code> class &amp; <code>form-switch-</code> class with below-mentioned color variation to set a color radius.</p>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div>
                                                <div class="form-check form-switch form-switch-custom form-switch-primary mb-3">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck9" checked>
                                                    <label class="form-check-label" for="SwitchCheck9">Switch Primary</label>
                                                </div>

                                                <div class="form-check form-switch form-switch-custom form-switch-secondary mb-3">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck10" checked>
                                                    <label class="form-check-label" for="SwitchCheck10">Switch Secondary</label>
                                                </div>

                                                <div class="form-check form-switch form-switch-custom form-switch-success mb-3">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck11" checked>
                                                    <label class="form-check-label" for="SwitchCheck11">Switch Success</label>
                                                </div>

                                                <div class="form-check form-switch form-switch-custom form-switch-warning mb-2 mb-md-0">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck12" checked>
                                                    <label class="form-check-label" for="SwitchCheck12">Switch Warning</label>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-6">
                                            <div class="mt-4 mt-md-0">
                                                <div class="form-check form-switch form-switch-custom form-switch-danger mb-3">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck13" checked>
                                                    <label class="form-check-label" for="SwitchCheck13">Switch Danger</label>
                                                </div>

                                                <div class="form-check form-switch form-switch-custom form-switch-info mb-3">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck14" checked>
                                                    <label class="form-check-label" for="SwitchCheck14">Switch Info</label>
                                                </div>

                                                <div class="form-check form-switch form-switch-custom form-switch-dark mb-3">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck15" checked>
                                                    <label class="form-check-label" for="SwitchCheck15">Switch Dark</label>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->
                                </div>


                                <!--end card-body-->
                            </div>
                            <!--end card-->
                        </div> <!-- end col -->
                    </div><!-- end row -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Inline Checkbox & Radios</h4>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>form-check-inline</code> class to form-check class to set horizontally align checkboxes, radios, or switches.</p>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="mt-4 mt-lg-0">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="option1">
                                                    <label class="form-check-label" for="inlineCheckbox6">1</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="option2">
                                                    <label class="form-check-label" for="inlineCheckbox7">2</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox8" value="option3" disabled>
                                                    <label class="form-check-label" for="inlineCheckbox8">3 (disabled)</label>
                                                </div>
                                            </div>
                                        </div><!-- end col -->

                                        <div class="col-lg-4">
                                            <div class="mt-4 mt-lg-0">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions1" id="inlineRadio1" value="option1">
                                                    <label class="form-check-label" for="inlineRadio1">1</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions2" id="inlineRadio2" value="option2">
                                                    <label class="form-check-label" for="inlineRadio2">2</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions3" id="inlineRadio3" value="option3" disabled>
                                                    <label class="form-check-label" for="inlineRadio3">3 (disabled)</label>
                                                </div>
                                            </div>
                                        </div><!-- end col -->

                                        <div class="col-lg-4">
                                            <div class="mt-4 mt-lg-0">
                                                <div class="form-check form-switch form-check-inline" dir="ltr">
                                                    <input type="checkbox" class="form-check-input" id="inlineswitch5">
                                                    <label class="form-check-label" for="inlineswitch5">1</label>
                                                </div>
                                                <div class="form-check form-switch form-check-inline" dir="ltr">
                                                    <input type="checkbox" class="form-check-input" id="inlineswitch6">
                                                    <label class="form-check-label" for="inlineswitch6">2</label>
                                                </div>
                                                <div class="form-check form-switch form-check-inline" dir="ltr">
                                                    <input type="checkbox" class="form-check-input" id="inlineswitchdisabled2" disabled>
                                                    <label class="form-check-label" for="inlineswitchdisabled2">2</label>
                                                </div>
                                            </div>
                                        </div><!-- end col -->
                                    </div>
                                    <!--end row-->
                                </div>


                                <!--end card-body-->
                            </div>
                            <!--end card-->
                        </div><!-- end col -->
                    </div><!-- end row -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Without Labels</h4>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Omit the wrapping, <code>form-check</code> class for checkboxes, radios, or switches that have no label text. Remember to still provide some form of accessible name for assistive technologies (for instance, using aria-label).</p>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="mt-4 mt-lg-0">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end col -->

                                        <div class="col-lg-4">
                                            <div class="mt-4 mt-lg-0">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="WithoutinlineRadio1" value="option1">
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="WithoutinlineRadio2" value="option2">
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="WithoutinlineRadio3" value="option3" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end col -->

                                        <div class="col-lg-4">
                                            <div class="mt-4 mt-lg-0">
                                                <div class="form-check form-switch form-check-inline" dir="ltr">
                                                    <input type="checkbox" class="form-check-input" id="inlineswitch">
                                                </div>
                                                <div class="form-check form-switch form-check-inline" dir="ltr">
                                                    <input type="checkbox" class="form-check-input" id="inlineswitch1">
                                                </div>
                                                <div class="form-check form-switch form-check-inline" dir="ltr">
                                                    <input type="checkbox" class="form-check-input" id="inlineswitchdisabled" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end col -->
                                    </div>
                                    <!--end row-->
                                </div>


                                <!--end card-body-->
                            </div>
                            <!--end card-->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Radio Toggle Buttons</h4>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Create button-like checkboxes and radio buttons by using <code>btn</code> styles rather than form-check-label class on the &lt;label&gt; elements. These toggle buttons can further be grouped in a <a href="https://getbootstrap.com/docs/5.1/components/button-group/">button group</a> if needed.</p>
                                    <div class="hstack gap-2 flex-wrap">
                                        <input type="radio" class="btn-check" name="options" id="option1" checked>
                                        <label class="btn btn-secondary" for="option1">Checked</label>

                                        <input type="radio" class="btn-check" name="options" id="option2">
                                        <label class="btn btn-secondary" for="option2">Radio</label>

                                        <input type="radio" class="btn-check" name="options" id="option3" disabled>
                                        <label class="btn btn-secondary" for="option3">Disabled</label>

                                        <input type="radio" class="btn-check" name="options" id="option4">
                                        <label class="btn btn-secondary" for="option4">Radio</label>
                                    </div>
                                </div>


                                <!--end card-body-->
                            </div>
                            <!--end card-->
                        </div> <!-- end col -->

                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Outlined Styles</h4>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Different variants of <code>btn</code> attribute, such as the various outlined styles, are supported.</p>
                                    <div class="hstack gap-2 flex-wrap">
                                        <input type="checkbox" class="btn-check" id="btn-check-outlined">
                                        <label class="btn btn-outline-primary" for="btn-check-outlined">Single toggle</label>

                                        <input type="checkbox" class="btn-check" id="btn-check-2-outlined" checked>
                                        <label class="btn btn-outline-secondary" for="btn-check-2-outlined">Checked</label>

                                        <input type="radio" class="btn-check" name="options-outlined" id="success-outlined" checked>
                                        <label class="btn btn-outline-success" for="success-outlined">Checked success radio</label>

                                        <input type="radio" class="btn-check" name="options-outlined" id="danger-outlined">
                                        <label class="btn btn-outline-danger" for="danger-outlined">Danger radio</label>
                                    </div>
                                </div>


                            </div>
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0">Ckeditor Classic Editor</h4>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>ckeditor-classic</code> class to set ckeditor classic editor.</p>
                                    <div class="ckeditor-classic"></div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>

                </div>
                <!-- container-fluid -->
            </div>



</asp:Content>
