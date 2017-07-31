using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using MySql.Data.MySqlClient;
using Handing.Data.Extensions;//DBHelper

namespace Handing.Reports.WholeDesign
{
    public partial class testbtb : System.Web.UI.Page
    {

        private MySqlConnection conn = null;
        private MySqlCommand cmd = null;
        //private SqlDataAdapter adapter = null;  
        //为了方便，设为全局对象的sql语句  
        private string sql = null;

        public void openDatabase()
        {
            conn = new MySqlConnection(DbHelper.connstring);
            conn.Open();
        }
        public void load(String sql)
        {
            openDatabase();
            //cmd = new MySqlCommand(sql, conn);
            //MySqlDataReader dr = cmd.ExecuteReader();
            //while (dr.Read())
            //{
            //    //dgn_load.Text = (String)dr[1].ToString().Trim();
            //    //dgn_load.Text = (String)dr[2].ToString().Trim();
            //    //this.DropDownList1.Items.Add(dr["Type"].ToString());
            //    var a = (String)dr[1].ToString().Trim();
            //    var b = (String)dr[2].ToString().Trim();
            //    var c = (String)dr[3].ToString().Trim();
            //    Response.Write(a+"\n");

            //    //Response.Write("<tr><td>" +a+ "</td></tr>");
            //    //Response.Write("<tr><td>" + b + "</td></tr>");
            //    //Response.Write("<tr><td>" + b + "</td></tr>");
            //}

            //Response.End();




            //实例化SqlDataAdapter sql数据适配器对象
            MySqlDataAdapter da = new MySqlDataAdapter(sql, conn);
            //实例化 DataSet 数据集 这个数据集会绑定在gridview上
            DataSet data = new DataSet();
            //向数据集中fill（填入）数据 da填入data
            da.Fill(data, "table");
            //将填好数据的数据集data 绑定到gridView空间上
            this.MyGridView.DataSource = data;
            this.MyGridView.DataBind();

            conn.Close();
        } 
        /// <summary>
        /// 首先加载 page_load 方法
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //C();
            B();
        }

        protected void C()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Action"]))
            {
                string action = Request.QueryString["Action"].ToString();
                // 处理异步请求
                switch (action)
                {
                    case "SaveUserInfo":
                        {
                            StringBuilder sBuilder = new StringBuilder();
                            sBuilder.Append("服务器接受到的信息是：\n");
                            sBuilder.AppendFormat("用户名:{0}\n", Request.Form["loginName"]);
                            sBuilder.AppendFormat("性别是:{0}\n", int.Parse(Request.Form["sex"]) == 0 ? "男" : "女");
                            sBuilder.AppendFormat("爱好是:{0}{1}{2}\n"
                                , !String.IsNullOrEmpty(Request.Form["cbLoveYy"]) ? "游泳、" : String.Empty
                                , !String.IsNullOrEmpty(Request.Form["cbLoveYx"]) ? "游戏、" : String.Empty
                                , !String.IsNullOrEmpty(Request.Form["cbLovePs"]) ? "爬山、" : String.Empty
                                );
                            sBuilder.AppendFormat("所属国家是:{0}\n", Request.Form["country"]);
                            Response.Write(sBuilder.ToString());
                            // 不在此声明结束，那么前端还会接收到页面的html字符串
                            Response.End();
                        }
                        break;
                }
            }
            else
            {
                // 正常的同步页面加载
            }

        }
        protected void B()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Action"]))
            {
                string action = Request.QueryString["Action"].ToString();
                switch (action)
                {
                    case "SaveUserInfo":
                        {
                            
                            var a = Request.Form["loginName"];
                            var b = Request.Form["sex"];
                            var c = Request.Form["cbLoveYy"];
                            var d = Request.Form["cbLoveYx"];
                            var e = Request.Form["cbLovePs"];
                            var f = Request.Form["country"];

                            sql = "SELECT * FROM abmmg WHERE (Capacity BETWEEN " + (Convert.ToDouble(a) - 0.5) + " AND " + (Convert.ToDouble(a) + 0.5) + ")" + " AND (ISO LIKE '" + f + "')";
                            load(sql);
                        }
                        break;
                }
            }
            else
            {
                // 正常的同步页面加载
            }

        }



        
    }
}