using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProfile : System.Web.UI.Page
{
    private ProfileData pdata = null;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void uxSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            pdata = new ProfileData(uxUserType.Text, uxName.Text, uxHobby.Text, uxBand.Text, uxBiography.Text, uxCoursePrefix.Text, uxCourseNumber.Text, uxCourseDescription.Text);
            Session["ProfileData"] = pdata;
            Response.Redirect("ViewProfile.aspx");
        }
    }

}