using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Handing.Reports
{
    public partial class StrengthModel2 : System.Web.UI.Page
    {
        public static string p, L,A1,Qx, Ix, Yx, txt_showresult, txt_showresult2;
        public void Page_Load(object sender, EventArgs e)
        {
            string abc = Request.QueryString["sti_force0"];//测试三种方式获取参数
            string aba = Request["sti_force0"];
            string anv = Request.Params["sti_force0"];

            if (Session["sti_force0"] != null)
            {
                p = Session["sti_force0"].ToString();
                L = Session["sti_span0"].ToString();
                A1 = Session["sti_span01"].ToString();
                Qx = Session["sti_L01"].ToString();
                Ix = Session["sti_t01"].ToString();
                Yx = Session["sti_L02"].ToString();

                txt_showresult = Session["txt_showresult"].ToString();
                txt_showresult2 = Session["txt_showresult2"].ToString();
            }

        }
    }
}