<%@ Page Title="" Language="C#" MasterPageFile="~/Rubtech.Master" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="RubTechDashBaord.forgot_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <section class="auth-page-wrapper py-5 position-relative d-flex align-items-center justify-content-center min-vh-100 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row g-0">
                                    <div class="col-lg-5">
                                        <div class="card auth-card h-100 border-0 shadow-none p-sm-3 overflow-hidden mb-0">
                                            <div class="card-body p-3 d-flex justify-content-between flex-column">
                                                <div class="auth-image mb-3">
                                                    <img src="assets/images/IRMRA-logo-login.png" alt="IRMRA Logo" height="100" />
                                                    <img src="assets/images/effect-pattern/auth-effect-2.png" alt="" class="auth-effect-2" />
                                                    <img src="assets/images/effect-pattern/auth-effect.png" alt="" class="auth-effect" />
                                                    <img src="assets/images/effect-pattern/auth-effect.png" alt="" class="auth-effect-3" />
                                                </div>
        
                                                <div>
                                                    <h3 class="text-white">About Us</h3>
                                                    <p class="text-white-75 fs-15">Established in 1958, as a small scale R & D Institute, has now become an internationally well known Centre of Excellence both for non-tyre & tyre sectors in our country.</p>
                                                </div>
                                                <div class="text-center text-white-75">
                                <p class="mb-0">&copy;
                 <script>document.write(new Date().getFullYear())</script> IRMRA. Designed & Developed by <a href="https://designaccent.in" target="_blank" class="text-warning">Design Accent </a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-lg-7">
                                        <div class="card mb-0 border-0 py-3 shadow-none">
                                            <div class="card-body px-0 p-sm-5 m-lg-4">
                                                <div class="text-center mt-2">
                                                    <h5 class="text-primary fs-20">Forgot Password?</h5>
                                                    <p class="text-muted mb-4">Reset password with IRMRA</p>
                                                    <div class="display-5 mb-4 text-danger">
                                                        <i class="bi bi-envelope"></i>                                                    </div>
                                                </div>

                                                <div class="alert alert-borderless alert-warning text-center mb-2 mx-2" role="alert">
                                                    Enter your email and instructions will be sent to you!                                                </div>
                                                <div class="p-2">
                                                    <form>
                                                        <div class="mb-4">
                                                            <label class="form-label">Email</label>
                                                            <input type="email" class="form-control" id="email" placeholder="Enter Email" required />
                                                        </div>

                                                        <div class="text-center mt-4">
                                                            <button class="btn btn-primary w-100" type="submit">Send Reset Link</button>
                                                        </div>
                                                    </form><!-- end form -->
                                                </div>
                            <div class="mt-4 text-center">
                            <p class="mb-0">Wait, I remember my password... <a href="index.html" class="fw-semibold text-primary text-decoration-underline"> Click here </a> </p>
                            </div>
                            </div><!-- end card body -->
                                        </div><!-- end card -->
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
            </div>
            <!--end container-->
        </section>

</asp:Content>
