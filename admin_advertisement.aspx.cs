using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewAdvertisement : System.Web.UI.Page
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
                BindGridView();
            }
        }
        
    }
    protected void BindGridView()
    {
        try {
            DataTable dt = advertisement.bindAdvertisement();
            ad_id.DataSource = dt;
            ad_id.DataBind();
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }
   
   
   
    protected void gv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        ad_id.EditIndex = -1;
        BindGridView();
    }
   
    protected void gv_RowEditing(object sender, GridViewEditEventArgs e)
    {
        ad_id.EditIndex = e.NewEditIndex;
        BindGridView();
    }
    protected void gv_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int index = e.RowIndex;

            GridViewRow row = (GridViewRow)ad_id.Rows[index];

            Label eid = (Label)row.FindControl("id");


            FileUpload fu = (FileUpload)row.FindControl("FileUpload2");


            string id = ad_id.Rows[e.RowIndex].Cells[2].Text;
            string status = ((TextBox)ad_id.Rows[e.RowIndex].FindControl("TextBox1")).Text;
            int img = fu.PostedFile.ContentLength;

            byte[] pic = new byte[img];
            fu.PostedFile.InputStream.Read(pic, 0, img);
            bool check = advertisement.updateAdvertisement(id, pic, status);


            ad_id.EditIndex = -1;
            Response.Write("upload pic.");

            BindGridView();
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }
  

    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try {
            string id = ad_id.Rows[e.RowIndex].Cells[2].Text;
            bool check = advertisement.deleteAdvertisement(id);

            BindGridView();
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }
    
    protected void ad_id_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ad_id.PageIndex = e.NewPageIndex;
        BindGridView();
    }
}