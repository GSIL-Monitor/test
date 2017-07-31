<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WholeDesignSecond.aspx.cs" Inherits="Handing.Reports.WholeDesign.WholeDesignSecond" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>Handing-中国首个起重机械开放性服务平台</title>
    <meta name="baidu-site-verification" content="2Lkh1N0Y9U" />
    <meta name="keywords" content="安全检测、云数据、智能报价、云计算" />
    <meta name="description" content="Handing是中国最先建立的监控服务商,专注于提供可靠的起重监控,数据采集、载荷分析等服务。" />
    <link rel="shortcut icon" href="~/Content/image/H140.png" type="image/vnd.microsoft.icon"/>
    <link rel="stylesheet" type="text/css" href="../../Content/css/wholedesign.css"/>
    <link rel="stylesheet" type="text/css" href="../../Content/css/wholedesignform.css"/>
    <script src="/Content/js/jquery/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="../../Content/js/jQuery.rTabs.js"></script>

    <script type="text/javascript">

        $(function () {

            $("#tab").rTabs({
                bind: 'click',
                animation: 'fadein'//渐入特效
            });

        });
        //电机减速器-吊钩组
        $(function () {
            $("#mgnext").click(function () {

                document.getElementById("hook").className = "current";
                document.getElementById("tab-con-item-1").style.display = "";
                document.getElementById("tab-con-item-2").style.display = "block";
            })
        });
        //吊钩组-钢丝绳
        $(function () {
            $("#hooknext").click(function () {

                document.getElementById("rope").className = "current";
                document.getElementById("tab-con-item-2").style.display = "";
                document.getElementById("tab-con-item-3").style.display = "block";
            })
        });
        //钢丝绳-定滑轮
        $(function () {
            $("#ropenext").click(function () {

                document.getElementById("pulley").className = "current";
                document.getElementById("tab-con-item-3").style.display = "";
                document.getElementById("tab-con-item-4").style.display = "block";
            })
        });
        //定滑轮-卷筒组
        $(function () {
            $("#pulleynext").click(function () {

                document.getElementById("drum").className = "current";
                document.getElementById("tab-con-item-4").style.display = "";
                document.getElementById("tab-con-item-5").style.display = "block";
            })
        });

        $(function () {
            $("#BtnAdd").click(function () {

                checkBox();
            })
        });
        function checkBox() {
            var v = document.getElementById("dgn_load").value;
            if (v >= 50) {
                document.getElementById("tips_").innerText = "单位：t，请输入1~50之间数字";
                document.getElementById("tips_").style = "color:red";
            }
            else {
                document.getElementById("tips_").innerText = "单位：t，请输入1~50之间数字";
                document.getElementById("tips_").style = "";
            }
        }
        ///
        function clearNoNum(event, obj) {
            event = window.event || event;
            if (event.keyCode == 37 | event.keyCode == 39)
            { return; }
            obj.value = obj.value.replace(/[^\d.]/g);
            obj.value = obj.value.replace(/^\./g, "");
            obj.value = obj.value.replace(/\.{2}/g, ".");
            obj.value = obj.value.replace(".", "$#$").replace(/\./g, ".").replace("$#$", ".");
        }
        function checkNum(obj)
        { obj.value = value.replace(/\.$/g, ""); }
        
	</script>

    <style type="text/css">

			body{ background:#fff;}

			h2 {

				width: 850px;

				margin: 0 auto 10px auto;

				font-size: 18px;

				font-family: "微软雅黑";

				color: #333;

			}

			.tab {

				position: relative;

				width: 848px;

                height:480px;

                overflow-x: hidden;

				overflow-y: auto;

				margin: -35px auto 20px auto;

				font-family: Microsoft Yahei,微软雅黑;

			}

			.tab-nav {

				height: 30px;

				overflow: hidden;

				background: #fff;

			}

			.tab-nav a {

				display: block;

				float: left;

				width: 100px;

				height: 50px;

				line-height: 30px;

                margin-left:5px;

				text-align: center;

				text-decoration: none;				

			}

			.tab-nav a.current {

				/*background: #2e97de;*/

				color: #2e97de;

			}

			.tab-con {

				position: relative;

				width: 850px;

				overflow: hidden;

				background: #fff;

			}

			.tab-con-item {

				display: none;

				width: 800px;

				padding-top:20px;

			}

 
            .mg-gridview{
                border-right: 1px solid #A7A6AA;
                border-bottom: 1px dashed #A7A6AA;
                border-left: 1px solid #A7A6AA;
                border-top: 1px solid #A7A6AA;
                text-align:center;
                padding: 4px;
                cursor:pointer
            }
            .GridViewHeaderStyle td{
                text-align:center;                
            }
            .GridViewHeaderStyle th{
                text-align:center;                
            }
            .GridViewHeaderStyle a:link{
                text-decoration:none;
            }
            .GridViewHeaderStyle a:hover{
                color:#999999;
                text-align :center;
            }
            .GridViewRowStyle td:hover{
                background-color: #5cc5f2;            
            }
		</style>
</head>
<body>
   <div>
        <div class="reg-top">
             <div class="reg-top-main">
                  <div class="pull-left">
                       <img src="../../Content/image/handinglogo.png" class="mt-15" width="120",height="30"/> 
                       <span class="v-separator"></span> 
                       <span class="reg-header-text">葫芦桥式起重机完整设计</span>
                  </div>
                  <div class="pull-right">
                       <a href="http://www.handingtech.cn">首页</a> 
                       <a href="http://bbs.handingtech.cn">帮助</a> 
                       <a href="/cas/login">登录</a>
                  </div>
             </div>
        </div>

        <div class="reg-main">
        <div id="reg-timeline-container">
             <ul class="reg-timeline nav nav-tabs">
                 <li>
                          <div class="hr active"></div>
                          <img src="../../Content/image/design_step/design_step_1.png"/>
                          <br/>
                          <span>小车模块</span>
                 </li> 
                 <li>
                          <img src="../../Content/image/design_step/design_step_2.png"/>
                          <br/>
                          <span>桥架模块</span>
                 </li> 
                 <li>
                         <img src="../../Content/image/design_step/design_step_33.png"/>
                         <br/>
                         <span>运行模块</span>
                  </li>
                  <li>
                         <img src="../../Content/image/design_step/design_step_44.png"/>
                         <br/>
                         <span>电控模块</span>
                  </li> 
             </ul>
         </div>

        <div class="reg-main-body expand-transition">

            <div class="tab" id="tab">

			<div class="tab-nav j-tab-nav" id="tab-nav">

				<a href="javascript:void(0);" class="current">桥架结构—></a>

				<a href="javascript:void(0);" id="hook" name="a2">主梁截面 —></a>

				<a href="javascript:void(0);" id="rope" name="a3">端梁截面 —></a>

				<a href="javascript:void(0);" id="pulley" name="a4">完成</a>

				<%--<a href="javascript:void(0);" id="drum" name="a5">卷筒组 —></a>--%>

<%--            <a href="javascript:void(0);"">运行电机 —></a>

                <a href="javascript:void(0);">车轮组 —></a>--%>

			</div>
            <hr style="margin-top:0;"/>
            
			<div class="tab-con">
                <form id="registerForm" role="form" runat="server" >
                    <asp:ScriptManager ID="scriptmanager1" runat="server"></asp:ScriptManager>
				<div class="j-tab-con">
                    
                    <%--桥架结构--%>                    
					<div class="tab-con-item" id="tab-con-item-1" style="display:block;">  
                                                    
                          <div class="dgn-title" >
                             <p><b>1、桥架结构</b></p>
                          </div>
                           <table>
                         <tbody class="text-center">
                              <tr >
                                   <td  class="text-right">
                                      <label for="dgn_load">
                                         <span>起重量</span>
                                         <span class="asterisk">*</span>
                                      </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="dgn_load" class="form-control" runat="server" required="true" oninput='checkBox()' onblur='this.value=this.value.replace(/[^\d.]/g,"");checkBox()'  onkeyup='this.value=this.value.replace(/[^\d.]/g,"")' MaxLength="6" ></asp:TextBox>
<%--                                       <input id="dgn_load1" name="dgn_load" value="www" type="number"  class="form-control" min="1" max="50" autofocus="" required="required" />--%>
                                    </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span id="tips_" class="text-note">单位：t，请输入1~50之间数字</span>
                                    </td>
                              </tr>
                              <tr>
                                    <td  class="text-right">
                                      <label for="dgn-class">
                                         <span>工作级别</span>
                                         <span class="asterisk">*</span>
                                      </label>
                                    </td>
                                    <td >
                                        <asp:DropDownList class="form-control" ID="ddl1" runat="server" required="true" >
                                              <asp:ListItem>M3</asp:ListItem>
                                              <asp:ListItem>M4</asp:ListItem>
                                              <asp:ListItem>M5</asp:ListItem>
                                              <asp:ListItem>M6</asp:ListItem>
                                              <asp:ListItem>M7</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span class="text-note">例如：M5，请选择合适级别</span>
                                    </td>
                              </tr>  
                              <tr>
                                    <td  class="text-right">
                                      <label for="dgn-class">
                                         <span>电机控制方式</span>
                                         <span class="asterisk">*</span>
                                      </label>
                                    </td>
                                    <td >
                                        <asp:DropDownList class="form-control" ID="DDL_motor_control" runat="server" required="true" >
                                              <asp:ListItem>双速控制</asp:ListItem>
                                              <asp:ListItem>变频控制</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span class="text-note">例如：双速，请选择合适控制方式</span>
                                    </td>
                              </tr>  
                              <tr>
                                  <td colspan="2" class="text-right">
                                      <asp:button runat="server" ID="BtnAdd" text="查询" class="form-control"  />
                                  </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span class="text-note">请先查询后，再选择电机减速器</span>
                                    </td>                                  
                              </tr>                        

                        </tbody>                      
                  </table>
                  
                  <table>
                      <tbody class="text-left" style="padding-left:-50px;">
                      <tr>
                          <td class="text-left" style="padding-left:50px;">
                              <span class="" >上盖板宽：</span>
                              <asp:Label ID="liftingspeed" runat="server" Text=""></asp:Label>
                              <span class="" id=""> m/min</span>
                          </td>
                          <td class="text-left" style="padding-left:50px;">
                              <span class="" >上盖板厚：</span>
                              <asp:Label ID="power" runat="server" Text=""></asp:Label>
                               <span class="" id=""> kW</span>
                          </td>
                      </tr>
                      <tr>
                          <td class="text-left" style="padding-left:50px;">
                              <span class="" >下盖板宽：</span>
                              <asp:Label ID="gearratio" runat="server" Text=""></asp:Label>
                              
                          </td>
                          <td class="text-left" style="padding-left:50px;">
                              <span class="" >下盖板厚：</span>
                              <asp:Label ID="torque" runat="server" Text=""></asp:Label>
                              <span class="" id=""> Nm</span>
                          </td>
                      </tr>
                      <tr>
                          <td class="text-left" style="padding-left:50px;">
                              <span class="" >腹板高：</span>
                              <asp:Label ID="drumdia" runat="server" Text=""></asp:Label>
                              <span class="" id=""> mm</span>
                          </td>
                          <td class="text-left" style="padding-left:50px;">
                              <span class="" >主腹板厚：</span>
                              <asp:Label ID="liftoverride" runat="server" Text=""></asp:Label>
                          </td>
                      </tr>
                      </tbody>
                  </table>             

                 <button class="u-btn u-btn-primary" type="button" id="mgnext" >下一步</button>       

					</div>                      
                   
                    
                                      
                    <%--主梁截面--%>
					<div class="tab-con-item" id="tab-con-item-2">

                           <div class="dgn-title" >
                             <p><b>2、主梁截面</b></p>
                          </div>
                        <asp:UpdatePanel ID="updatepanel1" runat="server" ChildrenAsTriggers="true">
                        <ContentTemplate>
                        <table>
                         <tbody class="text-center">
                              <tr >
                                   <td  class="text-right">
                                      <label for="dgn_load">
                                         <span>吊钩强度等级</span>
                                         <span class="asterisk">*</span>
                                      </label>
                                    </td>
                                    <td>
                                       <%--<input id="dgn_load1" name="dgn_load" type="number" class="form-control" min="1" max="50" autofocus="" required="required" />--%>
                                        <asp:DropDownList ID="DrowDownList1" class="form-control" runat="server">
                                            <asp:ListItem>P</asp:ListItem>
                                            <asp:ListItem>T</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="text-left">                                      
                                       <span class="text-note">请选择吊钩强度等级</span>
                                    </td>
                              </tr>
                              <tr>
                                  <td colspan="2" class="text-right">
                                  

                                      <asp:Button runat="server" ID="BtnHook" text="查询" class="form-control"   />
                                  <%--<input  type="button" value="查询" class="form-control"  onclick="ggg()"/>--%>
                                    
                                        
                                  </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span class="text-note">查询后，自动匹配</span>
                                    </td>                                  
                              </tr>                            


                        </tbody>                      
                  </table>
                           <br />
                           <br />
                           <br />
                   <table>
                      <tbody class="text-left" style="padding-left:-50px;">
                      <tr>
                          <td class="text-left" style="padding-left:0px;">
                              <span class="" >吊钩钩号：</span>
                              <asp:Label ID="hoot_type" runat="server" Text=""></asp:Label>
                          </td>
                      </tr>
                      <tr>
                          <td class="text-left" style="padding-left:0px;">
                              <span class="" >吊钩材料：</span>
                              <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                          </td>
                      </tr>
                      </tbody>
                  </table>  
                  </ContentTemplate>                                       
                  </asp:UpdatePanel>  

                        <br />
                        <br />

                 <button class="u-btn u-btn-primary" type="button" id="hooknext">下一步</button>

					</div>                  


                    <%--端梁截面--%>
					<div class="tab-con-item" id="tab-con-item-3">
                         <div class="dgn-title" >
                             <p><b>3、端梁截面</b></p>
                         </div>
                         <asp:UpdatePanel ID="updatepanel2" runat="server" ChildrenAsTriggers="true">
                             <ContentTemplate>                             
                           <table>
                              <tbody class="text-center">
                              <tr >
                                   <td  class="text-right">
                                      <label for="dgn_load">
                                         <span>滑轮组效率</span>
                                         <span class="asterisk">*</span>
                                      </label>
                                    </td>
                                    <td>
                                       <%--<input id="dgn_load1" name="dgn_load" type="number" class="form-control" min="1" max="50" autofocus="" required="required" />--%>
                                        <asp:DropDownList ID="DropDownList1_rope" class="form-control" runat="server">
                                            <asp:ListItem>0.99</asp:ListItem>
                                            <asp:ListItem>0.98</asp:ListItem>
                                            <asp:ListItem>0.97</asp:ListItem>
                                            <asp:ListItem>0.96</asp:ListItem>
                                            <asp:ListItem>0.95</asp:ListItem>
                                            <asp:ListItem>0.93</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="text-left">                                      
                                       <span class="text-note">已匹配推荐效率</span>
                                    </td>
                              </tr>
                              <tr >
                                   <td  class="text-right">
                                      <label for="dgn_load">
                                         <span>钢丝绳安全系数</span>
                                         <span class="asterisk">*</span>
                                      </label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList3" class="form-control" runat="server">
                                            <asp:ListItem>3.55</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>4.5</asp:ListItem>
                                            <asp:ListItem>5.6</asp:ListItem>
                                            <asp:ListItem>7.1</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="text-left">                                      
                                       <span class="text-note">已准确匹配安全系数，不需更改</span>
                                    </td>
                              </tr>
                              <tr>
                                  <td colspan="2" class="text-right">
                                      <asp:Button runat="server" ID="Button_rope" text="查询" class="form-control"/>
                                  </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span class="text-note">查询后，自动匹配</span>
                                    </td>                                  
                              </tr>                            


                        </tbody>                      
                           </table>
                           <br />
                           <br />
                           <br />
                              <table>
                              <tbody class="text-left" style="padding-left:-50px;">
                                <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >钢丝绳型号：</span>
                                       <asp:Label ID="Label_rope" runat="server" Text=""></asp:Label>
                                   </td>
                                </tr>
                                <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                      <span class="" >最小破断拉力：</span>
                                      <asp:Label ID="Label_breakforce" runat="server" Text=""></asp:Label>
                                   </td>
                                 </tr>
                                   </tbody>
                               </table>  
                                 </ContentTemplate>
                         </asp:UpdatePanel>
                           <br />
                           <br />
                          <button class="u-btn u-btn-primary" type="button" id="ropenext">下一步</button>
					</div>


                    <%--完成 --%>
					<div class="tab-con-item" id="tab-con-item-4">
						 <div class="dgn-title" >
                             <p><b>4、完成</b></p>
                          </div>
                         <table>
                         <tbody class="text-center">
                              <tr >
                                   <td  class="text-right">
                                      <label for="dgn_load">
                                         <span>轮绳直径比</span>
                                         <span class="asterisk">*</span>
                                      </label>
                                    </td>
                                    <td>
                                       <%--<input id="dgn_load1" name="dgn_load" type="number" class="form-control" min="1" max="50" autofocus="" required="required" />--%>
                                        <asp:DropDownList ID="DropDownList1" class="form-control" runat="server">
                                            <asp:ListItem>16</asp:ListItem>
                                            <asp:ListItem>18</asp:ListItem>
                                            <asp:ListItem>20</asp:ListItem>
                                            <asp:ListItem>22.4</asp:ListItem>
                                            <asp:ListItem>25</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="text-left">                                      
                                       <span class="text-note">已匹配推荐值</span>
                                    </td>
                              </tr>
                              <tr>
                                  <td colspan="2" class="text-right">
                                      <asp:Button runat="server" ID="Button_pulley" text="查询" class="form-control"/>
<%--                                   <input  type="submit" value="查询" class="form-control hd-mg-submit "/>--%>
                                  </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span class="text-note">查询后，自动匹配</span>
                                    </td>                                  
                              </tr>                            


                        </tbody>                      
                  </table>
                           <br />
                           <br />
                           <br />
                           <table>
                              <tbody class="text-left" style="padding-left:-50px;">
                                <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >滑轮槽底直径：</span>
                                       <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                   </td>
                      </tr>
                                <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                      <span class="" >槽底半径：</span>
                                      <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                                   </td>
                      </tr>
                      </tbody>
                           </table>  
                           <br />
                           <br />
                          <button class="u-btn u-btn-primary" type="button" id="pulleynext">下一步</button>
					</div>
               
				</div>
                </form>
			</div>
            
		</div>
            
        </div> 
             
        <div class="footer-links">
            <a href="http://www.handingtech.cn">首页</a>
            <span class="v-separator"></span> 
            <a href="http://www.ucloud.cn/site/product/uhost.html">通用计算</a> 
            <span class="v-separator"></span> 
            <a href="http://www.ucloud.cn/site/cases/game/">产品设计</a> 
            <span class="v-separator"></span> 
            <a href="http://www.ucloud.cn/site/about/intro/enter/">智能设计</a> 
            <span class="v-separator"></span> 
            <a href="http://www.ucloud.cn/site/service.html">技术支持</a>
        </div>  
    </div>
   </div>
</body>
</html>
