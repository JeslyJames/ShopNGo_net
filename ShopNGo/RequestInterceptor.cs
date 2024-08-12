using System;
using System.Web;

namespace ShopNGo
{
    public class RequestInterceptor : IHttpModule
    {
        public void Init(HttpApplication context)
        {
            context.AcquireRequestState += OnAcquireRequestState;
        }

        private void OnAcquireRequestState(object sender, EventArgs e)
        {
            HttpApplication application = (HttpApplication)sender;
            HttpContext httpContext = application.Context;


            string requestUrl = httpContext.Request.Url.AbsolutePath;
            if (requestUrl.EndsWith("/Login.aspx") || requestUrl.EndsWith("/Login") || requestUrl.EndsWith("/"))
            {
                return;
            }

            //bool isAuthenticated = AuthenticateRequest.VerifyToken(httpContext.Session != null ? httpContext.Session["token"] as string : null);

            bool isAuthenticated = false;

            if (!isAuthenticated)
            {
                httpContext.Response.Redirect("Login");
                return;
            }
        }

        public void Dispose()
        {
            
        }
    }
}
