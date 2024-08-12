using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using ShopNGo.Models; // Ensure you are using the correct namespace for CartItem

namespace ShopNGo
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Initialize cart if it doesn't exist
                if (Session["Cart"] == null)
                {
                    Session["Cart"] = new List<CartItem>();
                }
            }
        }

        protected void btnAddToCart_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);

                // Fetch product details from the database
                string productName = "";
                decimal productPrice = 0;

                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopNGoConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT name, sale_price FROM Products WHERE product_id = @ProductId";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ProductId", productId);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        productName = reader["name"].ToString();
                        productPrice = reader["sale_price"] != DBNull.Value ? Convert.ToDecimal(reader["sale_price"]) : 0;
                    }
                    reader.Close();
                }

                List<CartItem> cart = (List<CartItem>)Session["Cart"];
                CartItem existingItem = cart.Find(item => item.ProductId == productId);

                if (existingItem == null)
                {
                    // Add new item to the cart
                    cart.Add(new CartItem
                    {
                        ProductId = productId,
                        Name = productName,
                        Price = productPrice,
                        Quantity = 1
                    });
                }
                else
                {
                    // Update quantity and ensure the price is correct
                    existingItem.Quantity++;
                    existingItem.Price = productPrice; // Ensure the price is updated
                }

                // Save updated cart to session
                Session["Cart"] = cart;

                // Redirect to the cart page
                Response.Redirect("Cart.aspx");
            }
        }
    }
}
