using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;//引用命名空间

using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;
using Handing.Data.Extensions;
using Handing.Reports;
using System.Web.Services;

using NFine.Domain.Entity.Designer;
namespace Handing.Views.Product.WholeDesign
{
    public partial class WholeDesignFirst : System.Web.UI.Page
    {
        WholeDesignData wdd = new WholeDesignData();

        //数据连接最基本需要的两个对象  
        private MySqlConnection conn = null;
        private MySqlCommand cmd = null;
        public static string flag;//判断是否选择一行数据

        public static string errorMsg;
        public static string errorMsg1;
        public static string errorMsg2;
        public static string errorMsg3;
        public static string errorMsg4;
        protected static string errorMsg5;
        public static string errorMsg6;

        //private SqlDataAdapter adapter = null;  
        //为了方便，设为全局对象的sql语句  
        private string sql = null;
        //公用 打开数据库的方法  
        public void openDatabase()
        {
            conn = new MySqlConnection(DbHelper.connstring);
            conn.Open();
        }
        public void load()
        {
            openDatabase();
            //cmd = new MySqlCommand("select * from abmmg where ISO=(select max(ISO) from abmmg)", conn);
            //MySqlDataReader dr = cmd.ExecuteReader();
            //if (dr.Read())
            //{
            //dgn_load.Text = (String)dr[1].ToString().Trim();
            //dgn_load.Text = (String)dr[2].ToString().Trim();
            //Response.Write(dgn_load.Text+dgn_load.Text);
            //}
            conn.Close();

        }
        //根据sql语句加载信息，重载两个textbox  
        public void load(String sql)
        {
            openDatabase();
            cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                gridViewBind();
                this.cityGridView.Visible = true;
                errorMsg = "";
                ScriptManager.RegisterStartupScript(updatepanel7, this.Page.GetType(), "", "mgg();", true);

            }
            else
            {
                //Response.Write("未查到，相关数据");
                errorMsg = "没找到与工作级别相符项，请更换工作级别后重新查询!";
                ScriptManager.RegisterStartupScript(updatepanel7, this.Page.GetType(), "", "init_mgg();", true);

                flag = "No Select";
                //页面初始化
                liftingspeed.Text = "";
                power.Text = "";
                gearratio.Text = "";
                torque.Text = "";
                drumdia.Text = "";
                liftoverride.Text = "";

                this.cityGridView.Visible = false;

            }
            //while (dr.Read())
            //{
            //dgn_load.Text = (String)dr[1].ToString().Trim();
            //dgn_load.Text = (String)dr[2].ToString().Trim();
            //this.DropDownList1.Items.Add(dr["Type"].ToString());
            // }
            conn.Close();
        }
        //封装的数据库语句执行的方法  
        public void execute(String sql)
        {
            openDatabase();
            cmd = new MySqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();

        }

