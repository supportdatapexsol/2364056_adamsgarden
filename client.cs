using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Text;

/// <summary>
/// Summary description for client
/// </summary>
public class client
{
    public client()
    {
        //
    }  // TODO: Add constructor logic here
    public static bool clientRegistration(string regNo, string name, string relation, string postalAddress, string profession, string phone, string cnic,
           string inFavorOf, string jsAccount, string cashOrderNo, string amount, string amountInWords)
    {
        SqlCommand cmd;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        bool checkClientExist = applicant_info.checkClient(cnic);
        if (checkClientExist == false)
        {
           
            string pic = "0xFFD8FFE000104A46494600010101019001900000FFE110EE4578696600004D4D002A000000080004013B00020000000C0000084A8769000400000001000008569C9D000100000018000010CEEA1C00070000080C0000003E000000001CEA00000008000000000000000000000000000000000000000000000000000000000000";
            byte[] image = Encoding.UTF8.GetBytes(pic);
            cmd = new SqlCommand("insert into dbo.client_info values(@name,@relation_of,@applicant_cnic,@occupation,@present_address,@telephone,@mobile,@email,@permanent_address,@nominee_name,@nominee_address,@nominee_cnic,@nominee_no,@image,@registeration_no)", con);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@relation_of", relation);
            cmd.Parameters.AddWithValue("@applicant_cnic", cnic);
            cmd.Parameters.AddWithValue("@occupation", profession);
            cmd.Parameters.AddWithValue("@present_address", postalAddress);
            cmd.Parameters.AddWithValue("@telephone", phone);
            cmd.Parameters.AddWithValue("@registeration_no", regNo);

            //  @mobile,@email,@permanent_address,@nominee_name,@nominee_address,@nominee_cnic,@nominee_no,@image

            cmd.Parameters.AddWithValue("@mobile", "");
            cmd.Parameters.AddWithValue("@email", "");
            cmd.Parameters.AddWithValue("@permanent_address", "");
            cmd.Parameters.AddWithValue("@nominee_name", "");
            cmd.Parameters.AddWithValue("@nominee_address", "");
            cmd.Parameters.AddWithValue("@nominee_cnic", "");
            cmd.Parameters.AddWithValue("@nominee_no", "");
            cmd.Parameters.AddWithValue("@image", image);


            //    bool check = adamsgarden.adminlogin.login1(name.Text, cnic.Text);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            cmd.ExecuteScalar();
            }// IF CONDITION CLOSED
            int clientId = applicant_info.getClientId(cnic); //getting client id

            //payment
            cmd = new SqlCommand("insert into dbo.payment values( @amountin_rs, @date,@client_id, @propertyid,@amount_in_words,@type,@payment_made_through,@infavour_of,@jsbankaccount,@cash_payorder_no)", con);
            cmd.Parameters.AddWithValue("@amountin_rs", amount);//not in the form
            cmd.Parameters.AddWithValue("@date", System.DateTime.Today.ToShortDateString());
            cmd.Parameters.AddWithValue("@client_id", clientId);
            cmd.Parameters.AddWithValue("@propertyid", "");
            cmd.Parameters.AddWithValue("@amount_in_words", amountInWords);
            cmd.Parameters.AddWithValue("@type", "membership");//must b change to downpayment
            cmd.Parameters.AddWithValue("@payment_made_through", "");
            cmd.Parameters.AddWithValue("@infavour_of", inFavorOf);
            cmd.Parameters.AddWithValue("@jsbankaccount", jsAccount);
            cmd.Parameters.AddWithValue("@cash_payorder_no", cashOrderNo);

        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        cmd.ExecuteScalar();
            cmd = new SqlCommand("insert into dbo.property_info values( @plot_no, @plotsize,@clientid, @streetno,@plotAddress,@ownerproperty_name,@ownerproperty_address,@property_type,@Owener_property_cnic,@installment_plan,@registrationo)", con);

            cmd.Parameters.AddWithValue("@plot_no", "");
            cmd.Parameters.AddWithValue("@plotsize", "");
            cmd.Parameters.AddWithValue("@clientid", clientId);
            cmd.Parameters.AddWithValue("@streetno", "");
            cmd.Parameters.AddWithValue("@plotAddress", "");
            cmd.Parameters.AddWithValue("@ownerproperty_name", "");// should be from client side

            cmd.Parameters.AddWithValue("@ownerproperty_address", "");
            cmd.Parameters.AddWithValue("@property_type", "");
            cmd.Parameters.AddWithValue("@Owener_property_cnic", "");// shoud be from client side
            cmd.Parameters.AddWithValue("@installment_plan", "");
            cmd.Parameters.AddWithValue("@registrationo", regNo);
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        if (temp>1)
        {
            con.Close();
            return true;
        }
        else
        {
            return true;
        }
           
            
        

        


        // string query = "insert into dbo.client_info(name,relation_of,
        //applicant_cnic,occupation,permanent_address,) values('" + name + "','" + fathername + "','"++"','"++"')";
}
   
   
    public static DataTable viewClients()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        // Create a command object.

        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from dbo.client_info", conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "client_info");
        DataTable dt = ds.Tables["client_info"];
        int count = dt.Rows.Count;
        return dt;
    }
    public static DataTable viewClients(string cnic)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        // Create a command object.

        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from dbo.client_info where dbo.client_info.applicant_cnic='"+cnic+"' OR registeration_no='"+cnic+"'", conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "client_info");
        DataTable dt = ds.Tables["client_info"];
        int count = dt.Rows.Count;
        return dt;
    }

    public static byte[] getimage(int id)
    {
        byte[] img = null;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        // Create a command object.

        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select image from dbo.client_info where Id='"+id+"'", conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "image");
        DataTable dt = ds.Tables["image"];
        int count = dt.Rows.Count;
        foreach (DataRow row in dt.Rows)
        { 
            img = (byte[])row["image"];
        }
        return img;
    }
    public static bool updatclient(int id, string name,string relationof, string applicant_cnic, string occupation, string present_address, string telephone, string mobile, string email, string permanent_address, string nominee_name,string nominee_address,string nominee_cnic,string nominee_no,byte[] image,string registeration_no)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        // Create a command object.
       string query = "UPDATE dbo.client_info SET name='"+name+"',applicant_cnic='"+applicant_cnic+ "',occupation='"+occupation+ "',present_address='"+present_address+ "',telephone='"+telephone+ "',mobile='"+mobile+ "',email='"+email+ "',permanent_address='"+permanent_address+ "',nominee_name='"+nominee_name+ "',nominee_address='"+nominee_address+ "',nominee_cnic='"+nominee_cnic+ "',nominee_no='"+nominee_no+ "',image=@binaryValue,registeration_no='" + registeration_no+"' where Id='"+id+"'";
        SqlCommand cmd = new SqlCommand(query,conn);
        cmd.Parameters.Add("@binaryValue", SqlDbType.VarBinary).Value = image;
        conn.Open();
        bool IsUpdated = cmd.ExecuteNonQuery() > 0;
        conn.Close();
        return IsUpdated;
    }
    public static bool deleteInstallments(int cid)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            // Create a command object.
            SqlCommand cmd = new SqlCommand();

            // Assign the connection to the command.
            cmd.Connection = conn;

            // Set the command text
            // SQL statement or the name of the stored procedure 
            cmd.CommandText = "DELETE FROM dbo.client_info WHERE id = @cid";

            // Set the command type
            // CommandType.Text for ordinary SQL statements; 
            // CommandType.StoredProcedure for stored procedures.
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@cid", SqlDbType.Int).Value = cid;

            conn.Open();
            bool IsDeleted = cmd.ExecuteNonQuery() > 0;
            conn.Close();
            return IsDeleted;
        }
    }
    public static Image byteArrayToImage(byte[] byteArrayIn)
    {
        MemoryStream ms = new MemoryStream(byteArrayIn);
        Image returnImage = Image.FromStream(ms);
        return returnImage;
    }
   
}