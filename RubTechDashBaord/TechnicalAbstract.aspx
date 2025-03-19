<%@ Page Title="" Language="C#" MasterPageFile="~/Rubtech.Master" AutoEventWireup="true" CodeBehind="TechnicalAbstract.aspx.cs" Inherits="RubTechDashBaord.Technical_Abstract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="..\angular_scripts\controllers\TechnicalAbstractController.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div ng-controller="TechnicalAbstractController">
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

        <!-- Add Technical Abstract Popup Modal Start-->

          <div class="modal fade" id="addTechicalAbstract" tabindex="-1" aria-labelledby="addTechicalAbstract" aria-hidden="true">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header p-4 pb-0 m-2">
            <h1 class="modal-title fs-4 fw-medium" id="addContactModalLabel">Edit Technical Abstract</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" id="addContact-btnClose" aria-label="Close"></button>
        </div>
        <div class="modal-body pt-0 p-4">
            <form id="UpdateTechnicalAbstract" class="needs-validation p-2" #technicalAbstractForm="ngForm" enctype="multipart/form-data">
                <div class="d-flex flex-column gap-3">
                     <div>                           
                         <input type="hidden" class="form-control rounded-pill" id="abstractId" ng-model="technicalAbstract.Id" name="abstractId">
                    </div>
                    <div>
                       <label for="heading" class="form-label">Name</label>
                       <input type="text" class="form-control rounded-pill" id="heading" placeholder="Enter Heading" ng-model="technicalAbstract.Name" name="heading">
                    </div>
                    
                    <div>
                       <%-- <label for="abstractImage" class="form-label">Abstract Image</label>
                        <input type="file" name="abstractImage" class="form-control rounded-pill" id="abstractImage" (change)="onFileChange($event, 'abstractImage')">
                    --%>

                       <label for="abstractImage" class="form-label">Abstract Image</label>
<input type="file" name="abstractImage" class="form-control squared-pill" id="abstractImage" ng-model="abstractImage" (change)="onFileChange($event, 'abstractImage')">
<img ng-if="technicalAbstract.Absract_ImagePath" src="{{ 'https://api-test2.salesgenx.in/Content/Uploads/' + technicalAbstract.Absract_ImagePath.split('\\').pop() }}" class="rounded-circle avatar-xl" />
                               
                    </div>

                    <div>
                       <%-- <label for="authorImage" class="form-label">Author Image</label>
                        <input type="file" name="authorImage" class="form-control rounded-pill" id="authorImage" (change)="onFileChange($event, 'authorImage')">
                    --%>

                        <label for="authorImage" class="form-label">Author Image</label>
<input type="file" name="authorImage" class="form-control squared-pill" id="authorImage" (change)="onFileChange($event, 'authorImage')">

