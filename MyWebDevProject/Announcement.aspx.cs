using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWebDevProject
{
    public partial class Announcement : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            int id = 0;
            string ids = Request.QueryString["id"];
            Int32.TryParse(ids, out id);
            id++;
            SqlCommand command = new SqlCommand();
            command.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlSecurityDB"].ConnectionString);
            command.CommandType = System.Data.CommandType.Text;
            command.CommandText = "select Title,Body,DatePosted, Name  from announcement join userprofile on announcement.userid = userprofile.userid where id=@id";
            command.Parameters.AddWithValue("@id", id);

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
            

        }
    }
}