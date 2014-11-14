<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MyWebDevProject.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Register New User</h1>
        <asp:CreateUserWizard ID="uxCreateUsesr" runat="server" MembershipProvider="SqlMembership" ContinueDestinationPageUrl="~/Login.aspx"></asp:CreateUserWizard>
    </div>
    </form>
</body>
</html>
