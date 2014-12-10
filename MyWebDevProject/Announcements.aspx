<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Announcements.aspx.cs" Inherits="MyWebDevProject.Announcements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Announcements</title>
    <script src="jquery-1.11.1.min.js"></script>
      
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Announcements</h1>
    <asp:LoginView ID="uxLogin" runat="server" >
        <AnonymousTemplate>
            <p>You must log in to post new announcements.</p>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <div id="ShowHide">
                Add New Announcement
            </div>
           
            <p>Currently logged in as <asp:LoginName ID="uxLoginName" runat="server" />.</p>
             <div class="hidden" id="NewAnnounce">
            <fieldset id="uxFieldSet">
                <legend>Add New Announcement</legend>
                <asp:Label ID="uxTitleLabel" runat="server" AssociatedControlID="uxTitle">Title</asp:Label>
                <asp:TextBox ID="uxTitle" runat="server"></asp:TextBox>
                <asp:Label ID="uxBodyLabel" runat="server" AssociatedControlID="uxBody">Body</asp:Label>
                <asp:TextBox TextMode="MultiLine" ID="uxBody" runat="server" CssClass="formfield"></asp:TextBox>
                <asp:Button ID="uxsubmit" runat="server" Text="Submit" OnClick="uxsubmit_Click" OnClientClick="Hide" />
                </div>
            </fieldset>
        </LoggedInTemplate>
    </asp:LoginView>

    <asp:SqlDataSource ID="sqldatasource" ConnectionString="<%$ ConnectionStrings:SqlSecurityDB %>" SelectCommandType="Text" SelectCommand="select Title, Name, Body, Dateposted from announcement join userprofile on announcement.userid = userprofile.userid" runat="server"></asp:SqlDataSource>
 <asp:UpdatePanel runat="server">
     <ContentTemplate>
         <asp:UpdateProgress ID="uxProgress" runat="server">
             <ProgressTemplate>
                 Updating....
             </ProgressTemplate>
         </asp:UpdateProgress>

    
     <asp:Repeater ID="uxAnnouncements" runat="server" DataSourceID="sqldatasource">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>#</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Body</th>
                    <th>Date</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
               <tr>
                <td><%#(((RepeaterItem)Container).ItemIndex+1).ToString() %>. </td>
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
    </ContentTemplate>
 </asp:UpdatePanel>
    <script>
        $(document).ready(function () {
            $('#ShowHide').click(function () { $('#NewAnnounce').toggle(); });
        
            function Hide()
            {
                $('NewAnnounce').hide();
                
            }
        });
       
    </script>
</asp:Content>
