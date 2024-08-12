using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopNGo
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // No specific tasks needed on initial page load
            }
        }

        protected void RepeaterDeals_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                string productId = e.CommandArgument.ToString();

                // Add the selected product to the cart
                // For example, you can use a session or other storage method
                // Example:
                // List<string> cart = Session["Cart"] as List<string>;
                // if (cart == null) cart = new List<string>();
                // cart.Add(productId);
                // Session["Cart"] = cart;

                // Redirect to the cart page
                Response.Redirect("~/Cart.aspx");
            }
        }
    }
}
