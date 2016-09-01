using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for applicant_info
/// </summary>
public class applicant_info
{
    public applicant_info()
    { }
        //
        // TODO: Add constructor logic here
        //



        public static bool registerApplicant(String username, string password)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            String applicantInfo = "insert into dbo.applicant_info values( @uname, @pass,@address, @phone, @mobile,@image)";

            conn.Open();
            SqlCommand cmd = new SqlCommand(applicantInfo, conn);
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
           
                return false;
                // Response.Write("User name is incorrect ! ");
            }
    }
}
