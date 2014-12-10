<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Announcement.aspx.cs" Inherits="MyWebDevProject.Announcement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Announcement</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Announcement</h1>

    <asp:FormView ID="uxFormView" runat="server">
        <ItemTemplate>
            <h2>
            <asp:Label ID="uxTitleLabel" runat="server" Text='<%# Bind("Title") %>' ></asp:Label>
            </h2>
            <h3>
                Date Posted:
                <asp:Label ID="uxDateLabel" runat="server" Text='<%# Bind("DatePosted") %>' ></asp:Label>
                </br>By:
                <asp:Label ID="uxNameLabel" runat="server" Text='<%# Bind("Name") %>' ></asp:Label>
            </h3>
           
           <p >
              <asp:Label ID="uxBodyLabel" runat="server" Text='<%# Bind("Body") %>'></asp:Label>
           </p>
        </ItemTemplate>
    </asp:FormView>
    <asp:GridView ID="uxGridView" runat="server">
     <Columns>
        
       <%--  <asp:TemplateField>
             <ItemTemplate>
                 <asp:Label ID="uxCommentLabel" runat="server" ></asp:Label>
             </ItemTemplate>
         </asp:TemplateField>--%>
     </Columns>
    </asp:GridView>
    <asp:LoginView ID="uxLogin" runat="server">
        <AnonymousTemplate>
            <asp:Label ID="uxAnonLabel" runat="server" Text="Login to post a comment."></asp:Label>
        </AnonymousTemplate>
        <LoggedInTemplate>
    <div>
        <asp:Label ID="uxNewComment" AssociatedControlID="uxCommentText" Text="Comment:" runat="server"></asp:Label>
        <asp:TextBox ID="uxCommentText" runat="server"></asp:TextBox>
        <asp:Button ID="uxSubmitComment" runat="server" Text="Submit" OnClick="uxSubmitComment_Click" />
    </div>
        </LoggedInTemplate>
        </asp:LoginView>
</asp:Content>
