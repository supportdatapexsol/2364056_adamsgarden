using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for installment
/// </summary>
public class installment
{
    public installment()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static DataTable getAllclients()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        // Create a command object.

        conn.Open();
        //SqlDataAdapter da = new SqlDataAdapter("select * from dbo.client_info", conn);
        string query = @"SELECT dbo.client_info.id,
dbo.client_info.name,
dbo.client_info.relation_of,
dbo.client_info.applicant_cnic,
dbo.client_info.telephone,
dbo.client_info.mobile,
dbo.client_info.present_address,
dbo.client_info.occupation,
dbo.property_info.plot_no,
dbo.property_info.street_no,
dbo.property_info.registrationo  
FROM dbo.client_info 
INNER JOIN dbo.property_info on dbo.client_info.id = dbo.property_info.client_id
where dbo.property_info.plot_no!=''";
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "client_info");
        DataTable dt = ds.Tables["client_info"];
        int count = dt.Rows.Count;
        return dt;

    }
    public static DataTable SearchClient(string searchtxt)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        // Create a command object.

        conn.Open();
        //SqlDataAdapter da = new SqlDataAdapter("select * from dbo.client_info", conn);
        string query = @"SELECT dbo.client_info.id,
dbo.client_info.name,
dbo.client_info.relation_of,
dbo.client_info.applicant_cnic,
dbo.client_info.telephone,
dbo.client_info.mobile,
dbo.client_info.present_address,
dbo.client_info.occupation,
dbo.property_info.plot_no,
dbo.property_info.registrationo  
FROM dbo.client_info 
INNER JOIN dbo.property_info on dbo.client_info.id = dbo.property_info.client_id
where (dbo.property_info.plot_no!='' And dbo.client_info.applicant_cnic='"+searchtxt+"') or (dbo.property_info.plot_no!='' And dbo.property_info.registrationo='"+searchtxt+"')";
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "client_info");
        DataTable dt = ds.Tables["client_info"];
        int count = dt.Rows.Count;
        return dt;

    }
    public static DataTable getclientpayments(string regno)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        // Create a command object.
      /*  string query = @"select dbo.payment.* 
from dbo.payment 
inner join dbo.property_info on dbo.payment.client_id=dbo.property_info.client_id
where dbo.property_info.registrationo='" + regno + "'";*/
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(@"select dbo.payment.* 
from dbo.payment 

where dbo.payment.property_registration='"+regno+"'", conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "payment");
        DataTable dt = ds.Tables["payment"];
        int count = dt.Rows.Count;
        return dt;

    }
    public static DataTable getPropertiesSoldpermonty()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(@"select dbo.payment.payment_amount_in_Rs,dbo.payment.date
        from dbo.payment", conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "Date");
        DataTable dt = ds.Tables["Date"];
        return dt;
    }
    public static string addpayment(int cid, int propertyid, string date, string amount, string amount_words, string payorderno, string type, string account, string favorof, string pmadethrough,string regno)
    {
        string result = "";
        double paidamount=tranfer_form.getClientTotalInstallmentsPaid(regno);
        paidamount = paidamount + double.Parse(amount);
        double totalamout=tranfer_form.getPlotTotalPayment(propertyid);
        if (paidamount <= totalamout)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

           
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            
            cmd.CommandText = "INSERT INTO dbo.payment VALUES ( @payment_amount_in_Rs, @date,@client_id,@property_id,@payment_amount_in_wors,@payment_type,@payment_made_through,@infavour_off,@jsbankaccount,@cash_payorder_no,@propertyregistration)";
           
            cmd.Parameters.AddWithValue("@payment_amount_in_Rs", amount);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@client_id", cid);
            cmd.Parameters.AddWithValue("@property_id", propertyid);
            cmd.Parameters.AddWithValue("@payment_amount_in_wors", amount_words);
            cmd.Parameters.AddWithValue("@payment_type", type);
            cmd.Parameters.AddWithValue("@payment_made_through", pmadethrough);
            cmd.Parameters.AddWithValue("@infavour_off", favorof);
            cmd.Parameters.AddWithValue("@jsbankaccount", account);
            cmd.Parameters.AddWithValue("@cash_payorder_no", payorderno);
            cmd.Parameters.AddWithValue("@propertyregistration", regno);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        else
        {
            result = "Paid Amount Cannot Exceeds Total Amount. Please See How much amount you have to pay";
        }
        return result;
    }
    public static bool updatpayment(int payment_id, int cid, int propertyid, string date, string amount, string amount_words, string payorderno, string type, string account, string favorof, string pmadethrough)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

       
        SqlCommand cmd = new SqlCommand();

       
        cmd.Connection = conn;

       
        cmd.CommandText = "UPDATE dbo.payment SET payment_amount_in_Rs = @payment_amount_in_Rs,date = @date , client_id=@client_id,property_id=@property_id,payment_amount_in_wors=@payment_amount_in_wors, payment_type=@payment_type, payment_made_through=@payment_made_through,infavour_of=@infavour_off,jsbankaccount=@jsbankaccount,cash_payorder_no=@cash_payorder_no WHERE id = '" + payment_id + "'";

        
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@payment_amount_in_Rs", amount);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@client_id", cid);
        cmd.Parameters.AddWithValue("@property_id", propertyid);
        cmd.Parameters.AddWithValue("@payment_amount_in_wors", amount_words);
        cmd.Parameters.AddWithValue("@payment_type", type);
        cmd.Parameters.AddWithValue("@payment_made_through", pmadethrough);
        cmd.Parameters.AddWithValue("@infavour_off", favorof);
        cmd.Parameters.AddWithValue("@jsbankaccount", account);
        cmd.Parameters.AddWithValue("@cash_payorder_no", payorderno);
        conn.Open();
        bool IsUpdated = cmd.ExecuteNonQuery() > 0;
        conn.Close();
        return IsUpdated;
    }
    public static bool addClientInstallment(int clientid, int properyid, string plotsize)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        con.Open();
        string query = @"select * 
           from installments_plan_info
           where plot_size = '" + plotsize + "';";
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        string icostpermonth = "";
        string iduration = "";
        string iplot_size = "";
        string downpayment = "";  
        string lumsumdiscount = "";
        string marla = "";
        string totalcost = "";
        string membershipfee = "";
        foreach (DataRow row in dt.Rows)
        {
            icostpermonth = row["installment_cost_per_month"].ToString();
            iduration = row["installments_duration"].ToString();
            iplot_size = row["plot_size"].ToString();
            downpayment = row["down_payment"].ToString(); 
            lumsumdiscount = row["lum_sum_discount"].ToString();
            marla = row["Marla"].ToString();
            totalcost = row["totalcost"].ToString();
            membershipfee = row["membership_fee"].ToString();

        }
        string query2 = @"insert into 
        client_installment_plan_information(payment_permonth,installment_duration,plot_size,down_payment,lum_sum_discount,marla,totalcost,membership_fee,client_id,property_id) 
        values('" + icostpermonth + "','" + iduration + "','" + iplot_size + "','" + downpayment + "','" + lumsumdiscount + "','" + marla + "','" + totalcost + "','" + membershipfee + "','" + clientid + "','" + properyid + "');";
        SqlCommand cmd = new SqlCommand(query2, con);
        if (icostpermonth != "" && iduration != "" && iplot_size != "" && downpayment != "" && lumsumdiscount != "" && marla != "" && totalcost != "" && membershipfee != "")
        {
            cmd.ExecuteNonQuery();
            
                con.Close();
                return true;
            
        }
        else
        {
            return false;
        }

    }
    public static DataTable getClientInstallmentPlanByCnic(string cnic)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        con.Open();
        string query = @"select dbo.client_info.name,dbo.client_info.applicant_cnic,client_installment_plan_information.payment_permonth as Amount,client_installment_plan_information.installment_duration as Duration, client_installment_plan_information.plot_size as Plotsize,client_installment_plan_information.down_payment as Downpayment,client_installment_plan_information.lum_sum_discount as Lumsum_Discount,client_installment_plan_information.marla as Marla,client_installment_plan_information.membership_fee as Membershipfee,property_info.registrationo as RegNo
        from dbo.client_info
        inner join client_installment_plan_information on client_info.id=dbo.client_installment_plan_information.client_id
		inner join property_info on property_info.client_id=client_info.id
         where dbo.client_info.applicant_cnic='"+cnic+"' or property_info.registrationo='"+cnic+"'";
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }
    public static DataTable getClientInstallmentPlan(){
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        con.Open();
        string query = @"select dbo.client_info.name,dbo.client_info.applicant_cnic,client_installment_plan_information.payment_permonth as Amount,client_installment_plan_information.installment_duration as Duration, client_installment_plan_information.plot_size as Plotsize,client_installment_plan_information.down_payment as Downpayment,client_installment_plan_information.lum_sum_discount as Lumsum_Discount,client_installment_plan_information.marla as Marla,client_installment_plan_information.membership_fee as Membershipfee,property_info.registrationo as RegNo
        from dbo.client_info
        inner join client_installment_plan_information on client_info.id=dbo.client_installment_plan_information.client_id
		inner join property_info on property_info.client_id=client_info.id
order by dbo.client_info.applicant_cnic;";
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt ;
        }
    public static bool deleteInstallments(string paymentid)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
           
            SqlCommand cmd = new SqlCommand();

            
            cmd.Connection = conn;

          
            cmd.CommandText = "DELETE FROM dbo.payment WHERE id = @paymentid";

          
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@paymentid", SqlDbType.Int).Value = paymentid;
            conn.Open();
            bool IsDeleted = cmd.ExecuteNonQuery() > 0;
            conn.Close();
            return IsDeleted;
        }
    }
    //getting all information related to client, property and installments
    public static DataTable getClientInstallment(string regNo)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        con.Open();
        string query = @"select dbo.property_info.registrationo,
dbo.property_info.plot_no,
dbo.property_info.plot_size,
dbo.client_installment_plan_information.*,
dbo.payment.date as datedownpayment
from dbo.property_info 
inner join dbo.client_installment_plan_information on dbo.property_info.Id=dbo.client_installment_plan_information.property_id
inner join dbo.payment on dbo.property_info.registrationo=dbo.payment.property_registration And dbo.payment.payment_type='DownPayment'
where dbo.property_info.registrationo='" + regNo+"';";
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }
}