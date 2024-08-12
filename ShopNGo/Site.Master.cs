using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopNGo
{
    public partial class SiteMaster : MasterPage
    {
        protected bool ShowLogin { get; set; }
        protected bool ShowLogout { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie authTokenCookie = Request.Cookies["token"];
            if (authTokenCookie != null && !string.IsNullOrEmpty(authTokenCookie.Value))
            {
                ShowLogin = false;
                ShowLogout = true;
            }
            else
            {
                ShowLogin = true;
                ShowLogout = false;
            }
        }
    }
}