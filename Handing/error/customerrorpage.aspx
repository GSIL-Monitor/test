<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404Page.aspx.cs" Inherits="Handing.error._404Page" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
    <title>汉鼎开放服务平台 HD.COM</title>

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background: #efefef;
            font-family: Georgia, Times, Verdana, Geneva, Arial, Helvetica, sans-serif;
        }

        div#mother {
            margin: 0 auto;
            width: 943px;
            height: 572px;
            position: relative;
        }

        div#errorBox {
            background: url(/Content/image/404_bg.png) no-repeat top left;
            width: 943px;
            height: 572px;
            margin: auto;
        }

        div#errorText {
            color: #39351e;
            padding: 146px 0 0 446px;
        }

            div#errorText p {
                width: 303px;
                font-size: 14px;
                line-height: 26px;
            }

        div.link { /*background:#f90;*/
            height: 50px;
            width: 145px;
            float: left;
        }

        div#home {
            margin: 20px 0 0 444px;
        }

        div#contact {
            margin: 20px 0 0 25px;
        }

        h1 {
            font-size: 40px;
            margin-bottom: 35px;
        }
    </style>



</head>
<body>
    <div id="mother">
        <div id="errorBox">
            <div id="errorText">
                <h1>Sorry..您的操作异常！</h1>
                <p>
                    500
                </p>
                <p>
                    500
                </p>
                  
                <p>
                    欢迎访问汉鼎开放性服务平台
                </p>
            </div>
            <a href="http://192.168.0.188:8098" title="返回平台首页"><div class="link" id="home"></div></a>
               
          
            <a href="mailto:sanjiefu666@gmail.com" title="联系管理员"><div class="link" id="contact"></div></a>
            
        </div>
    </div>
</body>
</html>
