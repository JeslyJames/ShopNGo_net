using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
                    // Implement your cart logic here
                }
            }
        }
    }
