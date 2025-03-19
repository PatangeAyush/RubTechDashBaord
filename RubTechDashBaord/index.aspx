<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="RubTechDashBaord.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link href="\assets\css\sweetalert2new.min.css" rel="stylesheet" />
        <script src="\assets\js\sweetalert2@110000.js"></script>
    <!-- Custom CSS -->
    <link href="assets/css/index.css" rel="stylesheet" />

    <style>
        .vikas {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}


        div:where(.swal2-container) button:where(.swal2-styled):where(.swal2-confirm) {
  border: 0;
  border-radius: .25em;
    border-top-left-radius:none;
    border-top-right-radius: none;
    border-bottom-right-radius: none;
    border-bottom-left-radius: none;
  background: initial;
    background-color: initial;
  background-color: #1d4010 !important;
  color: #fff;
  font-size: 1em;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">


             <div class="vikas">
        <div class="login-container">
            <div class="card login-card">
                <div class="card-body">

                    <!-- Logo Section -->
                    <div class="logo-container">
                        <img src="assets/images/IRMRA-logo.png" alt="IRMRA Logo" class="logo" />
                    </div>

                    <!-- Heading -->
                    <h3 class="text-dark mb-4">Admin Login</h3>

                    <!-- Username Input -->
                    <div class="mb-3 text-start">
                        <label class="form-label">Username</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                    </div>

                    <!-- Password Input -->
                    <div class="mb-3 text-start">
                        <label class="form-label">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                    </div>

                    <!-- Login Button -->
                    <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click1" CssClass="btn btn-primary w-100" />

                    <!-- Footer -->
                    <p class="footer-text" style="color : black">
                        Designed & Developed by 
                        <a href="https://designaccent.in" target="_blank" class="text-success"><b>Design Accent</b></a>
                    </p>

                </div>
            </div>
        </div>

                 
               </div>
    </form>
</body>
</html>
