<%@ Page Language="C#"  AutoEventWireup="true" EnableEventValidation="false" CodeBehind="WholeDesignFirst.aspx.cs" Inherits="Handing.Views.Product.WholeDesign.WholeDesignFirst" %>

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
<%--    <script src="http://www.jq22.com/jquery/1.7.2/jquery.min.js"></script>--%>
    <script src="/Content/js/jquery/jquery-2.1.1.min.js"></script>

    <script type="text/javascript" src="../../Content/js/jQuery.rTabs.js"></script>

	<script type="text/javascript">
	    var btn = "";
	    var gridview_row = "";
	    var bn = "";
	    function che() {
	        gridview_row = "gridview_row";
	        //alert("哈哈哈，鼠标点到哪了！看准再点！"+ gridview_row);//后台调用cs
	    }
	    $(function () {

	        $("#tab").rTabs({
	            bind: 'click',
	            animation: 'fadein'//渐入特效
	        });

	    });
	    //电机减速器-吊钩组
	    function init_mgg() {
	        bn = "";
	        gridview_row = "";
	    }
	    function mgg() {
	        bn = "mgg";
	        return true;
	    }
	    $(function () {
	        $("#mgnext").click(function () {
	            
	            //alert(bn + gridview_row);
	            if (bn == "") {
	                
	                document.getElementById("btn_sel_1").innerHTML = "☜查询出有效数据!"
	                document.getElementById("btn_sel_1").style = "color:red";
	            }
	            if ( gridview_row != "gridview_row" & bn == "mgg") {

                    document.getElementById("lab_msg").innerHTML = "请选择，以下查询结果,再进行下一步。"
                }
                if ( gridview_row == "gridview_row" & bn == "mgg")
                {
                    document.getElementById("dgn_load").focus();
                    document.getElementById("hook").className = "current";
                    document.getElementById("tab-con-item-1").style.display = "";
                    document.getElementById("tab-con-item-2").style.display = "block";
	            }
	    })
	    });
	    //吊钩组-钢丝绳
	    function hook() {
	        btn = "hook";
	        return true;

	    }
	    $(function () {
	        $("#hooknext").click(function () {
	            if (btn == "hook") {
	                document.getElementById("rope").className = "current";
	                document.getElementById("tab-con-item-2").style.display = "";
	                document.getElementById("tab-con-item-3").style.display = "block";
	            }
	            else {
	                document.getElementById("btn_sel_2").innerHTML = "☜查询后，自动匹配"
	                document.getElementById("btn_sel_2").style = "color:red";

	            }
	        })
	    });
	    //钢丝绳-定滑轮
	    function rope() {
	        btn = "rope";
	        return true;
	    }
	    $(function () {
	        $("#ropenext").click(function () {
	            if (btn == "rope") {
	                document.getElementById("pulley").className = "current";
	                document.getElementById("tab-con-item-3").style.display = "";
	                document.getElementById("tab-con-item-4").style.display = "block";
	            }
	            else {
	                document.getElementById("btn_sel_3").innerHTML = "☜查询后，自动匹配"
	                document.getElementById("btn_sel_3").style = "color:red";
	            }
	        })
	    });
	    //定滑轮-卷筒组
	    function pulley() {
	        btn = "pulley";
	        return true;
	    }
	    $(function () {
	        $("#pulleynext").click(function () {
	           
	            if (btn == "pulley") {
	                document.getElementById("drum").className = "current";
	                document.getElementById("tab-con-item-4").style.display = "";
	                document.getElementById("tab-con-item-5").style.display = "block";
	                document.getElementById("btn_sel_4").innerHTML = "查询后，自动匹配"//恢复默认字体

	            }
	            else {
	                document.getElementById("btn_sel_4").innerHTML = "☜查询后，自动匹配"
	                document.getElementById("btn_sel_4").style = "color:red";

	            }
	            
	        })
	    });
        //卷筒-小车
	    function drum() {
	        var v = document.getElementById("text_liftheight").value;//Label_drumtype text_liftheight
	        if (v == "") {
	            document.getElementById("drum_tips").innerHTML = "单位：m，请输入6~18之间的数字!!!";
	            document.getElementById("drum_tips").style = "color:red";
	            btn = "";
	            return false;
	        }
	        else {
	            btn = "drum";

	            return true;
	        }
	    }
	    //卷筒组-小车架
	    $(function () {
	        $("#drumnext").click(function () {
	            var v = document.getElementById("text_liftheight").value;
               
	            //alert("btn====" + btn+"\nv="+v);
	          
	            if (btn == "drum" & v !="") {
	                document.getElementById("btn_sel_5").innerHTML = "";//查询 按钮 后面tips

	                document.getElementById("frame").className = "current";
	                document.getElementById("tab-con-item-5").style.display = "";
	                document.getElementById("tab-con-item-6").style.display = "block";
	            }
	            if (btn != "drum")
	            {
	                document.getElementById("btn_sel_5").innerHTML = "☜查询后，自动匹配";//查询 按钮 后面tips
	                document.getElementById("btn_sel_5").style = "color:red";
	            }
	            if (v == "") {
	                document.getElementById("drum_tips").innerHTML = "单位：m，请输入6~18之间的数字!!!";
	                document.getElementById("drum_tips").style = "color:red";
	            }
	               
	         
	        })
	    });

	    //小车架-完成
	    function frame() {
	        btn = "frame";
	        return true;
	    }
	    $(function () {
	        $("#framenext").click(function () {
	            if (btn == "frame") {
	                document.getElementById("complete").className = "current";
	                document.getElementById("tab-con-item-6").style.display = "";
	                document.getElementById("tab-con-item-7").style.display = "block";
	            }
	            else {
	                document.getElementById("btn_sel_6").innerHTML = "☜查询后，自动匹配";//查询 按钮 后面tips
	                document.getElementById("btn_sel_6").style = "color:red";
	            }
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
	            document.getElementById("tips_").innerText = "单位：t，请输入1~50之间数字!";
	            document.getElementById("tips_").style = "color:red";
	            return false;
	        }
	        else {
	            document.getElementById("tips_").innerText = "单位：t，请输入1~50之间数字!";
	            document.getElementById("tips_").style = "";
	            return true;
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

	    $(function () {

	        $.ajax({
	            type: 'post',
	            dataType: 'text',
	            //url: '/Designer/Crane5D/GetFormJson',//请求数据的地址
	            url: '/Reports/WholeDesign/WholeDesignFirst.aspx/GetListFuTest',
	            success: function (user) {

                   
	             
	            }

	        });
	    });
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
                          <img src="../../Content/image/design_step/design_step_22.png"/>
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

				<a href="javascript:void(0);" class="current">电机减速器 —></a>

				<a href="javascript:void(0);" id="hook" name="a2">吊钩组 —></a>

				<a href="javascript:void(0);" id="rope" name="a3">钢丝绳 —></a>

				<a href="javascript:void(0);" id="pulley" name="a4">定滑轮 —></a>

				<a href="javascript:void(0);" id="drum" name="a5">卷筒组 —></a>

                <a href="javascript:void(0);" id="frame" name="a6">小车架 —></a>

                <a href="javascript:void(0);" id="complete" name="a7">完成</a>

			</div>
            <hr style="margin-top:0;"/>
            
			<div class="tab-con">
                <form id="registerForm" role="form" runat="server" autocomplete="off" >
                    <asp:ScriptManager ID="scriptmanager1" runat="server"></asp:ScriptManager>
				<div class="j-tab-con">
                    
                    <%--电机减速器--%>       
                        
					<div class="tab-con-item" id="tab-con-item-1" style="display:block;">  
                                                    
                          <div class="dgn-title" >
                             <p><b>1、电机减速器</b></p>
                          </div>
                         <asp:UpdatePanel ID="updatepanel7" runat="server" ChildrenAsTriggers="true">
                        <ContentTemplate>          
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
                                        <asp:TextBox ID="dgn_load" class="form-control" runat="server" required="true" oninput='checkBox()'  onblur='this.value=this.value.replace(/[^\d.]/g,"");checkBox()'  onkeyup='this.value=this.value.replace(/[^\d.]/g,"")' MaxLength="4" ></asp:TextBox>
<%--                                       <input id="dgn_load1" name="dgn_load" value="www" type="number"  class="form-control" min="1" max="50" autofocus="" required="required" />--%>
                                    </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span  id="tips_" class="text-note">单位：t，请输入1~50之间数字</span>
                                    </td>
                              </tr>
<%--                              <tr>
                                    <td  class="text-right">
                                       <label for="dgn_span">
                                          <span>跨&nbsp;&nbsp;&nbsp;度</span>
                                          <span class="asterisk">*</span>
                                       </label>
                                    </td>
                                    <td>
                                       <input id="dgn_span" name="dgn_span" type="number" class="form-control" min="7"  max="25" required="required"/>
                                    </td>
                                     <td class="text-left">                                      
                                       <span class="text-note">单位：m，请输入7~25之间数字</span>
                                    </td>
                              </tr>--%>
<%--                              <tr>
                                    <td  class="text-right">
                                      <label for="dgn-height">
                                         <span>起升高度</span>
                                         <span class="asterisk">*</span>
                                      </label>
                                    </td>
                                    <td >
                                         <input id="dgn-height" name="dgn-height" type="number" class="form-control"  min="6"  max="18" required="required"/>
                                    </td>
                                    <td class="text-left">                                      
                                       <span class="text-note">单位：m，请输入6~18之间数字</span>
                                    </td>
                              </tr>--%>

                              <tr>
                                    <td  class="text-right">
                                      <label for="dgn-class">
                                         <span>工作级别</span>
                                         <span class="asterisk">*</span>
                                      </label>
                                    </td>
                                    <td >
                                        <asp:DropDownList class="form-control" ID="ddl1" runat="server" required="true" OnSelectedIndexChanged="ddl1_SelectedIndexChanged" >
                                              <asp:ListItem>M3</asp:ListItem>
                                              <asp:ListItem>M4</asp:ListItem>
                                              <asp:ListItem>M5</asp:ListItem>
                                              <asp:ListItem>M6</asp:ListItem>
                                              <asp:ListItem>M7</asp:ListItem>
                                        </asp:DropDownList>
<%--                                         <input id="dgn-class" name="dgn-class" type="text" list="cra_class" class="form-control" autocomplete="off"  required="required"/>--%>
                                        <%-- <datalist id="cra_class">
                                             <option>M3</option>
                                             <option>M4</option>
                                             <option>M5</option>
                                             <option>M6</option>
                                             <option>M7</option>
                                         </datalist>--%>
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
<%--                                         <input id="dgn-class" name="dgn-class" type="text" list="cra_class" class="form-control" autocomplete="off"  required="required"/>--%>
                                        <%-- <datalist id="cra_class">
                                             <option>M3</option>
                                             <option>M4</option>
                                             <option>M5</option>
                                             <option>M6</option>
                                             <option>M7</option>
                                         </datalist>--%>
                                    </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span class="text-note">例如：双速，请选择合适控制方式</span>
                                    </td>
                              </tr>  
                              <tr>
                                  <td colspan="2" class="text-right">
                                      <asp:button runat="server" ID="BtnAdd" text="查询" class="form-control" OnClick="BtnSelect_Click" />
<%--                                      <input  type="submit" value="查询" class="form-control hd-mg-submit "/>--%>
                                  </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span id="btn_sel_1" class="text-note">请先查询后，再选择电机减速器</span>
                                    </td>                                  
                              </tr>                        

                        </tbody>                      
                  </table>
                  <div style="padding-left:50px;">
                      <label id="lab_msg" style="color:red ;padding-left:150px;"><%=errorMsg %></label>
                  <%--加载 GriView 控件绑定数据-->--%>
                       <asp:GridView ID="cityGridView" runat="server" 
             CssClass="mg-gridview"
             AllowPaging="true" 
             AllowSorting="true" 
             AutoGenerateColumns="false" 
             OnPageIndexChanging="cityGridView_PageIndexChanging" 
             OnSelectedIndexChanged="cityGridView_SelectedIndexChanged" 
             AutoGenerateDeleteButton="False"
             OnRowDataBound="cityGridView_RowDataBound" OnSorting="cityGridView_Sorting" BorderStyle="Solid" 

             >
         <SelectedRowStyle CssClass="mg-selectrowstyle" BackColor="#5cc5f2" />
         <HeaderStyle CssClass="GridViewHeaderStyle" BackColor="#D9D9D9" BorderStyle="None" Font-Bold="False"/>
         <RowStyle CssClass="GridViewRowStyle"/> 
            <Columns>
                <asp:BoundField DataField="Capacity" HeaderText="起重量" SortExpression="Capacity" />
                <asp:BoundField DataField="FEM" HeaderText="FEM" SortExpression="FEM" />
                <asp:BoundField DataField="v" HeaderText="起升速度" SortExpression="v" />
                <asp:BoundField DataField="p" HeaderText="电机功率" SortExpression="p" />
                <asp:BoundField DataField="p_1" HeaderText="频率" SortExpression="p_1" />
                <asp:BoundField DataField="i" HeaderText="减速比" SortExpression="i" />
                <asp:BoundField DataField="T" HeaderText="扭矩" SortExpression="T" />
                <asp:BoundField DataField="a" HeaderText="倍率" SortExpression="a" />
                <asp:BoundField DataField="Drum" HeaderText="卷筒直径" SortExpression="Drum" />
                <asp:BoundField DataField="OutShaft" HeaderText="输出轴" SortExpression="OutShaft" />                
                <asp:BoundField DataField="Type" HeaderText="型号" SortExpression="Type" />    
                <asp:CommandField SelectText="选择" ShowSelectButton="true" />           
            </Columns>
         
        </asp:GridView>
                   </div>
                  <table>
                      <tbody class="text-left" style="padding-left:-50px;">
                      <tr>
                          <td class="text-left" style="padding-left:50px;">
                              <span class="" >起升速度：</span>
                              <asp:Label ID="liftingspeed" runat="server" Text=""></asp:Label>
                              <span class="" id=""> m/min</span>
                          </td>
                          <td class="text-left" style="padding-left:50px;">
                              <span class="" >电机功率：</span>
                              <asp:Label ID="power" runat="server" Text=""></asp:Label>
                               <span class="" id=""> kW</span>
                          </td>
                      </tr>
                      <tr>
                          <td class="text-left" style="padding-left:50px;">
                              <span class="" >减速比：</span>
                              <asp:Label ID="gearratio" runat="server" Text=""></asp:Label>
                              
                          </td>
                          <td class="text-left" style="padding-left:50px;">
                              <span class="" >扭矩：</span>
                              <asp:Label ID="torque" runat="server" Text=""></asp:Label>
                              <span class="" id=""> Nm</span>
                          </td>
                      </tr>
                      <tr>
                          <td class="text-left" style="padding-left:50px;">
                              <span class="" >卷筒直径：</span>
                              <asp:Label ID="drumdia" runat="server" Text=""></asp:Label>
                              <span class="" id=""> mm</span>
                          </td>
                          <td class="text-left" style="padding-left:50px;">
                              <span class="" >滑轮倍率：</span>
                              <asp:Label ID="liftoverride" runat="server" Text=""></asp:Label>
                          </td>
                      </tr>
                      </tbody>
                  </table>             
                        </ContentTemplate>
                         </asp:UpdatePanel>
                 <button class="u-btn u-btn-primary" type="button" id="mgnext" >下一步</button>           

					</div>                 
                                
                                      
                    <%--吊钩组--%>
					<div class="tab-con-item" id="tab-con-item-2">

                           <div class="dgn-title" >
                             <p><b>2、吊钩组</b></p>
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
                              

                                      <asp:Button runat="server" OnClientClick="return hook();" ID="BtnHook" text="查询" class="form-control"  OnClick="BtnHook_Click" />
                                  <%--<input  type="button" value="查询" class="form-control"  onclick="ggg()"/>--%>
                                    
                                        
                                  </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span id="btn_sel_2" class="text-note">查询后，自动匹配</span>
                                    </td>                                  
                              </tr>            
                             <tr>
                                 <td>
                                      <label style="color:red ;padding-left:150px;"><%=errorMsg1 %></label>
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


                    <%--钢丝绳--%>
					<div class="tab-con-item" id="tab-con-item-3">
                         <div class="dgn-title" >
                             <p><b>3、钢丝绳</b></p>
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
                                       <%--<input id="dgn_load1" name="dgn_load" type="number" class="form-control" min="1" max="50" autofocus="" required="required" />--%>
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
                                      <asp:Button runat="server" OnClientClick="return rope();" ID="Button_rope"  OnClick="Button_rope_Click" text="查询" class="form-control"/>
<%--                                   <input  type="submit" value="查询" class="form-control hd-mg-submit "/>--%>
                                  </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span id="btn_sel_3" class="text-note">查询后，自动匹配</span>
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
                                      <span class="" >kN</span>
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


                    <%--定滑轮 --%>
					<div class="tab-con-item" id="tab-con-item-4">
						 <div class="dgn-title" >
                             <p><b>4、定滑轮</b></p>
                          </div>
                        <asp:UpdatePanel ID="updatepanel3" runat="server" ChildrenAsTriggers="true">
                             <ContentTemplate> 
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
                                      <asp:Button runat="server" OnClientClick="return pulley();" ID="Button_pulley" text="查询" OnClick="Button_pulley_Click" class="form-control"/>
<%--                                   <input  type="submit" value="查询" class="form-control hd-mg-submit "/>--%>
                                  </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span  id="btn_sel_4" class="text-note">查询后，自动匹配</span>
                                    </td>                                  
                              </tr>                            


                        </tbody>                      
                  </table>
                           <br />
                           <br />
                           <table>
                              <tbody class="text-left" style="padding-left:-50px;">
                                <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >滑轮槽底直径：</span>
                                       <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                       <span class="" >mm</span>
                                   </td>
                      </tr>
                                <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                      <span class="" >槽底半径：</span>
                                      <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                                       <span class="" >mm</span>
                                   </td>
                      </tr>
                      </tbody>
                           </table>  
                                 </ContentTemplate>
                         </asp:UpdatePanel>
                           <br />
                          <button class="u-btn u-btn-primary" type="button" id="pulleynext">下一步</button>
					</div>

                         
                     <%--卷筒组 --%>
					<div class="tab-con-item" id="tab-con-item-5">

						 <div class="dgn-title" >
                             <p><b>5、卷筒组</b></p>
                          </div>
                        <asp:UpdatePanel ID="updatepanel4" runat="server"  ChildrenAsTriggers="true">
                             <ContentTemplate>
                         <table>
                         <tbody class="text-center">
                              <tr >
                                   <td  class="text-right">
                                      <label for="dgn_load">
                                         <span>起升高度</span>
                                         <span class="asterisk">*</span>
                                      </label>
                                    </td>
                                    <td>
                                       <%--<input id="dgn_load1" name="dgn_load" type="number" class="form-control" min="1" max="50" autofocus="" required="required" />--%>
                                        <asp:TextBox ID="text_liftheight" onblur='this.value=this.value.replace(/[^\d.]/g,"")'  onkeyup='this.value=this.value.replace(/[^\d.]/g,"")' MaxLength="5" class="form-control" runat="server" ></asp:TextBox>
                                    </td>
                                    <td class="text-left">                                      
                                       <span class="text-note" id="drum_tips">单位：m，请输入6~18之间的数字</span>
                                    </td>
                              </tr>
<%--                             <tr >
                                   <td  class="text-right">
                                      <label for="dgn_load">
                                         <span>筒绳直径比</span>
                                         <span class="asterisk">*</span>
                                      </label>
                                    </td>
                                    <td>                                      
                                        <asp:DropDownList ID="DropDownList_diariato" class="form-control" runat="server">
                                            <asp:ListItem>14</asp:ListItem>
                                            <asp:ListItem>16</asp:ListItem>
                                            <asp:ListItem>18</asp:ListItem>
                                            <asp:ListItem>20</asp:ListItem>
                                            <asp:ListItem>22.4</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="text-left">                                       
                                       <span class="text-note">已匹配推荐值</span>
                                    </td>
                              </tr>--%>
                              <tr>
                                  <td colspan="2" class="text-right">
                                      <asp:Button runat="server" ID="Btn_juantong" OnClick="Btn_juantong_Click" OnClientClick='return drum()' text="查询"  class="form-control"/>
<%--                                   <input  type="submit" value="查询" class="form-control hd-mg-submit "/>--%>
                                  </td>
                                    <td class="text-left" style="padding-top:5px;">                               
                                       <span id="btn_sel_5" class="text-note">查询后，自动匹配</span>
                                    </td>                                  
                              </tr>                            
                            
                        </tbody>                      
                  </table>
                           <br />
                           <br />
                           <table>
                              <tbody class="text-left" style="padding-left:-50px;">
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >卷筒型号：</span>
                                       <asp:Label ID="Label_drumtype" runat="server" Text=""></asp:Label>
                                   </td>
                      </tr>
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                      <span class="" >节距：</span>
                                      <asp:Label ID="Label_pitch" runat="server" Text=""></asp:Label>
                                       <span class="" >mm</span>
                                   </td>
                      </tr>
                      </tbody>
                           </table>  
                                 </ContentTemplate>
                         </asp:UpdatePanel>
                           <br />
                          <button class="u-btn u-btn-primary" type="button" id="drumnext">下一步</button>

					</div>


                     <%--小车架 --%>
					<div class="tab-con-item" id="tab-con-item-6">

						 <div class="dgn-title" >
                             <p><b>6、小车架</b></p>
                          </div>
                        <asp:UpdatePanel ID="updatepanel5" runat="server" UpdateMode="Always" >
                             <ContentTemplate>
                         <table>
                         <tbody class="text-center">
                             <tr >
                                   <td  class="text-right">
                                      <label for="dgn_load">
                                         <span>小车架结构</span>
                                         <span class="asterisk">*</span>
                                      </label>
                                    </td>
                                    <td>
                                       <%--<input id="dgn_load1" name="dgn_load" type="number" class="form-control" min="1" max="50" autofocus="" required="required" />--%>
                                        <asp:DropDownList ID="DropDownList2" class="form-control" runat="server">
                                            <asp:ListItem>标准</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="text-left">                                       
                                       <span class="text-note">目前仅推荐使用标准结构</span>
                                    </td>
                              </tr>  
                             <tr >
                                   <td  class="text-right">
                                      <label for="dgn_load">
                                         <span>小车运行速度</span>
                                         <span class="asterisk">*</span>
                                      </label>
                                    </td>
                                    <td>
                                       <%--<input id="dgn_load1" name="dgn_load" type="number" class="form-control" min="1" max="50" autofocus="" required="required" />--%>
                                        <asp:DropDownList ID="DropDownList4" class="form-control" runat="server">
                                            <asp:ListItem>20</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="text-left">                                       
                                       <span class="text-note">单位：m/min，已使用推荐值</span>
                                    </td>
                              </tr>                   
                              <tr>
                                  <td colspan="2" class="text-right">
                                      <asp:Button runat="server" OnClientClick="return frame();" ID="Button1" OnClick="Btn_xiaoche_Click" text="查询"  class="form-control"/>
                                  </td>
                                    <td class="text-left" style="padding-top:5px;">                                      
                                       <span id="btn_sel_6" class="text-note">查询后，自动匹配</span>
                                    </td>                                  
                              </tr> 
                        </tbody>                      
                  </table>
                  <table>
                              <tbody class="text-left" style="padding-left:-50px;">
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >运行电机功率：</span>
                                       <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                       <span class="" >kW</span>
                                   </td>
                      </tr>
<%--                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                      <span class="" >运行减速器速比：</span>
                                      <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                   </td>
                      </tr>--%>
                      </tbody>
                      </table>  
                                 </ContentTemplate>
                         </asp:UpdatePanel>
                           <br />

                          <button class="u-btn u-btn-primary" type="button"  id="framenext">下一步</button>

					</div>
                    <script type="text/javascript">
                        function refreshFrame() {
                            var v = document.getElementById("Label1").value;
                            //alert(v)
                            if (v == "") {
                                alert("请点击查询后，再点下一步噢")
                            }
                            //alert("xxxxxxxxxx");
                            //document.getElementById('3diframe-trolley').contentWindow.location.reload(true);
                            //window.parent.frames[1].location.reload();
                            //window.parent.frames[1].location.reload(); //适用于只有一个iframes；
                            //window.parent.frames["3diframe-trolley"].location.reload();
                            //window.frames["3diframe-trolley"].location.refreshFrame();
                            }
                   </script>

                     <%--完成 --%>
					<div class="tab-con-item" id="tab-con-item-7">

						 <div class="dgn-title" >
                             <p><b>7、完成</b></p>
                          </div>
<%--                     <img src="/Content/image/zhifubao.png" width="150" height="155" align="left" />--%>
                       <asp:UpdatePanel ID="updatepanel6" runat="server" UpdateMode="Always" >
                             <ContentTemplate>
                  <table>
                                   <tbody class="text-left" style="padding-left:0px;">
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >起重量：</span>
                                       <asp:Label ID="Label3" runat="server" ></asp:Label>
                                       <span class="" >t</span>
                                   </td>
                      </tr>
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >起升高度：</span>
                                       <asp:Label ID="Label6" runat="server" ></asp:Label>
                                       <span class="" >mm</span>
                                   </td>
                      </tr>
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >工作级别：</span>
                                       <asp:Label ID="Label7" runat="server" ></asp:Label>
                                   </td>
                      </tr>
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >起升速度：</span>
                                       <asp:Label ID="Label8" runat="server" ></asp:Label>
                                       <span class="" >m/min</span>
                                   </td>
                      </tr>
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >起升电机功率：</span>
                                       <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
                                       <span class="" >kW</span>
                                   </td>
                      </tr>
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >吊钩钩号：</span>
                                       <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                                   </td>
                      </tr>
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >钢丝绳型号：</span>
                                       <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
                                   </td>
                      </tr>
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >最小滑轮直径：</span>
                                       <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
                                       <span class="" >mm</span>
                                   </td>
                      </tr>
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >卷筒型号：</span>
                                       <asp:Label ID="Label13" runat="server" Text=""></asp:Label>
                                   </td>
                      </tr>
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >小车运行速度：</span>
                                       <asp:Label ID="Label14" runat="server" Text=""></asp:Label>
                                       <span class="" >m/min</span>
                                   </td>
                      </tr>
                      <tr>
                                   <td class="text-left" style="padding-left:0px;">
                                       <span class="" >小车运行电机功率：</span>
                                       <asp:Label ID="Label15" runat="server" Text=""></asp:Label>
                                       <span class="" >kW</span>
                                   </td>
                      </tr>
                      </tbody>
                      </table>       
                         
                            
                                 </ContentTemplate>
                           <Triggers>
                               <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                           </Triggers>
                        </asp:UpdatePanel>
                           <br />
                        <button class="u-btn u-btn-primary" type="button" id="completenext" onclick="javascript:window.location.href='WholeDesignSecond.aspx'" >完成</button>

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
