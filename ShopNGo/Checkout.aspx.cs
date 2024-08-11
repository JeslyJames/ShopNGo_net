using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopNGo
{
    public partial class Checkout : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize or load any required data here if necessary
            }
        }

        protected void chkSameAsBilling_CheckedChanged(object sender, EventArgs e)
        {
            // Handle the CheckBox event to copy billing address to shipping address
            bool isChecked = chkSameAsBilling.Checked;

            txtShipAddress.Text = isChecked ? txtAddress.Text : string.Empty;
            txtShipCity.Text = isChecked ? txtCity.Text : string.Empty;
            ddlShipState.SelectedValue = isChecked ? ddlState.SelectedValue : string.Empty;
            txtShipZip.Text = isChecked ? txtZip.Text : string.Empty;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Process the form data
                string email = txtEmail1.Text;
                string firstName = txtFirstName.Text;
                string lastName = txtLastName.Text;
                string phone = txtPhone.Text;

                string address = txtAddress.Text;
                string city = txtCity.Text;
                string state = ddlState.SelectedValue;
                string zip = txtZip.Text;

                string shipAddress = txtShipAddress.Text;
                string shipCity = txtShipCity.Text;
                string shipState = ddlShipState.SelectedValue;
                string shipZip = txtShipZip.Text;

                // Implement form submission logic here, such as saving data to a database
                // For example:
                // SaveOrder(email, firstName, lastName, phone, address, city, state, zip, shipAddress, shipCity, shipState, shipZip);

                // Redirect or show confirmation
                Response.Redirect("ConfirmPage.aspx");
            }
        }

        protected void cvDOB_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (DateTime.TryParse(txtDOB.Text, out DateTime dob))
            {
                int age = DateTime.Today.Year - dob.Year;
                if (dob.Date > DateTime.Today.AddYears(-age)) age--;
                args.IsValid = age >= 18;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}
