using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Handing.Startup))]
namespace Handing
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
