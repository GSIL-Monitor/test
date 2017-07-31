using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Handing.Data.Extensions;
using System.Data;
using System.Data.SqlClient;
using MySql.Data;
using MySql.Data.MySqlClient;
namespace Handing.Reports.WholeDesign
{
    public partial class showInfo : System.Web.UI.Page
    { 
        //数据连接最基本需要的两个对象  
        private MySqlConnection conn = null;
        private MySqlCommand cmd = null;
        //private SqlDataAdapter adapter = null;  
        //为了方便，设为全局对象的sql语句  
        private string sql = null;
        //公用 打开数据库的方法  
        public void openDatabase()
        {
            //string connstr = DbHelper.connstring;

             conn = new MySqlConnection(DbHelper.connstring);

            //conn.ConnectionString = "Integrated Security=SSPI;Data Source=(local);initial catalog=test;User ID =你的用户名;password=你的密码";
            
                conn.Open();
                //Response.Write("<script>alert('Connected!');</script>");  
            
        }  

        //默认加载页面的方法 找到年龄最大的加载  
        //有些问题，年龄不能相同，加载中前台的textbox里只能显示一条记录，数据拿到之后有多条只显示一条  
        public void load()
        {
            openDatabase();
            cmd = new MySqlCommand("select * from users where age=(select max(age) from users)", conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                tbName.Text = (String)dr[1].ToString().Trim();
                tbAge.Text = (String)dr[2].ToString().Trim();
                Response.Write(tbName.Text+tbAge.Text);
            }
            conn.Close();

        }  
        //根据sql语句加载信息，重载两个textbox  
        public void load(String sql)
        {
            openDatabase();
            cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                tbName.Text = (String)dr[1].ToString().Trim();
                tbAge.Text = (String)dr[2].ToString().Trim();
                Response.Write(tbName.Text + tbAge.Text);

            }
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
            if (!IsPostBack) { load(); }//如果页面不是刷新，则执行，这个很重要  

            ViewState["name"] = "name";
            ViewState["age"] = "age";
            gridViewBind();
        }

        protected void cityGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
        protected void cityGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        //四个按钮的方法，增删改查  
        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            sql = "insert into users(name,age) values('" + tbName.Text.ToString().Trim() + "','" + tbAge.Text.ToString().Trim() + "')";
            execute(sql);
        } 
        protected void BtnDel_Click(object sender, EventArgs e)
        {
            sql = "delete from users where name='" + tbName.Text.ToString().Trim() + "' and age='" + tbAge.Text.ToString().Trim() + "'";
            execute(sql);
            load();
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            sql = "update  users set age='" + tbAge.Text.ToString().Trim() + "' where name='" + tbName.Text.ToString().Trim() + "'";
            execute(sql);
        }

        protected void BtnSelect_Click(object sender, EventArgs e)
        {
            sql = "select * from users where name='" + tbName.Text.ToString().Trim() + "'";
            load(sql);
        }

        protected void gridViewBind()
        {
            /*
             * 建立数据库连接
             * 首先在头部引入DATA包
             * using System.Data;
             * using System.Data.SqlClient;
             */
            MySqlConnection dataBaseCon = new MySqlConnection(DbHelper.connstring);
            //配置sql语句
            string sqlStr = "select * from users";
            //实例化SqlDataAdapter sql数据适配器对象
            MySqlDataAdapter da = new MySqlDataAdapter(sqlStr, dataBaseCon);
            //实例化 DataSet 数据集 这个数据集会绑定在gridview上
            DataSet data = new DataSet();
            //向数据集中fill（填入）数据 da填入data
            da.Fill(data, "table");
            //将填好数据的数据集data 绑定到gridView空间上
            this.cityGridView.DataSource = data;
            this.cityGridView.DataBind();

        }






























    }
}