using Firebase.Auth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopNGo
{
    public partial class SignUp : System.Web.UI.Page
    {
        private const string API_KEY = "AIzaSyA2qjNpCC0_OpOlHnDzD-w4UIrjz0hNUF8";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        async protected void handleSignUp(object sender, EventArgs e)
        {
            try
            {
                string firstName = txtFirstName.Text.Trim();
                string lastName = txtLastName.Text.Trim();
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();

                FirebaseAuthProvider firebaseAuthProvider = new FirebaseAuthProvider(new FirebaseConfig(API_KEY));

                FirebaseAuthLink firebaseAuthLink = await firebaseAuthProvider.CreateUserWithEmailAndPasswordAsync(email, password, firstName + lastName);

                Response.Redirect("Login");

            }
            catch (FirebaseAuthException ex)
            {
                string errorMessage;

                if (ex.Reason == AuthErrorReason.EmailExists)
                {
                    errorMessage = "This email address exists already.";
                }
                else
                {
                    errorMessage = "SignUp Error! Please try again.";
                }

                lblError.Text = errorMessage;
                lblError.CssClass = "alert alert-danger";
            }
            catch (Exception ex)
            { 
                lblError.Text = "Unexpected error occurred";
                lblError.CssClass = "alert alert-danger";
            }
        }
    }
}