<img ng-if="technicalAbstract.Author_ImagePath" src="{{ 'https://api-test2.salesgenx.in/Content/Uploads/' + technicalAbstract.Author_ImagePath.split('\\').pop() }}" class="rounded-circle avatar-xl" />
                          
                    </div>
                    
                    <div>
                        <label for="authorName" class="form-label">Author Name</label>
                        <input type="text" class="form-control rounded-pill" id="authorName" placeholder="Enter Author Name" ng-model="technicalAbstract.Author_Name" name="authorName">
                    </div>

                    <div>
                        <label for="authorDescription" class="form-label">Author Description</label>
                        <input type="text" class="form-control rounded-pill" id="authorDescription" placeholder="Enter Author Description" ng-model="technicalAbstract.Author_Description" name="authorDescription">
                    </div>

                    <div>
                        <label for="abstractParagraph" class="form-label">Abstract Paragraph</label>
                        <textarea class="form-control squared-pill" id="abstractParagraph" placeholder="Enter Abstract Paragraph" ng-model="technicalAbstract.Abstract_Paragraph" name="abstractParagraph"></textarea>
                    </div>

                </div>
                <div class="text-end">
                    <button type="button" class="btn btn-success btn-label right ms-auto" id="addNewContact" onclick="updateTechnicalAbstract()">
                        <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Update
                    </button>
                </div>
                <div id="errorContainerr" class="alert alert-danger w-100 mt-3" style="display: none;">
                    <p id="errorMessagee" class="text-danger mt-2"></p>
                </div>

            </form>

            <script>
                function updateTechnicalAbstract() {
                    var errorMessagee = document.getElementById("errorMessagee");
                    var errorContainerr = document.getElementById("errorContainerr");

                    // Clear previous error message
                    errorMessagee.innerText = "";
                    errorContainerr.style.display = "none";

                    var id = document.getElementById("abstractId").value.trim();
                    var name = document.getElementById("heading").value.trim();
                    var authorName = document.getElementById("authorName").value.trim();
                    var authorDesc = document.getElementById("authorDescription").value.trim();
                    var abstractPara = document.getElementById("abstractParagraph").value.trim();
                    var abstractImageInput = document.getElementById("abstractImage");
                    var authorImageInput = document.getElementById("authorImage");

                    var abstractImageFile = abstractImageInput.files[0];
                    var authorImageFile = authorImageInput.files[0];

                    // 50 KB Size Check Function
                    const isFileSizeValid = (file) => file && (file.size / 1024) <= 50;

                    // Field Validations
                    if (name === "") {
                        errorMessagee.innerText = "Please enter the Technical Abstract Name.";
                    } else if (authorName === "") {
                        errorMessagee.innerText = "Please enter the Author Name.";
                    } else if (authorDesc === "") {
                        errorMessagee.innerText = "Please enter the Author Description.";
                    } else if (abstractPara === "") {
                        errorMessagee.innerText = "Please enter the Abstract Paragraph.";
                    } else if (abstractImageFile && !isFileSizeValid(abstractImageFile)) {
                        errorMessagee.innerText = "Abstract Image should be less than 50 KB.";
                    } else if (authorImageFile && !isFileSizeValid(authorImageFile)) {
                        errorMessagee.innerText = "Author Image should be less than 50 KB.";
                    } else {
                        var formdata = new FormData();
                        formdata.append("Id", id);
                        formdata.append("Name", name);
                        formdata.append("Author_Name", authorName);
                        formdata.append("Author_Description", authorDesc);
                        formdata.append("Abstract_Paragraph", abstractPara);

                        if (abstractImageFile) formdata.append("abstractImage", abstractImageFile);
                        if (authorImageFile) formdata.append("authorImage", authorImageFile);

                        $.ajax({
                            url: "https://api-test2.salesgenx.in/TechnicalAbstract/UpdateTechnicalAbstract",
                            type: "POST",
                            data: formdata,
                            contentType: false,
                            processData: false,
                            success: function (response) {
                                Swal.fire({
                                    title: "Updated Successfully",
                                    text: "Done",
                                    icon: "success",
                                    timer: 1500,
                                }).then(() => {
                                    window.location.reload();
                                });
                            },
                            error: function (error) {
                                Swal.fire({
                                    title: "Error Occurred While Updating",
                                    text: "Something went wrong",
                                    icon: "error"
                                });
                            }
                        });

                        return true;
                    }

                    errorContainerr.style.display = "block"; // Show error container
                    return false;
                }
            </script>

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
                    <h4 class="mb-sm-0">Add Technical Abstract</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                            <li class="breadcrumb-item active">Technical Abstract</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <!-- end page title -->

 
      <div class="row">
    <div class="col-lg-12">
        <div class="card">
            <form id="technicalAbstractForm" enctype="multipart/form-data" class="card">
                <div class="card-body">
                    <div class="row gy-4">

                        <!-- Technical Abstract Name -->
                        <div class="col-xxl-12 col-md-12">
                            <label for="Name" class="form-label">Technical Abstract</label>
                            <input type="text" class="form-control rounded-pill" id="Name" name="Name" placeholder="Enter Technical Abstract Name">
                        </div>

                        <!-- Abstract Image Upload -->
                        <div class="col-xxl-6 col-md-6">
                            <label for="AbstractImage" class="form-label">Abstract Image</label>
                            <p class="text-format">Upload Image <code>jpg, jpeg, png</code> Format Only.</p>
                            <input type="file" class="form-control rounded-pill" id="AbstractImage" name="AbstractImage" accept="image/*">
                        </div>

                        <!-- Author Image Upload -->
                        <div class="col-xxl-6 col-md-6">
                            <label for="AuthorImage" class="form-label">Author Image</label>
                            <p class="text-format">Upload Image <code>jpg, jpeg, png</code> Format Only.</p>
                            <input type="file" class="form-control rounded-pill" id="AuthorImage" name="AuthorImage" accept="image/*">
                        </div>

                        <!-- Author Name -->
                        <div class="col-xxl-12 col-md-12">
                            <label for="AuthorName" class="form-label">Author Name</label>
                            <input type="text" class="form-control rounded-pill" id="AuthorName" name="Author_Name" placeholder="Enter Author Name">
                        </div>

                        <!-- Author Description -->
                        <div class="col-xxl-12 col-md-12">
                            <label for="AuthorDescription" class="form-label">Author Description</label>
                            <input type="text" class="form-control rounded-pill" id="AuthorDescription" name="Author_Description" placeholder="Enter Author Description">
                        </div>

                        <!-- Author Paragraph -->
                        <div class="col-xxl-12 col-md-12">
                            <label for="AbstractParagraph" class="form-label">Author Paragraph</label>
                            <textarea class="form-control squared-pill" id="AbstractParagraph" name="Abstract_Paragraph" placeholder="Enter Author Paragraph"></textarea>
                        </div>

                        <!-- Submit Button -->
                        <div class="col-xxl-6 col-md-6">
                            <button type="button" class="btn btn-success btn-label right ms-auto" onclick="validateForm()">
                                <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Submit
                            </button>
                        </div>

                        <!-- Error Message (Shows One at a Time) -->
                        <div id="errorContainer" class="alert alert-danger w-100 mt-3" style="display: none;">
                            <p id="errorMessage" class="text-danger mt-2"></p>
                        </div>


                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function validateForm() {
        let name = document.getElementById("Name").value.trim();
        let authorName = document.getElementById("AuthorName").value.trim();
        let authorDesc = document.getElementById("AuthorDescription").value.trim();
        let abstractPara = document.getElementById("AbstractParagraph").value.trim();
        let abstractImageInput = document.getElementById("AbstractImage");
        let authorImageInput = document.getElementById("AuthorImage");

        let abstractImage = abstractImageInput.files[0];
        let authorImage = authorImageInput.files[0];

        let errorMessage = document.getElementById("errorMessage");
        let errorContainer = document.getElementById("errorContainer");

        // Reset previous error message and hide container
        errorMessage.innerText = "";
        errorContainer.style.display = "none";

        // 50 KB Size Check Function
        const isFileSizeValid = (file) => file && (file.size / 1024) <= 50;

        // Field Validations
        if (name === "") {
            errorMessage.innerText = "Please enter the Technical Abstract Name.";
        } else if (!abstractImage) {
            errorMessage.innerText = "Please upload an Abstract Image.";
        } else if (!isFileSizeValid(abstractImage)) {
            errorMessage.innerText = "Abstract Image should be less than 50 KB.";
        } else if (!authorImage) {
            errorMessage.innerText = "Please upload an Author Image.";
        } else if (!isFileSizeValid(authorImage)) {
            errorMessage.innerText = "Author Image should be less than 50 KB.";
        } else if (authorName === "") {
            errorMessage.innerText = "Please enter the Author Name.";
        } else if (authorDesc === "") {
            errorMessage.innerText = "Please enter the Author Description.";
        } else if (abstractPara === "") {
            errorMessage.innerText = "Please enter the Abstract Paragraph.";
        } else {
            submitForm(); // Call submit
            return true;
        }

        errorContainer.style.display = "block"; // Show error container
        return false;
    }

    function submitForm() {
        var formData = new FormData(document.getElementById("technicalAbstractForm"));

        $.ajax({
            url: "https://api-test2.salesgenx.in/TechnicalAbstract/AddTechnicalAbstract", // ✅ Correct API URL
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (response) {
                Swal.fire({
                    title: "Technical Abstract Added Successfully",
                    text: "You clicked the button!",
                    icon: "success"
                }).then(() => {
                    window.location.reload(); // Reload after success
                });
            },
            error: function (error) {
                alert("Error: " + error.responseText);
            }
        });
    }
