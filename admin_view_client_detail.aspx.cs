using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_view_client_detail : System.Web.UI.Page
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
                viewData.Visible = true;
                bindGridView();

            }

            if (searchtb.Text != "")
            {
                viewData.Visible = false;
                pSearchID.Visible = true;
                try {
                    DataTable dt = client.viewClients(searchtb.Text);
                    //  GridView2.DataSource = client.viewClients(searchtb.Text);
                    // GridView2.DataBind();

                    lbName.Text = dt.Rows[0]["name"].ToString();
                    lbrelation.Text = dt.Rows[0]["relation_of"].ToString();

                    lbCnic.Text = dt.Rows[0]["applicant_cnic"].ToString();
                    lbocc.Text = dt.Rows[0]["occupation"].ToString();
                    lbpersadd.Text = dt.Rows[0]["present_address"].ToString();
                    lbtel.Text = dt.Rows[0]["telephone"].ToString();
                    lbmob.Text = dt.Rows[0]["mobile"].ToString();
                    lbemail.Text = dt.Rows[0]["email"].ToString();
                    lbpadd.Text = dt.Rows[0]["permanent_address"].ToString();
                    lbnname.Text = dt.Rows[0]["nominee_name"].ToString();
                    lbnadd.Text = dt.Rows[0]["nominee_address"].ToString();
                    lbncnic.Text = dt.Rows[0]["nominee_cnic"].ToString();
                    lbnno.Text = dt.Rows[0]["nominee_no"].ToString();
                }catch(Exception ex)
                {
                    ShowMessage(ex.Message,MessageType.Warning);
                }
                }
              

        }

    }

    public void bindGridView()
    {
        viewData.Visible = true;
        pSearchID.Visible = false;
        try {
            DataTable dt = client.viewClients();

            GridView2.DataSource = dt;
            GridView2.DataBind();
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "Key", "<script>MakeStaticHeader('" + GridView2.ClientID + "', 400, 950 , 40 ,true); </script>", false);
        }
        catch(Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            viewData.Visible = true;
            try {
                DataTable dt = client.viewClients();
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }catch(Exception ex)
            {
                ShowMessage(ex.Message, MessageType.Warning);
            }
        }
    }



    protected void searchbtn_Click(object sender, EventArgs e)
    {
        Page_Load(this, e);
    }



    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        //Button1_Click(this, e);
        Page_Load(this, e);
    }

    protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView2.EditIndex = -1;
        bindGridView();

    }

    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView2.Rows[e.RowIndex];

        string id = GridView2.Rows[e.RowIndex].Cells[2].Text;
        //     int cId = Convert.ToInt32(GridView2.Rows[e.RowIndex].Cells[2].Text); //Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0]);
        int cId = Convert.ToInt32(id);
        string name = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("tbname")).Text;
        string sof = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("tbrelation")).Text;

        string cnic = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("tbcnic")).Text;
        string occupation = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("tboccupation")).Text;
        string paddress = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("tbaddress")).Text;
        string telephon = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("tbtele")).Text;
        string mobile = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("tbmobile")).Text;
        string email = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("tbemail")).Text;
        string peraddress = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("tbPerAdd")).Text;
        string nname = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("tbNomineeName")).Text;
        string naddress = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("tbNomineeAdd")).Text;
        string ncnic = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("tbNomineeCnic")).Text;
        string nno = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("tbNo")).Text;

       
        string rno = "abc";
        FileUpload fu = (FileUpload)row.FindControl("FileUpload2");
        if (!fu.HasFile)
        {
            try {
                byte[] imagebinary = client.getimage(cId);
                client.update(cId, name, sof, cnic, occupation, paddress, telephon, mobile, email, peraddress, nname, naddress, ncnic, nno, imagebinary, rno);
            }
            catch(Exception ex)
            {
                ShowMessage(ex.Message, MessageType.Warning);
            }

        }
        else
        {
            int length = fu.PostedFile.ContentLength;
            byte[] imagebinary = new byte[length];
            fu.PostedFile.InputStream.Read(imagebinary, 0, length);
            try
            {
                client.update(cId, name, sof, cnic, occupation, paddress, telephon, mobile, email, peraddress, nname, naddress, ncnic, nno, imagebinary, rno);
            }
            catch(Exception ex)
            {
                ShowMessage(ex.Message, MessageType.Warning);
            }
        }
        GridView2.EditIndex = -1;
        Button1_Click(this, e);
        bindGridView();
    }




    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        bindGridView();
    
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}