<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StiffnessRec.aspx.cs" Inherits="Handing.Reports.StiffnessRec" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>刚度计算报告--矩形梁</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="~/Content/css/common.css?v=2017050802" rel="stylesheet"/>
    <script type="text/javascript" src="../Content/js_sunfa/suanfa1.js"></script>
     <script>
         function reload_a(){
             //window.location.reload();
             //history.go(0);
             //window.location.href = "#";
             //document.execCommand('Refresh');
             //location.replace(location);
             //document.URL = location.href;
             //document.location.reload();
             //self.location.href = ("/Reports/StiffnessRec.aspx");
           
                 //location.reload();
                 alert("报告生成成功！");

            
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
        .font-01{
            font-family:Arial;
            font-weight:initial;
            font-style:italic;
           
        }
    </style>
</head>   
<body onload="reload_a();">
    <div class="div_border">
        <div class="div_title">
            <p class="p_header">Calculation Reports</p>
            <hr style="width:45%;border-top:2px solid #185598;"/>
            <p class="p_header_ch">刚度计算报告</p>
                <input id="btn_print" type="button" value="打印报告" onclick="printff();" style="background-color:Highlight skyblue"/>
            <hr style="border:1px solid #1ab3f2;"/>
            <div class="hr-in">
                <img src="../Content/image/in.png" width="30" height="15"/>
            </div>            
        </div>   
        <p>&nbsp;一、已知参数</p> 
        <table>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;弹性模量 E：</th>
                <th class="font-01">&nbsp;&nbsp;210000Mpa</th>
            </tr>
        </table>
        <img src="../Content/image/cal_sti1.png" width="166" height="246" align="right" />    
        <p>&nbsp;二、计算参数</p>
        <table>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;集中力 F：</th>
                <th class="font-01">&nbsp;&nbsp;<%=sti_force2 %>kN</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;跨度 L：</th>
                <th class="font-01">&nbsp;&nbsp;<%=sti_wheelbase %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;矩形管宽 L1：</th>
                <th class="font-01">&nbsp;&nbsp;<%=sti_rec_L1 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;矩形管高 h：</th>
                <th class="font-01">&nbsp;&nbsp;<%=sti_rec_t1 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;矩形管厚 t：</th>
                <th class="font-01">&nbsp;&nbsp;<%=sti_rec_t %>㎜</th>
            </tr>            
        </table>
        <p>&nbsp;三、计算惯性距</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;1、计算内矩形边长</p>
        <table>
            <tr>                
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;宽度 B1</th>
                <th>&nbsp;&nbsp;B1 = L1 - 2 × t=</th>
                <th class="font-01"><%=sti_rec_L1 - 2 * sti_rec_t%>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高度 h1：</th>
                <th>&nbsp;&nbsp;h1 = h - 2 × t=</th>
                <th class="font-01"><%=(sti_rec_t1 - 2 * sti_rec_t)%>㎜</th>
            </tr>           
        </table>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;2、计算各矩形惯性矩</p>
        <table>
            <tr>                
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;外矩形惯性矩 Ix_w：</th>
                <th>&nbsp;&nbsp;Ix_w = (B × h × h × h) / 12=</th>
                <th class="font-01"><%=(sti_rec_L1*sti_rec_t1*sti_rec_t1*sti_rec_t1)/12 %>㎜⁴</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;内矩形惯性矩 Ix_n：</th>
                <th>&nbsp;&nbsp;Ix_n = (B1 × h1 × h1 × h1) / 12=</th>
                <th class="font-01"><%=((sti_rec_L1 - 2 * sti_rec_t) * (sti_rec_t1 - 2 * sti_rec_t) * (sti_rec_t1 - 2 * sti_rec_t) * (sti_rec_t1 - 2 * sti_rec_t) )/ 12%>㎜⁴</th>
            </tr>           
        </table>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;3、计算截面惯性矩</p>
        <table>
            <tr>
                <th class="font-01">&nbsp;&nbsp;Ix = Ix_w - Ix_n =<%=txt_showresult %>㎜⁴</th>
            </tr>
        </table>
        <p>&nbsp;四、计算截面垂直刚度</p>
        <table>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.跨度1/2处的垂直静刚度</th>
                <th>&nbsp;&nbsp;f =(F × L × L × L) / (48 × E × Ix) ≈</th>
                <th class="font-01"><%=txt_showresult2 %></th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.跨度1/4处的垂直静刚度</th>
                <th>&nbsp;&nbsp;f =(F × (3L / 4)² × (L / 4)²) / (3 × E × Ix × L) ≈</th>
                <th class="font-01"><%=txt_showresult4 %></th>
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
            <input id="btn_print1" type="button" value="打印报告" onclick="printff()" style="background-color:Highlight skyblue"/>
        </div>
    </div>                
</body>
</html>
