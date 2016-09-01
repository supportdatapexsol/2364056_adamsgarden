using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for updateAdminData
/// </summary>
public class updateAdminData
{
    public updateAdminData()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static bool updateData(String tbname, String tbsof, String tbcnic, String tboccupatiom, String tbpresentaddress, String tbtel, String tbmobile, String tbemail, String tbparmaentadd, String tbnominename, String tbnomineaddress, String tbcnicnominee, byte[] clientImage)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //     cmd.CommandText = "UPDATE dbo.property_info SET plot_no=@plot_no,plot_size=@plot_size, street_no=@street_no, plot_address= @plot_address, owner_property_name = @owner_property_name, owner_property_address =@owner_property_address,property_type=@property_type,owner_property_cnic=@owner_property_cnic WHERE Id='" + id + "'";


        cmd.CommandText = @"UPDATE dbo.Transfer_form_information SET name=@name, relation_of=@relation,
            applicant_cnic=@applicant_cnic, occupation=@occupation,present_address=@present_address,
telephone=@telephone,mobile=@mobile,email=@email,permanent_address=@peradd,nominee_name=@nname,
nominee_address=@nadd,
nominee_cnic=@ncnic,nominee_no=@nno,image=@image
            WHERE type='Adams_Garden'";




        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = tbname;
        cmd.Parameters.Add("@applicant_cnic", SqlDbType.NVarChar, 50).Value = tbcnic;
        cmd.Parameters.AddWithValue("@relation", tbsof);
        cmd.Parameters.AddWithValue("@present_address", tbpresentaddress);
        cmd.Parameters.AddWithValue("@occupation", tboccupatiom);
        cmd.Parameters.AddWithValue("@address", tbparmaentadd);
        cmd.Parameters.AddWithValue("@telephone", tbtel);
        cmd.Parameters.AddWithValue("@mobile", tbmobile);
        cmd.Parameters.AddWithValue("@email", tbemail);
        cmd.Parameters.AddWithValue("@peradd", tbparmaentadd);

        cmd.Parameters.AddWithValue("@nname", tbnominename);

        cmd.Parameters.AddWithValue("@nadd", tbnomineaddress);

        cmd.Parameters.AddWithValue("@ncnic", tbcnicnominee);
        cmd.Parameters.AddWithValue("@nno", "123");

        cmd.Parameters.AddWithValue("@image", clientImage);

        conn.Open();
        bool IsUpdated = cmd.ExecuteNonQuery() > 0;
        conn.Close();
        return IsUpdated;

    }
    public static DataTable view()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"
        		SELECT * FROM dbo.Transfer_form_information
where type='Adams_Garden'", conn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        conn.Close();
        return dt;

    }
}