        //页面加载时ASP.NET首先会调用这个方法  
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load();


            }//如果页面不是刷新，则执行，这个很重要  
        }
        /// <summary>
        /// 点击查询 按钮执行SQL
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnSelect_Click(object sender, EventArgs e)
        {
            //sql = "select * from abmmg where ISO='" + dgn_load.Text.ToString().Trim() + "'";
            //sql = "SELECT * FROM abmmg WHERE Capacity <= " + Convert.ToDouble(dgn_load.Text.ToString().Trim()) + " AND ISO LIKE '" + ddl1.SelectedValue.ToString().Trim() + "'";
            sql = "SELECT * FROM abmmg WHERE (Capacity BETWEEN " + (Convert.ToDouble(dgn_load.Text.ToString().Trim())) + " AND " + (Convert.ToDouble(dgn_load.Text.ToString().Trim()) * 1.25) + ")" + " AND (ISO LIKE '" + ddl1.SelectedValue.ToString().Trim() + "')" + " AND (MotorControl LIKE '" + DDL_motor_control.SelectedValue.ToString().Trim() + "')";
            load(sql);
            // //页面初始化
            flag = "No Select";
            liftingspeed.Text = "";
            power.Text = "";
            gearratio.Text = "";
            torque.Text = "";
            drumdia.Text = "";
            liftoverride.Text = "";
            //
            hoot_type.Text = "";
            Label2.Text = "";

            Label_rope.Text = "";
            Label_breakforce.Text = "";

            Label4.Text = "";
            Label5.Text = "";

            Label_drumtype.Text = ""; //卷筒型号
            Label_pitch.Text = "";
            Label1.Text = "";

        }


        /// <summary>
        /// GridView 显示表格数据
        /// </summary>
        protected void gridViewBind()
        {

            if (dgn_load.Text == "")
            {
                return;
            }
            MySqlConnection dataBaseCon = new MySqlConnection(DbHelper.connstring);
            //string sqlStr = "SELECT * FROM abmmg WHERE Capacity <= " + Convert.ToDouble(dgn_load.Text.ToString().Trim()) + " AND ISO LIKE '" + ddl1.SelectedValue.ToString().Trim() + "'";
            string sqlStr = "SELECT * FROM abmmg WHERE (Capacity BETWEEN " + (Convert.ToDouble(dgn_load.Text.ToString().Trim())) + " AND " + (Convert.ToDouble(dgn_load.Text.ToString().Trim()) * 1.25) + ")" + " AND (ISO LIKE '" + ddl1.SelectedValue.ToString().Trim() + "')" + " AND (MotorControl LIKE '" + DDL_motor_control.SelectedValue.ToString().Trim() + "')";

            //实例化SqlDataAdapter sql数据适配器对象
            MySqlDataAdapter da = new MySqlDataAdapter(sqlStr, dataBaseCon);
            //实例化 DataSet 数据集 这个数据集会绑定在gridview上
            DataSet data = new DataSet();
            //向数据集中fill（填入）数据 da填入data
            da.Fill(data, "table");
            //将填好数据的数据集data 绑定到gridView空间上
            this.cityGridView.DataSource = data;
            this.cityGridView.DataBind();

            dataBaseCon.Close();

        }
        /// <summary>
        /// GridView单击事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cityGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            //选择某行，业务逻辑
            //dgn_load.Text = cityGridView.SelectedRow.Cells[2].Text;
            //dgn_load.Text = cityGridView.Rows[cityGridView.SelectedIndex].Cells[2].Text;
            int v = cityGridView.SelectedIndex;
            if (v != -1)
            {
                cityGridView.Visible = true;//显示gridview
                //全局变量赋值
                wdd.whliftspeed = cityGridView.Rows[cityGridView.SelectedIndex].Cells[2].Text;
                wdd.whliftpower = cityGridView.Rows[cityGridView.SelectedIndex].Cells[3].Text;
                wdd.whliftratio = cityGridView.Rows[cityGridView.SelectedIndex].Cells[5].Text;
                wdd.whlifttorque = cityGridView.Rows[cityGridView.SelectedIndex].Cells[6].Text;
                wdd.whliftdrumdia = cityGridView.Rows[cityGridView.SelectedIndex].Cells[8].Text;
                wdd.whliftoverride = cityGridView.Rows[cityGridView.SelectedIndex].Cells[7].Text;
                //页面赋值
                liftingspeed.Text = wdd.whliftspeed;
                power.Text = wdd.whliftpower;
                gearratio.Text = wdd.whliftratio;
                torque.Text = wdd.whlifttorque;
                drumdia.Text = wdd.whliftdrumdia;
                liftoverride.Text = wdd.whliftoverride;

                ScriptManager.RegisterStartupScript(updatepanel7, this.Page.GetType(), "", "che();", true);

            }
            else
            {
                cityGridView.Visible = true;
                flag = "No Select";
                ScriptManager.RegisterStartupScript(updatepanel1, this.Page.GetType(), "", "gridview_row();", true);//没有updatpal
                //this.Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "ada", "<script>che();</script>", true);


            }
            //钢丝绳赋值
            if (liftoverride.Text == "4/1")
            {
                DropDownList1_rope.SelectedValue = "0.97";

            }
            if (liftoverride.Text == "6/1")
            {
                DropDownList1_rope.SelectedValue = "0.95";

            }
            if (liftoverride.Text == "8/1")
            {
                DropDownList1_rope.SelectedValue = "0.93";

            }

        }

        protected void cityGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
        /// <summary>
        /// GridView数据绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cityGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Attributes["style"] = "cursor:pointer";

            PostBackOptions myPostBackOptions = new PostBackOptions(this);
            myPostBackOptions.AutoPostBack = false;
            myPostBackOptions.PerformValidation = false;
            myPostBackOptions.RequiresJavaScriptProtocol = true; //加入javascript:头
            String evt = Page.ClientScript.GetPostBackClientHyperlink(sender as GridView, "Select$" + e.Row.RowIndex.ToString());
            e.Row.Attributes.Add("onclick", evt);
            //后加的
            //e.Row.Attributes.Add("onfocus", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#5cc5f2'");
            //e.Row.Attributes.Add("onblur", "this.style.backgroundColor=currentcolor");
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#5cc5f2'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
        }


        protected void cityGridView_Sorting(object sender, GridViewSortEventArgs e)
        {

        }
        /// <summary>
        /// 吊钩组 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            wdd.whclass = ddl1.SelectedValue.ToString().Trim();//M3
            wdd.whcontype = DDL_motor_control.SelectedValue.ToString().Trim();//控制方式
            sql = "SELECT * FROM abmmg WHERE (Capacity BETWEEN " + (Convert.ToDouble(dgn_load.Text.ToString().Trim()) - 0.5) + " AND " + (Convert.ToDouble(dgn_load.Text.ToString().Trim()) + 0.5) + ")" + " AND (ISO LIKE '" + wdd.whclass + "')" + " AND (MotorControl LIKE '" + wdd.whcontype + "')";
            load(sql);
        }
        /// <summary>
        /// 暂时使用 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnHook_Click(object sender, EventArgs e)
        {
            //errorMsg2 = "请先点击,查询!";

            openDatabase();
            string mm = wdd.whliftspeed;
            wdd.whhookclass = DrowDownList1.SelectedValue.ToString().Trim();//吊钩强度等级
            wdd.whclass = ddl1.SelectedValue.ToString().Trim();//工作级别
            wdd.whhookmat = dgn_load.Text;                         //有问题 约等
            string c_class = wdd.whhookclass;
            string t = wdd.whclass;
            string s = wdd.whhookmat;

            //sql = "SELECT type,Material FROM p WHERE M3 = '0.25'";
            //sql = SELECT m3,type,Material FROM p WHERE M3 >=18.5 ORDER BY M3 ASC LIMIT 0,1;
            sql = "SELECT type,Material FROM " + c_class + " WHERE " + t + ">=" + s + " ORDER BY " + t + " ASC LIMIT 0,1";
            cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                //while (dr.Read())
                //{
                hoot_type.Text = (String)dr[0].ToString().Trim();
                Label2.Text = (String)dr[1].ToString().Trim();
                wdd.whhooknum = hoot_type.Text.ToString().Trim();//吊钩号

                // }
                errorMsg1 = "";
            }
            else
            {
                hoot_type.Text = "";
                Label2.Text = "";
                errorMsg1 = "未找到起重量匹配的数据，请重新输入起重量!";
            }

            conn.Close();
            //ScriptManager.RegisterStartupScript(BtnHook, this.GetType(), "clickPage", "ggg("  + ");", true); 
            //Page.RegisterStartupScript("ggg", "<script>SetVisible(1);</script>");Button_rope
        }
        /// <summary>
        /// 钢丝绳 计算
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button_rope_Click(object sender, EventArgs e)
        {
            //errorMsg3 = "请先点击,查询!";

            double Q, q1, a, n, c, s, f, d, t;
            string g_type;
            wdd.whload = Convert.ToDouble(dgn_load.Text.ToString().Trim()) * 9.81 * 1000;//起重量
            wdd.A = Convert.ToDouble(liftoverride.Text.Substring(0, 1));//倍率
            wdd.N = Convert.ToDouble(DropDownList1_rope.SelectedValue);//效率
            wdd.T = Convert.ToDouble(DropDownList3.SelectedValue);//安全系数

            Q = wdd.whload;
            a = wdd.A;
            n = wdd.N;
            t = wdd.T;
            q1 = wdd.Q11 = 0.02 * Q;
            s = wdd.S = (Q + q1) / (a * n);
            c = wdd.C = Math.Sqrt((t / (0.4 * 2160)));
            d = wdd.D = Math.Round(c * Math.Sqrt(s));

            wdd.Rope_pulley_block_version = "φ" + d + "-8x26" + "-2160"; //钢丝绳型号
            wdd.Minimum_breaking_load = Math.Round(Convert.ToDouble((s * t) / 1000));                        //最小破断拉力：

            g_type = wdd.Rope_pulley_block_version;
            f = wdd.Minimum_breaking_load;
            Label_rope.Text = g_type;
            Label_breakforce.Text = f.ToString();

        }
        /// <summary>
        /// 定滑轮 计算
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button_pulley_Click(object sender, EventArgs e)
        {
            //errorMsg4 = "请先点击,查询!";

            double d, r;
            string s = Label_rope.Text.ToString().Trim();
            int i = s.IndexOf("φ") + 1;
            int j = s.IndexOf("-8");
            string str = s.Substring(i, j - i);
            wdd.Crown_block_dd = Convert.ToDouble(str) * Convert.ToDouble(DropDownList1.SelectedValue);//槽底直径
            wdd.Crown_block_dr = (Convert.ToDouble(str) + 2) / 2;
            d = wdd.Crown_block_dd;
            r = wdd.Crown_block_dr;
            Label4.Text = d.ToString();
            Label5.Text = r.ToString();
        }
        /// <summary>
        /// 卷筒 型号 D L 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Btn_juantong_Click(object sender, EventArgs e)
        {
            double L, D, H, A, P, d1;
            //string drumdia_;
            errorMsg5 = "click_me";
            string s = Label_rope.Text.ToString().Trim();
            int i = s.IndexOf("φ") + 1;
            int j = s.IndexOf("-8");
            string str = s.Substring(i, j - i);
            wdd.Coiling_block_height = Convert.ToDouble(text_liftheight.Text.ToString().Trim());//起升高度
            wdd.Coiling_block_db = Convert.ToDouble(drumdia.Text.ToString().Trim());//卷筒直径
            H = wdd.Coiling_block_height;
            d1 = Convert.ToDouble(str);
            D = wdd.Coiling_block_db;
            A = Convert.ToDouble(liftoverride.Text.Substring(0, 1));//倍率4/1
            P = d1 + 2;//截距
            wdd.Coiling_block_pitch = Math.Round(((H * A * 1000 / 3.14) / (D + d1) + 6) * P);
            L = wdd.Coiling_block_pitch;
            wdd.Coiling_block_version = "φ" + D + "x" + L;
            //drumdia_ = drumdia.Text.ToString().Trim();//卷筒直径
            Label_drumtype.Text = wdd.Coiling_block_version; //卷筒型号
            Label_pitch.Text = P.ToString().Trim();
        }
        /// <summary>
        /// 小车架 计算6
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Btn_xiaoche_Click(object sender, EventArgs e)
        {
            //errorMsg6 = "请先点击,查询!";

            double num, p, v;
            v = wdd.Speed_of_motor = Convert.ToDouble(DropDownList4.SelectedValue);
            num = wdd.Motor_num;
            p = wdd.Power_of_motor = (wdd.whload * 1.06 * v * 0.016) / (60 * num * 0.97 * 1000);
            Label1.Text = p.ToString().Substring(0, 4);//保留两位小数    截取字符串实现

            Label3.Text = dgn_load.Text.ToString().Trim();
            Label6.Text = wdd.Coiling_block_height.ToString();
            Label7.Text = wdd.whclass = ddl1.SelectedValue;
            Label8.Text = wdd.whliftspeed;
            Label9.Text = wdd.whliftpower;
            Label10.Text = "p-" + wdd.whhooknum;
            Label11.Text = wdd.Rope_pulley_block_version;
            Label12.Text = wdd.Crown_block_dd.ToString();
            Label13.Text = wdd.Coiling_block_version;
            Label14.Text = wdd.Speed_of_motor.ToString();
            Label15.Text = wdd.Power_of_motor.ToString().Substring(0, 4);
            return;
        }

        [WebMethod]
        public List<Crane5DEntity> GetListFuTest1()
        {
            List<Crane5DEntity> list = new List<Crane5DEntity>();
            string connstr = DbHelper.connstring;
            MySqlConnection conn = new MySqlConnection(DbHelper.connstring);
            conn.Open();
            string sql_str = "select * from rundata";
            MySqlCommand cmd = new MySqlCommand(sql_str, conn);
            MySqlDataReader mread = cmd.ExecuteReader();
            while (mread.Read())
            {
                Crane5DEntity log = new Crane5DEntity();
                log.ID = (int)mread["ID"];
                log.ClientIP = (string)mread["ClientIP"];
                log.OverLoad = (string)mread["OverLoad"];
                log.StartYear = (string)mread["StartYear"];
                log.StopYear = (string)mread["StopYear"];
                log.LiftingCapacity = (string)mread["LiftingCapacity"];

                list.Add(log);
            }
            conn.Close();
            mread.Close();
            return list;
        }

        [WebMethod]
        public string GetListFuTest()
        {
            //errorMsg = "未查询到数据，无法进入下一步，请核对信息，重新查询!";
            return errorMsg;
        }
        /// <summary>
        /// 推荐 一 选项
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddl1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl1.SelectedValue == "M3")
            {
                DropDownList3.SelectedValue = "3.55";
                DropDownList1.SelectedValue = "16";
                //DropDownList_diariato.SelectedValue = "14";

            }
            if (ddl1.SelectedValue == "M4")
            {
                DropDownList3.SelectedValue = "4";
                DropDownList1.SelectedValue = "18";
                //DropDownList_diariato.SelectedValue = "16";

            }
            if (ddl1.SelectedValue == "M5")
            {
                DropDownList3.SelectedValue = "4.5";
                DropDownList1.SelectedValue = "20";
                //DropDownList_diariato.SelectedValue = "18";

            }
            if (ddl1.SelectedValue == "M6")
            {
                DropDownList3.SelectedValue = "5.6";
                DropDownList1.SelectedValue = "22.4";
                //DropDownList_diariato.SelectedValue = "20";

            }
            if (ddl1.SelectedValue == "M7")
            {
                DropDownList3.SelectedValue = "7.1";
                DropDownList1.SelectedValue = "25";
                //DropDownList_diariato.SelectedValue = "22.4";

            }
        }

    }

}
