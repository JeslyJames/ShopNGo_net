using System;
using System.Web.UI.WebControls;

namespace ShopNGo
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AuthenticateRequest.VerifyToken();
        }

        // Handle row updated event for categories
        protected void gvCategories_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            // Handle the row updated event here if needed
            gvCategories.DataBind();
            gvProducts.DataBind();
        }

        // Handle row deleted event for categories
        protected void gvCategories_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            // Handle the row deleted event here if needed
            gvCategories.DataBind();
            gvProducts.DataBind();
        }

        // Add a new category
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSourceAddCategory.InsertParameters["category_name"].DefaultValue = txtCategoryName.Text;
                SqlDataSourceAddCategory.InsertParameters["description"].DefaultValue = txtCategoryDescription.Text;
                SqlDataSourceAddCategory.Insert();
                gvCategories.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.StackTrace);
            }
        }

        // Handle product selection
        protected void gvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Handle product selection to update DetailsView
            dvProducts.PageIndex = gvProducts.SelectedIndex;
        }

        // Add a new product
        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            dvProducts.ChangeMode(DetailsViewMode.Insert);
        }
    }
}