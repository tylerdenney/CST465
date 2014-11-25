using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace MyWebDevProject.Old_App_Code
{
    public class ProfilePersistance
    {
       public  void SaveProfile(ProfileData pd)
        {
            string userid = Membership.GetUser().ProviderUserKey.ToString();
           MembershipUser mu = Membership.GetUser();
           string email = mu.Email;
             SqlCommand command = new SqlCommand();
            command.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlSecurityDB"].ConnectionString);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "UserProfile_InsertUpdate";
            command.Parameters.AddWithValue("@UserId", userid);
            command.Parameters.AddWithValue("@Name", pd.Name);
            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@Hobbies", pd.Hobby);
            command.Parameters.AddWithValue("@FavoriteBands", pd.Band);
            command.Parameters.AddWithValue("@Biography", pd.Bio);

            try
            {
                command.Connection.Open();
                SqlDataReader rdr = command.ExecuteReader();

            }
            catch(Exception e)
            {

            }
           finally
            {
                command.Connection.Close();
            }
            SqlCommand command2 = new SqlCommand();
            command2.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlSecurityDB"].ConnectionString);
            command2.CommandType = System.Data.CommandType.Text;
            command2.CommandText = "INSERT INTO Courses VALUES(@UserID, @CoursePrefix, @CourseNumber, @CourseDescription);";
            command2.Parameters.AddWithValue("@UserId", userid);
            command2.Parameters.AddWithValue("@CoursePrefix", pd.CoursePrefix);
            command2.Parameters.AddWithValue("@CourseNumber", pd.CourseNumber);
            command2.Parameters.AddWithValue("@CourseDescription", pd.CourseDesc);
            try
            {
             
                command2.Connection.Open();
                command2.ExecuteNonQuery();
            }
           catch(Exception e)
            {

            }
           finally
            {

                command2.Connection.Close();
            }


        }
        public ProfileData LoadProfile()
       {
           string userid = Membership.GetUser().ProviderUserKey.ToString();
           List<string> data = new List<string>();
          
           SqlCommand command = new SqlCommand();
           command.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlSecurityDB"].ConnectionString);
           command.CommandType = CommandType.Text;
           command.CommandText = "SELECT Name, Hobbies, FavoriteBands, Biography FROM UserProfile WHERE UserId=@Person;";
           command.Parameters.AddWithValue("@Person", userid);

           SqlCommand command2 = new SqlCommand();
           command2.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlSecurityDB"].ConnectionString);
           command2.CommandType = CommandType.Text;
           command2.CommandText = "SELECT Prefix, Number, Description FROM Courses WHERE UserId=@Person;";
           command2.Parameters.AddWithValue("@Person", userid);
           try
           {
               command.Connection.Open();
               
               SqlDataReader reader = command.ExecuteReader();
               int i = 0;
               reader.Read();
              for (int k = 0; k < 4; k++)
              {
                data.Add(reader.GetString(i));
                ++i;
              }
               
               reader.Close();
               i = 0;
               command2.Connection.Open();
               SqlDataReader reader2 = command2.ExecuteReader();
               reader2.Read();               
               for (int k = 0; k < 3; k++)
               {
                 data.Add(reader2.GetString(i));
                 ++i;
               }
               
               reader2.Close();

               ProfileData pd = new ProfileData("User type is not stored in the database provided", data[0], data[1], data[2],data[3],data[4], data[5],data[6]);
               return pd;
           }
           catch (Exception ex)
           {
               ProfileData pd = new ProfileData("", "","","","","","","");
               return pd;
               //Handle the error, or throw
           }
           finally
           {
               command.Connection.Close();
               command2.Connection.Close();
           }

       }
    }
}