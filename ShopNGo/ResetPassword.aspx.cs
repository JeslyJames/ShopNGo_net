using Firebase.Auth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopNGo
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        private const string API_KEY = "AIzaSyA2qjNpCC0_OpOlHnDzD-w4UIrjz0hNUF8";
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        async protected void handleResetPassword(object sender, EventArgs e)
        {
            try
            {
                string email = txtEmail.Text.Trim();

                if (string.IsNullOrEmpty(email))
                {
                    lblError.Text = "Please enter your email address.";
                    lblError.CssClass = "alert alert-danger";
                    lblError.CssClass = lblError.CssClass.Replace("d-none", "");
                    return;
                }

                FirebaseAuthProvider firebaseAuthProvider = new FirebaseAuthProvider(new FirebaseConfig(API_KEY));

                await firebaseAuthProvider.SendPasswordResetEmailAsync(email);

                lblError.Text = "You will receive a reset link if the email exists!";
                lblError.CssClass = "alert alert-success";

            }
            catch (Exception ex)
            {
                lblError.Text = "Unexpected Error";
                lblError.CssClass = "alert alert-danger";
                lblError.CssClass = lblError.CssClass.Replace("d-none", "");
            }
        }
    }
}