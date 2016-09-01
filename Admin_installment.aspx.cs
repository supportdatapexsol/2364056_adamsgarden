using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_installment : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    public Admin_installment()
    {
      

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
                viewData.Visible = false;
            }
        }
        
    }
    public void bindGridView()
    {
        GridView2.AllowPaging = true;
        pSearchID.Visible = false;
        viewData.Visible = false;
        try {
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
            tbid.Value = row.Cells[1].Text.ToString();
            tbregno.Value = tbid.Value = row.Cells[1].Text.ToString();
            try {
                int propertyid = tranfer_form.getPropertyID(tbregno.Value);
                double cliet_intallment = tranfer_form.getClientTotalInstallmentsPaid(tbregno.Value);
                double total_propertypayments = tranfer_form.getPlotTotalPayment(propertyid);
                double percent = Math.Round((cliet_intallment / total_propertypayments) * 100);
                tinstallment.Value = total_propertypayments.ToString();
                cinstallment.Value = cliet_intallment.ToString();
                pid.Value = propertyid.ToString();
                percentage.Value = Convert.ToString(percent);
            }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }

        if (viewData.Visible == true)
            {
                View_Click(this, e);//forupdating datagridview2 
                lbviewpanel.Visible = true;
            }
           
        }



    }


    protected void cancelbtn_Click(object sender, EventArgs e)
    {
      

    }

    protected void add_db_btn_Click(object sender, EventArgs e)
    {
        //should pass property id here ......fuck
       
    }
    public void dataBind() {
        DataTable dt = installment.getclientpayments(tbregno.Value); //get clientdata
        DataTable newdt = new DataTable();//for filtering data
        newdt.Columns.Add("Payment_id", typeof(string));
        newdt.Columns.Add("Date", typeof(string));
        newdt.Columns.Add("Amount", typeof(string));
        newdt.Columns.Add("Amount in words", typeof(string));
        newdt.Columns.Add("In favour of", typeof(string));
        newdt.Columns.Add("Jsbank", typeof(string));
        newdt.Columns.Add("Cashpay order", typeof(string));
        newdt.Columns.Add("Payment type", typeof(string));
        newdt.Columns.Add("Payment made through", typeof(string));
        newdt.Columns.Add("Regno", typeof(string));
        newdt.Columns.Add("Property id", typeof(string));

        foreach (DataRow row in dt.Rows)
        {
            DataRow nrow = newdt.NewRow();  //creating newRow
            nrow["Payment_id"] = row["id"];
            nrow["Date"] = row["date"];
            nrow["Amount"] = row["payment_amount_in_RS"];
            nrow["Amount in words"] = row["payment_amount_in_wors"];
                        nrow["Property id"] = row["property_id"];
            nrow["In favour of"] = row["infavour_of"];
            nrow["Jsbank"] = row["jsbankaccount"];
            nrow["Cashpay order"] = row["Cash_payorder_no"];
            nrow["Payment type"] = row["payment_type"];
            nrow["Payment made through"] = row["payment_made_through"];
            nrow["Regno"] = row["property_registration"];
            newdt.Rows.Add(nrow);

        }

        GridView2.DataSource = newdt;
        // ((BoundField)GridView2.Columns[1]).ReadOnly = true;
        GridView2.DataBind();
    }

    protected void View_Click(object sender, EventArgs e)
    {
       
            lbviewpanel.Visible = true;
           
            viewData.Visible = true;
        try {
            dataBind();
         /*   DataTable dt = installment.getclientpayments(tbregno.Value); //get clientdata
            DataTable newdt = new DataTable();//for filtering data
            newdt.Columns.Add("Payment_id", typeof(string));
            newdt.Columns.Add("Date", typeof(string));
            newdt.Columns.Add("Amount", typeof(string));
            newdt.Columns.Add("Amount in words", typeof(string));
       //            newdt.Columns.Add("Property id", typeof(string));
            newdt.Columns.Add("In favour of", typeof(string));
            newdt.Columns.Add("Jsbank", typeof(string));
            newdt.Columns.Add("Cashpay order", typeof(string));
            newdt.Columns.Add("Payment type", typeof(string));
            newdt.Columns.Add("Payment made through", typeof(string));
            newdt.Columns.Add("Regno", typeof(string));
            foreach (DataRow row in dt.Rows)
            {
                DataRow nrow = newdt.NewRow();  //creating newRow
                nrow["Payment_id"] = row["id"];
                nrow["Date"] = row["date"];
                nrow["Amount"] = row["payment_amount_in_RS"];
                nrow["Amount in words"] = row["payment_amount_in_wors"];
      //            nrow["Property id"] = row["property_id"];
                nrow["In favour of"] = row["infavour_of"];
                nrow["Jsbank"] = row["jsbankaccount"];
                nrow["Cashpay order"] = row["Cash_payorder_no"];
                nrow["Payment type"] = row["payment_type"];
                nrow["Payment made through"] = row["payment_made_through"];
                nrow["Regno"] = row["property_registration"];
                newdt.Rows.Add(nrow);

            }

            GridView2.DataSource = newdt;
            // ((BoundField)GridView2.Columns[1]).ReadOnly = true;
            GridView2.DataBind();*/
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
}
        
    }


    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        View_Click(this, e);
        dataBind();
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
        try {
            if (installment.updatpayment(paymentId, int.Parse(tbid.Value), propertyid, date, amount, amountinwords, cashorderpay, paymentype, jsbank, infavourof, madethrough) == true)
            {
                GridView2.EditIndex = -1;
                View_Click(this, e);
                dataBind();

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
        }*/


    }

    protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView2.EditIndex = -1;
        //   View_Click(this, e);
        dataBind();
    }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        View_Click(this, e);

        string paymentId = GridView2.DataKeys[e.RowIndex].Values[0].ToString();
        try { 
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
        try {
            /*  DataTable dt = installment.getAllclients();//get clientdata
              DataTable newdt = new DataTable();//for filtering data
              newdt.Columns.Add("id", typeof(string));
              newdt.Columns.Add("name", typeof(string));

              newdt.Columns.Add("Father/Husband", typeof(string));
              newdt.Columns.Add("cnic", typeof(string));
              newdt.Columns.Add("phone", typeof(string));
              newdt.Columns.Add("Telephone", typeof(string));
              newdt.Columns.Add("Present_Address", typeof(string));
              newdt.Columns.Add("Occupation", typeof(string));
              newdt.Columns.Add("Plot no", typeof(string));
              foreach (DataRow row in dt.Rows)
              {
                  DataRow nrow = newdt.NewRow();  //creating newRow
                  nrow["id"] = row["id"];
                  nrow["name"] = row["name"];
                  nrow["Father/Husband"] = row["relation_of"];
                  nrow["cnic"] = row["applicant_cnic"];
                  nrow["phone"] = row["mobile"];
                  nrow["telephone"] = row["telephone"];
                  nrow["Present_Address"] = row["present_Address"];
                  nrow["Occupation"] = row["occupation"];
                  nrow["plot no"] = row["plot_no"];

                  newdt.Rows.Add(nrow);

              }
              viewData.Visible = true;
              lbviewpanel.Visible = false;
              GridView1.DataSource = newdt;
              GridView1.DataBind();*/
            bindGridView();
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        lbviewpanel.Visible = true;
       
        viewData.Visible = true;
         try { 
             DataTable dt = installment.getclientpayments(tbregno.Value); //get clientdata
             DataTable newdt = new DataTable();//for filtering data
             newdt.Columns.Add("Payment Id", typeof(string));
             newdt.Columns.Add("Date", typeof(string));
             newdt.Columns.Add("Amount", typeof(string));
             newdt.Columns.Add("Amount in words", typeof(string));
             newdt.Columns.Add("Property id", typeof(string));
             newdt.Columns.Add("In favour of", typeof(string));
             newdt.Columns.Add("Jsbank", typeof(string));
             newdt.Columns.Add("Cashpay order", typeof(string));
             newdt.Columns.Add("Payment type", typeof(string));
             newdt.Columns.Add("Payment made through", typeof(string));
             foreach (DataRow row in dt.Rows)
             {
                 DataRow nrow = newdt.NewRow();  //creating newRow
                 nrow["Payment Id"] = row["id"];
                 nrow["Date"] = row["date"];
                 nrow["Amount"] = row["payment_amount_in_RS"];
                 nrow["Amount in words"] = row["payment_amount_in_wors"];
                 nrow["Property id"] = row["property_id"];
                 nrow["In favour of"] = row["infavour_of"];
                 nrow["Jsbank"] = row["jsbankaccount"];
                 nrow["Cashpay order"] = row["Cash_payorder_no"];
                 nrow["Payment type"] = row["payment_type"];
                 nrow["Payment made through"] = row["payment_made_through"];

                 newdt.Rows.Add(nrow);

             }

             GridView2.DataSource = newdt;
             // ((BoundField)GridView2.Columns[1]).ReadOnly = true;
             GridView2.DataBind();
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

            try { 
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
            try { 
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
