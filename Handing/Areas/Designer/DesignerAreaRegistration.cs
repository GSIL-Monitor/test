using System.Web.Mvc;

namespace Handing.Areas.Designer.Controllers
{
    public class DesignerAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Designer";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
              this.AreaName + "_Default",
              this.AreaName + "/{controller}/{action}/{id}",
              new { area = this.AreaName, controller = "Home", action = "Index", id = UrlParameter.Optional },
              new string[] { "Handing.Areas." + this.AreaName + ".Controllers" }
            );
        }
    }
}
