using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for viewtranfserform
/// </summary>
public class viewtranfserform
{
    public viewtranfserform()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static DataTable getTransferForms()
    {
        string query = @"select Transfer_form.Id,Transfer_form.regno,Transfer_form.date as TransferDate,property_info.plot_no,property_info.plot_size
from dbo.Transfer_form
inner join dbo.property_info on dbo.Transfer_form.regno=dbo.property_info.registrationo;";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        cmd.ExecuteNonQuery();
        con.Close();
        return dt;
    }
    public static DataTable getTransferBuyerInfo(int id,string regno)
    {
        string query = @" select *
from dbo.Transfer_form
inner join dbo.Transfer_form_information on dbo.Transfer_form_information.id= dbo.Transfer_form.buyer_id or dbo.Transfer_form_information.id= dbo.Transfer_form.seller_id
where Transfer_form.id="+id+" And Transfer_form.regno="+regno+";";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        cmd.ExecuteNonQuery();
        con.Close();
        return dt;
    }
    public static DataTable getTransfersellerInfo(string regno, string date)
    {
        string query = @" select *
from dbo.Transfer_form
inner join dbo.Transfer_form_information on dbo.Transfer_form_information.id= dbo.Transfer_form.seller_id
where Transfer_form.regno=" + regno + " ;";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        cmd.ExecuteNonQuery();
        con.Close();
        return dt;
    }
    //getting buyer info
    public static DataTable sellerinfo(string id)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        string q = @"SELECT *
FROM  dbo.Transfer_form
INNER JOIN dbo.Transfer_form_information on dbo.Transfer_form_information.Id=dbo.Transfer_form.seller_id or dbo.Transfer_form_information.Id=dbo.Transfer_form.seller_id
WHERE dbo.Transfer_form.Id=" + id + " ;";
        /*  string q = @"SELECT *
  FROM dbo.client_info
  INNER JOIN dbo.property_info on dbo.client_info.ID=dbo.property_info.client_id
  WHERE dbo.property_info.registrationo=" + regno + " ;"; 
  
        string q = @"SELECT *
FROM dbo.Transfer_form_information
INNER JOIN dbo.Transfer_form on dbo.Transfer_form_information.Id=dbo.Transfer_form.seller_id
WHERE dbo.Transfer_form.regno="+id+"  Order by dbo.Transfer_form_information.Id Desc  ;";
        /* string query = @" select *
 from dbo.client_info
 inner join dbo.property_info on dbo.Transfer_form_information.id= dbo.Transfer_form.seller_id where Transfer_form.regno=" + regno + " ;";
   */
        con.Open();
        SqlCommand cmd = new SqlCommand(q, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        cmd.ExecuteNonQuery();
        con.Close();
        return dt;
    }
    //getting buyer info
    public static DataTable gettingbuyerinfo(int id)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        string q = @"SELECT *
FROM  dbo.Transfer_form
INNER JOIN dbo.Transfer_form_information on dbo.Transfer_form_information.Id=dbo.Transfer_form.buyer_id or dbo.Transfer_form_information.Id=dbo.Transfer_form.seller_id
INNER JOIN dbo.property_info on dbo.property_info.registrationo=dbo.Transfer_form.regno
WHERE dbo.Transfer_form.Id=" + id + ";";
   
        con.Open();
        SqlCommand cmd = new SqlCommand(q, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        cmd.ExecuteNonQuery();
        con.Close();
        return dt;
    }
    public static DataTable getData(String reg)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        DataTable dt = new DataTable();
        conn.Open();
        string query = @"select * from dbo.client_info 
inner join dbo.property_info on dbo.property_info.client_id = dbo.client_info.Id
inner join dbo.payment on dbo.payment.client_id = dbo.client_info.Id where dbo.property_info.registrationo='" + reg + "'; ";
        SqlDataAdapter sd = new SqlDataAdapter(query, conn);
        sd.Fill(dt);
        conn.Close();
        return dt;
    }
}