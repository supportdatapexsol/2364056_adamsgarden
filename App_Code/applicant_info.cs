using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for applicant_info
/// </summary>
public class applicant_info
{
    public applicant_info()
    { }
    //
    // TODO: Add constructor logic here
    //
    public applicant_info(String name, string relation, string cnic, string occupation, string presentAddress, string telephone, string mobile, string email, string permanent_address, string nomineeName, string nomineeAddress,
       string nomineeCnic, string no, byte[] image, string regno, string amount, string amount_words, string plotsize, string cashmadethrough, string plotno, string street, string plotaddress, string propertytype, string enteredDate)
    {

    }


    public static string downpayment(String name, string relation, string cnic, string occupation, string presentAddress, string telephone, string mobile, string email, string permanent_address, string nomineeName, string nomineeAddress,
       string nomineeCnic, string no, byte[] image, string regno,string amount , string amount_words,string plotsize,string cashmadethrough,string plotno,string street,string plotaddress,string propertytype,string enteredDate)
    {

        String returnmsg = "";
        if (checkInstallmentPlan(plotsize) == true)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            bool checkbool = false;
            int clientId = getClientId(cnic);
            if (clientcheckExistance(cnic) == true && checkplotno(int.Parse(plotno)) == true && clientregnoAvailbilty(regno) == true)
            {
                SqlCommand cmd1 = new SqlCommand("UPDATE dbo.client_info SET  mobile = '" + mobile + "', email = '" + email + "', permanent_address = '" + permanent_address + "', nominee_name = '" + nomineeName + "', nominee_address = '" + nomineeAddress + "', nominee_cnic = '" + nomineeCnic + "', nominee_no = '" + no + "', image = @image where Id = '" + clientId + "'", conn);
                cmd1.Parameters.AddWithValue("@image", image);
                cmd1.Parameters.AddWithValue("@registeration_no", "");
                //    bool check = adamsgarden.adminlogin.login1(name.Text, cnic.Text);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                cmd1.ExecuteScalar();

            }
            //checking plotno already sold or not
            if (checkplotno(int.Parse(plotno)) == true && clientregnoAvailbilty(regno) == true)
            {
                // int clientId = getClientId(cnic);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE dbo.property_info set plot_no=@plot_no, plot_size=@plotsize,client_id=@clientid,street_no=@streetno,plot_address=@plotAddress,owner_property_name=@ownerproperty_name,owner_property_address=@ownerproperty_address,property_type=@property_type,owner_property_cnic=@Owener_property_cnic,installment_id=@installment_plan where registrationo='" + regno + "'", conn);

                cmd.Parameters.AddWithValue("@plot_no", plotno);//should be from admin payment page 
                cmd.Parameters.AddWithValue("@plotsize", plotsize);
                cmd.Parameters.AddWithValue("@clientid", clientId);
                cmd.Parameters.AddWithValue("@streetno", street);
                cmd.Parameters.AddWithValue("@plotAddress", "admas garden near new islamabad airport");//should be fixed
                cmd.Parameters.AddWithValue("@ownerproperty_name", "Pervez sundho");// should be from client side

                cmd.Parameters.AddWithValue("@ownerproperty_address", "g11 markaz alanyat plaza office no 07");
                cmd.Parameters.AddWithValue("@property_type", propertytype);
                cmd.Parameters.AddWithValue("@Owener_property_cnic", "23101-1234556-1");// shoud be from client side
                cmd.Parameters.AddWithValue("@installment_plan", "1");
                cmd.Parameters.AddWithValue("@registratonno", regno);
                cmd.ExecuteScalar();
                //cmd.ExecuteNonQuery();
                int plotid = getpropertyid(int.Parse(plotno));
                updatePaymentMemberShip(plotid, regno);
                
                cmd = new SqlCommand("insert into dbo.payment values( @amountin_rs, @date,@client_id, @propertyid,@amount_in_words,@type,@payment_made_through,@infavour_of,@jsbankaccount,@cash_payorder_no,@property_registration)", conn);
                cmd.Parameters.AddWithValue("@amountin_rs", amount);//not in the form
                cmd.Parameters.AddWithValue("@date", enteredDate);
                cmd.Parameters.AddWithValue("@client_id", clientId);
                cmd.Parameters.AddWithValue("@propertyid", plotid);
                cmd.Parameters.AddWithValue("@amount_in_words", amount_words);
                cmd.Parameters.AddWithValue("@type", "DownPayment");//must b change to downpayment
                cmd.Parameters.AddWithValue("@payment_made_through", cashmadethrough);
                cmd.Parameters.AddWithValue("@infavour_of", "adam's garden");
                cmd.Parameters.AddWithValue("@jsbankaccount", "0000760785");
                cmd.Parameters.AddWithValue("@cash_payorder_no", no);
                cmd.Parameters.AddWithValue("@property_registration", regno);

                cmd.ExecuteScalar();
                conn.Close();
                if (installment.addClientInstallment(clientId, plotid, plotsize) == false)
                {
                    returnmsg = "Installment plan for Plot size does not exist";
                }
            }
            else
            {
                returnmsg = "This plot is already sold";
            }
        }
        else
        {
            returnmsg = "Please Check Installment PLan it Does not Exist in the Record";
        }
        return returnmsg;
        
    }
   public static int getClientId(string cnic)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        conn.Open();
        //SqlDataAdapter da = new SqlDataAdapter("select * from dbo.client_info  order by id DESC", conn);
        string query = "select Id from dbo.client_info where applicant_cnic='"+cnic+"' order by id DESC";
        SqlCommand sql = new SqlCommand(query, conn);
        int temp = Convert.ToInt32(sql.ExecuteScalar().ToString());

        return temp;
        /*
        DataSet ds = new DataSet();
        da.Fill(ds, "registration");
        DataTable dt = ds.Tables["registration"];
        int count = dt.Rows.Count;
       return count;
       */
    }
    public static int getpropertyid(int plotno)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        conn.Open();
        // SqlDataAdapter da = new SqlDataAdapter("select * from dbo.property_info  order by id DESC", conn);
        string query = "select id from dbo.property_info where plot_no='"+plotno+"'";
        SqlCommand sql=  new SqlCommand(query, conn);
        int temp = Convert.ToInt32(sql.ExecuteScalar().ToString());

        return temp;
       /* DataSet ds = new DataSet();
        da.Fill(ds, "registration");
        DataTable dt = ds.Tables["registration"];
        int count = dt.Rows.Count;

        return count;*/
    }
    public static bool checkplotno(int plotno)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        String checkUser = "select count(*) from dbo.property_info where plot_no='" +plotno+ "'";

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
    public static DataTable viewdata()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        DataTable dt = new DataTable();
        conn.Open();
        string query = "select * from property_info; ";
        SqlDataAdapter sd = new SqlDataAdapter(query, conn);
        sd.Fill(dt);
        conn.Close();
        return dt;
    }
    public static bool checkClient(String userinput)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        String checkUser = "select count(*) from dbo.client_info where applicant_cnic='" + userinput + "'";

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
    public static bool clientcheckExistance(String cnic)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        String checkUser = "select count(*) from dbo.client_info where applicant_cnic='"+cnic+"' AND email='' AND nominee_name='' AND nominee_cnic=''";

        conn.Open();
        SqlCommand cmd = new SqlCommand(checkUser, conn);
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        //  cmd.BeginExecuteNonQuery();

        conn.Close();
        if (temp == 1)
        {
            return true;

        }
        else
        {

            return false;

        }
    }
    public static bool clientregnoAvailbilty(String regno)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        String checkUser = "select count(*) from dbo.property_info where registrationo='" + regno + "'";

        conn.Open();
        SqlCommand cmd = new SqlCommand(checkUser, conn);
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        //  cmd.BeginExecuteNonQuery();

        conn.Close();
        if (temp == 1)
        {
            return true;

        }
        else
        {

            return false;

        }
    }
    public static bool checkInstallmentPlan(string plotsize)
    {
        bool returnbool = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        string query = "select * from installments_plan_info where plot_size='" + plotsize + "'";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        //cmd.ExecuteNonQuery();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        int temp = dt.Rows.Count;

        con.Close();
        if (temp==1) {

            returnbool = true;
        }
        return returnbool;
    }
    public static bool checkClientByRegno(string regno)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        // Create a command object.

        conn.Open();
        SqlCommand cmd = new SqlCommand(@"select count(*) 
from dbo.client_info
inner join dbo.property_info on dbo.client_info.id = dbo.property_info.client_id
 where dbo.property_info.registrationo = '"+regno+"' AND dbo.property_info.plot_no=''; ", conn);
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        //  cmd.BeginExecuteNonQuery();

        conn.Close();
        if (temp == 1)
        {
            return true;

        }
        else
        {

            return false;

        }
        
    }
    public static void updatePaymentMemberShip(int pid, string regno)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        // Create a command object.

        conn.Open();
        SqlCommand cmd = new SqlCommand(@"update dbo.payment set dbo.payment.property_id=@pid where dbo.payment.property_registration='"+regno+"' And dbo.payment.payment_type='membership'", conn);
        cmd.Parameters.AddWithValue("@pid",pid);
        cmd.ExecuteScalar();
        
    }
}
