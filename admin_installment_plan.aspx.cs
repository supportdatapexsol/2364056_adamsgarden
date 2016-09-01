using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_installment_plan : System.Web.UI.Page
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
                gvPerson.AllowPaging = true;//enabling gridview paging object
                gvPerson.PageSize = 15; //specifying page size

                gvPerson.AllowSorting = true;// Enable the GridView sorting option.

                // Initialize the sorting expression.
                ViewState["SortExpression"] = "installments_plan_info ASC";

                BindGridView();
            }
        }
    }

    private void BindGridView()
    {
        try { 
        // Bind the GridView control.
        DataTable dt = installmentplan.view();
        gvPerson.DataSource = dt;
        gvPerson.DataBind();
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }

    }
    protected void gvPerson_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        // Make sure the current GridViewRow is a data row.
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Make sure the current GridViewRow is either 
            // in the normal state or an alternate row.
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                // Add client-side confirmation when deleting.
                ((LinkButton)e.Row.Cells[1].Controls[0]).Attributes["onclick"] = "if(!confirm('Are you sure you want to delete?')) return false;";
            }
        }
    }
    protected void gvPerson_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        // Set the index of the new display page. 
        gvPerson.PageIndex = e.NewPageIndex;
        BindGridView();
    }
    protected void gvPerson_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvPerson.EditIndex = e.NewEditIndex;
        BindGridView();
      //  lbtnAdd.Visible = false;
    }
    protected void gvPerson_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvPerson.EditIndex = -1;
        BindGridView();
       // lbtnAdd.Visible = true;
    }
    protected void gvPerson_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string strPersonID = gvPerson.Rows[e.RowIndex].Cells[2].Text;
        string strLastName = ((TextBox)gvPerson.Rows[e.RowIndex].FindControl("TextBox1")).Text;
        string strFirstName = ((TextBox)gvPerson.Rows[e.RowIndex].FindControl("TextBox2")).Text;
        string duration = ((TextBox)gvPerson.Rows[e.RowIndex].FindControl("TextBox3")).Text;
        string downpayment = ((TextBox)gvPerson.Rows[e.RowIndex].FindControl("TextBox4")).Text;
        string lumsum = ((TextBox)gvPerson.Rows[e.RowIndex].FindControl("TextBox5")).Text;
        string size = ((TextBox)gvPerson.Rows[e.RowIndex].FindControl("TextBox6")).Text;
        string totalCost = ((TextBox)gvPerson.Rows[e.RowIndex].FindControl("TextBox7")).Text;
        string membershipfee = ((TextBox)gvPerson.Rows[e.RowIndex].FindControl("Textbox8")).Text;
        try { 
            bool check = installmentplan.updateInstallments(strPersonID, strLastName, strFirstName, duration, downpayment, lumsum, size, totalCost,membershipfee);
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
        gvPerson.EditIndex = -1;
        BindGridView();
    }
    protected void gvPerson_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strPersonID = gvPerson.Rows[e.RowIndex].Cells[2].Text;
        try { 
            bool check = installmentplan.deleteInstallments(strPersonID);
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
        BindGridView();
    }
    protected void gvPerson_Sorting(object sender, GridViewSortEventArgs e)
    {
        string[] strSortExpression = ViewState["SortExpression"].ToString().Split(' ');
        if (strSortExpression[0] == e.SortExpression)
        {
            if (strSortExpression[1] == "ASC")
            {
                ViewState["SortExpression"] = e.SortExpression + " " + "DESC";
            }
            else
            {
                ViewState["SortExpression"] = e.SortExpression + " " + "ASC";
            }
        }
        else
        {
            ViewState["SortExpression"] = e.SortExpression + " " + "ASC";
        }
        BindGridView();
    }

  

    

    protected void installmentPlan(object sender, EventArgs e)
    {
        Response.Redirect("admin_installment_plan.aspx");
    }

    protected void installmentClick(object sender, EventArgs e)
    {
        Response.Redirect("admin_installment.aspx");
    }

}