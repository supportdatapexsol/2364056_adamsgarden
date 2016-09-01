using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
        
        public static bool login1(String username, string pass)
        {
            bool checkbool = false; 
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            String query = "select * from dbo.admin_reg_db where username='" + username + "' AND password='"+pass+"'";
            try
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataSet ds = new DataSet();
                da.Fill(ds, "login");
                DataTable dt = ds.Tables["login"];
                int count = dt.Rows.Count;
                if (count >= 1)
                {
                    if (dt.Rows[0]["username"].ToString() == username && dt.Rows[0]["password"].ToString() == pass)
                    {
                        checkbool = true;
                    }
                }
                
            }
            catch (Exception e)
            {
                Console.WriteLine("Error: " + e);
            }
            finally
            {
                conn.Close();
            }
           
            //  cmd.BeginExecuteNonQuery();

            conn.Close();
            return checkbool;
           
        }
        public static DataTable view(string username)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            String cmd = "select * from dbo.admin_reg_db where username='"+ username + "';";

            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;

        }

        public static bool updateProfile(string name, string pass, string ans1, string ans2, string ans3, int id)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;


            cmd.CommandText = @"UPDATE dbo.admin_reg_db 
                        SET username=@name, password=@pass,
            ans1=@ans_1, ans2=@ans_2,ans3=@ans_3 WHERE Id='" + id + "'";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = name;
            cmd.Parameters.Add("@pass", SqlDbType.NVarChar, 50).Value = pass;
            cmd.Parameters.AddWithValue("@ans_1", ans1);
            cmd.Parameters.AddWithValue("@ans_2", ans2);
            cmd.Parameters.AddWithValue("@ans_3", ans3);


            conn.Open();
            bool IsUpdated = cmd.ExecuteNonQuery() > 0;
            conn.Close();
            return IsUpdated;

        }

    }
}