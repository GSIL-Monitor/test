using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Handing.Reports
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 向aspx页面穿计算报告结果
        /// </summary>
        /// <param name="value1">下拉列表1的value</param>
        /// <param name="value2">下拉列表1的value</param>
        /// <returns></returns>
        protected string ReturnBendingReport(string value1,string value2)
        {
            if (value1=="2")
            {
                switch(value2)
                {
                    case "2":
                        return "跨中弯矩 Mmax = F ×（ L / 1000 ） / 4 =";
                    case "3":
                        return "偏心弯矩 Mmax = F × （a / 1000）× （b / 1000）/ L  =";
                    case "4":
                        return "两个集中力 Mmax = F ×（ a / 1000 ）=";
                    case "5":
                        return "均布载荷 Mmax = q ×（ L / 1000 ）² / 8 =";
                }
            }
            if(value1=="3")
            {
                switch(value2)
                {
                    case "2":
                        return "跨中弯矩 Mmax = - F ×（ b / 1000 ） =";
                    case "3":
                        return "偏心弯矩 Mmax = - F × （l / 1000）  =";
                    case "4":
                        return "均布载荷 Mmax = q ×（ L / 1000 ）² / 2 =";
                }
            }
            return "";
        }
    }
}