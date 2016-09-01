using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for property
/// </summary>
public class property
{
    public property()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static DataTable view()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"
        		SELECT dbo.client_info.name,dbo.client_info.applicant_cnic,dbo.property_info.*
FROM dbo.property_info
INNER JOIN dbo.client_info
ON dbo.property_info.client_id=dbo.client_info.Id
where dbo.property_info.plot_no !=''", conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        conn.Close();
        return dt;

    }
    public static bool updateMembership(string id, string name, string cnic, string relation, string address, string profession, string phone)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //     cmd.CommandText = "UPDATE dbo.property_info SET plot_no=@plot_no,plot_size=@plot_size, street_no=@street_no, plot_address= @plot_address, owner_property_name = @owner_property_name, owner_property_address =@owner_property_address,property_type=@property_type,owner_property_cnic=@owner_property_cnic WHERE Id='" + id + "'";


        cmd.CommandText = @"UPDATE dbo.client_info SET name=@name, relation_of=@relation,applicant_cnic=@applicant_cnic,
            occupation=@occupation,present_address=@address,telephone=@telephone WHERE Id=@id";




        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = name;
        cmd.Parameters.Add("@applicant_cnic", SqlDbType.NVarChar, 50).Value = cnic;
        cmd.Parameters.AddWithValue("@relation", relation);
        cmd.Parameters.AddWithValue("@address", address);
        cmd.Parameters.AddWithValue("@occupation", profession);
        cmd.Parameters.AddWithValue("@telephone", phone);

        conn.Open();
        bool IsUpdated = cmd.ExecuteNonQuery() > 0;
        conn.Close();
        return IsUpdated;
    }
    public static DataTable unpaidDownpaymentClient()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"
        		SELECT dbo.client_info.Id,dbo.client_info.name,dbo.client_info.applicant_cnic,dbo.property_info.registrationo,dbo.client_info.relation_of,dbo.client_info.present_address,dbo.client_info.occupation,dbo.client_info.telephone,dbo.payment.date
