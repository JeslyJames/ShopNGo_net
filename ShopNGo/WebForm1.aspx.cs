using System;

namespace ShopNGo
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            AuthenticateRequest.VerifyToken();
        }
    }
}