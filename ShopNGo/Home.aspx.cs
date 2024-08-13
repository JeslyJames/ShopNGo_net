using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using ShopNGo.Models; // Ensure this using directive matches your project's structure

namespace ShopNGo
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AuthenticateRequest.VerifyToken();
            if (!IsPostBack)
            {
                // Data binding or other initialization code
            }
        }

        protected void RepeaterDeals_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);

                // Retrieve product details from the database
                CartItem cartItem = GetProductDetails(productId);

                if (cartItem != null)
                {
                    // Retrieve the cart from session, if it exists
                    List<CartItem> cart = Session["Cart"] as List<CartItem>;
                    if (cart == null)
                        cart = new List<CartItem>();

                    // Check if the item already exists in the cart
                    CartItem existingItem = cart.Find(item => item.ProductId == productId);
                    if (existingItem != null)
                    {
                        // Update quantity if item already in cart
                        existingItem.Quantity += 1;
                    }
                    else
                    {
                        // Add new item to the cart
                        cartItem.Quantity = 1;
                        cart.Add(cartItem);
                    }

                    // Save the updated cart back to the session
                    Session["Cart"] = cart;

                    // Redirect to the cart page
                    Response.Redirect("~/Cart.aspx");
                }
            }
        }

        private CartItem GetProductDetails(int productId)
        {
            CartItem cartItem = null;

            string connectionString = ConfigurationManager.ConnectionStrings["ShopNGoConnectionString"].ConnectionString;
            string query = "SELECT product_id, name, sale_price FROM Products WHERE product_id = @ProductId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ProductId", productId);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    string name = reader["name"].ToString();
                    decimal price = Convert.ToDecimal(reader["sale_price"]);

                    cartItem = new CartItem
                    {
                        ProductId = productId,
                        Name = name,
                        Price = price,
                        Quantity = 0 // Set initial quantity to 0, to be updated later
                    };
                }

                reader.Close();
            }

            return cartItem;
        }
    }
}
