<%@ Page Language="C#" AutoEventWireup="true"Inherits="Handing.Reports.WFGang" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
    <script >

        var curIndex = 0;
        //时间间隔 单位毫秒 
        var timeInterval = 2100;
        var arr = new Array();
        arr[0] = "5462749abbbc87bd59432f837d3ce7fb.png";
        arr[1] = "88dea76d50665f69cedab6ba6a400bcc.png";
        arr[2] = "5462749abbbc87bd59432f837d3ce7fb.png";
        arr[3] = "88dea76d50665f69cedab6ba6a400bcc.png";
        arr[4] = "5462749abbbc87bd59432f837d3ce7fb.png";
        arr[5] = "88dea76d50665f69cedab6ba6a400bcc.png";
        arr[6] = "5462749abbbc87bd59432f837d3ce7fb.png";

        setInterval(changeImg, timeInterval);

        function changeImg() {
            var obj = document.getElementById("showpic");

            //
            var sel = document.getElementById("choice");
            var a = sel.options[sel.selectedIndex].value;

            if (curIndex == arr.length - 1) {
                curIndex = 0;
            }
            else {
                curIndex += 1;
            }
            obj.src = "/Content/image/" + arr[a];
        }

        function show() {
            //var choice = $("#choice option:selected").text().toString();              alert(this.value)
            var sel = document.getElementById("choice");
            //var selected_val = sel.options[sel.selectedIndex].value;
            var a = sel.options[sel.selectedIndex].value;
            //var a = this.options[this.options.selectedIndex].value();
            alert(a);

        }
</script> 
<img src="/Content/image/5462749abbbc87bd59432f837d3ce7fb.png" width="1300" height="280" id="showpic" /> 
     
    <select id="choice" onchange="changeImg()">
        <option>0</option>
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>5</option>
        <option value="4">0</option>
        <option selected="selected">6</option>

    </select>
</body>
</html>
