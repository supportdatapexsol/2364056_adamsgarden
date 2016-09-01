using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class admin_summary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // if (!IsPostBack)
       // {
            DataTable dt = property.get_all_properties();

        /*************************************/
        DataTable newdt = new DataTable();//for filtering data
        newdt.Columns.Add("Name", typeof(string));
        newdt.Columns.Add("Cnic", typeof(string));

        newdt.Columns.Add("Owner name", typeof(string));
        newdt.Columns.Add("Owner cnic", typeof(string));
        newdt.Columns.Add("Plot no.", typeof(string));
        newdt.Columns.Add("Registeration no", typeof(string));
        newdt.Columns.Add("Plot size", typeof(string));
        newdt.Columns.Add("Property type", typeof(string));
        newdt.Columns.Add("Plot address", typeof(string));
        newdt.Columns.Add("Street no.", typeof(string));
        

        foreach (DataRow row in dt.Rows)
        {
            DataRow nrow = newdt.NewRow();  //creating newRow
            nrow["Name"] = row["name"];
            nrow["Cnic"] = row["applicant_cnic"];
            nrow["Owner name"] = row["owner_property_name"];
            nrow["Owner cnic"] = row["owner_property_cnic"];
            nrow["Plot no."] = row["plot_no"];
            nrow["Registeration no"] = row["registrationo"];
            nrow["Plot size"] = row["plot_size"];
            nrow["Property type"] = row["property_type"];
            nrow["Plot address"] = row["plot_address"];
            nrow["Street no."] = row["street_no"];
           


            newdt.Rows.Add(nrow);
        }



        /*******************************/

        GridView1.DataSource = newdt;
            GridView1.DataBind();
      //  }
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        double totalamount = 0;
        GridViewRow row = GridView1.SelectedRow;
        if (IsPostBack)
        {
            string regno = row.Cells[6].Text.ToString();
            DataTable dt = property.getpayment_byregno(regno);
            foreach (DataRow row1 in dt.Rows)
            {
                totalamount += double.Parse(row1["Amount"].ToString());//amount in rs as amount 
            }
            totalprice.Text = totalamount.ToString();
            viewclients.DataSource = dt;
            viewclients.DataBind();
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string value = TextBox1.Text.ToString();
        if (value== "")
        {
            Page_Load(this, e);
        }
        else
        {
            GridView1.DataSource = property.searchByIdCard(TextBox1.Text);
            GridView1.DataBind();
        }    
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        DataTable dt = property.get_all_properties();



        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}