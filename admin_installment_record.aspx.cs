using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_installment_record : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
       // if (Session["uname"] == null && !Request.Path.EndsWith("login.aspx"))
       // {
       //     Response.Redirect("login.aspx");
        //}
        //else
       // {
            if (!IsPostBack)
            {
                bindGridView();
                viewData.Visible = true;
            }
        //}

    }
    public void bindGridView()
    {
        GridView2.AllowPaging = true;
        pSearchID.Visible = false;
        viewData.Visible = false;
        try
        {
            DataTable dt = installment.getAllclients();//get clientdata
            DataTable newdt = new DataTable();//for filtering data
            newdt.Columns.Add("Registeration No", typeof(string));


            newdt.Columns.Add("Name", typeof(string));

            newdt.Columns.Add("Father/Husband", typeof(string));
            newdt.Columns.Add("Cnic", typeof(string));
            newdt.Columns.Add("Plot No", typeof(string));
            newdt.Columns.Add("Street", typeof(string));

            newdt.Columns.Add("Phone", typeof(string));
            newdt.Columns.Add("Telephone", typeof(string));
            newdt.Columns.Add("Present Address", typeof(string));
            newdt.Columns.Add("Occupation", typeof(string));
            newdt.Columns.Add("Id", typeof(string));
            foreach (DataRow row in dt.Rows)
            {
                DataRow nrow = newdt.NewRow();  //creating newRow
                nrow["Id"] = row["id"];
                nrow["Name"] = row["name"];
                nrow["Father/Husband"] = row["relation_of"];
                nrow["Cnic"] = row["applicant_cnic"];
                nrow["Phone"] = row["mobile"];
                nrow["Telephone"] = row["telephone"];
                nrow["Present Address"] = row["present_Address"];
                nrow["Occupation"] = row["occupation"];
                nrow["Plot No"] = row["plot_no"];
                nrow["Street"] = row["street_no"];

                nrow["Registeration No"] = row["registrationo"];

                newdt.Rows.Add(nrow);

            }

            viewData.Visible = true;
            lbviewpanel.Visible = false;
            GridView1.DataSource = newdt;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;

        if (IsPostBack)
        {
            viewData.Visible = true;
           
            tbregno.Value = row.Cells[1].Text.ToString();
            try
            {
               
                //gridView2dataBind(tbregno.Value.ToString());
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message, MessageType.Warning);
            }

            if (viewData.Visible == true)
            {
                //View_Click(this, e); 
                //lbviewpanel.Visible = true;
            }

        }
 }
  public DataTable retrieveCalculatedInfo(DataRow dr)
    {
        string plotno = dr["plot_no"].ToString();
        string regno = dr["registrationo"].ToString();
        string paymentpermonth=dr["payment_permonth"].ToString();
        string installmentduration=dr["installment_duration"].ToString();
        string downpayment = dr["down_payment"].ToString();
        string totalcost = dr["totalcost"].ToString();
       DateTime downpaymentdate= DateTime.Parse(dr["datedownpayment"].ToString());

        DataTable newdt = new DataTable();
        newdt.Columns.Add("PlotNo", typeof(string));
        newdt.Columns.Add("registrationo", typeof(string));
        newdt.Columns.Add("DownPaymentDate", typeof(string));
        newdt.Columns.Add("payment_permonth", typeof(string));
        newdt.Columns.Add("installment_duration", typeof(string));
        newdt.Columns.Add("down_payment", typeof(string));
        newdt.Columns.Add("totalcost", typeof(string));
        newdt.Columns.Add("DateofPayment", typeof(string));
        newdt.Columns.Add("RemainingInstallmentCost", typeof(string));
        for (int i =1; i <=80; i++)
        {
          
            DataRow ndatarow = newdt.NewRow();
            ndatarow["PlotNo"]=plotno;
            ndatarow["registrationo"] = regno;
            ndatarow["DownPaymentDate"]=downpaymentdate.ToShortDateString().ToString();
            ndatarow["payment_permonth"] = paymentpermonth;
            ndatarow["installment_duration"] = installmentduration;
            ndatarow["down_payment"] = downpayment;
                ndatarow["totalcost"]=totalcost;
            ndatarow["DateofPayment"]=downpaymentdate.AddMonths(i).ToShortDateString().ToString();
            double costofinstallemnt = i * int.Parse(paymentpermonth);
            double remaingcost = double.Parse(totalcost)-costofinstallemnt-double.Parse(downpayment);
            ndatarow["RemainingInstallmentCost"] = remaingcost.ToString();
            newdt.Rows.Add(ndatarow);
          


        }
        
        return newdt;
    }

    public void gridView2dataBind( String regno)
    {
        //        DataTable dt = installment.getClientInstallment(regno); //get clientdata
        // DataRow dr = dt.Rows[0];
        //DataTable dnew= retrieveCalculatedInfo(dr);
        // int c = dnew.Rows.Count;
       // GridView2.DataSource = dnew;
      //GridView2.DataBind();
     }

    protected void View_Click(object sender, EventArgs e)
    {

        /*lbviewpanel.Visible = true;

        viewData.Visible = true;
        try
        {
            gridView2dataBind(tbregno.Value.ToString());
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        ;*/

    }

