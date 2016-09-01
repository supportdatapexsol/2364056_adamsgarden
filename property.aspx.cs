using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterpage
{
    public partial class property : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGridView();
            }
        }
        protected void bindGridView()
        {
            // Bind the GridView control.
            DataTable dt = property.view();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}