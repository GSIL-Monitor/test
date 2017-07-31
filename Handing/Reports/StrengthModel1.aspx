<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StrengthModel1.aspx.cs" Inherits="Handing.Reports.StrengthModel1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>强度计算报告---模型一</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="~/Content/css/common.css?v=2017050802" rel="stylesheet"/>
    <script type="text/javascript" src="~/Content/js_sunfa/suanfa1.js"></script>   
    <script>
            
         function printff() {
             //t = new ActiveXObject("WScript.Shell");
             //t.RegWrite("HKCU\\Software\\Microsoft\\InternetExplorer\\PageSetup\\header", "");
             //t.RegWrite("HKCU\\Software\\Microsoft\\InternetExplorer\\PageSetup\\footer", "");
             document.getElementById("btn_print").hidden = 'hiddened';
             document.getElementById("btn_print1").hidden = 'hiddened';

             window.print();

         }
    </script> 
    <style>
        .div_border{
        border:1px solid #1ab3f2    
      }
        .div_title{
            text-align:center
        }
        .p_header{
            font-size:30px
        }
        .p_header_ch{
            font-size:25px
        }
        .hr-in{
            position :relative;
            top:-12px;

        }

    </style>
</head>
<body onunload="clearSession();">
    <form id="form1" runat="server">
    <div>
    </div>
    </form>
     <div class="div_border">
        <div class="div_title">
            <br />
            <p class="p_header">Calculation Reports</p>
            <hr style="width:45%;border-top:2px solid #185598;" />
            <p class="p_header_ch">强度计算报告</p>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input id="btn_print" type="button" value="打印报告" onclick="printff()" style="background-color:Highlight"/><br  />
            <hr style="border:1px solid #1ab3f2;"/>
            <div class="hr-in">
                <img src="../Content/image/in.png" width="30" height="15"/>
            </div>   
        </div>   
        <img src="../Content/image/MUXING_201706010854222.png" width="280" height="100" align="right" />    
        <p>&nbsp;一、计算参数</p>
        <table>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;集中力 F：</th>
                <th>&nbsp;&nbsp;<%=p %>N</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;跨度 l：</th>
                <th>&nbsp;&nbsp;<%=L %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;自重 q：</th>
                <th>&nbsp;&nbsp;<%=Qx %>㎏/m</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;惯性矩 Ix：</th>
                <th>&nbsp;&nbsp;<%=Ix %>㎜⁴</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;形心距中性轴距离 y：</th>
                <th>&nbsp;&nbsp;<%=Yx %>㎜</th>
            </tr>
        </table>
        <img src="../Content/image/MUXING_201706010854221.png" width="280" height="100" align="right"/>
        <p>&nbsp;二、计算弯矩</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;1、计算弯矩</p>
        <table>
            <tr>                
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;跨中弯矩 MF：</th>
                <th>&nbsp;&nbsp;Mf = F × l / 4</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;自重弯矩 Mq：</th>
                <th>&nbsp;&nbsp;Mq = q / 1000 × 9.81 × l² / 8</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;跨中总弯矩 Mmax： <%=txt_showresult %></th>
                <th>&nbsp;&nbsp;Mmax = Mf × Mq</th>
            </tr>
        </table>        
        <p>&nbsp;三、计算截面垂直强度</p>
        <table>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.跨度1/2处的垂直强度</th>
                <th>&nbsp;&nbsp;σ = Mmax × y / Ix ≈ <%=txt_showresult2 %></th>
            </tr>
        </table>
        <br />
        <div class="div_title">
            <hr style="border:1px solid #1ab3f2;"/>
            <div class="hr-in">
                <img src="../Content/image/in.png" width="30" height="15"/>
            </div>  
             <p class="p_foot">HANDING</p>  
            <p class="p_foot_1">keep the interpretation power of this website content, and offer Your</p>   
            <p class="p_foot_1">Excellency individual to use this website content only.</p> 
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="btn_print1"type="button" value="打印报告" onclick="printff()" style="background-color:Highlight"/><br  />
            <br />     
        </div>
    </div>
</body>
</html>