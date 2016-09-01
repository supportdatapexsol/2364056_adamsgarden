using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_client_installmentplan : System.Web.UI.Page
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
            //viewData.Visible = false;
            clientpaymentplan.Visible = true;
            if (!IsPostBack)
            {
                if (Search.Text == "")//when search box will b null it will get allrecords 
                {
                    try {
                        pSearchID.Visible = false;
                        DataTable dt = installment.getClientInstallmentPlan();
                        //adjusting column name
                        DataTable newdt = new DataTable();//for filtering data

                        newdt.Columns.Add("Name", typeof(string));

                        newdt.Columns.Add("Cnic", typeof(string));
                        newdt.Columns.Add("Total Cost", typeof(string));
                        newdt.Columns.Add("Duration", typeof(string));
                        newdt.Columns.Add("Plot Size", typeof(string));
                        newdt.Columns.Add("Down Payment Cost", typeof(string));
                        newdt.Columns.Add("Lum Sum Discount", typeof(string));
                        newdt.Columns.Add("Dimensions of Plot", typeof(string));
                        newdt.Columns.Add("Membership Fee", typeof(string));
                        newdt.Columns.Add("Regno", typeof(string));
                        foreach (DataRow row in dt.Rows)
                        {
                            DataRow nrow = newdt.NewRow();  //creating newRow

                            nrow["Name"] = row["name"];
                            nrow["Cnic"] = row["applicant_cnic"];
                            nrow["Total Cost"] = row["Amount"];
                            nrow["Duration"] = row["Duration"];
                            nrow["Plot Size"] = row["PlotSize"];
                            nrow["Down Payment Cost"] = row["DownPayment"];
                            nrow["Lum Sum Discount"] = row["Lumsum_Discount"];
                            nrow["Dimensions of Plot"] = row["Marla"];
                            nrow["Membership Fee"] = row["Membershipfee"];
                            nrow["Regno"] = row["Regno"];

                            newdt.Rows.Add(nrow);

                        }
                        paymentplan_client.DataSource = newdt;
                        paymentplan_client.DataBind();
                    }catch(Exception ex)
                    {
                        ShowMessage(ex.Message, MessageType.Warning);
                    }
                }
            }
        }

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try {
            clientpaymentplan.Visible = false;
            pSearchID.Visible = true;
            DataTable dt = installment.getClientInstallmentPlanByCnic(Search.Text);
            lbName.Text = dt.Rows[0]["name"].ToString();
            lbCnic.Text = dt.Rows[0]["applicant_cnic"].ToString();
            lbtotalcost.Text = dt.Rows[0]["Amount"].ToString();
            lbduration.Text = dt.Rows[0]["Duration"].ToString();
            lbPlotSize.Text = dt.Rows[0]["PlotSize"].ToString();
            lbdownpayment.Text = dt.Rows[0]["DownPayment"].ToString();
            lblumsum.Text = dt.Rows[0]["Lumsum_Discount"].ToString();
            lbdimension.Text = dt.Rows[0]["Marla"].ToString();
            lbmembershipfee.Text = dt.Rows[0]["Membershipfee"].ToString();
            lbregno.Text = dt.Rows[0]["Regno"].ToString();
            
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }

    protected void paymentplan_client_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try {
            paymentplan_client.PageIndex = e.NewPageIndex;
            paymentplan_client.DataSource = installment.getClientInstallmentPlan();
            paymentplan_client.DataBind();
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }
}