using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for installmentplan
/// </summary>
public class installmentplan
{
    public installmentplan()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static DataTable view()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.installments_plan_info", conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        conn.Close();
        return dt;

    }
    public static bool insertInstallments(string tbinstallmentcost, string tbFirstName, string tbplotsize, string tbdownpayment, string tblumsum, string tbsize, string tbtotalcost, string tbmembershipfee)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        // Create a command object.
        SqlCommand cmd = new SqlCommand();

        // Assign the connection to the command.
        cmd.Connection = conn;

        // Set the command text
        // SQL statement or the name of the stored procedure 
        cmd.CommandText = "INSERT INTO dbo.installments_plan_info ( installment_cost_per_month,installments_duration, plot_size,down_payment,lum_sum_discount,Marla,totalcost,membership_fee ) VALUES ( @tbinstallmentcost, @FirstName,@plotsize,@downpayment,@lumsum,@Marla,@totalcost,@membershipfee )";

        // Set the command type
        // CommandType.Text for ordinary SQL statements; 
        // CommandType.StoredProcedure for stored procedures.
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@tbinstallmentcost", SqlDbType.NVarChar, 50).Value = tbinstallmentcost;
        cmd.Parameters.Add("@Firstname", SqlDbType.NVarChar, 50).Value = tbFirstName;
        cmd.Parameters.Add("@plotsize", SqlDbType.NVarChar, 50).Value = tbplotsize;
        cmd.Parameters.Add("@downpayment", SqlDbType.NVarChar, 50).Value = tbdownpayment;
        cmd.Parameters.Add("@lumsum", SqlDbType.NVarChar, 50).Value = tblumsum;
        cmd.Parameters.Add("@Marla", SqlDbType.NVarChar, 50).Value = tbsize;
        cmd.Parameters.Add("@totalcost", SqlDbType.NVarChar, 50).Value = tbtotalcost;
        cmd.Parameters.Add("@membershipfee", SqlDbType.NVarChar, 50).Value = tbmembershipfee;


        conn.Open();
        bool IsAdded = cmd.ExecuteNonQuery() > 0;
        conn.Close();
        return IsAdded;
    }
    public static bool updateInstallments(string strPersonID, string strLastName, string strFirstName, string duration, string downpayment, string lumsum, string size, string totalCost , string membershipfee)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        // Create a command object.
        SqlCommand cmd = new SqlCommand();

        // Assign the connection to the command.
        cmd.Connection = conn;

        // Set the command text
        // SQL statement or the name of the stored procedure 
        cmd.CommandText = "UPDATE dbo.installments_plan_info SET installment_cost_per_month = @LastName, plot_size = @FirstName , installments_duration=@duration,down_payment=@down_payment, lum_sum_discount=@lum_sum_discount, Marla=@Size, totalcost=@totalcost,membership_fee=@membershipfee WHERE id = @PersonID";

        // Set the command type
        // CommandType.Text for ordinary SQL statements; 
        // CommandType.StoredProcedure for stored procedures.
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@PersonID", SqlDbType.Int).Value = strPersonID;
        cmd.Parameters.Add("@LastName", SqlDbType.NVarChar, 50).Value = strLastName;
        cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar, 50).Value = strFirstName;
        cmd.Parameters.Add("@duration", SqlDbType.NVarChar, 50).Value = duration;
        cmd.Parameters.Add("@down_payment", SqlDbType.NVarChar, 50).Value = downpayment;
        cmd.Parameters.Add("@lum_sum_discount", SqlDbType.NVarChar, 50).Value = lumsum;
        cmd.Parameters.Add("@Size", SqlDbType.NVarChar, 50).Value = size;
        cmd.Parameters.Add("@totalcost", SqlDbType.NVarChar, 50).Value = totalCost;
        cmd.Parameters.Add("@membershipfee", SqlDbType.NVarChar, 50).Value = membershipfee;
        conn.Open();
        bool IsUpdated = cmd.ExecuteNonQuery() > 0;
        conn.Close();
        return IsUpdated;
    }
    public static bool deleteInstallments(string strPersonID)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
        {
            // Create a command object.
            SqlCommand cmd = new SqlCommand();

            // Assign the connection to the command.
            cmd.Connection = conn;

            // Set the command text
            // SQL statement or the name of the stored procedure 
            cmd.CommandText = "DELETE FROM dbo.installments_plan_info WHERE id = @PersonID";

            // Set the command type
            // CommandType.Text for ordinary SQL statements; 
            // CommandType.StoredProcedure for stored procedures.
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@PersonID", SqlDbType.Int).Value = strPersonID;

            conn.Open();
            bool IsDeleted = cmd.ExecuteNonQuery() > 0;
            conn.Close();
            return IsDeleted;
        }
    }
}