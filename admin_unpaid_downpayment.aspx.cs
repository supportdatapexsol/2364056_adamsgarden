using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class property_info : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null && !Request.Path.EndsWith("login.aspx"))
        {
            Response.Redirect("login.aspx");
        }
        else { 
            if (!IsPostBack)
            {
                bindGridView();
            }

            
            if (searchtb.Text != "")
            {
                pSearchID.Visible = true;
                pUnpaidInfo.Visible = false;
                try {

                    DataTable dt = property.searchUnpaidDownpaymentCLient(searchtb.Text);
                    lbRegNo.Text = dt.Rows[0]["registrationo"].ToString();
                    lbName.Text = dt.Rows[0]["name"].ToString();
                    lbCnic.Text = dt.Rows[0]["applicant_cnic"].ToString();
                    lbRelation.Text = dt.Rows[0]["relation_of"].ToString();
                    lbAddress.Text = dt.Rows[0]["present_address"].ToString();
                    lbprofession.Text = dt.Rows[0]["occupation"].ToString();
                    lbphone.Text = dt.Rows[0]["telephone"].ToString();
                }catch(Exception ex)
                {
                    ShowMessage(ex.Message, MessageType.Warning);
                }

                //GridView1.DataSource = dt;
                //GridView1.DataBind();

            }
        }

    }
        
    protected void searchbtn_Click(object sender, EventArgs e)
    {
      
         Page_Load(this, e);
    }
    protected void bindGridView()
    {
        pSearchID.Visible = false;
        pUnpaidInfo.Visible = true;
        // Bind the GridView control.
        try {
            DataTable dt = property.unpaidDownpaymentClient();

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }catch(Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        // bindGridView();
        Page_Load(this, e);
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string id = GridView1.Rows[e.RowIndex].Cells[1].Text;
        string name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
        string cnic = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text;
      
        string relation = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4")).Text;
        string address = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5")).Text;
        string profession = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox6")).Text;
        string phone = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox7")).Text;
        try {
            bool check = property.updateMembership(id, name, cnic, relation, address, profession, phone);
            //   bool check = cnic);

            GridView1.EditIndex = -1;
            bindGridView();
        }catch(Exception ex)
        {
            ShowMessage(ex.Message,MessageType.Warning);
        }
      //  Page_Load(this, e);
    }
   
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindGridView();
        Page_Load(this, e);
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.Rows[e.RowIndex].Cells[2].Text;
        try {
            bool check = property.deleteProperty(id);
        }catch(Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
        bindGridView();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                // Add client-side confirmation when deleting.
               // ((LinkButton)e.Row.Cells[1].Controls[0]).Attributes["onclick"] = "if(!confirm('Are you sure you want to delete?')) return false;";
            }
        }
    }

    protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        // bindGridView();
        Page_Load(this, e);
    }

   
}


