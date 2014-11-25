<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="MyWebDevProject.Admin.ManageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Users</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Manage Users</h1>
    <fieldset>
        <legend>Add Roles</legend>
        <asp:label ID="uxAddRolesLabel" runat="server" AssociatedControlID="uxAddRoles">Role Name</asp:label>
        <asp:TextBox ID="uxAddRoles" runat="server"></asp:TextBox>
        <asp:Button ID="uxCreateButton" runat="server" Text="Create Role" OnClick="uxCreateButton_Click" />
        
    </fieldset>
    <fieldset>
        <legend>Role Membership</legend>
       <asp:SqlDataSource   ID="uxDataSource"
                            ConnectionString="<%$ConnectionStrings:SqlSecurityDB %>"
                            SelectCommandType="Text"
                            SelectCommand="SELECT Username FROM aspnet_Users"
                            runat="server" />
        <asp:SqlDataSource   ID="uxDataSource2"
                            ConnectionString="<%$ConnectionStrings:SqlSecurityDB %>"
                            SelectCommandType="Text"
                            SelectCommand="SELECT Rolename FROM aspnet_Roles"
                            runat="server" />
         <asp:Label ID="uxUsersLabel" runat="server">Users:</asp:Label>
        <asp:DropDownList runat="server" ID="uxUsersDropDown" DataSourceID="uxDataSource" DataTextField="UserName"></asp:DropDownList>
        <asp:DropDownList runat="server" ID="uxRolesDropDown" DataSourceID="uxDataSource2" DataTextField="RoleName"></asp:DropDownList>
        <asp:Button ID="uxAddUserToRoleButton" runat="server" Text="Add User to Role" OnClick="uxAddUserToRoleButton_Click" />
    </fieldset>
</asp:Content>
