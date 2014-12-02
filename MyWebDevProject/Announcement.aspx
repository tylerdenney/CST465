<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Announcement.aspx.cs" Inherits="MyWebDevProject.Announcement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Announcement</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Announcement</h1>

    <asp:FormView ID="uxFormView" runat="server">
        <ItemTemplate>
            <asp:Label ID="uxTitleLabel" runat="server" AssociatedControlID="uxTitle">Title: </asp:Label>
            <asp:TextBox ID="uxTitle" runat="server" ReadOnly="true" Text='<%# Bind("Title") %>'></asp:TextBox>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
