using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopNGo
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie authTokenCookie = Request.Cookies["token"];
            if (authTokenCookie != null)
            {
                authTokenCookie.Expires = DateTime.Now.AddDays(-1); // Set expiration to the past
                Response.Cookies.Add(authTokenCookie); // Add the expired cookie to the response to remove it
            }

            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Login");
        }
    }
}