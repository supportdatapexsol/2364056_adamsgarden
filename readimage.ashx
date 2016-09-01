<%@ WebHandler Language="C#" Class="readimage" %>
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

using System;
using System.Web;

public class readimage : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select [image] from dbo.client_info where id =@ID";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = conn;

        SqlParameter ImageID = new SqlParameter("@ID", SqlDbType.Int);
        ImageID.Value = context.Request.QueryString["id"];
        cmd.Parameters.Add(ImageID);
        conn.Open();
        SqlDataReader dReader = cmd.ExecuteReader();
        dReader.Read();
        context.Response.BinaryWrite((byte[])dReader["image"]);
        dReader.Close();
        conn.Close();
        //sadasdasdad
    }
    public bool IsReusable {
        get {
            return false;
        }
    }


}