</script>



</div>


<!-- Table Section -->
<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header d-flex align-items-center">
                <h4 class="card-title mb-0 flex-grow-1">Technical Abstract Details</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped align-middle">
                        <thead class="table-success">
                            <tr>
                                <th class="d-none">ID</th>
                                <th>Name</th>
                                <th>Abstract Image</th>
                                <th>Author Image</th>
                                <th>Author Name</th>
                                <th>Author Description</th>
                                <th>Abstract Paragraph</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="abstract in technicalAbstracts">
                                <td class="d-none">{{ abstract.Id }}</td>
                                <td>{{ abstract.Name }}</td>
                                <td>
                                    <img ng-if="abstract.Absract_ImagePath" ng-src="{{ 'https://api-test2.salesgenx.in/Content/Uploads/' + abstract.Absract_ImagePath.split('\\').pop() }}" alt="Abstract Image" class="rounded me-1" style="width: 50px; height: 50px; object-fit: cover;">
                                    <span ng-if="!abstract.Absract_ImagePath" class="text-muted">No Image</span>
                                </td>
                                <td>
                                    <img ng-if="abstract.Author_ImagePath" ng-src="{{ 'https://api-test2.salesgenx.in/Content/Uploads/' + abstract.Author_ImagePath.split('\\').pop() }}" alt="Author Image" class="rounded me-1" style="width: 50px; height: 50px; object-fit: cover;">
                                    <span ng-if="!abstract.Author_ImagePath" class="text-muted">No Image</span>
                                </td>
                                <td>{{ abstract.Author_Name }}</td>
                                <td>{{ abstract.Author_Description }}</td>
                                <td>{{ abstract.Abstract_Paragraph }}</td>
                                <td class="text-center">
                                   <a href="#editAbstractModal" data-bs-toggle="modal" 
                                    ng-click="editTechnicalAbstract(abstract)" 
                                    class="link-success fs-20 me-2" title="Edit">
                                        <i class="ri-edit-2-line"></i>
                                   </a>

                                    <a href="#" ng-click="deleteTechnicalAbstract($event, abstract)" class="link-danger fs-20" title="Delete">
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
</asp:Content>