using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopNGo
{
    public partial class Products : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Perform any additional setup or data binding here
            }
        }

        protected void RepeaterProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                // Add the product to the shopping cart
            }
        }
    }
}
