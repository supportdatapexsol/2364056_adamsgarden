using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Class1
{
    public Class1()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static int buyerid(string reg)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        conn.Open();
        //SqlDataAdapter da = new SqlDataAdapter("select * from dbo.client_info  order by id DESC", conn);
        string query = "select buyer_id from dbo.Transfer_form where regno='" + reg + "' order by buyer_id asc;";
        SqlCommand sql = new SqlCommand(query, conn);
        int temp = Convert.ToInt32(sql.ExecuteScalar().ToString());

        return temp;
    }
    public static DataTable buyerinfo(string regno)
    {
        int buyerid1 = buyerid(regno);

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        string q = @"SELECT *
FROM dbo.Transfer_form_information
INNER JOIN dbo.Transfer_form on dbo.Transfer_form_information.Id=dbo.Transfer_form.buyer_id
WHERE dbo.Transfer_form.regno="+regno+"  Order by dbo.Transfer_form_information.Id asc ;";

        con.Open();
        SqlCommand cmd = new SqlCommand(q, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        cmd.ExecuteNonQuery();
        con.Close();
        return dt;
    }
}