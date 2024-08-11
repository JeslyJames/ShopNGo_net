using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopNGo.Models; // Ensure this namespace is correct

namespace ShopNGo
{
    public partial class Cart : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Cart"] == null)
                {
                    Session["Cart"] = new List<CartItem>();
                }
                DisplayCart();
            }
        }

        private void DisplayCart()
        {
            List<CartItem> cart = (List<CartItem>)Session["Cart"];
            var cartItems = new List<CartItemDisplayModel>();

            foreach (var item in cart)
            {
                cartItems.Add(new CartItemDisplayModel
                {
                    ProductId = item.Product.Id,
                    ProductName = item.Product.Name,
                    Quantity = item.Quantity,
                    TotalPrice = item.TotalPrice
                });
            }

            RepeaterCart.DataSource = cartItems;
            RepeaterCart.DataBind();
        }

        protected void RepeaterCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            List<CartItem> cart = (List<CartItem>)Session["Cart"];
            int productId = Convert.ToInt32(e.CommandArgument);
            CartItem item = cart.Find(i => i.Product.Id == productId);

            if (item != null)
            {
                if (e.CommandName == "UpdateQuantity")
                {
                    TextBox txtQuantity = (TextBox)e.Item.FindControl("txtQuantity");
                    int newQuantity = Convert.ToInt32(txtQuantity.Text);

                    if (newQuantity > 0)
                    {
                        item.Quantity = newQuantity;
                        Session["Cart"] = cart;
                        DisplayCart();
                        lblMessage.Text = "Cart updated.";
                    }
                    else
                    {
                        lblMessage.Text = "Quantity must be greater than zero.";
                    }
                }
                else if (e.CommandName == "RemoveFromCart")
                {
                    cart.Remove(item);
                    Session["Cart"] = cart;
                    DisplayCart();
                    lblMessage.Text = "Item removed from cart.";
                }
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            Session["Cart"] = new List<CartItem>();
            DisplayCart();
            lblMessage.Text = "Cart has been emptied.";
        }
    }
}
