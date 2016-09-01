using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(masterpage.Startup))]
namespace masterpage
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
