/*******************************************************************************
 * Copyright © 2017
 * Author: Handing 
 * Description: Haning开发平台
 * Website：www.hdmes.com
*********************************************************************************/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySql.Data.MySqlClient;
using Handing.Data.Extensions;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Security.Cryptography;

using System.IO;
using Newtonsoft.Json;

using NFine.Code;//引用net类
using Handing.Models;

namespace Handing.Controllers
{
    /// <summary>
    ///   UserAccountController 
    ///   与用户相关的方法类，如用户登录，
    ///   用户注册，用户中心,密码重置等
    /// </summary>
    public class UserAccountController : Controller
    {
        public string code = "";
        public ActionResult UserInfo()
        {
            return View();
        }
        public ActionResult UserPassForm()
        {
            return View();
        }
        public ActionResult GetUserPass()
        {
            return View();
        }
        public ActionResult UserReg()
        {
            return View();
        }
        //用户登录
        public ActionResult UserLogin()
        {
            return View();
        }
        /// <summary>
        /// 用户中心个人信息显示
        /// </summary>
        /// <param name="username"></param>
        /// <param name="nickName"></param>
        /// <returns></returns>
        public String GetUserPerson(String username, String nickName)
        {
            string[] data = { "0", "2", "3","email" };

            string sql_hd = "";
            string user_ip = Net.Ip;//获取IP
            string mycity = Net.GetLocation(user_ip);
            data[1] = mycity;
            //Session["nickName"] = "fly";

            if (!string.IsNullOrEmpty(username) || username != null || nickName != "")
            {
                if (nickName == "" || string.IsNullOrEmpty(nickName))
                {
                    sql_hd = "SELECT *FROM login WHERE yhm = '" + username + "'";///汉鼎报价用户
                }
                else
                {
                    sql_hd = "SELECT *FROM wx_memary WHERE wx_openid =(SELECT  wx_openid FROM wx_memary WHERE  wx_nickname = '" + nickName + "' ORDER BY wx_balance DESC LIMIT 1)ORDER BY wx_balance DESC LIMIT 1";

                    //sql_hd = "SELECT * FROM wx_memary WHERE wx_nickname = '" + nickName + "' ORDER BY wx_balance desc LIMIT 1";//微信游客登录
                }

                MySqlConnection conn = new MySqlConnection(DbHelper.bj_connstring);
                try
                {
                    conn.Open();

                    MySqlCommand cmd = new MySqlCommand(sql_hd, conn);
                    MySqlDataReader mread = cmd.ExecuteReader();
                    if (mread.Read())
                    {
                        data[0] = (string)mread["wx_balance"];  //取出用户余额
                        data[2] = mread["wx_headimgurl"].ToString();//微信头像
                        //data[3] = mread["email"].ToString();//邮箱暂未使用
                    }

                }
                catch (MySqlException ex)
                {
                    string error_ = ex.Message;
                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                //

            }
            return data.ToJson();
        }
        /// <summary>
        /// 用户注册
        /// </summary>
        /// <param name="username"></param>
        /// <param name="upass"></param>
        /// <param name="uemail"></param>
        /// <returns></returns>
        public String UserRegister(string UserName, string UserPassword, string Email)
        {
            string user = "";//显示信息提示!

            string sql_ = "select yhm from login WHERE yhm ='" + UserName + "'";
            string user_ip = Net.Ip;//获取IP
            string nowtime = DateTime.Now.ToString();
            string pwd_md5 = Mymd5(UserPassword);
            MySqlConnection conn = new MySqlConnection(DbHelper.bj_connstring);

            try
            {
                conn.Open();
                MySqlCommand cmd_reg = new MySqlCommand(sql_, conn);
                MySqlDataReader rd = cmd_reg.ExecuteReader();
                if (rd.Read())
                {
                    user = "温馨提示:\n\n用户名已存在！\n\n请修改用户名后重试！";
                }
                else
                {
                    conn.Close();
                    string sql_str = "INSERT INTO login(yhm,psw,pwd2,email,computerIP) VALUES ('" + UserName + "','" + UserPassword + "','" + pwd_md5 + "','" + Email + "','" + user_ip + "')";
                    conn.Open();
                    cmd_reg = new MySqlCommand(sql_str, conn);///再次打开，需关闭conn
                    var rows = cmd_reg.ExecuteNonQuery();
                    if (rows != 0)
                    {
                        user = "温馨提示:\n\n注册成功!\n请牢记用户名:" + UserName;//这一句注册联动
                    }
                    else
                    {
                        user = "温馨提示:\n\n注册失败，请核对输入信息！";
                    }
                }
            }
            catch (Exception ex)
            {
                string error_ = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            return user;
        }
        /// <summary>
        /// 用户注册成功，发送欢迎页面
        /// </summary>
        /// <param name="UserName"></param>
        /// <param name="Email"></param>
        public void SendMailToUser(string UserName, string Email)
        {

            System.Net.Mail.SmtpClient client = new SmtpClient("smtp.ym.163.com");
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("handingtech@handingtech.cn", "handingtech123");
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            MailAddress addressFrom = new MailAddress("handingtech@handingtech.cn", "汉鼎网络科技Co.,Ltd");
            MailAddress addressTo = new MailAddress(Email);//发送到指定邮箱;

            System.Net.Mail.MailMessage message = new MailMessage(addressFrom, addressTo);
            message.Subject = "欢迎用户<" + UserName + ">注册成功";

            StringBuilder contentBuilder = new StringBuilder();
            contentBuilder.Append("欢迎<h3 style='color:blue'>" + UserName + "</h3>");
            contentBuilder.Append("<p>加入汉鼎云服务平台</p><br/>");
            contentBuilder.Append("----------------------------------------------------------------");
            contentBuilder.Append("<p><b>公司介绍:</b></p>");
            contentBuilder.Append("<p>Handing(汉鼎智能物料搬运有限公司),是国内首个共享服务商,自主研发并提供计算资源,存储");
            contentBuilder.Append("   资源,网络资源等企业必需的基础技术服务,并深入了解互联网,移动互联网,");
            contentBuilder.Append("   传统企业不同场景下的业务需求,提供全局解决方案</p>");
            contentBuilder.Append("----------------------------------------------------------------");

            contentBuilder.Append("<p><b>联系方式:</b></p>");
            contentBuilder.Append("<p><b>公司地址:</b></p>");
            contentBuilder.Append("<p>河南省洛阳市洛龙区老城区唐宫东路10号</p>");

            contentBuilder.Append("-----------------------------------------------------------------");
            contentBuilder.Append("<br/><br/><br/><p style='color:red'>温馨提示：本邮件系统发送，请不要回复</p>");

            message.Body = contentBuilder.ToString();

            message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnSuccess;
            //message.Attachments.Add(new Attachment(@"c:\1.txt"));
            message.Sender = new MailAddress("handingtech@handingtech.cn");
            message.BodyEncoding = System.Text.Encoding.UTF8;
            message.IsBodyHtml = true;

            client.Send(message);

        }
        /// <summary>
        /// 用户登录验证
        /// </summary>
        /// <param name="UserName"></param>
        /// <param name="UserPassword"></param>
        /// <returns></returns>
        public String UserLogin_Me(string UserName, string UserPassword)
        {
            string user = "";
            string user_ip = Net.Ip;
            string pwd_md5 = Mymd5(UserPassword);

            string [] data={"success","username","3"};

            MySqlConnection conn = new MySqlConnection(DbHelper.bj_connstring);
            try
            {
                conn.Open();
                string sql_str = "SELECT *FROM login WHERE (yhm ='" + UserName + "' OR email = '" + UserName + "') AND psw ='" + UserPassword + "'" + " OR pwd2 ='" + pwd_md5 + "'ORDER BY email DESC LIMIT 1";

                MySqlCommand cmd = new MySqlCommand(sql_str, conn);
                //var rows = cmd.ExecuteReader();
                MySqlDataReader mread = cmd.ExecuteReader();

                if (mread.Read())
                {
                    user = "UserName" + "@success";
                    data[1] = mread["yhm"].ToString();//用户

                    string sql_hd = "INSERT INTO hd_memary(hd_userName,hd_userIP) VALUES('" + UserName + "','" + user_ip + "')";
                    MySqlCommand cmd_log_ln = new MySqlCommand(sql_hd, conn);
                    conn.Close();
                    conn.Open();
                    int dox = cmd_log_ln.ExecuteNonQuery();
                }
                else
                {
                    user = "登录失败，用户账号或密码错误!" + "@error";// 数组下班越界
                }
            }
            catch (Exception ex)
            {
                string error_ = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            var user1 = user.Split('@');
            data[0] = user1[1];//success
            return data.ToJson();

        }
        /// <summary>
        /// 邮箱发送验证码
        /// </summary>
        public String SendMail(string Email)
        {
            code = GenerateRandomNumber(5);

            System.Net.Mail.SmtpClient client = new SmtpClient("smtp.ym.163.com");
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("handingtech@handingtech.cn", "handingtech123");
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            MailAddress addressFrom = new MailAddress("handingtech@handingtech.cn", "汉鼎网络科技Co.,Ltd");
            MailAddress addressTo = new MailAddress(Email);//发送到指定邮箱;

            System.Net.Mail.MailMessage message = new MailMessage(addressFrom, addressTo);
            message.Subject = "您的验证码:" + code;

            StringBuilder contentBuilder = new StringBuilder();
            contentBuilder.Append("<h3> 您的验证码:" + code + "</h3><br/>");

            contentBuilder.Append("<h2>欢迎加入汉鼎云服务平台</h2><br/>");
            contentBuilder.Append("----------------------------------------------------------------");
            contentBuilder.Append("<p><b>公司介绍:</b></p>");
            contentBuilder.Append("<p>Handing(汉鼎智能物料搬运有限公司),是国内首个共享服务商,自主研发并提供计算资源,存储");
            contentBuilder.Append("   资源,网络资源等企业必需的基础技术服务,并深入了解互联网,移动互联网,");
            contentBuilder.Append("   传统企业不同场景下的业务需求,提供全局解决方案</p>");
            contentBuilder.Append("----------------------------------------------------------------");

            contentBuilder.Append("<p><b>联系方式:</b></p>");
            contentBuilder.Append("<p><b>公司地址:</b></p>");
            contentBuilder.Append("<p>河南省洛阳市洛龙区老城区唐宫东路10号</p>");

            contentBuilder.Append("-----------------------------------------------------------------");
            contentBuilder.Append("<br/><br/><br/><p style='color:red'>温馨提示：本邮件系统发送，请不要回复</p>");

            message.Body = contentBuilder.ToString();

            message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnSuccess;
            //message.Attachments.Add(new Attachment(@"c:\1.txt"));
            message.Sender = new MailAddress("handingtech@handingtech.cn");
            message.BodyEncoding = System.Text.Encoding.UTF8;
            message.IsBodyHtml = true;

            client.Send(message);
            return code;
        }
        private static char[] constant =   
      {   
        '0','1','2','3','4','5','6','7','8','9',  
        'a','b','c','d','e','f','g','h','j','k','l','m','n','p','q','r','s','t','u','v','w','x','y','z',   
        'A','B','C','D','E','F','G','H','J','K','M','N','P','Q','R','S','T','U','V','W','X','Y','Z'   
      };
        /// <summary>
        /// 生成5位验证码
        /// </summary>
        /// <param name="Length"></param>
        /// <returns></returns>
        public static string GenerateRandomNumber(int Length)
        {
            System.Text.StringBuilder newRandom = new System.Text.StringBuilder(57);
            Random rd = new Random();
            for (int i = 0; i < Length; i++)
            {
                newRandom.Append(constant[rd.Next(57)]);
            }
            string code = newRandom.ToString();
            return code;
        }
        /// <summary>
        /// 忘记密码，检查用户是否注册
        /// </summary>
        /// <param name="Email"></param>
        /// <returns></returns>
        public String GetUserPassw(string Email)
        {
            string data = "data";

            MySqlConnection conn = new MySqlConnection(DbHelper.bj_connstring);
            try
            {
                conn.Open();
                string sql_str = "select *from login WHERE yhm ='" + Email + "' OR email ='" + Email + "'";
                MySqlCommand cmd = new MySqlCommand(sql_str, conn);
                var rows = cmd.ExecuteReader();
                if (rows.Read())
                {
                    data = "";
                }
                else
                {
                    data = "邮箱/用户名不存在!";
                }

            }
            catch (MySqlException myex)
            {
                string error_ = myex.Message;
            }
            finally
            {
                conn.Close();
            }

            return data;
        }
        /// <summary>
        /// 忘记密码，发送重置密码链接邮箱给用户
        /// </summary>
        /// <param name="Email"></param>
        /// <returns></returns>
        public String MailSend(string Email)
        {
            //Email = "1002110484@qq.com";//测试邮箱和用户名

            MySqlConnection conn = new MySqlConnection(DbHelper.bj_connstring);
            string data = "";
            try
            {
                conn.Open();
                string sql_str = "select email from login WHERE yhm ='" + Email + "' OR email ='" + Email + "'";//邮箱有问题
                //string sql_str = "select email from login WHERE yhm ='" + Email +  "'";

                MySqlCommand cmd = new MySqlCommand(sql_str, conn);
                MySqlDataReader mread = cmd.ExecuteReader();
                if (mread.Read())
                {
                    Email = (String)mread["email"];//通过邮箱或用户名找回密码
                    data = Email;
                }

            }
            catch (MySqlException ex)
            {
                string error_ = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            MailMessage MyMail = new MailMessage();
            MyMail.From = new MailAddress("handingtech@handingtech.cn", "汉鼎网络科技 Co.,Ltd");
            MyMail.To.Add(new MailAddress(Email));
            MyMail.Subject = "由安全中心发送";//邮件标题
            StringBuilder contentBuilder = new StringBuilder();
            contentBuilder.Append("请单击以下链接完成操作");
            contentBuilder.Append("<a href='http://www.hdmes.com/UserAccount/UserPassForm?email=" + Email + "'>密码重置</a>");//这个地址需要改变

            contentBuilder.Append("-----------------------------------------------------------------");
            contentBuilder.Append("<br/><br/><br/><p style='color:red'>温馨提示：本邮件系统发送，请不要回复</p>");
            MyMail.Body = contentBuilder.ToString();
            MyMail.IsBodyHtml = true;
            SmtpClient smtpclient = new SmtpClient();
            smtpclient.Credentials = new System.Net.NetworkCredential("handingtech@handingtech.cn", "handingtech123");
            smtpclient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpclient.Host = "smtp.ym.163.com";
            smtpclient.EnableSsl = true;
            smtpclient.Send(MyMail);

            var data1 = data.Split('@');
            var data2 = data1[1];
            return data2;
        }
        /// <summary>
        /// 重置密码框
        /// </summary>
        /// <param name="Userpass"></param>
        /// <param name="Email"></param>
        /// <returns></returns>
        public String ReSetUserPass(string Userpass, string Email)
        {
            string data = "";

            MySqlConnection conn = new MySqlConnection(DbHelper.bj_connstring);
            try
            {
                conn.Open();
                string sql_update = "UPDATE login SET psw = '" + Userpass + "' WHERE yhm = '" + Email + "' OR email='" + Email + "'";
                MySqlCommand cmd = new MySqlCommand(sql_update, conn);
                var rows = cmd.ExecuteNonQuery();//返回int类型 >0 修改成功!
                if (rows > 0)
                {
                    data = "";
                }
                else
                {
                    data = "系统异常,重设密码失败!";
                }
            }
            catch (MySqlException ex)
            {
                string error_ = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            return data;
        }
        /// <summary>
        /// 检查邮箱是否被占用
        /// </summary>
        /// <param name="Email"></param>
        /// <returns></returns>
        public String CheckUSerEmail(string Email)
        {
            string data = "";
            MySqlConnection conn = new MySqlConnection(DbHelper.bj_connstring);
            try
            {
                conn.Open();
                string sql_str = "select email from login WHERE email ='" + Email + "'";

                MySqlCommand cmd = new MySqlCommand(sql_str, conn);
                MySqlDataReader mread = cmd.ExecuteReader();
                if (mread.Read())
                {
                    data = "温馨提示:\n\n\n邮箱:" + Email + "已被注册.\n\n您可以返回登录，找回密码！";
                }
                else
                {
                    data = "checked";
                }
            }
            catch (MySqlException ex)
            {
                string error_ = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            return data;
        }
        /// <summary>
        /// 微信登录接入 OAuthSnsApiUserInfo                  
        /// </summary>
        /// <returns></returns>
        public ActionResult OAuthSnsApiUserInfo()
        {
            string code = Request.QueryString["code"];
            string appid = "wx0d9a0bfa8fe63c7c";
            string appsecret = "445a080b690d92c192c20e63bedab525";

            MySqlConnection conn = new MySqlConnection(DbHelper.bj_connstring);
            string user_ip = Net.Ip;//获取IP
            try
            {
                if (!string.IsNullOrEmpty(code))
                {
                    ViewData["newname"] = "Code 不为空";

                    OAuthToken oauthToken = HttpUtility.Get<OAuthToken>(string.Format("https://api.weixin.qq.com/sns/oauth2/access_token?appid={0}&secret={1}&code={2}&grant_type=authorization_code", appid, appsecret, code));

                    string access_token = oauthToken.access_token;
                    string openid = oauthToken.openid;

                    //if (b != null)
                    if (oauthToken != null && !string.IsNullOrEmpty(oauthToken.openid) && !string.IsNullOrEmpty(oauthToken.access_token))
                    {
                        ViewData["newname"] = "oauthToken 不为空";
                        ViewData["mycode"] = code;
                        ViewData["myAccessToken"] = access_token;
                        ViewData["myopenid"] = openid;

                        string uri = string.Format("https://api.weixin.qq.com/sns/userinfo?access_token={0}&openid={1}&lang=zh_CN", access_token, openid);
                        ViewData["userInfo"] = uri;

                        OAuthUserInfo userInfo = Get<OAuthUserInfo>(string.Format("https://api.weixin.qq.com/sns/userinfo?access_token={0}&openid={1}&lang=zh_CN"
                            , access_token, openid));

                        ViewData["nickName"] = userInfo.nickname;

                        if (userInfo != null)
                        {
                            ViewData["mycode1"] = code;
                            ViewData["myAccessToken1"] = access_token;
                            ViewData["myopenid1"] = openid;
                            ViewData["newname1"] = "User 不为空";

                            ViewData["headImage"] = userInfo.headimgurl;
                            ViewData["openid"] = userInfo.openid;
                            ViewData["nickName"] = userInfo.nickname;

                            Session["nickName"] = userInfo.nickname;//保存到用户名
                            if (userInfo.sex == 0)
                            {
                                ViewData["sex"] = "未知";
                            }
                            else if (userInfo.sex == 1)
                            {
                                ViewData["sex"] = "男";
                            }
                            else
                            {
                                ViewData["sex"] = "女";
                            }
                            ViewData["province"] = userInfo.province;
                            ViewData["city"] = userInfo.city;
                            //记录用户信息
                            try
                            {
                                conn.Open();
                                string sql_str = "INSERT INTO wx_memary(wx_ip,wx_code,wx_access_token,wx_uri_user,wx_nickname,wx_country,wx_province,wx_city,wx_sex,wx_headimgurl,wx_openid,wx_unionid) VALUES ('" + user_ip + "','" + code + "','" + access_token + "','" + uri + "','" + userInfo.nickname + "','" + userInfo.country + "','" + userInfo.province + "','" + userInfo.city + "','" + userInfo.sex + "','" + userInfo.headimgurl + "','" + userInfo.openid + "','" + userInfo.unionid + "')";
                                MySqlCommand cmd = new MySqlCommand(sql_str, conn);
                                var rows = cmd.ExecuteNonQuery();
                                if (rows != 0)
                                {
                                    // 
                                }
                                else
                                {
                                    // 
                                }
                            }
                            catch (MySqlException ex)
                            {
                                string error_ = ex.Message;
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }
                        else
                        {
                            //ViewData["newname"] = "User 为空";

                        }
                    }
                    else
                    {
                        //ViewData["newname"] = "oauthToken 为空";
                    }
                }
                else
                {
                    return Redirect(string.Format("https://open.weixin.qq.com/connect/qrconnect?appid={0}&redirect_uri={1}&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect", "wx0d9a0bfa8fe63c7c", Server.UrlEncode("http://" + Request.Url.Host + Url.Action("OAuthSnsApiUserInfo"))));
                }
            }
            catch (Exception ex)
            {
                ViewData["errmsg"] = ex.Message;
            }
            return View();
        }
        /// <summary>
        /// 获取微信用户信息回调数据Json转换JsonConvert.DeserializeObject<T>(result);
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="url"></param>
        /// <returns></returns>
        public T Get<T>(string url)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "get";
            request.Timeout = 2000;
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            StreamReader sr = new StreamReader(response.GetResponseStream(), System.Text.Encoding.UTF8);

            string result = sr.ReadToEnd();
            // Log("result:" + result);
            return JsonConvert.DeserializeObject<T>(result);

        }
        /// <summary>
        /// 清除session登录
        /// </summary>
        public void ClearSession()
        {
            Session["nickName"] = null;

            Session.Abandon();
            Session.Clear();
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
        /// 网易开始测试
        /// </summary>
        /// <param name="IPhone"></param>
        /// <param name="code"></param>
        /// <returns></returns>
        public String Main(String IPhone)
        {
            String url = "https://api.netease.im/sms/sendcode.action";
            url += "?templateid=3058788&mobile=" + IPhone;//请输入正确的手机号 模板ID

            //网易云信分配的账号，请替换你在管理后台应用下申请的Appkey
            String appKey = "eb150182f2633909bf7ebbf7bd984938";
            //网易云信分配的密钥，请替换你在管理后台应用下申请的appSecret
            String appSecret = "211789f5ccf5";
            //随机数（最大长度128个字符）
            String nonce = "12345";

            TimeSpan ts = DateTime.Now.ToUniversalTime() - new DateTime(1970, 1, 1);
            Int32 ticks = System.Convert.ToInt32(ts.TotalSeconds);
            //当前UTC时间戳，从1970年1月1日0点0 分0 秒开始到现在的秒数(String)
            String curTime = ticks.ToString();
            //SHA1(AppSecret + Nonce + CurTime),三个参数拼接的字符串，进行SHA1哈希计算，转化成16进制字符(String，小写)
            String checkSum = getCheckSum(appSecret, nonce, curTime);

            IDictionary<object, String> headers = new Dictionary<object, String>();
            headers["AppKey"] = appKey;
            headers["Nonce"] = nonce;
            headers["CurTime"] = curTime;
            headers["CheckSum"] = checkSum;
            headers["ContentType"] = "application/x-www-form-urlencoded;charset=utf-8";
            //执行Http请求
            //HttpPost(url, null, headers);

            //HttpPost(vurl, null, headers);

            string data = HttpPost(url, null, headers);

            return data;
        }

        // 1 计算并获取CheckSum
        public static String getCheckSum(String appSecret, String nonce, String curTime)
        {
            byte[] data = Encoding.Default.GetBytes(appSecret + nonce + curTime);
            byte[] result;

            SHA1 sha = new SHA1CryptoServiceProvider();
            // This is one implementation of the abstract class SHA1.
            result = sha.ComputeHash(data);

            return getFormattedText(result);
        }

        // 2 计算并获取md5值
        public static String getMD5(String requestBody)
        {
            if (requestBody == null)
                return null;

            // Create a new instance of the MD5CryptoServiceProvider object.
            MD5 md5Hasher = MD5.Create();

            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(requestBody));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return getFormattedText(Encoding.Default.GetBytes(sBuilder.ToString()));
        }

        private static String getFormattedText(byte[] bytes)
        {
            char[] HEX_DIGITS = { '0', '1', '2', '3', '4', '5',
            '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
            int len = bytes.Length;
            StringBuilder buf = new StringBuilder(len * 2);
            for (int j = 0; j < len; j++)
            {
                buf.Append(HEX_DIGITS[(bytes[j] >> 4) & 0x0f]);
                buf.Append(HEX_DIGITS[bytes[j] & 0x0f]);
            }
            return buf.ToString();
        }
        /// <summary>
        ///  3 发起Http请求
        /// </summary>
        /// <param name="url"></param>
        /// <param name="data"></param>
        /// <param name="headers"></param>
        public static String HttpPost(string url, Stream data, IDictionary<object, string> headers = null)
        {
            string responseFromServer = "";
            System.Net.WebRequest request = HttpWebRequest.Create(url);
            request.Method = "POST";
            if (data != null)
                request.ContentLength = data.Length;
            //request.ContentType = "application/x-www-form-urlencoded;charset=utf-8";

            if (headers != null)
            {
                foreach (var v in headers)
                {
                    if (v.Key is HttpRequestHeader)
                        request.Headers[(HttpRequestHeader)v.Key] = v.Value;
                    else
                        request.Headers[v.Key.ToString()] = v.Value;
                }
            }
            HttpWebResponse response = null;
            try
            {
                // Get the response.
                response = (HttpWebResponse)request.GetResponse();
                // Display the status.
                Console.WriteLine(response.StatusDescription);///Ok 已发送
                // Get the stream containing content returned by the server.
                Stream dataStream = response.GetResponseStream();
                // Open the stream using a StreamReader for easy access.
                StreamReader reader = new StreamReader(dataStream);
                // Read the content.
                responseFromServer = reader.ReadToEnd();///code码

                // Display the content.
                Console.WriteLine(responseFromServer);
                // Cleanup the streams and the response.
                reader.Close();
                dataStream.Close();
                response.Close();

            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Console.WriteLine(response.StatusDescription);
            }

            return responseFromServer;
        }


    }

}