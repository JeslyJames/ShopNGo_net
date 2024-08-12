using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopNGo
{
    public partial class ConfirmPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AuthenticateRequest.VerifyToken();
        }

        protected void btnGoHome_Click(object sender, EventArgs e)
        {
            // Redirect to the home page
            Response.Redirect("Home.aspx"); // Adjust the URL based on your home page
        }
    }
}