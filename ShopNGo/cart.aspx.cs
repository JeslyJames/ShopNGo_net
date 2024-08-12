using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace ShopNGo
{
    public partial class Cart : System.Web.UI.Page
    {
        private List<CartItem> CartItems
        {
            get
            {
                if (Session["Cart"] == null)
                {
                    Session["Cart"] = new List<CartItem>();
                }
                return (List<CartItem>)Session["Cart"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            AuthenticateRequest.VerifyToken();

            if (!IsPostBack)
            {
                BindCart();
                UpdateTotalPrice();
            }
        }

        private void BindCart()
        {
            RepeaterCart.DataSource = CartItems;
            RepeaterCart.DataBind();
        }

        private void UpdateTotalPrice()
        {
            decimal totalPrice = CartItems.Sum(item => item.TotalPrice);
            lblTotalPrice.Text = $"Total Price: {totalPrice:C}";
        }

        protected void RepeaterCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "UpdateQuantity")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                TextBox txtQuantity = (TextBox)e.Item.FindControl("txtQuantity");
                if (int.TryParse(txtQuantity.Text, out int quantity) && quantity > 0)
                {
                    var item = CartItems.FirstOrDefault(i => i.ProductId == productId);
                    if (item != null)
                    {
                        item.Quantity = quantity;
                        Session["Cart"] = CartItems;
                        UpdateTotalPrice();
                    }
                }
                BindCart();
            }
            else if (e.CommandName == "RemoveFromCart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                var item = CartItems.FirstOrDefault(i => i.ProductId == productId);
                if (item != null)
                {
                    CartItems.Remove(item);
                    Session["Cart"] = CartItems;
                    UpdateTotalPrice();
                }
                BindCart();
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            Session["Cart"] = new List<CartItem>();
            BindCart();
            UpdateTotalPrice();
        }
    }
}
