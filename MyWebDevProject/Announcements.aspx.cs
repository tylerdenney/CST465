using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWebDevProject
{
    public partial class Announcements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uxsubmit_Click(object sender, EventArgs e)
        {

            TextBox titletxt = (TextBox)uxLogin.FindControl("uxTitle");
            string title = titletxt.Text;
            TextBox bodytxt = (TextBox)uxLogin.FindControl("uxBody");
            string body = bodytxt.Text;
            string userid = Membership.GetUser().ProviderUserKey.ToString();
            DateTime date = DateTime.Now;

            SqlCommand command = new SqlCommand();
            command.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlSecurityDB"].ConnectionString);
            command.CommandType = System.Data.CommandType.Text;
            command.CommandText = "INSERT INTO Announcement VALUES(@Userid, @Title, @Body, @Date);";
            command.Parameters.AddWithValue("@Userid", userid);
            command.Parameters.AddWithValue("@Title", title);
            command.Parameters.AddWithValue("@Body", body);
            command.Parameters.AddWithValue("@Date", date);

            try
            {

                command.Connection.Open();
                command.ExecuteNonQuery();
                uxAnnouncements.DataBind();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                command.Connection.Close();

            }
        }

        protected void TitleButton_Click(object sender, EventArgs e)
        {
            LinkButton r = sender as LinkButton;
            string id = ((RepeaterItem)r.NamingContainer).ItemIndex.ToString();
            Response.Redirect("Announcement.aspx?id=" + id);
           

        }
    }
}