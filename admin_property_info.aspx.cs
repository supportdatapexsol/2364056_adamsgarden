using System;
using System.Collections.Generic;
using System.Data;
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
                pSearchID.Visible = false;

                // Bind the GridView control.
                bindGridView();

            }
           
            if (searchtb.Text != "")
            {
                pSearchID.Visible = true;
                scrollId.Visible = false;
                try {
                    DataTable dt = property.searchPropertyDetailByCnic(searchtb.Text);
                    lbName.Text = dt.Rows[0]["name"].ToString();
                    lbCnic.Text = dt.Rows[0]["applicant_cnic"].ToString();
                    lbPlotNo.Text = dt.Rows[0]["plot_no"].ToString();
                    lbReg.Text = dt.Rows[0]["registrationo"].ToString();
                    lbPlotSize.Text = dt.Rows[0]["plot_size"].ToString();
                    lbStreet.Text = dt.Rows[0]["street_no"].ToString();
                    lbPlotAdd.Text = dt.Rows[0]["plot_address"].ToString();
                    lbOwnerName.Text = dt.Rows[0]["owner_property_name"].ToString();
                    lbOwnerAddress.Text = dt.Rows[0]["owner_property_address"].ToString();
                    lbOwnerCnic.Text = dt.Rows[0]["owner_property_cnic"].ToString();
                    lbPropertyType.Text = dt.Rows[0]["property_type"].ToString();
                }
                catch (Exception ex)
                {
                    ShowMessage(ex.Message, MessageType.Warning);
                }

            }
          
        }
    }
        protected void searchbtn_Click(object sender, EventArgs e)
        {
            Page_Load(this, e);
        }
        protected void bindGridView()
        {
        // Bind the GridView control.
        try {
            DataTable dt = property.view();

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception ex)
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
            string plot_no = GridView1.Rows[e.RowIndex].Cells[4].Text;
            string plot_size = GridView1.Rows[e.RowIndex].Cells[6].Text;
            //  string plot_no = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4")).Text;
            // string plot_size = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5")).Text;
            string street_no = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4")).Text;
            string plot_address = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5")).Text;
            string owner_property_name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox6")).Text;
            string owner_property_address = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox7")).Text;
            string property_type = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox8")).Text;
            string owner_property_cnic = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox9")).Text;
        try {
            bool check = property.updateProperty(id, plot_no, plot_size, street_no, plot_address, owner_property_name, owner_property_address, property_type, owner_property_cnic);
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
        GridView1.EditIndex = -1;
            bindGridView();
    //       Page_Load(this, e);


        }


        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            //bindGridView();
            Page_Load(this, e);
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        try {
            string id = GridView1.Rows[e.RowIndex].Cells[2].Text;
            bool check = property.deleteProperty(id);
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
        bindGridView();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

           
        // Make sure the current GridViewRow is either 
        // in the normal state or an alternate row.
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



    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindGridView();
    }
}

