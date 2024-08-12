using System;
using System.Net.Http;
using System.Web;

namespace ShopNGo
{
    public class AuthenticateRequest
    {
        public async static void VerifyToken()
        {
            try
            {

                string requestUrl = HttpContext.Current.Request.Url.AbsolutePath;
                if (requestUrl.EndsWith("/Login.aspx") || requestUrl.EndsWith("/Login"))
                {
                    return;
                }

                //string token = HttpContext.Current.Session["token"] as string;
                string token = HttpContext.Current.Request.Cookies["token"]?.Value;

                /*
                if (token != null)
                {
                    Session["token"] = token;
                }
                */
                if (token == null)
                {
                    HttpContext.Current.Response.Redirect("/Login", false);
                }
                else
                {
                    string UId = await FirebaseAuthHelper.VerifyTokenAsync(token);

                    if (UId == null)
                    {
                        HttpContext.Current.Response.Redirect("/Login", false);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error authenticating");
            }
        }
    }
}