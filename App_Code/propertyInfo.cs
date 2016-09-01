using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for propertyInfo
/// </summary>
public class propertyInfo
{
    public propertyInfo()
    {
        //
        // TODO: Add constructor logic here
        //
    }
   public static bool addProperties(string ptype,string cost, string plotsize, string location, string clientId,string adsId)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

        SqlCommand cmd1 = new SqlCommand("insert into dbo.property_info values( @propertyType, @cost,@plotsize,@location, @clientId, @adsId)", conn);

        cmd1.Parameters.AddWithValue("@propertyType", ptype);
        cmd1.Parameters.AddWithValue("@cost", cost);
        cmd1.Parameters.AddWithValue("@plotsize", plotsize);
        cmd1.Parameters.AddWithValue("@location", location);
        cmd1.Parameters.AddWithValue("@clientId", clientId);
        cmd1.Parameters.AddWithValue("@adsId", adsId);



        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
        cmd1.ExecuteNonQuery();

        conn.Close();
        return true;
    }
}