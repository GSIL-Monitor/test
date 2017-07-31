<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StiffnessBox.aspx.cs" Inherits="Handing.Reports.WFGang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>刚度计算报告--箱型梁</title>
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
        .font-01{
            font-family:Arial;
            font-weight:initial;
            font-style:italic;
           
        }

    </style>
</head>
 
<body>
    <div class="div_border">
        <div class="div_title">
            <br />
            <p class="p_header">Calculation Reports</p>
            <hr style="width:45%;border-top:2px solid #185598;" />
            <p class="p_header_ch">刚度计算报告</p>
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
        <p>&nbsp;一、已知参数</p> 
        <table>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;弹性模量 E：<%=pass %></th>
                <th class="font-01">&nbsp;&nbsp;210000Mpa</th>
            </tr>
        </table>
        <img src="../Content/image/cal_sti.png" width="166" height="246" align="right" />    
        <p>&nbsp;二、计算参数</p>
        <table>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;集中力 F：</th>
                <th class="font-01">&nbsp;&nbsp;<%=p %>kN</th>
            </tr>

            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;跨度 L：</th>
                <th class="font-01">&nbsp;&nbsp;<%=L %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上盖板宽 L1：</th>
                <th class="font-01">&nbsp;&nbsp;<%=x1 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上盖板厚 t1：</th>
                <th class="font-01">&nbsp;&nbsp;<%=x2 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下盖板宽 L2：</th>
                <th class="font-01">&nbsp;&nbsp;<%=x3 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下盖板厚 t2：</th>
                <th class="font-01">&nbsp;&nbsp;<%=x4 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;右腹板厚 t3：</th>
                <th class="font-01">&nbsp;&nbsp;<%=x5 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;左腹板厚 t4：</th>
                <th class="font-01">&nbsp;&nbsp;<%=x6 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;腹板高度 h：</th>
                <th class="font-01">&nbsp;&nbsp;<%=x7 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;腹板边距 t5：</th>
                <th class="font-01">&nbsp;&nbsp;<%=x9 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;腹板边距 t6：</th>
                <th class="font-01">&nbsp;&nbsp;<%=x10 %>㎜</th>
            </tr>
        </table>
        <p>&nbsp;三、计算惯性距</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;1、计算各截面面积</p>
        <table>
            <tr>                
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上盖板面积 A1：</th>
                <th>&nbsp;&nbsp;A1=L1×t1=</th>
                 <th class="font-01"><%=x1*x2 %>㎜²</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下盖板面积 A2：</th>
                <th>&nbsp;&nbsp;A2=L2×t2=</th>
                <th class="font-01"><%=x3*x4 %>㎜²</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;右腹板面积 A3：</th>
                <th>&nbsp;&nbsp;A3=h×t3=</th>
                 <th class="font-01"><%=x5*x7 %>㎜²</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;左腹板面积 A4：</th>
                <th>&nbsp;&nbsp;A4=h×t4=</th>
                <th class="font-01"><%=x6*x7 %>㎜²</th>
            </tr>            
        </table>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;2、计算各截面形心坐标</p>
        <table>
            <tr>                
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上盖板形心X轴坐标 A1_X：</th>
                <th>&nbsp;&nbsp;A1_X=L1/2=</th>
                <th class="font-01"><%=x1/2%>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上盖板形心Y轴坐标 A1_Y：</th>
                <th>&nbsp;&nbsp;A1_Y=t1/2+h+t2=</th>
                 <th class="font-01"><%=x2/2 + x4 + x7 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下盖板形心X轴坐标 A2_X：</th>
                <th>&nbsp;&nbsp;A2_X=L2/2=</th>
                <th class="font-01"><%=x3/2 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下盖板形心Y轴坐标 A2_Y：</th>
                <th>&nbsp;&nbsp;A2_Y=t2/2=</th>
                <th class="font-01"><%=x4/2 %>㎜</th>
            </tr> 
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;右腹板形心X轴坐标 A3_X：</th>
                <th>&nbsp;&nbsp;A3_X=L2-t6-t3/2=</th>
                <th class="font-01"><%=x3 - x9 - x5 / 2 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;右腹板形心Y轴坐标 A3_Y：</th>
                <th>&nbsp;&nbsp;A3_Y=h/2+t2=</th>
                <th class="font-01"><%=x7 / 2 + x4 %>㎜</th>

            </tr>  
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;左腹板形心X轴坐标 A4_X：</th>
                <th>&nbsp;&nbsp;A4_X=t5+t4/2=</th>
                <th class="font-01"><%= x10 + x6 / 2 %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;左腹板形心Y轴坐标 A4_Y：</th>
                <th>&nbsp;&nbsp;A4_Y=h/2+t2=</th>
                <th class="font-01"><%=x7 / 2 + x4 %>㎜</th>
            </tr>           
        </table>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;3、计算截面形心坐标</p>
        <table>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;截面形心X轴坐标 X：</th>
                <th>&nbsp;&nbsp;X=(A1×A1_X + A2×A2_X + A3×A3_X + A4×A4_X) / (A1 + A2 + A3 + A4)=</th>
                <th  class="font-01"><%=((x1*x2) * (x1/2) + (x3*x4) * (x3/2) + (x5*x7) * (x3 - x9 - x5 / 2) + (x6*x7) * (x10 + x6 / 2)) / ((x1*x2) + (x3*x4) + (x5*x7) + (x6*x7)) %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;截面形心Y轴坐标 Y：</th>
                <th>&nbsp;&nbsp;Y=(A1×A1_Y + A2×A2_Y + A3×A3_Y + A4×A4_Y) / (A1 + A2 + A3 + A4)=</th>
                <th class="font-01"><%=((x1*x2) * (x2/2 + x4 + x7) + (x3*x4) * (x4/2) + (x5*x7) * (x7 / 2 + x4) + (x6*x7) * (x7 / 2 + x4)) / ((x1*x2) + (x3*x4) + (x5*x7) + (x6*x7)) %>㎜</th>
            </tr>
        </table>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;4、计算各截面形心距截面形心X轴距离</p>
        <table>
            <tr><%var Yy = ((x1 * x2) * (x2 / 2 + x4 + x7) + (x3 * x4) * (x4 / 2) + (x5 * x7) * (x7 / 2 + x4) + (x6 * x7) * (x7 / 2 + x4)) / ((x1 * x2) + (x3 * x4) + (x5 * x7) + (x6 * x7));%>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上盖板形心距截面形心X轴距离 A1_CX：</th>
                <th>&nbsp;&nbsp;A1_CX=(t1 + h + t2) - Y - t1 / 2=</th>
                <th class="font-01"><%=((x2 + x7 + x4) - Yy - x2 / 2) %>㎜</th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下盖板形心距截面形心X轴距离 A2_CX：</th>
                <th>&nbsp;&nbsp;A2_CX=Y - t2 / 2=</th>
                 <th class="font-01"><%=Yy -x4/2 %>㎜</th>
            </tr>
        </table>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;5、计算截面垂直惯性矩 Ix</p>
        <table>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ix=(L1 × t1³ / 12) + (A1_CX² × A1) + (L2 × t2³ / 12) + (A2_CX² × A2) + (t3 × h³ / 12) + (t4 × h³ / 12)</th>
            </tr>
            <tr class="font-01">
                                <th class="font-01">&nbsp;&nbsp;=<%=txt_showresult %>㎜⁴</th>
            </tr>
        </table>
        <p>&nbsp;四、计算截面垂直刚度</p>
        <table>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.跨度1/2处的垂直静刚度</th>
                <th>&nbsp;&nbsp;f =(F × L × L × L) / (48 × E × Ix) ≈</th>
                <th class="font-01"> <%=txt_showresult2 %></th>
            </tr>
            <tr>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.跨度1/4处的垂直静刚度</th>
                <th>&nbsp;&nbsp;f =(F × (3L / 4)² × (L / 4)²) / (48 × E × Ix) ≈</th>
                <th class="font-01"> <%=txt_showresult4 %></th>
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
