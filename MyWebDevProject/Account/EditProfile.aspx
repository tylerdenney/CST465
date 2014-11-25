<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="EditProfile" Codebehind="EditProfile.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Edit Your Profile</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Edit your profile</h1>
     <div>
        <asp:Label runat="server" AssociatedControlID="uxUserType" ID="uxUserTypeLabel">Usere Type:</asp:Label>
         <asp:DropDownList ID="uxUserType" runat="server" AutoPostBack="true">
            <asp:ListItem Value="0" >--Select</asp:ListItem>
            <asp:ListItem Text="Student"></asp:ListItem>
            <asp:ListItem Text="Faculty"></asp:ListItem>
        </asp:DropDownList>
         <asp:RequiredFieldValidator ID="usertypeValidator" runat="server" ControlToValidate="uxUserType" ErrorMessage="Choose a user type!" InitialValue="0"></asp:RequiredFieldValidator>
         </br>
        <asp:Label runat="server" AssociatedControlID="uxName" ID="uxNameLabel">Name:</asp:Label>
        <asp:TextBox ID="uxName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="nameValidator" ControlToValidate="uxName" ErrorMessage="Enter a name!"></asp:RequiredFieldValidator>
         </br>
        <asp:Label runat="server" AssociatedControlID="uxHobby" ID="uxHobbyLabel">Hobby:</asp:Label>
        <asp:TextBox ID="uxHobby" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="hobbyValidator" ControlToValidate="uxHobby" ErrorMessage="Enter a hobby!"></asp:RequiredFieldValidator>
         </br>
        <asp:Label runat="server" AssociatedControlID="uxBand" ID="uxBandLabel">Band:</asp:Label>
        <asp:TextBox ID="uxBand" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="bandValidator" ControlToValidate="uxBand" ErrorMessage="Enter a band!"></asp:RequiredFieldValidator>
         </br>

        <p class="formfield">
            <asp:Label runat="server" AssociatedControlID="uxBiography" ID="uxBiograpyLabel">Biography:</asp:Label>
            <asp:TextBox ID="uxBiography" runat="server" TextMode="MultiLine" Columns="50" Rows="5"></asp:TextBox>

            <asp:RequiredFieldValidator runat="server" ID="biographyValidator" ControlToValidate="uxBiography" ErrorMessage="Enter some information about yourself!"></asp:RequiredFieldValidator>
        </p>
        <table>
        <thead>
            <tr>
                <th><asp:Label runat="server" AssociatedControlID="uxCoursePrefix" ID="uxCoursePrefixLabel">Course Prefix</asp:Label></th>
                <th><asp:Label runat="server" AssociatedControlID="uxCourseNumber" ID="uxCourseNumberLabel">Course Number</asp:Label></th>
                <th><asp:Label runat="server" AssociatedControlID="uxCourseDescription" ID="uxCourseDescriptionLabel">Course Description</asp:Label></th>
            </tr>
        </thead>
       <tbody>
            <tr>
              <td><asp:TextBox ID="uxCoursePrefix" runat="server"></asp:TextBox></td>
              <td><asp:TextBox ID="uxCourseNumber" runat="server"></asp:TextBox></td>
              <td><asp:TextBox ID="uxCourseDescription" runat="server"></asp:TextBox></td>
            </tr>
        </tbody>
    </table>
    <asp:RequiredFieldValidator runat="server" ID="courseprefixValidator" ControlToValidate="uxCoursePrefix" ErrorMessage="Enter a course prefix!"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator runat="server" ID="coursenumberValidator" ControlToValidate="uxCourseNumber" ErrorMessage="Enter a course number!"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator runat="server" ID="coursedescriptionValidator" ControlToValidate="uxCourseDescription" ErrorMessage="Enter a course description!"></asp:RequiredFieldValidator>
    </br>
    <asp:Button runat="server" Text="Save Profile" ID="uxSubmit" OnClick="uxSubmit_Click" />


    <asp:ValidationSummary enabled="true" ShowSummary="true" runat="server" HeaderText="Complete the following:"  />
   <!-- <asp:Literal runat="server" ID="uxIsPostBack"><br /><br /><br /></asp:Literal>
    <asp:Literal runat="server" ID ="uxFormOutput"><br /><br /><br /></asp:Literal>
    <asp:Literal runat="server" ID ="uxEventOutput"><br /><br /><br /></asp:Literal> !-->


    </div>
</asp:Content>