FROM dbo.property_info
INNER JOIN dbo.client_info
ON dbo.property_info.client_id=dbo.client_info.Id
INNER JOIN dbo.payment
ON dbo.payment.property_registration=dbo.property_info.registrationo
where dbo.property_info.plot_no='';", conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        conn.Close();
        return dt;

    }
    public static DataTable searchUnpaidDownpaymentCLient(string searchstr)
    {
        string query = @"SELECT dbo.client_info.Id,dbo.client_info.name,dbo.client_info.applicant_cnic,dbo.property_info.registrationo,dbo.client_info.relation_of,dbo.client_info.present_address,dbo.client_info.occupation,dbo.client_info.telephone,dbo.payment.date
FROM dbo.property_info
INNER JOIN dbo.client_info
ON dbo.property_info.client_id=dbo.client_info.Id
INNER JOIN dbo.payment
ON dbo.payment.property_registration=dbo.property_info.registrationo
where (dbo.property_info.plot_no='' and dbo.client_info.applicant_cnic='"+searchstr+"') or (dbo.property_info.plot_no='' and dbo.property_info.registrationo='"+searchstr+"');";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand(query, conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        conn.Close();
        return dt;

    }
    public static DataTable searchPropertyDetailByCnic(string cnic)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        /*  SqlCommand cmd = new SqlCommand(@"
          SELECT *  
          FROM dbo.property_info", conn);*/
        SqlCommand cmd = new SqlCommand(@"
        		SELECT *
FROM dbo.property_info
INNER JOIN dbo.client_info
ON dbo.property_info.client_id=dbo.client_info.Id
where dbo.client_info.applicant_cnic='"+cnic+ "' or dbo.property_info.registrationo='"+cnic+"';", conn);//cnic can be eithere regno or 
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        conn.Close();
        return dt;

    }
    public static string returnID(string plot_no)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        
        SqlCommand cmd = new SqlCommand(@"
         SELECT id
        FROM dbo.property_info
        where plot_no='"+plot_no+"'", conn);
        conn.Open();
        
        cmd.Parameters.Add("@plot_no", SqlDbType.Int).Value = plot_no;
        string id = cmd.ExecuteNonQuery().ToString();
        return id ;
    }
    public static bool updateProperty( string id,string plot_no, string plot_size,  string street_no, string plot_address, string owner_property_name, string owner_property_address, string property_type, string owner_property_cnic)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "UPDATE dbo.property_info SET plot_no=@plot_no,plot_size=@plot_size, street_no=@street_no, plot_address= @plot_address, owner_property_name = @owner_property_name, owner_property_address =@owner_property_address,property_type=@property_type,owner_property_cnic=@owner_property_cnic WHERE Id='"+id+"'";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
        //  cmd.Parameters.AddWithValue("@Id", id + "%");
           cmd.Parameters.Add("@plot_no", SqlDbType.NVarChar, 50).Value = plot_no;
         cmd.Parameters.Add("@plot_size", SqlDbType.NVarChar, 50).Value = plot_size;
        // cmd.Parameters.Add("@client_id", SqlDbType.NVarChar, 50).Value = client_id;
        // cmd.Parameters.
        cmd.Parameters.AddWithValue("@street_no", street_no);
        cmd.Parameters.AddWithValue("@plot_address", plot_address);
        cmd.Parameters.AddWithValue("@owner_property_name", owner_property_name);
        cmd.Parameters.AddWithValue("@owner_property_address", owner_property_address);
        cmd.Parameters.AddWithValue("@property_type", property_type);
        cmd.Parameters.AddWithValue("@owner_property_cnic", owner_property_cnic);
        //  cmd.Parameters.Add("@street_no", SqlDbType.NVarChar, 50).Value = street_no;
        // cmd.Parameters.Add("@plot_address", SqlDbType.NVarChar, 50).Value = plot_address;
        // cmd.Parameters.Add("@owner_property_name", SqlDbType.NVarChar, 50).Value = owner_property_name;
        // cmd.Parameters.Add("@owner_property_address", SqlDbType.NVarChar, 50).Value = owner_property_address;
        // cmd.Parameters.Add("@property_type", SqlDbType.NVarChar, 50).Value = property_type;
        // cmd.Parameters.Add("@owner_property_cnic", SqlDbType.NVarChar, 50).Value = owner_property_cnic;
        //cmd.Parameters.Add("@installment_id", SqlDbType.NVarChar, 50).Value = installment_id;

        conn.Open();
     //   cmd.ExecuteNonQuery();
     bool IsUpdated = cmd.ExecuteNonQuery() > 0;
        conn.Close();
        return IsUpdated;
    }
    public static bool deleteProperty(string id)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        SqlCommand cmd = new SqlCommand();

        cmd.Connection = conn;

        cmd.CommandText = "DELETE FROM dbo.property_info WHERE id = @Id";

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@Id", SqlDbType.Int).Value = id;

        conn.Open();
        bool IsDeleted = cmd.ExecuteNonQuery() > 0;
        conn.Close();
        return IsDeleted;
    }
    public static DataTable View_Information_all()
    {
        string query = "SELECT dbo.client_info.name,dbo.client_info.applicant_cnic,dbo.property_info.*,dbo.payment.payment_amount_in_Rs,dbo.payment.date FROM dbo.client_info INNER JOIN dbo.property_info on dbo.client_info.id = dbo.property_info.client_id INNER JOIN dbo.payment on dbo.client_info.id = dbo.payment.client_id; ";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand(query, conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        conn.Close();
        return dt;

    }
    public static DataTable clientInfo()
    {
        //SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        //da.Fill(dt);
       // conn.Close();
        return dt;
    }
    public static DataTable get_all_properties()
    {
        string query = @"select
dbo.client_info.name,dbo.client_info.applicant_cnic,
dbo.property_info.owner_property_name,
dbo.property_info.owner_property_cnic,
dbo.property_info.plot_no,
dbo.property_info.registrationo,
dbo.property_info.plot_size,dbo.property_info.property_type,
dbo.property_info.plot_address,dbo.property_info.street_no
FROM dbo.client_info 
INNER JOIN dbo.property_info on dbo.client_info.id = dbo.property_info.client_id;";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand(query, conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        conn.Close();
        return dt;

    }
    public static DataTable getpayment_byplotno(int plotno)
    {
        int propertyid = applicant_info.getpropertyid(plotno);
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        string query = @"select payment_amount_in_Rs as Amount,
		 payment_amount_in_wors as Amount_in_Words,
		  date=CONVERT(CHAR(10), date, 101),
		 payment_made_through,
		 jsbankaccount,
		 cash_payorder_no
         from payment where property_id='" + propertyid + "';";
        SqlCommand cmd = new SqlCommand(query, conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        conn.Close();
        return dt;
    }
    public static DataTable getpayment_byregno(string regno)
    {

        //must b changed
       // int propertyid = applicant_info.getpropertyid(plotno);
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        string query = @"select payment_amount_in_Rs as Amount,
		 payment_amount_in_wors as Amount_in_Words,
		  date = CONVERT(CHAR(10), date, 101),
		 payment_made_through,
		 jsbankaccount,
		 cash_payorder_no
         from payment
         inner join property_info on payment.client_id = property_info.client_id

         where property_info.registrationo = '1001'";
        SqlCommand cmd = new SqlCommand(query, conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        conn.Close();
        return dt;
    }
    public static DataTable searchByIdCard(string cnic)
    {
        string query = @"select
dbo.client_info.name,dbo.client_info.applicant_cnic,
dbo.property_info.owner_property_name,
dbo.property_info.owner_property_cnic,
dbo.property_info.plot_no,
dbo.property_info.plot_size,dbo.property_info.property_type,
dbo.property_info.plot_address,dbo.property_info.street_no
FROM dbo.client_info 
INNER JOIN dbo.property_info on dbo.client_info.id = dbo.property_info.client_id
where dbo.client_info.applicant_cnic='" + cnic + "';";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlDataAdapter sd = new SqlDataAdapter(query, conn);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        return dt;
    }
}
