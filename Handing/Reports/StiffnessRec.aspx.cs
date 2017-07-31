using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Handing.Reports
{
    public partial class StiffnessRec : System.Web.UI.Page
    {
        public static double sti_force2, sti_wheelbase, sti_rec_L1, sti_rec_t1,sti_rec_t;
        public static string txt_showresult, txt_showresult2, txt_showresult4;

        public void Page_Load(object sender, EventArgs e)
        {
            if (Session["sti_force2"]!=null){

                sti_force2 = Convert.ToDouble(Session["sti_force2"]);
                sti_wheelbase = Convert.ToDouble(Session["sti_wheelbase"]);

                sti_rec_L1 = Convert.ToDouble(Session["sti_rec_L1"]);

                sti_rec_t1 = Convert.ToDouble(Session["sti_rec_t1"].ToString());

                sti_rec_t = Convert.ToDouble(Session["sti_rec_t"].ToString());

                txt_showresult = Session["txt_showresult"].ToString();
                txt_showresult2 = Session["txt_showresult2"].ToString();
                txt_showresult4 = Session["txt_showresult4"].ToString();

            }
            
        }
    }
}