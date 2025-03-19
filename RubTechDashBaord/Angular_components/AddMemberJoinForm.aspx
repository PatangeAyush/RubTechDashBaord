<%@ Page Title="" Language="C#" MasterPageFile="~/Mrai.Master" AutoEventWireup="true" CodeBehind="AddMemberJoinForm.aspx.cs" Inherits="MraiDashboard.AddMemberJoinForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="angular_scripts/DashboardController/AddNewMembership.js"></script>   
    <link href="plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <script src="plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    <link href="css/my-style.css" rel="stylesheet" />
    <script src="angular_scripts/DashboardController/CountryStateCity.js"></script>
    <link href="css/form-popup.css" rel="stylesheet" />
    <script src="js/checboxbootstrap.min.js"></script>
    <script src="js/form-popup.js"></script>
      <script>
          function India(selected) {
            if (selected) {
                document.getElementById("Foreign1").style.display = "";
            }
            else {
                document.getElementById("Foreign1").style.display = "none";
            }

        }
    </script>

    <script>
        function Foreign(selected) {
            if (selected) {
                document.getElementById("Foreign1").style.display = "none";
            }
            else {
                document.getElementById("Foreign1").style.display = "";
            }

        }
    </script>
    <script type="text/javascript">
        $(function () {
            $("#datepicker").datepicker({
                autoclose: true,
                todayHighlight: true
            }).datepicker();

            $("#datepickerExpiry").datepicker({
                autoclose: true,
                todayHighlight: true
            }).datepicker();
            $("#datepickerStar").datepicker({
                autoclose: true,
                todayHighlight: true
            }).datepicker();
            $("#Receivedate").datepicker({
                autoclose: true,
                todayHighlight: true
            }).datepicker();
            $("#Joindate").datepicker({
                autoclose: true,
                todayHighlight: true
            }).datepicker();
            $("#txtfirstrenewal").datepicker({
                autoclose: true,
                todayHighlight: true
            }).datepicker();

            $("#txtMembershipValidity").datepicker({
                autoclose: true,
                todayHighlight: true
            }).datepicker();

            $("#ConferenceDate").datepicker({
                autoclose: true,
                todayHighlight: true
            }).datepicker();

            $("#txtConfirmationMailDate").datepicker({
                autoclose: true,
                todayHighlight: true
            }).datepicker();




        });




        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        function ValidateAlpha(evt) {
            var keyCode = (evt.which) ? evt.which : evt.keyCode
            if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32)

                return false;
            return true;
        }





    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ng-controller="rootController">
    <div ng-controller="JoinMraiController" ng-init="init()">

        <div class="content-page">

            <div class="content" id="DirectorHead">

                <div class="edit-btn text-left">
                    <button class="btn open-form btn-primary" id="btn-id1" ng-click="AboutHeader()"><i class="fas fa-edit"></i></button>
                    <div class="notes-on-page">
                        (
                                            <strong>Note* : - </strong>

                        <small>Image Dimension Should be with in - <span class="color_blue">width : 1920px, height : 200px </span></small>)
                    </div>
                </div>
                <div class="breadcrumb-area breadcrumb-area-bg section-space--inner--80 bg-img" style="background-image: url('{{DataLink}}HeaderImg/{{SelectHeaderData[0].Image}}')">
                    <div class="container">

                        <div class="row align-items-center">
                            <div class="col-sm-6">
                                <h2 class="breadcrumb-page-title">{{SelectHeaderData[0].HeadName}}</h2>
                            </div>
                            <div class="col-sm-6">
                                <ul class="breadcrumb-page-list text-uppercase">
                                    <li class="has-children"><a href="../index.html">Home</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="container-fluid">

                    <div class="featured-project-area bg-img section-space--inner--top--120-r section-space--inner--bottom--0">
                        <!--====================  page content area ====================-->
                        <div class="page-content-area">
                            <div class="bg-light-gray">

                                <div class="page-title-box">
                                    <div class="row align-items-center">
                                        <div class="col-sm-6">
                                            <h4 class="page-title all-title-style-left title-subittl-style">Add New Members</h4>

                                        </div>
                                    </div>
                                    <!-- end row -->
                                </div>
                                <div class="row">

                                    <div class="col-xl-12 p-0">
                                        <div class="m-b-30">
                                            <div class="card-body">

                                                <!-- Nav tabs -->
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link active" data-toggle="tab" id="btndashboad" href="#home" role="tab">
                                                            <span class="d-none d-md-block">Company - <span class="steps-section">Step 01</span></span><span class="d-block d-md-none"><i class="mdi mdi-home-variant h5"></i></span>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" data-toggle="tab" id="btnorders" href="#profile" role="tab">
                                                            <span class="d-none d-md-block">Contacts  - <span class="steps-section">Step 02</span></span><span class="d-block d-md-none"><i class="mdi mdi-account h5"></i></span>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" data-toggle="tab" id="btndownload" href="#messages" role="tab">
                                                            <span class="d-none d-md-block">Activities  - <span class="steps-section">Step 03</span></span><span class="d-block d-md-none"><i class="mdi mdi-email h5"></i></span>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" data-toggle="tab" id="btnpayment-method" href="#settings" role="tab">
                                                            <span class="d-none d-md-block">Sectors  - <span class="steps-section">Step 04</span></span><span class="d-block d-md-none"><i class="mdi mdi-settings h5"></i></span>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" data-toggle="tab" id="btnaccount-info" href="#settings-2" role="tab">
                                                            <span class="d-none d-md-block">Fees -  <span class="steps-section">Step 05</span></span><span class="d-block d-md-none"><i class="mdi mdi-settings h5"></i></span>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" data-toggle="tab" id="btndocument-info" href="#document" role="tab">
                                                            <span class="d-none d-md-block">Documents: -  <span class="steps-section">Step 06</span></span><span class="d-block d-md-none"><i class="mdi mdi-settings h5"></i></span>
                                                        </a>
                                                    </li>

                                                </ul>

                                                <!-- Tab panes -->
                                                <div class="card tab-content">
                                                    <div class="tab-pane active p-3" id="home" role="tabpanel">
                                                        <div class="myaccount-content">
                                                            <h3>Company Information :</h3>
                                                            <ul class="feature-list section-space--bottom--40 my-metal-ul">
                                                                <li>Before filling in this form, you should be aware that you must provide the following information so that your application can be processed </li>
                                                                <li>We agree to abide by the Memorandum and Rules &amp; Regulations of the Association as framed from time to time.</li>
                                                            </ul>
                                                            <br />
                                                            <div class="account-details-form">
                                                                <div class="row">
                                                                    <div class="col-sm-6">
                                                                        <div class="mb-2-">
                                                                            <label>Company <span class="color_red asterik">*</span></label>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-lg-6 col-12">
                                                                                <div class="inline-div-radio">
                                                                                    <input id="India" type="radio" name="Country" value="Indian" class="input-radio" onclick="India(this.checked);">
                                                                                    <label class="radio-label">Indian </label>
                                                                                </div>
                                                                                <div class="inline-div-radio">
                                                                                    <input id="Foreign" type="radio" name="Country" value="Foreign" class="input-radio" onclick="Foreign(this.checked);">
                                                                                    <label class="radio-label">Foreign</label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="mb-2-">
                                                                            <label>Name of Company/Association<span class="color_red asterik">*</span></label>
                                                                        </div>
                                                                        <div>
                                                                            <input id="txtCompany" name="txtCompany" autocomplete="off" placeholder="Name of Company/Association:" type="text" class="form-control" />
                                                                            <span id="spnFirstName"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12 mb-2-">
                                                                        <label>Name of parent company or Primary Contact Company (When Applicable) </label>
                                                                    </div>
                                                                    <div class="col-sm-12">
                                                                        <input id="txtPrimaryContact" autocomplete="off" placeholder="Name of parent company or Primary Contact Company" type="text" class="form-control" />
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 mb-2-">
                                                                        <label>Postal Address <span class="color_red asterik">*</span></label>
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <select id="txtcountry" name="txtcountry" ng-model="txtcountry" ng-change="Feeschange()" class="field select medium" tabindex="11">
                                                                            <option selected="selected">Select Country</option>
                                                                        </select>

                                                                    </div>
                                                                    <div class="col-lg-4 col-12" id="Foreign1" style="display:none;">

                                                                        <select id="txtState" name="txtState" class="field select medium" tabindex="11">
                                                                            <option selected="selected">Select State</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <select id="txtCity" name="txtCity" class="field select medium" tabindex="11">
                                                                            <option selected="selected">Select City</option>
                                                                        </select>

                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <input id="txtaddress1" autocomplete="off" placeholder="Street Address 1" type="text" class="form-control" />
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <input id="txtaddress2" autocomplete="off" placeholder="Street Address 2" type="text" class="form-control" />
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <input id="txtpincode" autocomplete="off" placeholder="Postal/Zip code/P.O. Box" onkeypress="return isNumberKey(event)" maxlength="6" type="text" class="form-control" />
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <select id="ddlZone" name="ddlZone" class="field select medium" tabindex="11">
                                                                            <option selected="selected" disabled value="">Select Zone</option>
                                                                            <option value="Central">Central</option>
                                                                            <option value="East">East</option>
                                                                            <option value="Foreign">Foreign</option>
                                                                            <option value="North">North</option>
                                                                            <option value="South">South</option>
                                                                            <option value="West">West</option>

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-10 mb-2-">
                                                                        <label>Date of Incorporation <span class="color_red asterik">*</span></label>
                                                                    </div>
                                                                    <div id="datepicker" class="col-lg-10 col-12 input-group date" data-date-format="yyyy-mm-dd">
                                                                        <input class="form-control" type="text" id="txtDate" readonly autocomplete="off" name="txtDate" ng-model="txtDate" onkeypress="return isNumberKey(event)" placeholder="Date of Incorporation" />
                                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                                    </div>

                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12 mb-2-">
                                                                        <label>Telephone 1 Number <span class="color_red asterik">*</span></label>
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <input id="txtCountryCode" autocomplete="off" placeholder="Country Code" onkeypress="return isNumberKey(event)" maxlength="3" type="text" class="form-control" />
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <input id="txtcityCode" autocomplete="off" placeholder="City Code" onkeypress="return isNumberKey(event)" maxlength="4" type="text" class="form-control" />
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <input id="txtphone" autocomplete="off" onkeypress="return isNumberKey(event)" maxlength="10" placeholder=" Phone No." type="text" class="form-control" />
                                                                    </div>
                                                                    <div class="col-12 mb-2-">
                                                                        <label>Telephone 2 Number <span class="color_red asterik"></span></label>
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <input id="txtCountryCode1" autocomplete="off" placeholder="Country Code" onkeypress="return isNumberKey(event)" maxlength="3" type="text" class="form-control" />
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <input id="txtcityCode1" autocomplete="off" placeholder="City Code" onkeypress="return isNumberKey(event)" maxlength="4" type="text" class="form-control" />
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <input id="txtphone1" autocomplete="off" onkeypress="return isNumberKey(event)" maxlength="10" placeholder=" Phone No." type="text" class="form-control" />
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12 mb-2-">
                                                                        <label>Fax Number </label>
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <input id="faxCountryCode" autocomplete="off" placeholder="Country Code" maxlength="3" type="text" class="form-control" />
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <input id="faxcitycode" autocomplete="off" placeholder="City Code" maxlength="4" type="text" class="form-control" />
                                                                    </div>
                                                                    <div class="col-lg-4 col-12">
                                                                        <input id="faxphone" autocomplete="off" placeholder="Fax Number" type="text" class="form-control" />
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-sm-6">
                                                                        <div class="mb-2-">
                                                                            <label>Website Address (if any)</label>
                                                                        </div>
                                                                        <div class="">
                                                                            <input id="txtwebsite" autocomplete="off" placeholder="Website Address" type="text" class="form-control" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="mb-2-">
                                                                            <label>Nature of the Firm/Association <span class="color_blue asterik">(Limited/Partnership/Proprietary)</span></label>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-lg-12 col-12">
                                                                                <input id="txtfirm" type="text" autocomplete="off" placeholder="Limited/Partnership/Proprietary" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row" ng-if="txtcountry==='101'">
                                                                    <div class="col-sm-6">
                                                                        <div class="mb-2">
                                                                            <h4>PAN Card Number<span class="color_red asterik">*</span> <span class="color_blue asterik">(Only For Indian Member)</span></h4>
                                                                        </div>
                                                                        <div class="">
                                                                            <input id="txtpancard" placeholder="PAN Card Number" ng-model="txtpancard" autocomplete="off" type="text" class="form-control">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="mb-2">
                                                                            <h4>GST Number <span class="color_red asterik">*</span> <span class="color_blue asterik">(Only For Indian Member)</span></h4>
                                                                        </div>
                                                                        <div class="">
                                                                            <input id="txtgst" placeholder="GST Number" ng-model="txtgst" autocomplete="off" type="text" class="form-control">
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-12 mb-2"><span class="tab-field-error">Input Field Not Empty</span> </div>
                                                                </div>
                                                                <!--<label id="divmsg"></label>-->
                                                                <div class="row">
                                                                    <div class="col-sm-12">
                                                                        <button class="btn btn-sm animated-button thar-three" id="txtStep2">Proceed to Step 2</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane p-3" id="profile" role="tabpanel">
                                                        <div class="myaccount-content">
                                                            <h3>Contacts - <small class="text-black-50">Main Contact (for mail, invoices, etc.) </small>:</h3>
                                                            <div class="account-details-form">
                                                                <div class="row">
                                                                    <div class="col-sm-3">
                                                                        <label>Gender <span class="color_red asterik">*</span></label>
                                                                        <div class="row">
                                                                            <div class="col-lg-12">
                                                                                <select id="ddlgender" name="ddlgender" class="field select medium" tabindex="11">
                                                                                    <option selected="selected" value="Mr. / Ms.">Mr. / Ms.</option>
                                                                                    <option value="Mr.">Mr.</option>
                                                                                    <option value="Ms.">Ms.</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-9">
                                                                        <label>Full Name <span class="color_red asterik">*</span></label>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-12">
                                                                                <input id="txtFirstname" placeholder="First Name" autocomplete="off" type="text" class="form-control" />
                                                                            </div>
                                                                            <div class="col-lg-4 col-12">
                                                                                <input id="txtmiddlename" placeholder="Middle Name" autocomplete="off" type="text" class="form-control" />
                                                                            </div>
                                                                            <div class="col-lg-4 col-12">
                                                                                <input id="txtlastname" placeholder="Last Name" autocomplete="off" type="text" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-6 col-12">

                                                                        <label>Designation <span class="color_red asterik">*</span></label>

                                                                        <input id="designation" placeholder="Designation" autocomplete="off" type="text" class="form-control" />


                                                                    </div>
                                                                    <div class="col-lg-6 col-12">
                                                                        <label>Mobile Number <span class="color_red asterik">*</span></label>
                                                                        <div class="row">
                                                                            <div class="col-lg-2 col-12 pd-right0">
                                                                                <input id="countrycode" placeholder="+91" type="text" onkeypress="return isNumberKey(event)" maxlength="4" autocomplete="off" class="form-control" />
                                                                            </div>
                                                                            <div class="col-lg-10 col-12">
                                                                                <input id="mobilenumber" onkeypress="return isNumberKey(event)" maxlength="12" placeholder="Mobile Number" autocomplete="off" type="text" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-sm-4">
                                                                        <div class="row">
                                                                            <div class="col-12">
                                                                                <label>Email Address <span class="color_red asterik">*</span></label>
                                                                            </div>
                                                                            <div class="col-12">
                                                                                <input id="txtemailid" placeholder="Email Address" autocomplete="off" type="email" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-4">
                                                                        <div class="row">
                                                                            <div class="col-12">
                                                                                <label>Member Password<span class="color_red asterik"></span></label>
                                                                            </div>
                                                                            <div class="col-12">
                                                                                <div class="row">
                                                                                    <div class="col-sm-12">
                                                                                        <input id="txtPassword" placeholder="Enter Password" autocomplete="off" type="text" class="form-control" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                
                                                                    <div class="col-sm-4">
                                                                        <div class="row">
                                                                            <div class="col-12">
                                                                                <label>Secondary Contact Details<span class="color_red asterik"></span></label>
                                                                            </div>
                                                                            <div class="col-12">
                                                                                <div class="row">
                                                                                    <div class="col-sm-12">
                                                                                        <input id="displayname" placeholder="Name, Email ID &amp; Contact No." autocomplete="off" type="text" class="form-control" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-4">
                                                                        <div class="row">
                                                                            <div class="col-12">
                                                                                <label>Membership Number<span class="color_red asterik"></span></label>
                                                                            </div>
                                                                            <div class="col-12">
                                                                                <div class="row">
                                                                                    <div class="col-sm-12">
                                                                                        <input id="MembershipNo" placeholder="Membership No." autocomplete="off" type="text" class="form-control" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <label>Membership Start  Date <span class="color_red asterik">*</span></label>
                                                                        <div id="datepickerStar" class="input-group date" data-date-format="yyyy-mm-dd">
                                                                            <input class="form-control" type="text" id="txtStartDate" name="txtStartDate" ng-model="txtStartDate" readonly placeholder="Start Date" />
                                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <label>Membership Expiry  Date <span class="color_red asterik">*</span> </label>
                                                                        <div id="datepickerExpiry" class="input-group date" data-date-format="yyyy-mm-dd">
                                                                            <input class="form-control" type="text" id="txtEndDate" name="txtEndDate" ng-model="txtEndDate" readonly placeholder="End Date" />
                                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-12 mb-2"><span class="tab-field-error">Input Field Not Empty</span></div>
                                                                    <div class="col-12">

                                                                        <button class="btn btn-sm animated-button thar-three" id="txtBackStep1">Back to Step 1</button>
                                                                        <button class="btn btn-sm animated-button thar-three" id="txtStep3">Proceed to Step 3</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane p-3" id="messages" role="tabpanel">
                                                        <div class="myaccount-content">
                                                            <h3>Activities :</h3>
                                                            <div class="row">
                                                                <div class="col-sm-12 services-heading">
                                                                    <h1 class="all-title-style-left title-subittl-style">Primary Business  : <span class="color_red asterik">*</span></h1>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <ul class="feature-list section-space--bottom--40 my-metal-ul">
                                                                    <li><b class="font-bold">We are active in the following fields </b></li>
                                                                    <li>Please tick any one appropriate box for <b class="font-bold">Main/Core </b>Business </li>
                                                                </ul>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-12 services-heading">
                                                                    <h1 class="all-title-style-left title-subittl-style">Commodity Divisions :</h1>
                                                                </div>
                                                            </div>
                                                            <div class="account-details-form">
                                                                <div class="row">
                                                                    <div class="col-lg-5 col-12">
                                                                        <div class="identity-wrapper has-border-left">
                                                                            <label for="email" class="m-0">
                                                                                <h3 class="name sub-heading-title mb-0">Ferrous Scrap :</h3>
                                                                            </label>
                                                                            <%--  <a href="#FerrousScrap" class="float-left" data-toggle="collapse">--%>
                                                                            <input id="Ferrous" type="radio" name="Ferrous1" value="FerrousScrap" data-target="#FerrousScrap" class="input-checkbox" data-toggle="collapse" />
                                                                            <%--</a>--%>
                                                                        </div>




                                                                        <div class="commodity-sub-category collapse radio-collapse" style="padding-left: 12px;" id="FerrousScrap">
                                                                            <div class="section-space--bottom--30">
                                                                                <label for="email">Iron and Steel Scrap </label>
                                                                                <input type="checkbox" name="FerrousScrap" value="Iron and Steel Scrap" class="input-checkbox"/>
                                                                                <br/>
                                                                                <label for="email">Alloyed Scrap </label>
                                                                                <input type="checkbox" name="FerrousScrap" value="Alloyed Scrap" class="input-checkbox"/>
                                                                                <br/>
                                                                                <label for="email">Shredded Scrap </label>
                                                                                <input type="checkbox" name="FerrousScrap" value="Shredded Scrap" class="input-checkbox"/>
                                                                                <br/>
                                                                                <label for="email">Shredder Scrap </label>
                                                                                <input type="checkbox" name="FerrousScrap" value="Shredder Scrap" class="input-checkbox"/>
                                                                                <br/>
                                                                                <label for="email">Heavy Media plant </label>
                                                                                <input type="checkbox" name="FerrousScrap" value="Heavy Media plant" class="input-checkbox"/>
                                                                                <br/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-7 col-12">

                                                                        <div class="identity-wrapper has-border-left">
                                                                            <label for="email" class="m-0">
                                                                                <h3 class="name sub-heading-title mb-0">Non-Ferrous Scrap :</h3>
                                                                            </label>
                                                                            <%--  <a href="#NonFerrousScrap" class="float-left" data-toggle="collapse">--%>
                                                                            <input id="NonFerrous" type="radio" name="Ferrous1" value="NonFerrousScrap" class="input-checkbox" data-target="#NonFerrousScrap" data-toggle="collapse" />
                                                                            <%--   </a>--%>
                                                                        </div>
                                                                        <div class="commodity-sub-category collapse radio-collapse" style="padding-left: 12px;" id="NonFerrousScrap">
                                                                            <div class="section-space--bottom--30">
                                                                                <div class="row">
                                                                                    <div class="col-lg-6 col-12">
                                                                                        <label for="email">Copper</label>
                                                                                        <input type="checkbox" value="Copper" name="NonFerrousScrap" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Brass/Bronze </label>
                                                                                        <input type="checkbox" value="Brass/Bronze" name="NonFerrousScrap" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Aluminium </label>
                                                                                        <input type="checkbox" value="Aluminium" name="NonFerrousScrap" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Lead</label>
                                                                                        <input type="checkbox" value="Lead" name="NonFerrousScrap" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Zinc</label>
                                                                                        <input type="checkbox" value="Zinc" name="NonFerrousScrap" class="input-checkbox">
                                                                                        <br>
                                                                                    </div>
                                                                                    <div class="col-lg-6 col-12">
                                                                                        <label for="email">Tin </label>
                                                                                        <input type="checkbox" value="Tin" name="NonFerrousScrap" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Magnesium </label>
                                                                                        <input type="checkbox" value="Magnesium" name="NonFerrousScrap" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Special Alloys</label>
                                                                                        <input type="checkbox" value="Special Alloys" name="NonFerrousScrap" class="input-checkbox">
                                                                                        <br>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-5 col-12">
                                                                        <div class="identity-wrapper has-border-left">
                                                                            <label for="email" class="m-0">
                                                                                <h3 class="name sub-heading-title mb-0">Stainless Steel and Special Alloys :</h3>
                                                                            </label>
                                                                            <%--<a href="#StainlessSteelandSpecialAlloys" class="float-left" data-toggle="collapse">--%>
                                                                            <input id="StainlessSteel" type="radio" name="Ferrous1" value="StainlessSteelandSpecialAlloys" class="input-checkbox" data-target="#StainlessSteelandSpecialAlloys" data-toggle="collapse">
                                                                            <%--  </a>--%>
                                                                        </div>
                                                                        <div class="commodity-sub-category collapse radio-collapse" style="padding-left: 12px;" id="StainlessSteelandSpecialAlloys">

                                                                            <div class="section-space--bottom--30">
                                                                                <label for="email">Nickel and nickel alloys</label>
                                                                                <input type="checkbox" name="StainlessSteelandSpecialAlloys" value="Nickel and nickel alloys" class="input-checkbox">
                                                                                <br>
                                                                                <label for="email">Cobalt </label>
                                                                                <input type="checkbox" name="StainlessSteelandSpecialAlloys" value="Cobalt" class="input-checkbox">
                                                                                <br>
                                                                                <label for="email">High temperature </label>
                                                                                <input type="checkbox" name="StainlessSteelandSpecialAlloys" value="High temperature" id="High temperature1" class="input-checkbox">
                                                                                <br>
                                                                                <label for="email">Titanium </label>
                                                                                <input type="checkbox" name="StainlessSteelandSpecialAlloys" value="Titanium" id="Titanium1" class="input-checkbox">
                                                                                <br>
                                                                                <label for="email">High Speed Steel </label>
                                                                                <input type="checkbox" name="StainlessSteelandSpecialAlloys" value="High Speed Steel" id="High Speed Steel1" class="input-checkbox">
                                                                                <br>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-7 col-12">
                                                                        <div class="identity-wrapper has-border-left">
                                                                            <label for="email" class="m-0">
                                                                                <h3 class="name sub-heading-title mb-0">Paper :</h3>
                                                                            </label>
                                                                           <%-- <a href="#Paper" class="float-left" >--%>
                                                                                <input id="Papers" type="radio" name="Ferrous1" value="Paper" class="input-checkbox" data-toggle="collapse" data-target="#Paper">
                                                                            <%--</a>--%>
                                                                        </div>

                                                                        <div class="commodity-sub-category collapse radio-collapse" style="padding-left: 12px;" id="Paper">
                                                                            <div class="section-space--bottom--30">
                                                                                <div class="row">
                                                                                    <div class="col-lg-6 col-12">
                                                                                        <label for="email">Mixed paper </label>
                                                                                        <input type="checkbox" name="Paper" value="Mixed paper" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Over-issue new</label>
                                                                                        <input type="checkbox" name="Paper" value="Over-issue new" id="Over-issue new" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Corrugated cardboard </label>
                                                                                        <input type="checkbox" name="Paper" value="Corrugated cardboard" id="Corrugated cardboard" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Pulp substitutes</label>
                                                                                        <input type="checkbox" name="Paper" value="Pulp substitutes" id="Pulp substitutes" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">De-inking grades(woodfree) </label>
                                                                                        <input type="checkbox" name="Paper" value="De-inking grades(woodfree)" id="De-inking grades(woodfree)" class="input-checkbox">
                                                                                        <br>
                                                                                    </div>
                                                                                    <div class="col-lg-6 col-12">
                                                                                        <label for="email">De-inking grades(mechanical) </label>
                                                                                        <input type="checkbox" name="Paper" value="De-inking grades(mechanical)" id="De-inking grades(mechanical)" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Special grades</label>
                                                                                        <input type="checkbox" name="Paper" value="Special grades" id="Special grades" class="input-checkbox">
                                                                                        <br>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-5 col-12">
                                                                        <div class="identity-wrapper has-border-left">
                                                                            <label for="email" class="m-0">
                                                                                <h3 class="name sub-heading-title mb-0">Textiles :</h3>
                                                                            </label>
                                                                          <%--  <a href="#Textiles" class="float-left" data-toggle="collapse">--%>
                                                                                <input id="Textile" type="radio" name="Ferrous1" value="Textiles" class="input-checkbox" data-toggle="collapse" data-target="#Textiles">
                                                                           <%-- </a>--%>
                                                                        </div>
                                                                        <div class="commodity-sub-category collapse radio-collapse" style="padding-left: 12px;" id="Textiles">
                                                                            <div class="section-space--bottom--30">
                                                                                <div class="row">
                                                                                    <div class="col-sm-12">
                                                                                        <label for="email">Original textiles from Collection (non graded)</label>
                                                                                        <input type="checkbox" name="Textiles" value="Original textiles from Collection (non graded)" id="Original textiles from Collection (non graded)" class="input-checkbox">
                                                                                        <br>
                                                                                    </div>
                                                                                    <div class="col-sm-6">
                                                                                        <label for="email">New Cuttings</label>
                                                                                        <input type="checkbox" name="Textiles" value="New Cuttings" id="New Cuttings" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Cotton </label>
                                                                                        <input type="checkbox" name="Textiles" value="Cotton" id="Cotton" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Wool</label>
                                                                                        <input type="checkbox" name="Textiles" value="Wool" id="Wool" class="input-checkbox">
                                                                                        <br>
                                                                                    </div>
                                                                                    <div class="col-sm-6">
                                                                                        <label for="email">Synthetics</label>
                                                                                        <input type="checkbox" name="Textiles" value="Synthetics" id="Synthetics" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Used Clothing </label>
                                                                                        <input type="checkbox" name="Textiles" value="Used Clothing" id="Used Clothing" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Wiping cloths </label>
                                                                                        <input type="checkbox" name="Textiles" value="Wiping cloths" id="Wiping cloths" class="input-checkbox">
                                                                                        <br>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-7 col-12">
                                                                        <div class="row">
                                                                            <div class="col-lg-6 col-12">
                                                                                <div class="identity-wrapper has-border-left">
                                                                                    <label for="email" class="m-0">
                                                                                        <h3 class="name sub-heading-title mb-0">Tyres/Rubbers :</h3>
                                                                                    </label>
                                                                                  <%--  <a href="#TyresRubbers" class="float-left" data-toggle="collapse">--%>
                                                                                        <input id="TyreandRubber" type="radio" name="Ferrous1" value="TyresRubbers" class="input-checkbox" data-toggle="collapse" data-target="#TyresRubbers" >
                                                                                 <%--   </a>--%>
                                                                                </div>
                                                                                <div class="commodity-sub-category collapse radio-collapse" style="padding-left: 12px;" id="TyresRubbers">

                                                                                    <div class="section-space--bottom--30">
                                                                                        <label for="email">Re-use </label>
                                                                                        <input type="checkbox" name="TyresRubbers" value="Re-use" id="Re-use" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Re-trading </label>
                                                                                        <input type="checkbox" name="TyresRubbers" value="Re-trading" id="Re-trading" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Granulating </label>
                                                                                        <input type="checkbox" name="TyresRubbers" value="Granulating" id="Granulating" class="input-checkbox">
                                                                                        <br>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-6 col-12">

                                                                                <div class="identity-wrapper has-border-left">
                                                                                    <label for="email" class="m-0">
                                                                                        <h3 class="name sub-heading-title mb-0">Plastics :</h3>
                                                                                    </label>
                                                                                    <%--<a href="#Plastics" class="float-left" data-toggle="collapse">--%>
                                                                                        <input id="Plastic" type="radio" name="Ferrous1" value="Plastics" class="input-checkbox" data-toggle="collapse" data-target="#Plastics" >
                                                                                  <%--  </a>--%>
                                                                                </div>
                                                                                <div class="commodity-sub-category collapse radio-collapse" style="padding-left: 12px;" id="Plastics">

                                                                                    <div class="section-space--bottom--30">
                                                                                        <label for="email">Materials recycling </label>
                                                                                        <input type="checkbox" name="Plastics" value="Materials recycling" id="Materials recycling" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Energy recovery</label>
                                                                                        <input type="checkbox" name="Plastics" value="Energy recovery" id="Energy recovery" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Trader </label>
                                                                                        <input type="checkbox" name="Plastics" value="Trader" id="Trader3" class="input-checkbox">
                                                                                        <br>
                                                                                        <label for="email">Collector </label>
                                                                                        <input type="checkbox" name="Plastics" value="Collector" id="Collector" class="input-checkbox">
                                                                                        <br>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-5 col-12">
                                                                        <div class="section-space--bottom--30-">

                                                                            <div class="identity-wrapper has-border-left">
                                                                                <label for="email" class="m-0">
                                                                                    <h3 class="name sub-heading-title mb-0">Construction & Demolition Waste:</h3>
                                                                                </label>
                                                                                 <input id="Construction" type="radio" name="Ferrous1" value="Construction & Demolition Waste" class="input-checkbox">
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-7 col-12">
                                                                        <div class="row">
                                                                            <div class="col-lg-6 col-12">
                                                                                <div class="section-space--bottom--30-">

                                                                                    <div class="identity-wrapper has-border-left">
                                                                                        <label for="email" class="m-0">
                                                                                            <h3 class="name sub-heading-title mb-0">Electronic Waste:</h3>
                                                                                        </label>
                                                                                             <input id="Electronic" type="radio" name="Ferrous1" value="Electronic Waste" class="input-checkbox">
                                                                                    </div>

                                                                                </div>
                                                                            </div>


                                                                            <div class="col-lg-6 col-12">
                                                                                <div class="section-space--bottom--30-">
                                                                                    <div class="identity-wrapper has-border-left">
                                                                                        <label for="email" class="m-0">
                                                                                            <h3 class="name sub-heading-title mb-0">Recycled Glass:</h3>
                                                                                        </label>
                                                                                        <input id="Recycled" type="radio" name="Ferrous1" value="Recycled Glass" class="input-checkbox">
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-12 col-12">
                                                                        <div class="identity-wrapper has-border-left d-flex other-with-text">
                                                                            <!--<input type="text" name="Plastics" id="txtPlastics" class="others-ip m-0 ttl-ip-other" placeholder="Others" />-->
                                                                            <input value="Others" id="Others" type="radio" name="Ferrous1" class="input-checkbox">
                                                                            <label for="email" class="m-0">
                                                                                <h3 class="name sub-heading-title mb-0">Others</h3>
                                                                            </label>
                                                                            <!--<input type="checkbox" value="" name="Traderprocessor" class="input-checkbox" />-->
                                                                            <input type="text" name="txtother" id="txtotherPrimary" class="others-ip m-0 ttl-ip-other-" placeholder="Others">
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col-sm-12 services-heading">
                                                                    <h1 class="all-title-style-left title-subittl-style">Secondary Business : <span class="color_red asterik">*</span></h1>
                                                                </div>
                                                            </div>
                                                            <div class="account-details-form">
                                                                <div class="row">
                                    

                                                                        <div class="col-lg-5 col-12">
                                                                            <div class="section-space--bottom--30- chk-side-click">
                                                                                <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                    <label for="email" class="m-0">
                                                                                        <h3 class="name sub-heading-title mb-0">Ferrous Scrap :</h3>
                                                                                    </label>
                                                                                 <%--   <a  class="float-left" >--%>
                                                                                        <input type="checkbox" name="SecondaryComm" value="Ferrous Scrap" class="input-checkbox" data-target="#db_FerrousScrap" data-toggle="collapse" />
                                                                                 <%--   </a>--%>
                                                                                </div>
                                                                                <div class="commodity-sub-category collapse" style="padding-left: 12px;" id="db_FerrousScrap">
                                                                                    <label for="email">Iron and Steel Scrap </label>
                                                                                    <input type="checkbox" name="Ferrous12" value="Iron and Steel Scrap" id="Iron and Steel Scrap" class="input-checkbox">
                                                                                    <br>
                                                                                    <label for="email">Alloyed Scrap </label>
                                                                                    <input type="checkbox" name="Ferrous12" value="Alloyed Scrap" id="Alloyed Scrap" class="input-checkbox">
                                                                                    <br>
                                                                                    <label for="email">Shredded Scrap </label>
                                                                                    <input type="checkbox" name="Ferrous12" value="Shredded Scrap" id="Shredded Scrap" class="input-checkbox">
                                                                                    <br>
                                                                                    <label for="email">Shredder Scrap </label>
                                                                                    <input type="checkbox" name="Ferrous12" value="Shredder Scrap" id="Shredder Scrap" class="input-checkbox">
                                                                                    <br>
                                                                                    <label for="email">Heavy Media plant </label>
                                                                                    <input type="checkbox" name="Ferrous12" value="Heavy Media plant" id="Heavy Media plant" class="input-checkbox">
                                                                                    <br>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-7 col-12">
                                                                            <div class="section-space--bottom--30- chk-side-click">
                                                                                <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                    <label for="email" class="m-0">
                                                                                        <h3 class="name sub-heading-title mb-0">Non-Ferrous Scrap :</h3>
                                                                                    </label>
                                                                                <%--    <a  class="float-left">--%>
                                                                                        <input type="checkbox" name="SecondaryComm" value="Non-Ferrous Scrap" id="Non-Ferrous Scrap" class="input-checkbox" data-target="#db_NonFerrousScrap"  data-toggle="collapse" />
                                                                                  <%--  </a>--%>
                                                                                </div>
                                                                                <div class="commodity-sub-category collapse" style="padding-left: 12px;" id="db_NonFerrousScrap">
                                                                                    <div class="row">
                                                                                        <div class="col-lg-6 col-12">
                                                                                            <label for="email">Copper</label>
                                                                                            <input type="checkbox" value="Copper" id="Copper" name="NonFerrousMetals12" class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Brass/Bronze </label>
                                                                                            <input type="checkbox" value="Brass/Bronze" id="Brass/Bronze" name="NonFerrousMetals12" class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Aluminium </label>
                                                                                            <input type="checkbox" value="Aluminium" id="Aluminium" name="NonFerrousMetals12" class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Lead</label>
                                                                                            <input type="checkbox" value="Lead" id="Lead" name="NonFerrousMetals12" class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Zinc</label>
                                                                                            <input type="checkbox" value="Zinc" id="Zinc" name="NonFerrousMetals12" class="input-checkbox">
                                                                                            <br>
                                                                                        </div>
                                                                                        <div class="col-lg-6 col-12">
                                                                                            <label for="email">Tin </label>
                                                                                            <input type="checkbox" value="Tin" id="Tin" name="NonFerrousMetals12" class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Magnesium </label>
                                                                                            <input type="checkbox" value="Magnesium" id="Magnesium" name="NonFerrousMetals12" class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Special Alloys</label>
                                                                                            <input type="checkbox" value="Special Alloys" id="Special Alloys" name="NonFerrousMetals12" class="input-checkbox">
                                                                                            <br>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-5 col-12">
                                                                            <div class="section-space--bottom--30- chk-side-click">
                                                                                <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                    <label for="email" class="m-0">
                                                                                        <h3 class="name sub-heading-title mb-0">Stainless Steel and Special Alloys :</h3>
                                                                                    </label>
                                                                                    <%--<a href="#db_StainlessSteelandSpecialAlloys" class="float-left" data-toggle="collapse">--%>
                                                                                        <input type="checkbox" name="SecondaryComm" value="Stainless Steel and Special Alloys"  class="input-checkbox" data-target="#db_StainlessSteelandSpecialAlloys"  data-toggle="collapse" />
                                                                                   <%-- </a>--%>
                                                                                </div>
                                                                                <div class="commodity-sub-category collapse" style="padding-left: 12px;" id="db_StainlessSteelandSpecialAlloys">
                                                                                    <label for="email">Nickel and nickel alloys</label>
                                                                                    <input type="checkbox" name="StainlessSteel12" value="Nickel and nickel alloys" id="Nickel and nickel alloys" class="input-checkbox">
                                                                                    <br>
                                                                                    <label for="email">Cobalt </label>
                                                                                    <input type="checkbox" name="StainlessSteel12" value="Cobalt" id="Cobalt" class="input-checkbox">
                                                                                    <br>
                                                                                    <label for="email">High temperature </label>
                                                                                    <input type="checkbox" name="StainlessSteel12" value="High temperature" id="High temperature" class="input-checkbox">
                                                                                    <br>
                                                                                    <label for="email">Titanium </label>
                                                                                    <input type="checkbox" name="StainlessSteel12" value="Titanium" id="Titanium" class="input-checkbox">
                                                                                    <br>
                                                                                    <label for="email">High Speed Steel </label>
                                                                                    <input type="checkbox" name="StainlessSteel12" value="High Speed Steel" id="High Speed Steel" class="input-checkbox">
                                                                                    <br>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-7 col-12">
                                                                            <div class="section-space--bottom--30- chk-side-click">
                                                                                <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                    <label for="email" class="m-0">
                                                                                        <h3 class="name sub-heading-title mb-0">Paper :</h3>
                                                                                    </label>
                                                                                <%--    <a href="#db_Paper" class="float-left" data-toggle="collapse">--%>
                                                                                        <input type="checkbox" name="SecondaryComm" value="Paper"  class="input-checkbox" data-target="#db_Paper"  data-toggle="collapse" />
                                                                                  <%--  </a>--%>
                                                                                </div>

                                                                                <div class="commodity-sub-category collapse" style="padding-left: 12px;" id="db_Paper">
                                                                                    <div class="row">
                                                                                        <div class="col-lg-6 col-12">
                                                                                            <label for="email">Mixed paper </label>
                                                                                            <input type="checkbox" name="Paper12" value="Mixed paper"  class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Over-issue new</label>
                                                                                            <input type="checkbox" name="Paper12" value="Over-issue new" class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Corrugated cardboard </label>
                                                                                            <input type="checkbox" name="Paper12" value="Corrugated cardboard"  class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Pulp substitutes</label>
                                                                                            <input type="checkbox" name="Paper12" value="Pulp substitutes"  class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">De-inking grades(woodfree) </label>
                                                                                            <input type="checkbox" name="Paper12" value="De-inking grades(woodfree)"  class="input-checkbox">
                                                                                            <br>
                                                                                        </div>
                                                                                        <div class="col-lg-6 col-12">
                                                                                            <label for="email">De-inking grades(mechanical) </label>
                                                                                            <input type="checkbox" name="Paper12" value="De-inking grades(mechanical)"  class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Special grades</label>
                                                                                            <input type="checkbox" name="Paper12" value="Special grades"  class="input-checkbox">
                                                                                            <br>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-5 col-12">
                                                                            <div class="section-space--bottom--30- chk-side-click">
                                                                                <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                    <label for="email" class="m-0">
                                                                                        <h3 class="name sub-heading-title mb-0">Textiles :</h3>
                                                                                    </label>
                                                                             
                                                                                        <input type="checkbox" name="SecondaryComm" value="Textiles" class="input-checkbox" data-target="#db_Textiles"  data-toggle="collapse" />
                                                                                
                                                                                </div>
                                                                                <div class="commodity-sub-category collapse" style="padding-left: 12px;" id="db_Textiles">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-12">
                                                                                            <label for="email">Original textiles from Collection (non graded)</label>
                                                                                            <input type="checkbox" name="Textiles12" value="Original textiles from Collection (non graded)"  class="input-checkbox" />
                                                                                            <br>
                                                                                        </div>
                                                                                        <div class="col-sm-6">
                                                                                            <label for="email">New Cuttings</label>
                                                                                            <input type="checkbox" name="Textiles12" value="New Cuttings"  class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Cotton </label>
                                                                                            <input type="checkbox" name="Textiles12" value="Cotton"  class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Wool</label>
                                                                                            <input type="checkbox" name="Textiles12" value="Wool"  class="input-checkbox">
                                                                                            <br>
                                                                                        </div>
                                                                                        <div class="col-sm-6">
                                                                                            <label for="email">Synthetics</label>
                                                                                            <input type="checkbox" name="Textiles12" value="Synthetics"  class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Used Clothing </label>
                                                                                            <input type="checkbox" name="Textiles12" value="Used Clothing" class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Wiping cloths </label>
                                                                                            <input type="checkbox" name="Textiles12" value="Wiping cloths" id="Wiping cloths1" class="input-checkbox">
                                                                                            <br>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-7 col-12">
                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-12">
                                                                                    <div class="section-space--bottom--30- chk-side-click">
                                                                                        <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                            <label for="email" class="m-0">
                                                                                                <h3 class="name sub-heading-title mb-0">Tyres/Rubbers :</h3>
                                                                                            </label>
                                                                                          <%--  <a href="#db_TyresRubbers" class="float-left" data-toggle="collapse">--%>
                                                                                                <input type="checkbox" name="SecondaryComm" value="Tyres/Rubbers" id="Tyres/Rubbers" class="input-checkbox" data-target="#db_TyresRubbers"  data-toggle="collapse" />
                                                                                           <%-- </a>--%>
                                                                                        </div>
                                                                                        <div class="commodity-sub-category collapse" style="padding-left: 12px;" id="db_TyresRubbers">
                                                                                            <label for="email">Re-use </label>
                                                                                            <input type="checkbox" name="Tyres12" value="Re-use" id="Re-use1" class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Re-trading </label>
                                                                                            <input type="checkbox" name="Tyres12" value="Re-trading" id="Re-trading1" class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Granulating </label>
                                                                                            <input type="checkbox" name="Tyres12" value="Granulating" id="Granulating1" class="input-checkbox">
                                                                                            <br>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-6 col-12">
                                                                                    <div class="section-space--bottom--30- chk-side-click">

                                                                                        <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                            <label for="email" class="m-0">
                                                                                                <h3 class="name sub-heading-title mb-0">Plastics :</h3>
                                                                                            </label>
                                                                                          <%--  <a href="#db_Plastics" class="float-left" data-toggle="collapse">--%>
                                                                                                <input type="checkbox" name="SecondaryComm" value="Plastics" class="input-checkbox" data-target="#db_Plastics"  data-toggle="collapse"  />
                                                                                          <%--  </a>--%>
                                                                                        </div>
                                                                                        <div class="commodity-sub-category collapse" style="padding-left: 12px;" id="db_Plastics">
                                                                                            <label for="email">Materials recycling </label>
                                                                                            <input type="checkbox" name="Plastics12" value="Materials recycling" id="Materials recycling1" class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Energy recovery</label>
                                                                                            <input type="checkbox" name="Plastics12" value="Energy recovery" id="Energy recovery1" class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Trader </label>
                                                                                            <input type="checkbox" name="Plastics12" value="Trader" id="Trader1" class="input-checkbox">
                                                                                            <br>
                                                                                            <label for="email">Collector </label>
                                                                                            <input type="checkbox" name="Plastics12" value="Collector" id="Collector1" class="input-checkbox">
                                                                                            <br>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>


                                                                        <div class="col-lg-5 col-12">
                                                                            <div class="section-space--bottom--30- chk-side-click">

                                                                                <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                    <label for="email" class="m-0">
                                                                                        <h3 class="name sub-heading-title mb-0">Construction & Demolition Waste:</h3>
                                                                                    </label>
                                                                                    <input type="checkbox" name="SecondaryComm" value="Construction & Demolition Waste" id="Construction & Demolition Waste" class="input-checkbox">
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-7 col-12">
                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-12">
                                                                                    <div class="section-space--bottom--30- chk-side-click">

                                                                                        <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                            <label for="email" class="m-0">
                                                                                                <h3 class="name sub-heading-title mb-0">Electronic Waste:</h3>
                                                                                            </label>
                                                                                            <input type="checkbox" name="SecondaryComm" value="Electronic Waste" id="Electronic Waste" class="input-checkbox">
                                                                                        </div>

                                                                                    </div>
                                                                                </div>


                                                                                <div class="col-lg-6 col-12">
                                                                                    <div class="section-space--bottom--30- chk-side-click">
                                                                                        <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                            <label for="email" class="m-0">
                                                                                                <h3 class="name sub-heading-title mb-0">Recycled Glass:</h3>
                                                                                            </label>
                                                                                            <input type="checkbox" name="SecondaryComm" value="Recycled Glass" id="Recycled Glass" class="input-checkbox">
                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-12 col-12">
                                                                            <div class="identity-wrapper has-border-left pl-2 mb-10 d-flex other-with-text">
                                                                                <!--<input type="text" name="Plastics" id="db_txtPlastics" class="others-ip m-0 ttl-ip-other" placeholder="Others" />-->
                                                                                <input type="checkbox" value="Others" name="SecondaryComm" class="input-checkbox">
                                                                                <label for="email" class="m-0">
                                                                                    <h3 class="name sub-heading-title mb-0">Others</h3>
                                                                                </label>
                                                                                <!--<input type="checkbox" value=" name="Traderprocessor" class="input-checkbox" />-->
                                                                                <input type="text" name="Traderprocessor" id="txtOtherSecondary" class="others-ip m-0 ttl-ip-other-" placeholder="Others">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                             
                                                                <div class="row">
                                                                    <div class="col-12 mb-2"><span class="tab-field-error">Input Field Not Empty</span> </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <button class="btn btn-sm animated-button thar-three" id="txtBackStep2">Back to Step 2</button>
                                                                        <button class="btn btn-sm animated-button thar-three" id="txtStep4">Proceed to Step 4</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane p-3" id="settings" role="tabpanel">
                                                        <div class="myaccount-content">
                                                            <h3>Sectors :</h3>
                                                            <div class="row">
                                                                <div class="col-sm-12 services-heading">
                                                                    <h1 class="all-title-style-left title-subittl-style">We are active in the sector as :</h1>
                                                                </div>
                                                            </div>
                                                            <div class="account-details-form">
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-12">
                                                                        <div class="identity-wrapper has-border-left pl-2 mb-10 chk-side-click">
                                                                            <label for="email" class="m-0">
                                                                                <h3 class="name sub-heading-title mb-0">Trader :</h3>
                                                                            </label>
                                                                          <%--  <a href="#Trader" class="float-left">--%>
                                                                                <input type="checkbox" name="Traderprocessor" value="Trader" class="input-checkbox" data-target="#Trader"  data-toggle="collapse"/>
                                                                       <%--     </a>--%>
                                                                        </div>
                                                                        <div class="commodity-sub-category collapse" style="padding-left: 12px;" id="Trader">
                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-sm-12 section-space--bottom--30-">
                                                                                    <div class="identity-wrapper has-border-left-">
                                                                                        <h3 class="name sub-heading-title">- With recycling facilities </h3>
                                                                                    </div>
                                                                                    <ul class="feature-list section-space--bottom--40 my-metal-ul">
                                                                                <li class="d-flex other-with-text pl-3">
                                                                                    <label for="email" class="m-0">
                                                                                        <span class="color_red asterik">*</span><small> Licenced Capacity Per Annum</small>
                                                                                    </label>
                                                                                    <input type="text" name="txtLicenced" id="txtLicenced" ng-model="txtLicenced" class="others-ip m-0 ttl-ip-other-" placeholder="" />
                                                                                </li>
                                                                                <li class="d-flex other-with-text pl-3">
                                                                                    <label for="email" class="m-0">
                                                                                        <span class="color_red asterik">*</span> <small> Actual Quantity Processed</small>
                                                                                    </label>
                                                                                    <input type="text" name="txtActual" id="txtActual"ng-model="txtActual" class="others-ip m-0 ttl-ip-other-" placeholder="" />
                                                                                </li>
                                                                                <li class="d-flex other-with-text pl-3">
                                                                                    <label for="email" class="m-0">
                                                                                        <span class="color_red asterik">*</span> <small> No of Employees </small>
                                                                                    </label>
                                                                                    <input type="text" name="txtNOEmployees" id="txtNOEmployees" ng-model="txtNOEmployees" class="others-ip m-0 ttl-ip-other-" placeholder="" />
                                                                                </li>
                                                                                <li class="d-flex other-with-text pl-3">
                                                                                    <label for="email" class="m-0">
                                                                                        <span class="color_red asterik">*</span> <small>Annual Turnover </small>
                                                                                    </label>
                                                                                    <input type="text" name="txtTurnover" id="txtTurnover" ng-model="txtTurnover" class="others-ip m-0 ttl-ip-other-" placeholder="" />
                                                                                </li>
                                                                            </ul>
                                                                                </div>
                                                                                <div class="col-lg-6 col-sm-12 section-space--bottom--30- chk-side-click">
                                                                            <div class="identity-wrapper has-border-left-">
                                                                                <h3 class="name sub-heading-title">- Without recycling facilities </h3>
                                                                            </div>
                                                                            <ul class="feature-list section-space--bottom--40 my-metal-ul">
                                                                                <li class="d-flex other-with-text pl-3">
                                                                                    <label for="email" class="m-0">
                                                                                        <span class="color_red asterik">*</span> <small>Annual Turnover</small>
                                                                                    </label>
                                                                                    <input type="text" name="txtAnnualTurnover" id="txtAnnualTurnover" ng-model="txtAnnualTurnover" class="others-ip m-0 ttl-ip-other-" placeholder="" />
                                                                                </li>
                                                                                <li class="d-flex other-with-text pl-3">
                                                                                    <label for="email" class="m-0">
                                                                                        <span class="color_red asterik">*</span> <small>Quantity Traded</small>
                                                                                    </label>
                                                                                    <input type="text" name="txtQuantity" id="txtQuantity" ng-model="txtQuantity" class="others-ip m-0 ttl-ip-other-" placeholder="" />
                                                                                </li>


                                                                            </ul>
                                                                        </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>


                                                                    <div class="col-lg-6 col-12">
                                                                        <div class="identity-wrapper has-border-left pl-2 mb-10 chk-side-click">
                                                                            <label for="email" class="m-0">
                                                                                <h3 class="name sub-heading-title mb-0">Broker / Intenders / Commission Agents</h3>
                                                                            </label>
                                                                            <input type="checkbox" value="Broker/Intenders/Commission Agents" name="Traderprocessor" class="input-checkbox" />
                                                                        </div>
                                                                    </div>



                                                                    <div class="col-lg-6 col-12">
                                                                        <div class="identity-wrapper has-border-left pl-2 mb-10 chk-side-click">
                                                                            <label for="email" class="m-0">
                                                                                <h3 class="name sub-heading-title mb-0">Consumer / Manufacturer :</h3>
                                                                            </label>
                                                                            <%--<a href="#ConsumerManufacturer" class="float-left" data-toggle="collapse">--%>
                                                                               <input type="checkbox" name="Traderprocessor" value="Consumer/Manufacturer" class="input-checkbox" data-target="#ConsumerManufacturer"  data-toggle="collapse">
                                                                           <%-- </a>--%>
                                                                        </div>
                                                                        <div class="commodity-sub-category collapse" style="padding-left: 12px;" id="ConsumerManufacturer">
                                                                            <div class="row">
                                                                                <div class="col-lg-12 col-sm-12 section-space--bottom--30- chk-side-click">

                                                                            <ul class="feature-list section-space--bottom--40 my-metal-ul">
                                                                                <li class="d-flex other-with-text pl-3">
                                                                                    <label for="email" class="m-0">
                                                                                        <span class="color_red asterik">*</span><small> Licenced Capacity Per Annum</small>
                                                                                    </label>
                                                                                    <input type="text" name="txtCapacity" id="txtCapacity" ng-model="txtCapacity" class="others-ip m-0 ttl-ip-other-" placeholder="" />
                                                                                </li>
                                                                                <li class="d-flex other-with-text pl-3">
                                                                                    <label for="email" class="m-0">
                                                                                        <span class="color_red asterik">*</span> <small> Actual Quantity Processed</small>
                                                                                    </label>
                                                                                    <input type="text" name="txtProcessed" id="txtProcessed" ng-model="txtProcessed" class="others-ip m-0 ttl-ip-other-" placeholder="" />
                                                                                </li>
                                                                                <li class="d-flex other-with-text pl-3">
                                                                                    <label for="email" class="m-0">
                                                                                        <span class="color_red asterik">*</span> <small> No of Employees </small>
                                                                                    </label>
                                                                                    <input type="text" name="txtEmployees" id="txtEmployees" ng-model="txtEmployees" class="others-ip m-0 ttl-ip-other-" placeholder="" />
                                                                                </li>
                                                                                <li class="d-flex other-with-text pl-3">
                                                                                    <label for="email" class="m-0">
                                                                                        <span class="color_red asterik">*</span> <small>Annual Turnover </small>
                                                                                    </label>
                                                                                    <input type="text" name="txtAnnualTurnover1" id="txtAnnualTurnover1" ng-model="txtAnnualTurnover1" class="others-ip m-0 ttl-ip-other-" placeholder="" />
                                                                                </li>
                                                                            </ul>
                                                                        </div>

                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                    <div class="col-lg-6 col-12">
                                                                        <div class="section-space--bottom--30-">

                                                                            <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                <label for="email" class="m-0">
                                                                                    <h3 class="name sub-heading-title mb-0">Supplier & Manufacturer of Machinery and Equipment</h3>
                                                                                </label>
                                                                                <input type="checkbox" value="Supplier & Manufacturer of Machinery and Equipment" name="Traderprocessor" class="input-checkbox">
                                                                            </div>
                                                                            <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                <label for="email" class="m-0">
                                                                                    <h3 class="name sub-heading-title mb-0">Laboratory/assayer </h3>
                                                                                </label>
                                                                                <input type="checkbox" value="Laboratory/assayer" name="Traderprocessor" class="input-checkbox">
                                                                            </div>
                                                                            <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                <label for="email" class="m-0">
                                                                                    <h3 class="name sub-heading-title mb-0">Insurer </h3>
                                                                                </label>
                                                                                <input type="checkbox" value="Insurer" name="Traderprocessor" class="input-checkbox">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6 col-12">
                                                                        <div class="section-space--bottom--30">

                                                                            <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                <label for="email" class="m-0">
                                                                                    <h3 class="name sub-heading-title mb-0">Consultant/research bureau </h3>
                                                                                </label>
                                                                                <input type="checkbox" value="Consultant/research bureau" name="Traderprocessor" class="input-checkbox">
                                                                            </div>
                                                                            <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                <label for="email" class="m-0">
                                                                                    <h3 class="name sub-heading-title mb-0">Administration/State agency </h3>
                                                                                </label>
                                                                                <input type="checkbox" value="Administration/State agency" name="Traderprocessor" class="input-checkbox">
                                                                            </div>
                                                                            <div class="identity-wrapper has-border-left pl-2 mb-10">
                                                                                <label for="email" class="m-0">
                                                                                    <h3 class="name sub-heading-title mb-0">Trade Press </h3>
                                                                                </label>
                                                                                <input type="checkbox" value="Trade Press" name="Traderprocessor" class="input-checkbox">
                                                                            </div>
                                                                            <div class="identity-wrapper has-border-left pl-2 mb-10 d-flex other-with-text">

                                                                                <input type="checkbox" value="Others" name="Traderprocessor" class="input-checkbox">
                                                                                <label for="email" class="m-0">
                                                                                    <h3 class="name sub-heading-title mb-0">Others</h3>
                                                                                </label>
                                                                                <!--<input type="checkbox" value="" name="Traderprocessor" class="input-checkbox" />-->
                                                                                <input type="text" name="Traderprocessor" id="txtTradePress" class="others-ip m-0 ttl-ip-other-" placeholder="Others" />


                                                                            </div>



                                                                         


                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-sm-12 services-heading">
                                                                    <h1 class="all-title-style-left title-subittl-style">General Information :</h1>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <label>Member of any other Associations (Please Specify)</label>

                                                                    <textarea id="txtAssociations" autocomplete="off" class="width-100"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12 mb-2-">
                                                                    <label>Application Recommended by existing Members of MRAI<span class="color_red asterik">*</span></label>
                                                                </div>
                                                                <div class="col-lg-6 col-6 col-sm-12">
                                                                    <label for="first-member"><span class="color_blue asterik">1<sup>st</sup> Reference</span></label>
                                                                    <input id="txtRecommended" autocomplete="off" placeholder="" type="text" class="form-control" />
                                                                </div>
                                                                <div class="col-lg-6 col-6 col-sm-12">
                                                                    <label for="second-member"><span class="color_blue asterik">2<sup>nd</sup> Reference</span></label>
                                                                    <input id="txtRecommended1" autocomplete="off" placeholder="" type="text" class="form-control" />
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12 mb-2-">
                                                                    <label>Any other relevant information (Attach Sheets, if necessary)</label>
                                                                </div>
                                                                <div class="col-lg-12 col-12">
                                                                    <textarea id="txtinformation" autocomplete="off" class="width-100"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">

                                                                    <button class="btn btn-sm animated-button thar-three" id="txtBackStep3">Back to Step 3</button>
                                                                    <button class="btn btn-sm animated-button thar-three" id="txtStep5">Proceed to Step 5</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>




                                                    <div class="tab-pane p-3" id="settings-2" role="tabpanel">
                                                        <div class="myaccount-content">
                                                            <h3>Fees :</h3>
                                                            <div class="account-details-form">
                                                                <!--<form action="#">-->
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-sm-12 section-space--bottom--30">
                                                                        <div class="identity-wrapper has-border-left">
                                                                            <h3 class="name sub-heading-title">The details of the fees are as below :</h3>
                                                                        </div>

                                                                        <div class="row">
                                                                            <div class="col-lg-6">
                                                                                <label>One Time Joining Fee</label>
                                                                                <input id="txtjoinfees" onkeypress="return isNumberKey(event)" placeholder="One Time Joining Fee" autocomplete="off" class="form-control" />
                                                                            </div>
                                                                            <div class="col-lg-6">
                                                                                <label>Subscription Fee</label>
                                                                                <input id="txtSubscriptionfee" onkeypress="return isNumberKey(event)" autocomplete="off" placeholder="Subscription Fee" type="text" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-lg-6 mb-2-">
                                                                                <label>Total Fee</label>
                                                                                <input id="txtTotalfee" onkeypress="return isNumberKey(event)" autocomplete="off" placeholder="Total Fee" type="text" class="form-control" />
                                                                            </div>
                                                                            <div class="col-lg-6 mb-2-">
                                                                                <label for="first-member">Payment Details</label>
                                                                                <input id="txtPayDetails" autocomplete="off" placeholder="Payment Details" type="text" class="form-control" />
                                                                            </div>

                                                                        </div>
                                                                        <div class="row">

                                                                            <div class="col-lg-6 mb-2-">
                                                                                <label>Select Payment Status</label>
                                                                                <select id="ddlPaymentStatus" name="ddlPaymentStatus" class="field select medium" tabindex="11">
                                                                                    <option selected="selected" disabled value="">Select Payment Status</option>
                                                                                    <option value="Done">Done</option>
                                                                                    <option value="Pending">Pending</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="col-lg-6 mb-2-">
                                                                                <label>Commant</label>
                                                                                <input id="txtCommant" autocomplete="off" placeholder="Commant" type="text" class="form-control" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-lg-6 m-2-">
                                                                                <label>Membership Type </label>
                                                                                <select id="ddlMemberType" name="ddlMemberType" class="field select medium" tabindex="11">
                                                                                    <option selected="selected" disabled value="">Select Type</option>
                                                                                    <option value="Member">Member</option>
                                                                                    <option value="Gold Member">Gold Member</option>
                                                                                    <option value="Non-Renewed Member">Non-Renewed Member</option>
                                                                                    <option value="Association">Association</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="col-lg-6 m-2-">
                                                                                <label for="first-member">Membership Form Receive Date</label>
                                                                                <div id="Receivedate" class="input-group date" data-date-format="yyyy-mm-dd">
                                                                                    <input class="form-control" type="text" id="txtReceive" name="txtReceive" ng-model="txtReceive" readonly placeholder="Membership Form Receive Date" />
                                                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                                                </div>
                                                                            </div>


                                                                        </div>
                                                                    </div>





                                                                    <div class="col-lg-12 col-sm-12 section-space--bottom--30">
                                                                        <div class="identity-wrapper has-border-left">
                                                                            <h3 class="name sub-heading-title">Please Note - </h3>
                                                                        </div>
                                                                        <ul class="feature-list section-space--bottom--40 my-metal-ul">
                                                                            <li>For a Sister- Concern (Whose Parent or Holding Company is already a Member), one time
                                  joining fee is payable. However, there will be a 50% reduction in Annual Membership Fees. (Proof
                                  of relation to parent /holding company needs to be submitted.) </li>
                                                                        </ul>
                                                                    </div>

                                                                    <div class="col-lg-12 col-sm-12 section-space--bottom--30">
                                                                        <div class="identity-wrapper has-border-left">
                                                                            <h3 class="name sub-heading-title">Declaration - </h3>
                                                                        </div>
                                                                        <ul class="feature-list section-space--bottom--40 my-metal-ul">
                                                                            <li>Application Registration Status Depends on Board of Directors Approval. </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-lg-12 col-12">
                                                                        <div class="section-space--bottom--30">
                                                                            <label for="email">
                                                                                We have read and here with agree to abide by the Articles of Association and Internal                               Regulations.
                                                                            </label>
                                                                            <input type="checkbox" value="Articles of Association and Internal Regulations" name="ArticlesAssociation" id="ArticlesAssociation" class="input-checkbox">
                                                                        </div>
                                                                    </div>
                                                                </div>



                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <button class="btn btn-sm animated-button thar-three" id="txtBackStep4">Back to Step 4</button>
                                                                        <button class="btn btn-sm animated-button thar-three" id="txtStep6">Proceed to Step 6</button>
                                                                    </div>
                                                                </div>
                                                                <!--</form>-->
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="tab-pane p-3" id="document" role="tabpanel">
                                                        <div class="myaccount-content">
                                                            <h3>Upload Company Documents:</h3>
                                                            <div class="row">
                                                                <div class="col-sm-12 services-heading">
                                                                    <h1 class="all-title-style-left title-subittl-style">List of Documents to be attached along with the form :</h1>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-4 col-sm-6 col-sm-12">
                                                                    <div class="mb-2-">
                                                                        <label>
                                                                            Add - Membership Form <span class="color_red asterik">*</span>
                                                                            <br />
                                                                            <span class="color_blue asterik">(Indian/Foreign)</span>
                                                                        </label>
                                                                    </div>

                                                                    <div class="row mb-20">
                                                                        <div class="col-lg-12 col-md-12">
                                                                            <input type="file" id="AddForm" ng-name="AddForm" accept="application/pdf image/*" ng-model="AddForm" name="AddForm" onchange="angular.element(this).scope().uploadedFile(this, 'AddForm')" />

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-4 col-sm-6 col-sm-12">
                                                                    <div class="mb-2-">
                                                                        <label>
                                                                            Photocopy of Certificate of Incorporation <span class="color_red asterik">*</span>
                                                                            <br />
                                                                            <span class="color_blue asterik">(Indian/Foreign)</span>
                                                                        </label>
                                                                    </div>

                                                                    <div class="row mb-20">
                                                                        <div class="col-lg-12 col-md-12">
                                                                            <input type="file" id="rdbIncome" ng-name="rdbIncome" accept="application/pdf image/*" ng-model="rdbIncome" name="rdbIncome" onchange="angular.element(this).scope().uploadedFile(this, 'rdbIncome')" />

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-4 col-sm-6 col-sm-12">
                                                                    <div class="mb-2-">
                                                                        <label>
                                                                            Photocopy of Pan Card <span class="color_red asterik"></span>
                                                                            <br />
                                                                            <span class="color_blue asterik">(for Indian companies/Association only)</span>
                                                                        </label>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12">
                                                                            <input type="file" id="rdbPancard" ng-name="rdbPancard" accept="application/pdf image/*" ng-model="rdbPancard" name="rdbPancard" onchange="angular.element(this).scope().uploadedFile(this, 'rdbPancard')" />

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-4 col-sm-6 col-sm-12">
                                                                    <div class="mb-2-">
                                                                        <label>
                                                                            Photocopy of GST <span class="color_red asterik"></span>
                                                                            <br />
                                                                            <span class="color_blue asterik">(for Indian companies only)</span>
                                                                        </label>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12">
                                                                            <input type="file" id="rdbGst" ng-name="rdbGst" accept="application/pdf image/*" ng-model="rdbGst" name="rdbGst" onchange="angular.element(this).scope().uploadedFile(this, 'rdbGst')" />

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-4 col-sm-6 col-sm-12">
                                                                    <div class="mb-2-">
                                                                        <label>
                                                                            Others Document <span class="color_red asterik">*</span>
                                                                            <br />
                                                                            <span class="color_blue asterik">(Indian/Foreign)</span>
                                                                        </label>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12">
                                                                            <input type="file" id="rdbOther" ng-name="rdbOther" accept="application/pdf image/*" ng-model="rdbOther" name="rdbOther" onchange="angular.element(this).scope().uploadedFile(this, 'rdbOther')" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-4 col-sm-6 col-sm-12">
                                                                    <div class="mb-2-">
                                                                        <label>
                                                                            Membership Certification <span class="color_red asterik">*</span>
                                                                            <br />
                                                                            <span class="color_blue asterik">(Indian/Foreign)</span>
                                                                        </label>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12">
                                                                            <input type="file" id="rdbCertification" ng-name="rdbCertification" accept="application/pdf" ng-model="rdbCertification" name="rdbCertification" onchange="angular.element(this).scope().uploadedFile(this, 'rdbCertification')" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12 mb-2">
                                                                    <label class="error" id="divmsg"></label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">

                                                                    <button class="btn btn-sm animated-button thar-three" id="txtBackStep5">Back to Step 5</button>
                                                                    <button class="btn btn-sm animated-button thar-three preview-btn" id="btnprive" data-popup="popup-reg" ng-click="Dataview()">Preview</button>
                                                                    <button class="btn btn-sm animated-button thar-three" id="btnsubmit" ng-click="FormValidate()">Submit</button>

                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>

                                                    <div class="tab-pane p-3" id="history" role="tabpanel">
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

            </div>
            <div class="form-popup" id="id1">
                <div class="container form-wrapper">
                    <button class="btn close-form btn-primary">X</button>

                    <div id="my-form">
                        <div class="row">



                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="HeadTitle" name="HeadTitle" autocomplete="off" ng-model="HeadTitle" placeholder="Enter Title Name" required />
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input class="form-control" type="file" id="HeadImageUpload" name="HeadImageUpload" ng-model="HeadImageUpload" accept="image/*" onchange="angular.element(this).scope().uploadedFile(this,'HeadImageUpload','ImageDisplay')" />
                                </div>
                            </div>


                            <div class="col-sm-12">
                                <div class="form-group">
                                    <img ng-src="{{ImageDisplay}}" class="img-responsive" />
                                </div>
                            </div>

                            <div class="col-sm-12">
                                <input type="button" id="Headsubmibtn" class="btn btn-primary btn-md" value="Update" ng-click="UpdateHeader()" style="margin-bottom: 5px;" />
                            </div>




                            <div class="row notes-div m-0">
                                <div class="col-sm-12 myaccount-content">
                                    <%--<label class="color_blue btn-block"><strong> Note* : </strong></label>--%>
                                    <div class="identity-wrapper has-border-left">
                                        <h3 class="name sub-heading-title m-0">Note* :</h3>
                                    </div>
                                </div>

                                <div class="col-sm-12 ">
                                    <ul class="feature-list ">
                                        <li><small>Upload Image <span class="color_blue">jpg </span>Format Only </small></li>
                                        <li><small>Image Dimension Should be with in - <span class="color_blue">width : 1920px, height : 200px </span></small></li>
                                        <li><small>Maximum Upload Image Size - <span class="color_blue">150kb</span> </small></li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>


        <div class="pop-up-contact-form preview-form-div">
            <div id="popup-reg" class="popup">
                <div class="popup-content container">
                    <!--<div class="section-title-area section-title-area--middle section-space--bottom--40">
        <h2 class="title title--style2  title--style2--black2">Preview Section</h2>
      </div>-->
                    <form class="preview-form-div-2 ng-pristine ng-valid">
                        <div class="col-lg-12 col-12 form-col-div">
                            <div class="row">
                                <div class="col-lg-12 col-12">
                                    <b>
                                        <h2 class="text-center">Preview Members Details</h2>
                                    </b>
                                </div>

                            </div>
                            <div class="row">
                                <div class="tab-content">
                                    <!-- Single Tab Content Start 1-->
                                    <div class="tab-pane fade show active">
                                        <div class="myaccount-content">
                                            <h3>Company Information :</h3>
                                        </div>
                                        <div class="contact-area">
                                            <div class="contact">
                                                <nav class="active">
                                                    <div class="row m-0">
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Company :</h1>
                                                                    <span>{{pop_India}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-8 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Name of Company/Association :</h1>
                                                                    <span class="ng-binding">{{pop_Company}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Name of parent company or Primary Contact Company :</h1>
                                                                    <span class="ng-binding">{{pop_PrimaryContact}}</span>
                                                                </div>

                                                            </a>
                                                        </div>
                                                        <div class="col-md-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-map-marker fa-lg"></i></div>
                                                                <div class="content">
                                                                    <h1>Postal Address :</h1>
                                                                    <span>{{pop_address1}}, {{pop_address2}}, {{pop_City}}, {{pop_State}}, {{pop_pincode}}, {{pop_country}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                          <div class="col-md-4 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-industry"></i></div>
                                                                <div class="content">
                                                                    <h1>Zone :</h1>
                                                                    <span>{{pop_Zone}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-md-4 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-industry"></i></div>
                                                                <div class="content">
                                                                    <h1>Date Of Incorporation :</h1>
                                                                    <span>{{pop_Date}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-mobile fa-lg"></i></div>
                                                                <div class="content">
                                                                    <h1>Tel No. :</h1>
                                                                    <span>{{pop_CountryCode}} {{pop_cityCode}} {{pop_phone}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-fax"></i></div>
                                                                <div class="content">
                                                                    <h1>Fax No. : </h1>
                                                                    <span>{{pop_faxCountryCode}} {{pop_faxcitycode}} {{pop_faxphone}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-globe"></i></div>
                                                                <div class="content">
                                                                    <h1>Website :</h1>
                                                                    <span>{{pop_website}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-8 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-globe"></i></div>
                                                                <div class="content">
                                                                    <h1>Nature of the Firm/Association  :</h1>
                                                                    <span>{{pop_firm}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-8 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-globe"></i></div>
                                                                <div class="content">
                                                                    <h1>Member Pancard No. :</h1>
                                                                    <span>{{Pop_Pancard}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-globe"></i></div>
                                                                <div class="content">
                                                                    <h1>Member Gst No. :</h1>
                                                                    <span>{{Pop_Gst}}</span>
                                                                </div>
                                                            </a>
                                                        </div>

                                                    </div>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Tab Content End -->
                                    <!-- Single Tab Content Start 2 -->
                                    <div class="tab-pane fade show active">
                                        <div class="myaccount-content">
                                            <h3>Contacts - <small class="">Main Contact (for mail, invoices, etc.) </small>:</h3>
                                        </div>
                                        <div class="contact-area">
                                            <div class="contact">
                                                <nav class="active">
                                                    <div class="row m-0">
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Gender :</h1>
                                                                    <span>{{pop_ddlgender}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Full Name :</h1>
                                                                    <span>{{pop_Firstname}} {{pop_middlename}} {{pop_lastname}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Designation :</h1>
                                                                    <span>{{pop_designation}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Mobile Number  :</h1>
                                                                    <span>{{pop_countrycode}} {{pop_mobilenumber}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Email :</h1>
                                                                    <span>{{pop_txtemailid}}</span>
                                                                </div>
                                                            </a>
                                                        </div> 
                                                           <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Password :</h1>
                                                                    <span>{{pop_Password}}</span>
                                                                </div>
                                                            </a>
                                                        </div>                                                
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Secondary Contact Details :</h1>
                                                                    <span>{{pop_displayname}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Membership Number :</h1>
                                                                    <span>{{Pop_membershino}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Membership Start Date :</h1>
                                                                    <span>{{MemberStartDate}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Membership End Date :</h1>
                                                                    <span>{{MemberEndDate}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Tab Content End -->
                                    <!-- Single Tab Content Start 3-->
                                    <div class="tab-pane fade show active">
                                        <div class="myaccount-content">
                                            <h3>Activities :</h3>
                                        </div>
                                        <div class="contact-area">
                                            <div class="contact">
                                                <nav class="active">
                                                    <div class="row m-0">
                                                        <div class="col-sm-12 services-heading">
                                                            <h1 class="all-title-style-left title-subittl-style">Primary Business Commodity Divisions :</h1>
                                                        </div>
                                                    </div>
                                                    <div class="row m-0">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-calendar"></i></div>
                                                                <div class="content">
                                                                    <h1>Primary Business:</h1>
                                                                    <span>{{pop_PrimaryBussiness}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                       
                                                    </div>

                                                    <div class="row m-0">
                                                        <div class="col-sm-12 services-heading">
                                                            <h1 class="all-title-style-left title-subittl-style">Secondary Business :</h1>
                                                        </div>
                                                    </div>

                                                     <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-calendar"></i></div>
                                                                <div class="content">
                                                                    <h1>Secondary Commodity:</h1>
                                                                    <span>{{pop_Divisions}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                       
                                                
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Tab Content End -->
                                    <!-- Single Tab Content Start 4-->
                                    <div class="tab-pane fade show active">
                                        <div class="myaccount-content">
                                            <h3>Sectors :</h3>
                                        </div>
                                        <div class="contact-area">
                                            <div class="contact">
                                                <nav class="active">
                                                    <div class="row m-0">
                                                        <div class="col-sm-12 services-heading">
                                                            <h1 class="all-title-style-left title-subittl-style">We are active in the sector as :</h1>
                                                        </div>
                                                    </div>
                                                    <div class="row m-0">
                                                        <div class="col-lg-12 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Sectors :</h1>
                                                                    <span>{{strtxtTraderprocessor}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="row m-0">
                                                        <div class="col-sm-12 services-heading">
                                                            <h1 class="all-title-style-left title-subittl-style">General Information :</h1>
                                                        </div>
                                                    </div>
                                                    <div class="row m-0">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Member of any other Associations :</h1>
                                                                    <span>{{pop_Associations}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Reference of two current active members :</h1>
                                                                    <span>{{pop_Recommended}}, {{pop_Recommended1}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Any other relevant information :</h1>
                                                                    <span>{{pop_information}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Tab Content End -->
                                    <!-- Single Tab Content Start 5-->
                                      <div class="tab-pane fade show active">
                                        <div class="myaccount-content">
                                            <h3>Fees :</h3>
                                        </div>
                                        <div class="contact-area">
                                            <div class="contact">
                                                <nav class="active">
                                                    <div class="row m-0">
                                                        <div class="col-sm-12 services-heading">
                                                            <h1 class="all-title-style-left title-subittl-style">The details of the fees are as below :</h1>
                                                        </div>
                                                    </div>
                                                    <div class="row m-0">
                                                          <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>One Time Joining Fee :</h1>
                                                                    <span>{{pop_OneTimeJoin}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    
                                                       <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Subscription Fee :</h1>
                                                                    <span>{{pop_Subscription}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                          <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Total Fee :</h1>
                                                                    <span>{{pop_TotalFees}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Payment Details :</h1>
                                                                    <span>{{pop_Paymentdetail}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                         <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Select Payment Status :</h1>
                                                                    <span>{{pop_ddlPaymentStatus}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                         <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Commant :</h1>
                                                                    <span>{{pop_MemberType}}</span>
                                                                </div>
                                                            </a>
                                                        </div>                                                        
                                                           <div class="col-lg-6 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Membership Type :</h1>
                                                                    <span>{{pop_MemberCommant}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                           <div class="col-lg-6 col-md-6 col-sm-12 p-0">
                                                            <a class="gmail m-0">
                                                                <div class="icon"><i class="fa fa-envelope"></i></div>
                                                                <div class="content">
                                                                    <h1>Membership Form Receive Date :</h1>
                                                                    <span>{{pop_Receivedate}}</span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    
                                                </nav>
                                            </div>
                                        </div>
                                    </div>

                                    <!--<div class="tab-pane fade show active">
                  <div class="myaccount-content">
                    <h3>Fees :</h3>
                  </div>
                  <div class="contact-area">
                    <div class="contact">
                      <nav class="active">
                        <div class="row m-0">
                          <div class="col-sm-12 services-heading">
                            <h1 class="all-title-style-left title-subittl-style">One time joining fee and Annual Membership fee <small class=""> (1 Year Membership) </small></h1>
                          </div>
                        </div>
                        <div class="row m-0">
                          <div class="col-lg-4 col-md-6 col-sm-12 p-0"> <a class="gmail m-0">
                            <div class="icon"> <i class="fa fa-envelope"></i> </div>
                            <div class="content">
                              <h1>Indian Company :</h1>
                              <span>{{pop_ArticlesAssociation}}</span> </div>
                            </a> </div>
                        </div>
                      </nav>
                    </div>
                  </div>
                </div>-->
                                    <!-- Single Tab Content End -->
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-12">
                                    <!--<button type="submit" class="main-btn-rect" name="text" value="Send"> <i class="fa fa-edit"></i> Edit </button>-->
                                    <button type="submit" class="main-btn-rect close-preview-div" name="text" value="Send"><i class="fa fa-close"></i>Close </button>
                                </div>
                            </div>
                        </div>

                        <span class="fade-out main-btn-circle close-preview-div">X</span>
                    </form>
                </div>
            </div>
        </div>


    </div>



    <link href="css/preview-style.css" rel="stylesheet" />
    <link href="website-style/memberlist-style.css" rel="stylesheet" />


    <script>
        $(document).ready(function () {
            $('.preview-btn').click(function () {
                $('.popup').addClass('active');

            });
            $('.close-preview-div').click(function () {
                $('.popup').removeClass('active');

            });

        })
    </script>
    <script>
        //   $(":checkbox[class='" + value + "']").prop("checked", this.checked);
        $(document).ready(function () {

            $('input[type="radio"]').click(function () {
                var inputValue = $(this).val();
                $("div.radio-collapse").hide();

                $('#' + inputValue).find('input[name=' + inputValue + ']').each(function () {
                    //$('input[name=' + inputValue + ']').each(function () {
                    this.checked = false;
                });
                $("#" + inputValue).show();
            });
        });
    </script>

         <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
 <%--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>
</asp:Content>
