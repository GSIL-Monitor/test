using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Handing.Reports
{
    public partial class StrengthModel1 : System.Web.UI.Page
    {
        public static string p, L, Qx, Ix, Yx, txt_showresult,txt_showresult2;
        public void Page_Load(object sender, EventArgs e)
        {
            string abc = Request.QueryString["sti_force"];//测试三种方式获取参数
            string aba = Request["sti_force"];
            string anv = Request.Params["sti_force"];

            if (Session["sti_force"]!=null)
            {
                    
              p = Session["sti_force"].ToString();
              L = Session["sti_span"].ToString();
              Qx = Session["sti_L1"].ToString();
              Ix = Session["sti_t1"].ToString();
              Yx = Session["sti_L2"].ToString();

              txt_showresult = Session["txt_showresult"].ToString();
              txt_showresult2 = Session["txt_showresult2"].ToString();
           }
                       
        }
    }
}