/*
    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        View_Click(this, e);
     //   gridView2dataBind();
    }

    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        GridViewRow row = GridView1.Rows[e.RowIndex];
        int paymentId = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0]);
        //string id = ((TextBox)GridView2.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
        string date = System.DateTime.Today.ToShortDateString();//((TextBox)GridView2.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        string amount = ((TextBox)GridView2.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
        string amountinwords = ((TextBox)GridView2.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
        int propertyid = int.Parse(((TextBox)GridView2.Rows[e.RowIndex].Cells[11].Controls[0]).Text);
        string infavourof = ((TextBox)GridView2.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
        string jsbank = ((TextBox)GridView2.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
        string cashorderpay = ((TextBox)GridView2.Rows[e.RowIndex].Cells[7].Controls[0]).Text;
        string paymentype = ((TextBox)GridView2.Rows[e.RowIndex].Cells[8].Controls[0]).Text;
        string madethrough = ((TextBox)GridView2.Rows[e.RowIndex].Cells[9].Controls[0]).Text;
        try
        {
            if (installment.updatpayment(paymentId, int.Parse(tbid.Value), propertyid, date, amount, amountinwords, cashorderpay, paymentype, jsbank, infavourof, madethrough) == true)
            {
                GridView2.EditIndex = -1;
                View_Click(this, e);
            //   gridView2dataBind();

            }
            else
            {
                //checking.Text = "UnableToUPdateData";
            }
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }

    }




    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState == DataControlRowState.Edit)
        {
            // Comments
            TextBox comments = (TextBox)e.Row.Cells[2].Controls[0];
            comments.TextMode = TextBoxMode.MultiLine;
            comments.Height = 40;
            comments.Width = 120;
            comments = (TextBox)e.Row.Cells[3].Controls[0];
            comments.TextMode = TextBoxMode.MultiLine;
            comments.Height = 40;
            comments.Width = 120;
            comments = (TextBox)e.Row.Cells[4].Controls[0];
            comments.TextMode = TextBoxMode.MultiLine;
            comments.Height = 40;
            comments.Width = 120;
            comments = (TextBox)e.Row.Cells[5].Controls[0];
            comments.TextMode = TextBoxMode.MultiLine;
            comments.Height = 40;
            comments.Width = 120;
            comments = (TextBox)e.Row.Cells[6].Controls[0];
            comments.TextMode = TextBoxMode.MultiLine;
            comments.Height = 40;
            comments.Width = 120;
            comments = (TextBox)e.Row.Cells[7].Controls[0];
            comments.TextMode = TextBoxMode.MultiLine;
            comments.Height = 40;
            comments.Width = 120;
            comments = (TextBox)e.Row.Cells[8].Controls[0];
            comments.TextMode = TextBoxMode.MultiLine;
            comments.Height = 40;
            comments.Width = 120;
            comments = (TextBox)e.Row.Cells[9].Controls[0];
            comments.TextMode = TextBoxMode.MultiLine;
            comments.Height = 40;
            comments.Width = 120;
            comments = (TextBox)e.Row.Cells[10].Controls[0];
            comments.TextMode = TextBoxMode.MultiLine;
            comments.Height = 40;
            comments.Width = 120;

        }
        if (e.Row.RowType != DataControlRowType.DataRow) return;
        var updateButton = (LinkButton)e.Row.Cells[0].Controls[0];
        /*if (updateButton.Text == "Update")
        {
            updateButton.OnClientClick = "return confirm('Do you really want to update?');";
        }
        var deleteButton = (LinkButton)e.Row.Cells[0].Controls[2];
        if (deleteButton.Text == "Delete")
        {
            deleteButton.OnClientClick = "return confirm('Do you really want to delete?');";
        }


    }

    protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView2.EditIndex = -1;
        //   View_Click(this, e);
     //   gridView2dataBind();
    }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        View_Click(this, e);

        string paymentId = GridView2.DataKeys[e.RowIndex].Values[0].ToString();
        try
        {
            if (installment.deleteInstallments(paymentId) == true)
            {
                GridView2.EditIndex = -1;
                View_Click(this, e);
                StringWriter stringwriter = new StringWriter();
                HtmlTextWriter writer = new HtmlTextWriter(stringwriter);

            }
            else
            {
                // checking.Text = "Data not Deleted ";
            }
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }

    protected void GridView2_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    */

    protected void installmentPlan(object sender, EventArgs e)
    {
        Response.Redirect("admin_installment_plan.aspx");
    }

    protected void installmentClick(object sender, EventArgs e)
    {
        Response.Redirect("admin_installment.aspx");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        try
        {
            
            bindGridView();
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }

   

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (Search.Text != "")
        {
            Employepanel.Visible = true;

            try
            {
                DataTable dt = installment.SearchClient(Search.Text);//get clientdata
                lbName.Text = dt.Rows[0]["name"].ToString();
                lbrelation.Text = dt.Rows[0]["relation_of"].ToString();
                lbcnic.Text = dt.Rows[0]["applicant_cnic"].ToString();
                lbmobile.Text = dt.Rows[0]["mobile"].ToString();
                lbtel.Text = dt.Rows[0]["telephone"].ToString();
                lbadd.Text = dt.Rows[0]["present_address"].ToString();
                lboccupation.Text = dt.Rows[0]["occupation"].ToString();
                lbplot.Text = dt.Rows[0]["plot_no"].ToString();
                lbreg.Text = dt.Rows[0]["registrationo"].ToString();
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message, MessageType.Warning);
            }
        }
        else
        {
            GridView2.AllowPaging = true;

            //   Add.Visible = true;
            try
            {
                DataTable dt = installment.getAllclients();//get clientdata
                DataTable newdt = new DataTable();//for filtering data
                newdt.Columns.Add("Id", typeof(string));
                newdt.Columns.Add("Name", typeof(string));

                newdt.Columns.Add("Father/Husband", typeof(string));
                newdt.Columns.Add("Cnic", typeof(string));
                newdt.Columns.Add("Phone", typeof(string));
                newdt.Columns.Add("Telephone", typeof(string));
                newdt.Columns.Add("Present Address", typeof(string));
                newdt.Columns.Add("Occupation", typeof(string));
                newdt.Columns.Add("Plot No", typeof(string));
                newdt.Columns.Add("Registeration No", typeof(string));
                foreach (DataRow row in dt.Rows)
                {
                    DataRow nrow = newdt.NewRow();  //creating newRow
                    nrow["Id"] = row["id"];
                    nrow["Name"] = row["name"];
                    nrow["Father/Husband"] = row["relation_of"];
                    nrow["Cnic"] = row["applicant_cnic"];
                    nrow["Phone"] = row["mobile"];
                    nrow["Telephone"] = row["telephone"];
                    nrow["Present Address"] = row["present_Address"];
                    nrow["Occupation"] = row["occupation"];
                    nrow["Plot No"] = row["plot_no"];
                    nrow["Registeration No"] = row["registrationo"];

                    newdt.Rows.Add(nrow);

                }
                viewData.Visible = true;
                lbviewpanel.Visible = false;
                GridView1.DataSource = newdt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message, MessageType.Warning);
            }
        }
    }
}
