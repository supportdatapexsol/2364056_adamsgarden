using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

using System.Linq;
using System.Web;

/// <summary>
/// Summary description for adminlogin
/// </summary>
/// 
namespace adamsgarden
{
    public class adminlogin
{
        public adminlogin()
        {

        }
    
        // TODO: Add constructor logic here

            //
        
        public static bool login1(String username, string password)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            String checkUser = "select count(*) from dbo.admin_reg_db where username='" + username + "'";

            conn.Open();
            SqlCommand cmd = new SqlCommand(checkUser, conn);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            //  cmd.BeginExecuteNonQuery();

            conn.Close();
            if (temp == 1)
            {
                conn.Open();
                String checkPassword = "select password from dbo.admin_reg_db where username='" + username + "'";
                SqlCommand passCommamd = new SqlCommand(checkPassword, conn);
                String password1 = passCommamd.ExecuteScalar().ToString().Replace(" ", "");
                if (password1 == password)
                {
                    //  Session["New"] = uname.Text;
                    return true;
                    //Response.Write("Password is correct ! ");
                }
                else
                {
                    return false;
                    //Response.Write("Password is incorrect ! ");
                }

                //                Response.Write("User already exists ! ");
            }
            else
            {
                /* string q1 = "What was the last name of your third grade teacher";
                 string q2 = "When you were young what did you want to be when you grew up?";
                 string  str3 = "What was your childhood nickname?";
                 SqlCommand comand = new SqlCommand("insert into dbo.security values(, @sec1,@sec2,@sec3)", conn);


                 comand.Parameters.AddWithValue("@sec1",q1);
                 comand.Parameters.AddWithValue("@sec2",q2);
                 comand.Parameters.AddWithValue("@sec3", str3 );
                 if (conn.State == ConnectionState.Closed)
                 {
                     conn.Open();
                 }
                 comand.ExecuteNonQuery();

                 conn.Close();*/
                return false;
                // Response.Write("User name is incorrect ! ");
            }
        }

}
}