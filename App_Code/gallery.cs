using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for gallery
/// </summary>
public class gallery
{
    public gallery()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static bool addItem(byte []msdata,string date )
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("insert into dbo.gallery values( @image, @date)", conn);
        cmd.Parameters.AddWithValue("@image", msdata);
        cmd.Parameters.AddWithValue("@date", date);

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
        cmd.ExecuteNonQuery();

        conn.Close();
        return true;
    }
}