using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Handing.Reports.WholeDesign
{
    public partial class WholeDesignSecond : System.Web.UI.Page
    {
        WholeDesignData wdd = new WholeDesignData();

        protected void Page_Load(object sender, EventArgs e)
        {
            string mm = wdd.whliftspeed;

        }
    }
}