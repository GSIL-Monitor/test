<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showInfo.aspx.cs" Inherits="Handing.Reports.WholeDesign.showInfo" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
        function onlyNumbers() {
            //re = /^\d+\.?\d*$/
            var re = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;

            var str = address_Form.txt.value;
            if (!re.test(str)) {
                alert("只能输入数字,请重新输入");
                len = str.length;
                str1 = str.substr(0, len - 1);
                thistbName.txt.value = str1;
                tbName.txt.focus();
                return;
            }
        }
     function validate(){  
         var reg = new RegExp("^[0-9]*$");  
         var obj = document.getElementById("tbName");
         if(!reg.test(obj.value)){  
             alert("请输入数字!");  
         }  
         if(!/^[0-9]*$/.test(obj.value)){  
             alert("请输入数字!");  
         }  
     }  
    </script>
    <style type="text/css">
        .mugridviewstyle{
            border-right: 2px solid #ff0000;
            border-bottom: 2px solid #ff0000;
            border-left: 2px solid #ff0000;
            border-top: 2px solid #ff0000;
            text-align:center;
            padding: 50px;
            cursor:pointer
        }
        .mygridviewselectstyle td:hover{
            background-color: #00ff21;
            font-weight: bold;
            color: #333333;
        }
        .GridViewRowStyle td:hover{
            background-color: #ff6a00;
            
        }

        .GridViewHeaderStyle{
            background-color: #ffffff;
            font-weight: bold;
            color: gray;
        }        
        .GridViewHeaderStyle a:link{
            text-decoration:none;
        } 
        .mugridviewstyle.pgr a{
            color: #666; 
        }
        .mugridviewstyle .pgr a:hover { color: #000; } 
    </style>
</head>
<body>
   <form id="form1" runat="server" oninvalid="true" autocomplete="off">  
    <div>  
    <table runat="server" id="table1">  
        <tr>  
            <td>name:</td>  
            <td>  
                <asp:TextBox ID="tbName" required="true"  runat="server"></asp:TextBox>  
            </td>  
        </tr>  
        <tr>  
            <td>age:</td>  
            <td>  
                <asp:TextBox ID="tbAge" runat="server" TextMode="Number" required="true" ></asp:TextBox>  
            </td>  
        </tr>  
        <tr>  
            <td><asp:Button runat="server" ID="BtnAdd" text="add" OnClick="BtnAdd_Click"/></td>  
            <td><asp:Button runat="server" ID="BtnDel" text="del" OnClick="BtnDel_Click"/></td>  
            <td><asp:Button runat="server" ID="BtnUpdate" text="update" OnClick="BtnUpdate_Click"/></td>  
            <td><asp:Button runat="server" ID="BtnSelect" text="select" OnClick="BtnSelect_Click"/></td>  
        </tr>  
    </table>  
    </div>  
        <asp:GridView 
            ID="cityGridView" 
            runat="server" 
            cssclass="mugridviewstyle"
            PagerStyle-CssClass="pgr"
            AllowPaging="true" 
            AllowSorting="true" 
            AutoGenerateColumns="false" 
            OnPageIndexChanging="cityGridView_PageIndexChanging" 
            OnSelectedIndexChanged="cityGridView_SelectedIndexChanged" >
            <SelectedRowStyle CssClass="mygridviewselectstyle" BackColor="Lime" />
            <HeaderStyle CssClass="GridViewHeaderStyle"/>
            <PagerStyle CssClass="pgr" />
            <RowStyle CssClass="GridViewRowStyle"/> 
            <Columns>
                <asp:BoundField DataField="id" HeaderText="学生ID" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                <asp:BoundField DataField="age" HeaderText="年龄" SortExpression="age" />
            </Columns>
        </asp:GridView>
    </form> 
    
    
    

</body>
</html>
