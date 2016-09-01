using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
/// <summary>
/// Summary description for clientTransferForm
/// </summary>
public class clientTransferForm
{
    public static bool CheckPlotAvailbiltyAndTransfer(string regno)
    {
        bool returnbool = false;
        string query = @"Select COUNT(*) as count_transfer
from Transfer_form
where regno = '"+regno+"'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        int result =int.Parse(dt.Rows[0][0].ToString());
        if (result>=1)
        {
            returnbool = true;
            conn.Close();
        }
        return returnbool;

    }
    public static string InsertBuyerData(string regno, string name, string relation_of, string applicant_cnic, string occupation, string present_address, string telephone, string mobile, string email, string permanent_address, string nominee_name, string nominee_address, string nominee_cnic, string nominee_no, byte[] image)
    {
        string returnmsg = "";
        if (checkClientExistance(applicant_cnic) == false)  //when client exists it will return false
        {
            if (checkPropertyFirstTransefer(regno) == true)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                con.Open();
                string buyer = "buyer";
                string savequery = @"insert into Transfer_form_information(name,relation_of,applicant_cnic,occupation,present_address,telephone,mobile,email,permanent_address,nominee_name,nominee_address,nominee_cnic,nominee_no,image,type) 
                                                                    values('" + name + "','" + relation_of + "','" + applicant_cnic + "','" + occupation + "','" + present_address + "','" + telephone + "','" + mobile + "','" + email + "','" + permanent_address + "','" + nominee_name + "','" + nominee_address + "','" + nominee_cnic + "','" + nominee_no + "',@image,'" + buyer + "')";
                SqlCommand cmd = new SqlCommand(savequery, con);
                cmd.Parameters.AddWithValue("@image", image);
                cmd.ExecuteNonQuery();
                int sellerid = getSellerID(regno);
                int buyerid = getBuyeriD(applicant_cnic);

                string SaveTransferFormQuery = @"insert into Transfer_form(buyer_id,seller_id,regno,date,transferform_image) Values('" + buyerid + "','" + sellerid + "','" + regno + "','" + System.DateTime.Now.ToString() + "',@image)";
                cmd = new SqlCommand(SaveTransferFormQuery, con);
                byte[] imge = new byte[10];
                cmd.Parameters.AddWithValue("@image", imge);//this image should be replaced
                cmd.ExecuteNonQuery();

                tranfer_form.UpdatapropertOwner(name, applicant_cnic, permanent_address, regno);//update property owener information

            }
            else
            {
                returnmsg = "Property is Not Transferred to first Client.Please First Transfer it to first Client";
            }
        }
        else
        {
            if (checkPropertyFirstTransefer(regno) == true)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                con.Open();

                int sellerid = getSellerID(regno);
                int buyerid = getBuyeriD(applicant_cnic);
                if (CheckAlreadyTransfer(buyerid, sellerid,regno) == false)
                {
                    string SaveTransferFormQuery = @"insert into Transfer_form(buyer_id,seller_id,regno,date,transferform_image) Values('" + buyerid + "','" + sellerid + "','" + regno + "','" + System.DateTime.Now.ToString() + "',@image)";
                    SqlCommand cmd = new SqlCommand(SaveTransferFormQuery, con);
                    byte[] imge = new byte[10];
                    cmd.Parameters.AddWithValue("@image", imge);//this image should be replaced
                    cmd.ExecuteNonQuery();

                    tranfer_form.UpdatapropertOwner(name, applicant_cnic, permanent_address, regno);//update property owener information
                }
                else
                {
                    returnmsg = "This Property iS also been Transferd";
                }

            }
        }
        return returnmsg;
    }
    public static int getBuyeriD(string Cnic)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        int sid = 1;
        string query = @"select id
from Transfer_form_information
where Transfer_form_information.applicant_cnic='"+Cnic+"';";//seller id should always bee 1;
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        int bid = int.Parse(dt.Rows[0][0].ToString());

        return bid;
    }
    public static int getSellerID(string regno)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        int sid = 1;
        string query = @"Select Transfer_form.buyer_id 
from Transfer_form
where regno='"+regno+"' order by CONVERT(DateTime, Transfer_form.date,101) desc;";//seller id should always bee 1;
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        int ssid= int.Parse(dt.Rows[0][0].ToString());

        return ssid;
    }
    public static bool CheckAlreadyTransfer(int bid,int sid,string regno)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        string query = @"Select count(*) 
from Transfer_form
where buyer_id='"+bid+"' AND seller_id='"+sid+"' AND regno='"+regno+"'";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        int count = int.Parse(dt.Rows[0][0].ToString());

        if (count == 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public static int sellerId()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        conn.Open();
        string query = "select id from dbo.Transfer_form_information where type='Adams_Garden'";
        SqlCommand sql = new SqlCommand(query, conn);
        int sid = Convert.ToInt32(sql.ExecuteScalar().ToString());

        return sid;
    }
    public static bool checkPropertyFirstTransefer(string regno)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        int sid = sellerId();//should get addams garden id by type = adamgarden
        string query = @"select count(*) from dbo.Transfer_form where regno='"+regno+"' And seller_id='"+sid+"'";//seller id should always bee 1;
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        int count = int.Parse(dt.Rows[0][0].ToString());
        if (count >= 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public static bool checkClientExistance(string cnic)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        int sid = 1;
        string query = @"select count(*) as clients from dbo.Transfer_form_information where applicant_cnic='"+cnic+"'";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        int count = int.Parse(dt.Rows[0][0].ToString());
        if (count == 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}

