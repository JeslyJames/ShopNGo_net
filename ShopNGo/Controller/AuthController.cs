using Google.Apis.Auth;
using System;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace ShopNGo.Controller
{
    [RoutePrefix("api/auth")]
    public class AuthController : ApiController
    {
        [HttpPost]
        [Route("login")]
        public async Task<IHttpActionResult> Login(TokenRequest request)
        {
            if (string.IsNullOrEmpty(request.Token))
            {
                return BadRequest("Invalid token");
            }

            try
            {
                // Perform the token validation asynchronously
                var payload = await GoogleJsonWebSignature.ValidateAsync(request.Token);

                // Use the session synchronously after the async operation
                HttpContext context = HttpContext.Current;
                if (context != null && context.Session != null)
                {
                    context.Session["token"] = request.Token;
                    context.Session["UserEmail"] = payload.Email;
                }

                return Ok(new { message = "Token received and validated successfully", user = payload });
            }
            catch (InvalidJwtException)
            {
                // Handle invalid JWT
                return Unauthorized();
            }
            catch (Exception ex)
            {
                // Handle other exceptions
                Console.WriteLine($"Exception in api/auth/login: {ex.Message}");
                return InternalServerError(ex);
            }
        }
    }

    public class TokenRequest
    {
        public string Token { get; set; }
    }
}
