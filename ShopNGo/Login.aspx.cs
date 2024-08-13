﻿using Firebase.Auth;
using System;
using System.Web;

namespace ShopNGo
{
    public partial class Login1 : System.Web.UI.Page
    {
        private const string API_KEY = "AIzaSyA2qjNpCC0_OpOlHnDzD-w4UIrjz0hNUF8";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void handleLogin(object sender, EventArgs e)
        {
            try
            {
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();

                var firebaseAuthProvider = new FirebaseAuthProvider(new FirebaseConfig(API_KEY));
                var firebaseAuthLink = firebaseAuthProvider.SignInWithEmailAndPasswordAsync(email, password).Result;

                //Session["token"] = firebaseAuthLink.FirebaseToken;
                
                HttpCookie myCookie = new HttpCookie("token");
                myCookie.Value = firebaseAuthLink.FirebaseToken;
                myCookie.Expires = DateTime.Now.AddDays(7); // Set expiration to 7 days from now

                // Add the cookie to the response
                Response.Cookies.Add(myCookie);

                Response.Redirect("/Home", false);
            }
            catch (Exception ex)
            {
                lblError.Text = "Invalid Credentials";
                lblError.CssClass = "alert alert-danger";
            }
        }
    }
}