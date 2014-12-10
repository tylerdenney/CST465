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
    public partial class Announcement : System.Web.UI.Page
    {
        int currentid = 0;
        protected void Page_Init(object sender, EventArgs e)
        {
            int id = 0;
            string ids = Request.QueryString["id"];
            Int32.TryParse(ids, out id);
            id++;
            currentid = id;
            SqlCommand command = new SqlCommand();
            command.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlSecurityDB"].ConnectionString);
            command.CommandType = System.Data.CommandType.Text;
            command.CommandText = "select Title,Body,DatePosted, Name  from announcement join userprofile on announcement.userid = userprofile.userid where id=@id";
            command.Parameters.AddWithValue("@id", id);

            SqlCommand command2 = new SqlCommand();
            command2.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlSecurityDB"].ConnectionString);
            command2.CommandType = System.Data.CommandType.Text;
            command2.CommandText = "select Name, Comment, AnnouncementComment.DatePosted from announcementcomment join announcement on Announcement.ID = AnnouncementComment.announcementID join Userprofile on AnnouncementComment.UserId = UserProfile.UserId where announcement.id=@id";
            command2.Parameters.AddWithValue("@id", id);


            try
            {
                command.Connection.Open();
                SqlDataReader rdr = command.ExecuteReader();
                uxFormView.DataSource = rdr;
                uxFormView.DataBind();
                rdr.Close();
            }
            catch(Exception ex)
            {
            }
            finally 
            { 
                command.Connection.Close(); 
            }
            try
            {
                command2.Connection.Open();
                SqlDataReader rdr2 = command2.ExecuteReader();
                uxGridView.DataSource = rdr2;
                uxGridView.DataBind();
                rdr2.Close();
            }
            catch(Exception ex2)
            {
            }
            finally
            {
                command2.Connection.Close();
            }
            

        }

        protected void uxSubmitComment_Click(object sender, EventArgs e)
        {
            TextBox commtxt = (TextBox)uxLogin.FindControl("uxCommentText");
            string comment = commtxt.Text;
            string userid = Membership.GetUser().ProviderUserKey.ToString();
            DateTime date = DateTime.Now;


            SqlCommand command = new SqlCommand();
            command.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlSecurityDB"].ConnectionString);
            command.CommandType = System.Data.CommandType.Text;
            command.CommandText = "INSERT INTO AnnouncementComment VALUES(@ID, @UserID, @Comment, @Date);";
            command.Parameters.AddWithValue("@ID", currentid);
            command.Parameters.AddWithValue("@UserID",userid);
            command.Parameters.AddWithValue("@Comment", comment);
            command.Parameters.AddWithValue("@Date", date);
            try
            {

                command.Connection.Open();
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                command.Connection.Close();
            }

        }
    }
}