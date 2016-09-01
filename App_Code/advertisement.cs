using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for advertisement
/// </summary>
public class advertisement
{
    public advertisement()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static DataTable bindAdvertisement()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select id,image,slider_status from dbo.advertisement", conn);
        // SqlCommand cmd = new SqlCommand("select* from dbo.advertisement where slider_status='advertisement'", conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        conn.Close();
        return dt;
    }
    public static bool insertAdvertisement(byte[] msdata, string status1)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

        SqlCommand cmd = new SqlCommand("insert into dbo.advertisement values(@image,@slider_status,@content)", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("@image", msdata);
        cmd.Parameters.AddWithValue("@slider_status", status1);
        cmd.Parameters.AddWithValue("@content", "2");
        bool IsInserted = cmd.ExecuteNonQuery() > 0;
        conn.Close();
        return IsInserted;

    }
    public static bool updateAdvertisement(string id, byte[] msdata1, string stat)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "UPDATE dbo.advertisement SET image = @fu,slider_status=@stat WHERE id = @id";
        // cmd.CommandText = "UPDATE dbo.advertisement SET image = @fu,slider_status=@status WHERE id = @id";
        cmd.CommandType = CommandType.Text;



        cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;


        cmd.Parameters.AddWithValue("@fu", msdata1);
        cmd.Parameters.Add("@stat", SqlDbType.NVarChar, 50).Value = stat;
        //        cmd.Parameters.AddWithValue("@image",fu);
        // cmd.Parameters.Add("@image", SqlDbType.Int).Value = msdata1;
        conn.Open();
        // cmd.ExecuteNonQuery();
        bool IsUpdated = cmd.ExecuteNonQuery() > 0;
        conn.Close();
        return IsUpdated;
        //BindGridView();
    }
    public static bool deleteAdvertisement(string id)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        SqlCommand cmd = new SqlCommand();

        cmd.Connection = conn;

        cmd.CommandText = "DELETE FROM dbo.advertisement WHERE id = @id";

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;

        conn.Open();
        bool IsDeleted = cmd.ExecuteNonQuery() > 0;
        conn.Close();
        return IsDeleted;
    }
   

    public static DataTable returnAvertisementImage()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select image from dbo.advertisement where slider_status='advertisement'", conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        
        da.Fill(dt);
        conn.Close();
        return dt;
    }
    public static DataTable returnSliderImage()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select image from dbo.advertisement where slider_status='slider'", conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        conn.Close();
        return dt;
    }
   public static Image convertbytetoimage(byte[] byteArrayIn)
    {
        MemoryStream ms = new MemoryStream(byteArrayIn);
        Image img = Image.FromStream(ms);
        return img;
    }
   /* public static byte[] convertbytetoimage(byte image)
    {
        BinaryReader br = new BinaryReader(image);
        Byte[] bytes = br.ReadBytes((Int32)fs.Length);
        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);

        Image1.ImageUrl = "data:image/jpeg;base64," + base64String;
        //  FileUpload1.PostedFile.InputStream.Read(msdata, 0, image);
        return img;
    }*/

}