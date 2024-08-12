using FirebaseAdmin;
using FirebaseAdmin.Auth;
using Google.Apis.Auth.OAuth2;
using System;
using System.Threading.Tasks;
using System.Web;

namespace ShopNGo
{
    public static class FirebaseAuthHelper
    {
        private static bool _initialized;

        // Ensure Firebase is initialized
        private static void Initialize()
        {
            if (!_initialized)
            {
                var serviceAccountPath = HttpContext.Current.Server.MapPath("~/App_Data/firebase-config.json");

                FirebaseApp.Create(new AppOptions
                {
                    Credential = GoogleCredential.FromFile(serviceAccountPath)
                });

                _initialized = true;
            }
        }

        public static async Task<string> VerifyTokenAsync(string token)
        {
            Initialize();

            try
            {
                var decodedToken = await FirebaseAuth.DefaultInstance.VerifyIdTokenAsync(token);
                return decodedToken.Uid;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Token verification failed: {ex.Message}");
                return null;
            }
        }

    }
}
