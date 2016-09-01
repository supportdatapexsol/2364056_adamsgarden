using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_membership_registeration : System.Web.UI.Page
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
        else
        {
            if (!IsPostBack)
            {
                Cal1.Visible = false;
                tbreg.Focus();
            }
        }
    }

    protected void add_db_btn_Click(object sender, EventArgs e)
    {
        string regNo = tbreg.Text;
        string name = tbname.Text;
        string relation = tbsof.Text;
        string postalAddress = tbcurrentAddress.Text;
        string profession = tbprofession.Text;
        string phone = tbPhone.Text;
        string cnic = tbcnic.Text;
        string inFavorOf = tbfavourof.Text;
        string jsAccount = tbjsbankaccout.Text;
        string cashOrderNo = tb_cash_paordernumber.Text;
        string amount = tbamount.Text;
        string amountInWords = tbamountinwords.Text;
        string date = tbdate.Text;
        try { 

            string returnmsg = client.clientRegistration(regNo, name, relation, postalAddress, profession, phone, cnic,
                inFavorOf, jsAccount, cashOrderNo, amount, amountInWords,date);
     
        if (returnmsg == "")
        {
             tbreg.Text="";
             tbname.Text="";
             tbsof.Text="";
            tbcurrentAddress.Text="";
            tbprofession.Text="";
            tbPhone.Text="";
            tbcnic.Text="";
            tb_cash_paordernumber.Text="";
            ShowMessage("Membership registration", MessageType.Success);
        }
        else
        {
            ShowMessage(returnmsg, MessageType.Error);
        }
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, MessageType.Warning);
        }
    }

    protected void ImageButton_Click(object sender, ImageClickEventArgs e)
    {
        if(Cal1.Visible == false)
        {
            Cal1.Visible = true;
        }
        else
        {
            Cal1.Visible = false;

        }
    }

    protected void Cal1_SelectionChanged(object sender, EventArgs e)
    {
        tbdate.Text = Cal1.SelectedDate.ToShortDateString();
        Cal1.Visible = false;
    }
}