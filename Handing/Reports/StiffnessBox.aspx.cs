using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Handing.Reports
{
    public partial class WFGang : System.Web.UI.Page
    {
        public static string sti_force, txt_showresult, txt_showresult2, txt_showresult4;
        public static double x1, x2, x3, x4,x5,x6,x7,x9,x10;
        public static string aaa,p,L,pass;
        public void Page_Load(object sender, EventArgs e)
        {
            if (Session["sti_force"] != null)
            {
                sti_force = Session["sti_force"].ToString();
                //pass = Request["hidenx"];//测试1
                //pass = Request.QueryString["hidenx"];//测试2
                //pass = Request.Params["hidenx"].ToString();测试3
                //pass = Request.RequestContext.RouteData.Values["hidenx"].ToString();测试4
                p = Session["sti_force"].ToString();
                L =  Session["sti_span"].ToString();
                x1 = Convert.ToDouble(Session["sti_L1"]);
                x2 = Convert.ToDouble(Session["sti_t1"]);
                x3 = Convert.ToDouble(Session["sti_L2"]);
                x4 = Convert.ToDouble(Session["sti_t2"]);
                x5 = Convert.ToDouble(Session["sti_t3"]);
                x6 = Convert.ToDouble(Session["sti_t4"]);
                x7 = Convert.ToDouble(Session["sti_h"]);
                x9 = Convert.ToDouble(Session["sti_t6"]);
                x10 = Convert.ToDouble(Session["sti_t5"]);

                txt_showresult = Session["txt_showresult"].ToString();
                txt_showresult2 = Session["txt_showresult2"].ToString();
                txt_showresult4 = Session["txt_showresult4"].ToString();

            }
          
        }
        public void Page_UnLoad(object sender, EventArgs e)
        {
            Session.RemoveAll();
        }
    }
}