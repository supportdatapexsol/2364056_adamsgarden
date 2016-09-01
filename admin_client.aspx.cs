using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
public partial class admin_client : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null && !Request.Path.EndsWith("login.aspx"))
        {
            Response.Redirect("login.aspx");

        }
    }
    
    protected void GridView2_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        Button1_Click(this, e);
    }

    protected void GridView2_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView2.Rows[e.RowIndex];
        int cId = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0]);
       // string id = ((TextBox)GridView2.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        string name = ((TextBox)GridView2.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
        string sof = ((TextBox)GridView2.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
        string cnic =((TextBox)GridView2.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
        string occupation = ((TextBox)GridView2.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
        string paddress = ((TextBox)GridView2.Rows[e.RowIndex].Cells[7].Controls[0]).Text;
        string telephon = ((TextBox)GridView2.Rows[e.RowIndex].Cells[8].Controls[0]).Text;
        string mobile = ((TextBox)GridView2.Rows[e.RowIndex].Cells[9].Controls[0]).Text;
        string email = ((TextBox)GridView2.Rows[e.RowIndex].Cells[10].Controls[0]).Text;
        string peraddress = ((TextBox)GridView2.Rows[e.RowIndex].Cells[11].Controls[0]).Text;
        string nname = ((TextBox)GridView2.Rows[e.RowIndex].Cells[12].Controls[0]).Text;
        string naddress = ((TextBox)GridView2.Rows[e.RowIndex].Cells[13].Controls[0]).Text;
        string ncnic = ((TextBox)GridView2.Rows[e.RowIndex].Cells[14].Controls[0]).Text;
        string nno = ((TextBox)GridView2.Rows[e.RowIndex].Cells[15].Controls[0]).Text;
        string rno = ((TextBox)GridView2.Rows[e.RowIndex].Cells[16].Controls[0]).Text;
        FileUpload fu = (FileUpload)row.FindControl("FileUpload2");
        if (!fu.HasFile)
        {
            byte[] imagebinary = client.getimage(cId);
          //  fu.PostedFile.InputStream.Read(imagebinary, 0, length);


          //  client.updatclient(cId, name, sof, cnic, occupation, paddress, telephon, mobile, email, peraddress, nname, naddress, cnic, nno, imagebinary, rno);
        }
        else
        {
            int length = fu.PostedFile.ContentLength;
            byte[] imagebinary = new byte[length];
            fu.PostedFile.InputStream.Read(imagebinary, 0, length);
            

          //  client.updatclient(cId, name, sof, cnic, occupation, paddress, telephon, mobile, email, peraddress, nname, naddress, cnic, nno, imagebinary, rno);
        }
        GridView2.EditIndex = -1;
        Button1_Click(this, e);
    }

    protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView2.EditIndex = -1;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        viewData.Visible = false;
        clientpaymentplan.Visible = true;
        paymentplan_client.DataSource = installment.getClientInstallmentPlan();
        paymentplan_client.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            viewData.Visible = true;
            clientpaymentplan.Visible = false;
            DataTable dt = client.viewClients();
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
    }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int cid = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0]);
        client.deleteInstallments(cid);
        Button1_Click(this, e);
    }



    protected void Button3_Click(object sender, EventArgs e)
    {
        paymentplan_client.DataSource = installment.getClientInstallmentPlanByCnic(Search.Text);
        paymentplan_client.DataBind();
    }
}