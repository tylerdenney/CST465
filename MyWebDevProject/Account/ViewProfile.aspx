<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="ViewProfile" Codebehind="ViewProfile.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>View Profile</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>View Profile</h1>

    <span class="fieldTitle">Name:</span><asp:Literal ID="uxName" runat="server" />
    <br />
    <span class="fieldTitle">User Type:</span><asp:Literal ID="uxType" runat="server" />
    <br />
     <span class="fieldTitle">Favorite Band:</span><asp:Literal ID="uxBand" runat="server" />
    <br />
     <span class="fieldTitle">Favorite Hobby:</span><asp:Literal ID="uxHobby" runat="server" />
    <br />
     <span class="fieldTitle">Biography:</span><asp:Literal ID="uxBio" runat="server" />
    <br />
     <span class="fieldTitle">Course Prefix</span><asp:Literal ID="uxPrefix" runat="server" />
    <br />
     <span class="fieldTitle">Course Number:</span><asp:Literal ID="uxNumber" runat="server" />
    <br />
     <span class="fieldTitle">Course Description:</span><asp:Literal ID="uxDescription" runat="server" />
    <br />



</asp:Content>

