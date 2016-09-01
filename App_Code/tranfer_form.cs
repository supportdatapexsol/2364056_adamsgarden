using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
/// <summary>
/// Summary description for tranfer_form
/// </summary>
public class tranfer_form
{
    public tranfer_form()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public static DataTable getClientDataTransferForm(string regno)
    {
        string query = @"select client_info.name,client_info.relation_of,client_info.applicant_cnic,client_info.permanent_address,property_info.plot_no,property_info.street_no,property_info.property_type,property_info.plot_address
from dbo.client_info
inner join property_info on dbo.property_info.client_id=dbo.client_info.id
where property_info.registrationo='" + regno+"';";
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
    public static DataTable GetOwnerDataTransferForm()
    {
        string query = @"select*
        from Transfer_form_information
        where type = 'Adams_Garden';";
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
    public static string SaveClientDataTransForm(string regno, byte[] img)
    {
        string return_msg = "";
        int pid = getPropertyID(regno);
        double plot_Total_Payment = getPlotTotalPayment(pid);
        double paid_Payments = getClientTotalInstallmentsPaid(regno);
        if (plot_Total_Payment == paid_Payments) {
            string query = @"select client_info.*,property_info.plot_no,property_info.street_no,property_info.property_type,property_info.plot_address
from dbo.client_info
inner join property_info on dbo.property_info.client_id=dbo.client_info.id
where property_info.registrationo='" + regno + "';";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            cmd.ExecuteNonQuery();

            if (dt.Rows.Count == 1) {
                DataRow row = dt.Rows[0];
                if (checkclient_existance(row[3].ToString()) == false)
                {
                    string buyer = "buyer";
                    string savequery = @"insert into Transfer_form_information(name,relation_of,applicant_cnic,occupation,present_address,telephone,mobile,email,permanent_address,nominee_name,nominee_address,nominee_cnic,nominee_no,image,type) 
                                                                    values('" + row[1] + "','" + row[2] + "','" + row[3] + "','" + row[4] + "','" + row[5] + "','" + row[6] + "','" + row[7] + "','" + row[8] + "','" + row[9] + "','" + row[10] + "','" + row[11] + "','" + row[12] + "','" + row[13] + "',@image,'" + buyer + "')";
                    cmd = new SqlCommand(savequery, con);
                    cmd.Parameters.AddWithValue("@image", img);//row[14];
                    cmd.ExecuteNonQuery();
                    UpdatapropertOwner(row[1].ToString(), row[3].ToString(), row[9].ToString(), regno);//update property owener information
                }
                int bid = getBuyerID(row["applicant_cnic"].ToString());
                int sid = getSellerID();
                if (checkTransferForm_existance(bid, sid, regno) == false)
                {
                    string SaveTransferFormQuery = @"insert into Transfer_form(buyer_id,seller_id,regno,date,transferform_image) Values('" + bid + "','" + sid + "','" + regno + "','" + System.DateTime.Today.ToShortDateString() + "',@image)";
                    cmd = new SqlCommand(SaveTransferFormQuery, con);
                    cmd.Parameters.AddWithValue("@image", row[14]);//this image should be replaced
                    cmd.ExecuteNonQuery();
                } else
                {
                    return_msg = "This property is Already transferd";
                }
            }
            else
            {
                return_msg = "Could not find data of the client";
            }
        }
        else
        {
            return_msg = "Complete property installments are not paid";
        }
        return return_msg;
    }
    public static int getBuyerID(string cnic)
    {
        string query = @"select id from Transfer_form_information where applicant_cnic='"+cnic+"'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        cmd.ExecuteNonQuery();
        DataRow row = dt.Rows[0];
        int id = int.Parse(row["id"].ToString());
        return id;
    }
    public static int getSellerID()
    {
        string query = @"select id from Transfer_form_information where type = 'Adams_Garden'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        cmd.ExecuteNonQuery();
        DataRow row = dt.Rows[0];
        int id = int.Parse(row["id"].ToString());
        return id;
    }
    public static bool checkclient_existance(string cnic)
    {
        string query = @"select count(*) from Transfer_form_information 
where dbo.Transfer_form_information.applicant_cnic='" + cnic + "' AND dbo.Transfer_form_information.type='buyer'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        cmd.ExecuteNonQuery();
        DataRow row = dt.Rows[0];
        bool returnbool = false;
        if (int.Parse(row[0].ToString()) > 0)
        {
            returnbool = true;
        }else
        {
            returnbool= false;
        }
        return returnbool;
    }
    public static bool checkTransferForm_existance(int bid,int sid,string regno)
    {
        string query = @"select count(*) from Transfer_form
where dbo.Transfer_form.buyer_id='" + bid + "' AND dbo.Transfer_form.seller_id='"+sid+ "' AND dbo.Transfer_form.regno='"+regno+"'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        cmd.ExecuteNonQuery();
        DataRow row = dt.Rows[0];
        bool returnbool = false;
        if (int.Parse(row[0].ToString()) > 0)
        {
            returnbool = true;
        }
        else
        {
            returnbool = false;
        }
        return returnbool;
    }
    public static int getPropertyID(string regno)
    {
        string query = @"select id from property_info
where dbo.property_info.registrationo='"+regno+"'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        cmd.ExecuteNonQuery();
        DataRow row = dt.Rows[0];
        return (int.Parse(row[0].ToString()));
    }
    public static double getPlotTotalPayment(int pid)
    {
        string query = @"select client_installment_plan_information.totalcost
from client_installment_plan_information
where client_installment_plan_information.property_id='"+pid+"'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        cmd.ExecuteNonQuery();
        DataRow row = dt.Rows[0];
        return (double.Parse(row[0].ToString()));
    }
    public static double getClientTotalInstallmentsPaid(string regno)
    {
        string query = @"select SUM(CONVERT(numeric,payment_amount_in_Rs)) as TotalAmount 

from payment
where payment_type <>'"+ "membership" + "' AND payment.property_registration='" + regno+"'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        cmd.ExecuteNonQuery();
        DataRow dr = dt.Rows[0];
        string str = dr["TotalAmount"].ToString();
        double totalpayments = double.Parse(dr[0].ToString());



        return totalpayments;
    }
    public static void UpdatapropertOwner(string Oname,string Ocnic,string Oaddress,string regno)
    {
        string query = "update property_info set owner_property_name='"+Oname+"', owner_property_address='"+Oaddress+"',owner_property_cnic='"+Ocnic+ "' where registrationo='"+regno+"'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteScalar();
        con.Close();
    }
    public static void second_Transfer_form(string name, string relation, string cnic, string occupation, string presentAddress, string telephone, string mobile, string email, string permanent_address, string nomineeName, string nomineeAddress,
       string nomineeCnic,byte[] image)
    {

    }
}