<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Announcements.aspx.cs" Inherits="MyWebDevProject.Announcements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Announcements</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Announcements</h1>
    <asp:LoginView ID="uxLogin" runat="server" >
        <AnonymousTemplate>
            <p>You must log in to post new announcements.</p>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <p>Currently logged in as <asp:LoginName ID="uxLoginName" runat="server" />.</p>
            <fieldset id="uxFieldSet">
                <legend>Add New Announcement</legend>
                <asp:Label ID="uxTitleLabel" runat="server" AssociatedControlID="uxTitle">Title</asp:Label>
                <asp:TextBox ID="uxTitle" runat="server"></asp:TextBox>
                <asp:Label ID="uxBodyLabel" runat="server" AssociatedControlID="uxBody">Body</asp:Label>
                <asp:TextBox TextMode="MultiLine" ID="uxBody" runat="server" CssClass="formfield"></asp:TextBox>
                <asp:Button ID="uxsubmit" runat="server" Text="Submit" OnClick="uxsubmit_Click" />
            </fieldset>
        </LoggedInTemplate>
    </asp:LoginView>
    <asp:SqlDataSource ID="sqldatasource" ConnectionString="<%$ ConnectionStrings:SqlSecurityDB %>" SelectCommandType="Text" SelectCommand="select Title, Name, Body, Dateposted from announcement join userprofile on announcement.userid = userprofile.userid" runat="server"></asp:SqlDataSource>
    <asp:Repeater ID="uxAnnouncements" runat="server" DataSourceID="sqldatasource">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Body</th>
                    <th>Date</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td> <asp:LinkButton runat="server" ID="uxTitleButton" OnClick="TitleButton_Click"><%# Eval("Title") %></asp:LinkButton> </td>
                <td><%# Eval("Name") %></td>
                <td><%# Eval("Body") %></td>
                <td><%# Eval("Dateposted") %></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
