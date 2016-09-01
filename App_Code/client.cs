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
    public static string clientRegistration(string regNo, string name, string relation, string postalAddress, string profession, string phone, string cnic,
           string inFavorOf, string jsAccount, string cashOrderNo, string amount, string amountInWords, string selectedDate)
    {
        string returnmsg = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
       // if client does not exist and regnois not in db then add client infooo 
        if (checkClientExistance(cnic) == false && checkRegnoAvalibilty(regNo) == true)
        {

            
            string pic = "0xFFD8FFE000104A46494600010101019001900000FFE110EE4578696600004D4D002A000000080004013B00020000000C0000084A8769000400000001000008569C9D000100000018000010CEEA1C00070000080C0000003E000000001CEA00000008000000000000000000000000000000000000000000000000000000000000";
            byte[] image = Encoding.UTF8.GetBytes(pic);
            SqlCommand cmd = new SqlCommand("insert into dbo.client_info(name,relation_of,applicant_cnic,occupation,present_address,telephone,mobile,email,permanent_address,nominee_name,nominee_address,nominee_cnic,nominee_no,image) values(@name,@relation_of,@applicant_cnic,@occupation,@present_address,@telephone,@mobile,@email,@permanent_address,@nominee_name,@nominee_address,@nominee_cnic,@nominee_no,@image)", con);
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
        }
        //if client regno not in db then 
        if(checkRegnoAvalibilty(regNo) == true) { 
            int clientId = applicant_info.getClientId(cnic); //getting client id

            //payment
            SqlCommand cmd = new SqlCommand("insert into dbo.payment values( @amountin_rs, @date,@client_id, @propertyid,@amount_in_words,@type,@payment_made_through,@infavour_of,@jsbankaccount,@cash_payorder_no,@property_registration)", con);
            cmd.Parameters.AddWithValue("@amountin_rs", amount);//not in the form
            cmd.Parameters.AddWithValue("@date", selectedDate);
            cmd.Parameters.AddWithValue("@client_id", clientId);
            cmd.Parameters.AddWithValue("@propertyid", "");
            cmd.Parameters.AddWithValue("@amount_in_words", amountInWords);
            cmd.Parameters.AddWithValue("@type", "membership");//must b change to downpayment
            cmd.Parameters.AddWithValue("@payment_made_through", "Cash");
            cmd.Parameters.AddWithValue("@infavour_of", inFavorOf);
            cmd.Parameters.AddWithValue("@jsbankaccount", jsAccount);
            cmd.Parameters.AddWithValue("@cash_payorder_no", cashOrderNo);
            cmd.Parameters.AddWithValue("@property_registration",regNo);
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
            cmd.ExecuteScalar();
            con.Close();


        }else
        {
            returnmsg = "This registration no is Already Exist";
        }
        
        
           return returnmsg;

        


        // string query = "insert into dbo.client_info(name,relation_of,
        //applicant_cnic,occupation,permanent_address,) values('" + name + "','" + fathername + "','"++"','"++"')";
}
   
   
    public static DataTable viewClients()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        // Create a command object.

        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from dbo.client_info where email!='' AND nominee_name!='' AND nominee_cnic!=''", conn);
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
        SqlDataAdapter da = new SqlDataAdapter(@"select top 1 dbo.client_info.* 
from dbo.client_info 
inner join dbo.property_info on dbo.client_info.Id=dbo.property_info.client_id
where dbo.property_info.registrationo='"+cnic+"' or dbo.client_info.applicant_cnic='"+cnic+"'", conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "client_info");
        DataTable dt = ds.Tables["client_info"];
        int count = dt.Rows.Count;
        return dt;
    }
    public static DataTable getClientByRegno(string regno)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        // Create a command object.

        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(@"select * 
from dbo.client_info
inner join dbo.property_info on dbo.client_info.id = dbo.property_info.client_id
 where dbo.property_info.registrationo = '"+regno+"'; ", conn);
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
    public static bool update(int cid, string name, string sof, string cnic, string occupation, string paddress,
      string telephone, string mobile, string email,
      string peraddress, string nname, string naddress, string ncnic, string nno, byte[] image, string rno)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //     cmd.CommandText = "UPDATE dbo.property_info SET plot_no=@plot_no,plot_size=@plot_size, street_no=@street_no, plot_address= @plot_address, owner_property_name = @owner_property_name, owner_property_address =@owner_property_address,property_type=@property_type,owner_property_cnic=@owner_property_cnic WHERE Id='" + id + "'";


        cmd.CommandText = @"UPDATE dbo.client_info SET name=@name, relation_of=@relation,
            applicant_cnic=@applicant_cnic, occupation=@occupation,present_address=@present_address,
telephone=@telephone,mobile=@mobile,email=@email,permanent_address=@peradd,nominee_name=@nname,
nominee_address=@nadd,
nominee_cnic=@ncnic,nominee_no=@nno,image=@image
            WHERE Id=@id";




        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@id", SqlDbType.Int).Value = cid;
        cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = name;
        cmd.Parameters.Add("@applicant_cnic", SqlDbType.NVarChar, 50).Value = cnic;
        cmd.Parameters.AddWithValue("@relation", sof);
        cmd.Parameters.AddWithValue("@present_address", paddress);
        cmd.Parameters.AddWithValue("@occupation", occupation);
        cmd.Parameters.AddWithValue("@address", paddress);
        cmd.Parameters.AddWithValue("@telephone", telephone);
        cmd.Parameters.AddWithValue("@mobile", mobile);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@peradd", peraddress);

        cmd.Parameters.AddWithValue("@nname", nname);

        cmd.Parameters.AddWithValue("@nadd", naddress);

        cmd.Parameters.AddWithValue("@ncnic", ncnic);
        cmd.Parameters.AddWithValue("@nno", "123");

        cmd.Parameters.AddWithValue("@image", image);

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
    public static bool checkClientExistance(String cnic)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        String checkUser = "select count(*) from dbo.client_info where applicant_cnic='" + cnic + "'";

        conn.Open();
        SqlCommand cmd = new SqlCommand(checkUser, conn);
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        //  cmd.BeginExecuteNonQuery();

        conn.Close();
        if (temp >= 1)
        {
            return true;

        }
        else
        {

            return false;

        }
    }
    public static bool checkRegnoAvalibilty(String regno)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        String checkUser = "select count(*) from dbo.property_info where registrationo='" + regno+ "'";

        conn.Open();
        SqlCommand cmd = new SqlCommand(checkUser, conn);
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        //  cmd.BeginExecuteNonQuery();

        conn.Close();
        if (temp >= 1)
        {
            return false;

        }
        else
        {

            return true;

        }
    }
}