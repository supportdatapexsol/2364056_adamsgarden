using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
public partial class Admin_SellerCamera : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null && !Request.Path.EndsWith("login.aspx"))
        {
            Response.Redirect("login.aspx");
        }
        else { 
            if (IsPostBack)
            {
                string seller = Request.Form["tbid"].ToString();


                if (seller.Length > 0)
                {

                    seller = seller.Replace("data:image/jpeg;base64,", "");


                    byte[] sellerBytes = Convert.FromBase64String(seller);
                    MemoryStream ms = new MemoryStream(sellerBytes, 0, sellerBytes.Length);
                    ms.Write(sellerBytes, 0, sellerBytes.Length);
                    System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                    image.Save(Server.MapPath("/Captures/Seller.jpg"), System.Drawing.Imaging.ImageFormat.Jpeg);
                    //************************************************
                    ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
                }
            }

        }
    }
}