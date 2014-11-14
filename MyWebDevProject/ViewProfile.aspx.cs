﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ProfileData pdata = (ProfileData)Session["ProfileData"];
        uxName.Text = pdata.Name;
        uxHobby.Text = pdata.Hobby;
        uxBand.Text = pdata.Band;
        uxBio.Text = pdata.Bio;
        uxPrefix.Text = pdata.CoursePrefix;
        uxNumber.Text = pdata.CourseNumber;
        uxDescription.Text = pdata.CourseDesc;
        uxType.Text = pdata.UserType;
    }
}