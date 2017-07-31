using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySql.Data.MySqlClient;
using NFine.Application.Designer;
using NFine.Code;
using NFine.Domain.Entity.Designer;
using Handing.Data.Extensions;

//using Autodesk.AutoCAD.DatabaseServices;
//using Autodesk.AutoCAD.Geometry;
//using Autodesk.AutoCAD.Runtime;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net;
using System.Text;
namespace Handing.Areas.Designer.Controllers
{
    public class Crane5DController : Controller
    {

        private Crane5DApp cranedApp = new Crane5DApp();
        /// <summary>
        /// MVC 多层调用
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [HandlerAjaxOnly]
        public ActionResult GetFormJson()
        {
            var data = cranedApp.GetListFuTest();//调用数据层
            return Content(data.ToJson());
        }

        //以下为 功能测试方法 方便以后调用
        //
        // GET: /Designer/CraneDB/
        public ActionResult Index(string keyvalue)
        {
            //string connstr = DbHelper.connstring;

            string str1 = "yes";

            MySqlConnection conn = new MySqlConnection(DbHelper.bj_connstring);
            conn.Open();
            string sql_str = "select * from login where RegisterAuthority = '" + str1 + "'";
            MySqlCommand cmd = new MySqlCommand(sql_str, conn);
            MySqlDataReader mread = cmd.ExecuteReader();

            Response.Write("<table  id='MyTable' border='1'>");
            while (mread.Read())
            {
                Response.Write("<tr><td><b>" + (string)mread["yhm"] + "</b></td>");
                Response.Write("<td>" + (string)mread["psw"] + "</td>");
                Response.Write("<td>" + (string)mread["email"] + "</td>");
                Response.Write("<td>" + (string)mread["RegisterAuthority"] + "</td></tr>");

            }
            Response.Write("</table>");
            return View();
        }
        /// <summary>
        /// MD5 加密方法返回字符串32
        /// </summary>
        /// <param name="keyvalue"></param>
        /// <returns></returns>
        public String Mymd5(String keyvalue)
        {
            //SmtpClient
            MD5 md5 = new MD5CryptoServiceProvider();
            string b = Request.Form["keyvalue"];     //post  form / name 属性方式

            byte[] bytes = System.Text.Encoding.UTF8.GetBytes(keyvalue);
            bytes = md5.ComputeHash(bytes);
            md5.Clear();

            string ret = "";
            for (int i = 0; i < bytes.Length; i++)
            {
                ret += Convert.ToString(bytes[i], 16).PadLeft(2, '0');
            }
            var data = ret.PadLeft(32, '0');
            return data;
        }
        /// <summary>
        /// 邮箱发送
        /// </summary>
        public void SendMail()
        {
            System.Net.Mail.SmtpClient client = new SmtpClient("smtp.163.com");

            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("18237950347@163.com", "abc123");
            client.DeliveryMethod = SmtpDeliveryMethod.Network;

            MailAddress addressFrom = new MailAddress("18237950347@163.com", "复兴网络科技Focus.LTD");
            MailAddress addressTo = new MailAddress("1002110484@qq.com");

            System.Net.Mail.MailMessage message = new MailMessage(addressFrom, addressTo);
            message.Subject = "汉鼎有限";
            message.Body = "欢迎访问汉鼎平台：验证码98762";
            message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnSuccess;
            message.Attachments.Add(new Attachment(@"c:\1.txt"));
            message.Sender = new MailAddress("18237950347@163.com");
            message.BodyEncoding = System.Text.Encoding.UTF8;
            message.IsBodyHtml = false;

            client.Send(message);
        }
        protected void IdCodeForEmail(string toEmail, string idCode, string userId)
        {
            MailMessage mailMsg = new MailMessage();//引用 Net.Mail名称空间  

            mailMsg.From = new MailAddress("***@qq.com", "***集团公司");

            mailMsg.To.Add(new MailAddress(toEmail, "尊敬的用户"));
            StringBuilder eMailCode = new StringBuilder();
            eMailCode.Append("请点击下面链接激活账号：");
            //=&userName='>点击激活</a>  
            eMailCode.Append("<a href='a.aspx?code").Append("=").Append(idCode).Append("&userName=").Append(userId).Append("'>点击激活</a>");
            //eMail中正文部分  
            AlternateView htmlBody =
            AlternateView.CreateAlternateViewFromString(eMailCode.ToString(), null, "text/html");
            mailMsg.AlternateViews.Add(htmlBody);
            //eMail中的标题  
            mailMsg.Subject = "关于***";


            SmtpClient client = new SmtpClient("smtp.qq.com");

            client.Credentials = new NetworkCredential("***", "***");

            client.Send(mailMsg);
        }
        //测试CAD
        // [CommandMethod("FirstLine")]
        //public static void FirstLine()
        //{
        //    //获取当前活动图形数据库  
        //    Database db = HostApplicationServices.WorkingDatabase;
        //    Point3d startPoint = new Point3d(500, 500, 0);  //直线起点  
        //    Point3d endPoint = new Point3d(700, 500, 0); //直线终点  
        //    Line line = new Line(startPoint, endPoint); //新建一直线对象     
        //    //定义一个指向当前数据库的事务处理，以添加直线  
        //    using (Transaction trans = db.TransactionManager.StartTransaction())
        //    {
        //        BlockTable bt = (BlockTable)trans.GetObject(db.BlockTableId, OpenMode.ForRead); //以读方式打开块表.  
        //        //以写方式打开模型空间块表记录.  
        //        BlockTableRecord btr = (BlockTableRecord)trans.GetObject(bt[BlockTableRecord.ModelSpace], OpenMode.ForWrite);
        //        //将图形对象的信息添加到块表记录中,并返回ObjectId对象.  
        //        btr.AppendEntity(line);
        //        trans.AddNewlyCreatedDBObject(line, true); //把对象添加到事务处理中.  
        //        trans.Commit(); //提交事务处理  
        //    }
        //}  
    }
}