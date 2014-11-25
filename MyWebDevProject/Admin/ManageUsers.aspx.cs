using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
namespace MyWebDevProject.Admin
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uxCreateButton_Click(object sender, EventArgs e)
        {
            Roles.CreateRole(uxAddRoles.Text);
        }

        protected void uxAddUserToRoleButton_Click(object sender, EventArgs e)
        {
            Roles.AddUserToRole(uxUsersDropDown.SelectedValue, uxRolesDropDown.SelectedValue);
        }
    }
}