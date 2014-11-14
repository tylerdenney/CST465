<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyWebDevProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Login Please</h1>
        <asp:Login MembershipProvider="SqlMembership" CreateUserText="Register" CreateUserUrl="~/Register.aspx" runat="server"></asp:Login>
    </div>
    </form>
</body>
</html>
