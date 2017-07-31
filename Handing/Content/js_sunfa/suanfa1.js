//箱型梁计算模型
function bjxxl() {
    var squarerailwidth = 30; var platetolerance = 0.3; var squarerailheight = 40; var E = 210000;
    var p = parseInt($("#sti_force").val());//集中力
    var L = parseInt($("#sti_span").val());//跨度

    var x1 = parseInt($("#sti_L1").val());//上盖板宽 L1
    var x2 = parseInt($("#sti_t1").val());//上盖板厚 t1 
    var x3 = parseInt($("#sti_L2").val());//下盖板宽 L2 
    var x4 = parseInt($("#sti_t2").val());//下盖板厚 t2 
    var x5 = parseInt($("#sti_t3").val());//右腹板厚 t3 
    var x6 = parseInt($("#sti_t4").val());//左腹板厚 t4 
    var x7 = parseInt($("#sti_h").val());//腹板高度 h
    var x9 = parseInt($("#sti_t6").val());//腹板边距 t6
    var x10 = parseInt($("#sti_t5").val());//腹板边距 t5
    var x8 = x3 - x10 - x9 - x5 - x6;//L2 - t6 - t5 - t3-t4 计算出来

    //计算各钢板面积

    var A1 = x1 * x2;//上盖板面积
    var A2 = x3 * x4;//下盖板面积
    var A3 = x5 * x7;//主腹板面积
    var A4 = x6 * x7;//副腹板面积
    //var A5 = squarerailwidth * squarerailwidth;        //计算方钢轨道的面积
    //计算上盖板面积形心坐标
    var coordinatesX_A1 = x1 / 2;
    var coordinatesY_A1 = x2 / 2 + x4 + x7;
    //计算下盖板面积形心坐标
    var coordinatesX_A2 = x3 / 2;
    var coordinatesY_A2 = x4 / 2;
    //计算主腹板面积形心坐标
    var coordinatesX_A3 = x3 - x9 - x5 / 2;
    var coordinatesY_A3 = x7 / 2 + x4;
    //计算副腹板面积形心坐标
    var coordinatesX_A4 = x10 + x6 / 2;
    var coordinatesY_A4 = x7 / 2 + x4;
    //计算横梁截面形心坐标
    var coordinatesX = (A1 * coordinatesX_A1 + A2 * coordinatesX_A2 + A3 * coordinatesX_A3 + A4 * coordinatesX_A4) / (A1 + A2 + A3 + A4);
    var coordinatesY = (A1 * coordinatesY_A1 + A2 * coordinatesY_A2 + A3 * coordinatesY_A3 + A4 * coordinatesY_A4) / (A1 + A2 + A3 + A4);
    //计算垂直X轴和水平Y轴的惯性距
    var distancetoX = (x2 + x7 + x4) - coordinatesY - x2 / 2;//计算上盖板形心距形心x轴距离
    var maindistancetoY = x1 - coordinatesX - x9 - x5 / 2;//计算主腹板形心距形心y轴距离
    var assistantdistancetoY = coordinatesX - x10 - x6 / 2;//计算副腹板形心距形心y轴距离
    //var squarerailtoX = distancetoX;//计算方钢轨道距截面形心X轴距离  + squarerailheight / 2
    //垂直惯性矩Ix
    var inertiaIx = (x1 * x2 * x2 * x2 / 12) + (distancetoX * distancetoX * A1) + (x3 * x4 * x4 * x4 / 12) + ((coordinatesY - x4 / 2) * (coordinatesY - x4 / 2) * A2) + (x5 * x7 * x7 * x7 / 12) + (x6 * x7 * x7 * x7 / 12);

    var fmax = parseFloat((p * L * L * L) / (48 * E * inertiaIx));//½刚度
    //¼刚度
    var a = (3 / 4) * L; var b = (1 / 4) * L;
    var f = (p * a * a * b * b) / (3 * E * L * inertiaIx);
    var fc = parseInt(L / f);

    var fio = 1 + "/" + parseInt(L / fmax);
    var fio2 = 1 + "/" + fc;
    var hidenx = document.getElementById("hidenx").value = "xiangxing";

    var gxj = document.getElementById("txt_showresult").value = parseInt(inertiaIx);
    var gd2 = document.getElementById("txt_showresult2").value = fio;
    var gd4 = document.getElementById("txt_showresult4").value = fio2;

}
//截面特性  箱型梁截面特性计算
function bjxxl0() {
    var a = document.getElementById("select1").value;
    if (a != 0) {
        //
        var platetolerance = 0.3; var squarerailheight = 40; var E = 210000;
        var x1 = parseInt($("#input0").val());//上盖板宽 L1
        var x2 = parseInt($("#input1").val());//上盖板厚 t1 
        var x3 = parseInt($("#input2").val());//下盖板宽 L2 
        var x4 = parseInt($("#input3").val());//下盖板厚 t2 
        var x5 = parseInt($("#input4").val());//右腹板厚 t3 
        var x6 = parseInt($("#input5").val());//左腹板厚 t4 
        var x7 = parseInt($("#input6").val());//腹板高度 h
        var x9 = parseInt($("#input8").val());//腹板边距 t6
        var x10 = parseInt($("#input7").val());//腹板边距 t5
        var x8 = x3 - x10 - x9 - x5 - x6;//L2 - t6 - t5 - t3-t4 计算出来

        //计算各钢板面积
        var A1 = x1 * x2;//上盖板面积
        var A2 = x3 * x4;//下盖板面积
        var A3 = x5 * x7;//主腹板面积
        var A4 = x6 * x7;//副腹板面积
        //var A5 = squarerailwidth * squarerailwidth;        //计算方钢轨道的面积
        //计算上盖板面积形心坐标
        var coordinatesX_A1 = x1 / 2;
        var coordinatesY_A1 = x2 / 2 + x4 + x7;
        //计算下盖板面积形心坐标
        var coordinatesX_A2 = x3 / 2;
        var coordinatesY_A2 = x4 / 2;
        //计算主腹板面积形心坐标
        var coordinatesX_A3 = x3 - x9 - x5 / 2;
        var coordinatesY_A3 = x7 / 2 + x4;
        //计算副腹板面积形心坐标
        var coordinatesX_A4 = x10 + x6 / 2;
        var coordinatesY_A4 = x7 / 2 + x4;
        //计算横梁截面形心坐标
        var coordinatesX = (A1 * coordinatesX_A1 + A2 * coordinatesX_A2 + A3 * coordinatesX_A3 + A4 * coordinatesX_A4) / (A1 + A2 + A3 + A4);
        var coordinatesY = (A1 * coordinatesY_A1 + A2 * coordinatesY_A2 + A3 * coordinatesY_A3 + A4 * coordinatesY_A4) / (A1 + A2 + A3 + A4);
        //计算垂直X轴和水平Y轴的惯性距
        var distancetoX = (x2 + x7 + x4) - coordinatesY - x2 / 2;//计算上盖板形心距形心x轴距离
        var maindistancetoY = x1 - coordinatesX - x9 - x5 / 2;//计算主腹板形心距形心y轴距离
        var assistantdistancetoY = coordinatesX - x10 - x6 / 2;//计算副腹板形心距形心y轴距离
        //var squarerailtoX = distancetoX;//计算方钢轨道距截面形心X轴距离  + squarerailheight / 2
        //垂直惯性矩Ix
        var inertiaIx = (x1 * x2 * x2 * x2 / 12) + (distancetoX * distancetoX * A1) + (x3 * x4 * x4 * x4 / 12) + ((coordinatesY - x4 / 2) * (coordinatesY - x4 / 2) * A2) + (x5 * x7 * x7 * x7 / 12) + (x6 * x7 * x7 * x7 / 12);
        //水平惯性距
        var inertiaIy = (x1 * x1 * x1 * x2 / 12) + (x3 * x3 * x3 * x4 / 12) + (x5 * x5 * x5 * x7 / 12) + (A3 * maindistancetoY * maindistancetoY) + (x6 * x6 * x6 * x7 / 12) + (A3 * assistantdistancetoY * assistantdistancetoY);

        var Ix = document.getElementById("txt_showresult").value = "≈" + Math.round(inertiaIx * 100) / 100;
        var Iy = document.getElementById("txt_showresult2").value = "≈" + Math.round(inertiaIy * 100) / 100;
    }
    if (a == "0") {
        document.getElementById("s_tips").innerHTML = "请选择截面形状!";
        document.getElementById("s_tips").style = "color:#FF0000";
    }


}
//截面特性矩形管截面特性计算
function bjjxl0() {
    ///矩形管计算参数

    var a = document.getElementById("select1").value;
    if (a != 0) {
        var E = 210000;

        var B = $("#input0").val();
        var H = $("#input1").val();
        var t = $("#input2").val();

        var b1 = B - 2 * t;
        var h1 = H - 2 * t;
        var end_Ix = (B * H * H * H - b1 * h1 * h1 * h1) / 12;//垂直惯性距
        var end_Iy = (B * B * B * H - b1 * b1 * b1 * h1) / 12;//水平惯性距
        var Ix = document.getElementById("txt_showresult").value = "≈" + Math.round(end_Ix * 100) / 100;
        var Iy = document.getElementById("txt_showresult2").value = "≈" + Math.round(end_Iy * 100) / 100;

        document.getElementById("s_tips").innerHTML = "";
        document.getElementById("s_tips").style = "";
    }
    if (a == "0") {
        document.getElementById("s_tips").innerHTML = "请选择截面形状!";
        document.getElementById("s_tips").style = "color:#FF0000";
    }

}
//矩形管报价
function bjjxl() {
    ///矩形管计算参数
    var E = 210000;

    var p = $("#sti_force2").val();
    var L = $("#sti_wheelbase").val();

    var B = $("#sti_rec_L1").val();
    var H = $("#sti_rec_t1").val();
    var t = $("#sti_rec_t").val();

    var b1 = B - 2 * t;
    var h1 = H - 2 * t;
    var end_Ix = (B * H * H * H - b1 * h1 * h1 * h1) / 12;//惯性ju
    var fmax = parseFloat((p * L * L * L) / (48 * E * end_Ix));//½刚度
    ////¼刚度
    var a = (3 / 4) * L; var b = (1 / 4) * L;
    var f = (p * a * a * b * b) / (3 * E * L * end_Ix);
    var fc = parseInt(L / f);

    var g2 = 1 + "/" + parseInt(L / fmax);
    var g4 = 1 + "/" + fc;

    var gxj = document.getElementById("txt_showresult").value = end_Ix;
    var gd2 = document.getElementById("txt_showresult2").value = g2;
    var gd4 = document.getElementById("txt_showresult4").value = g4;

    var hidenx = document.getElementById("hidenx").value = "juxing";

}
//强度计算 截面已知 M/W
function jmyz() {
    var a = document.getElementById("select1").value;
    var b = document.getElementById("select2").value;

    if (a == "0") {

        document.getElementById("s_tips").innerHTML = "请选择强度类型!";
        document.getElementById("s_tips").style = "color:#FF0000";
    }
    //截面已知 下拉也提示
    if (b == "0") {
        document.getElementById("s_tips1").innerHTML = "请选择输入参数!";
        document.getElementById("s_tips1").style = "color:#FF0000";
    }
    if (a != "0" && b != "0") {
        var M = parseInt($("#input0").val());
        var W = parseInt($("#input1").val());
        var Msigma = M / W;
        var res = document.getElementById("txt_showresult").value = "≈" + Math.round(Msigma * 100) / 100;

        document.getElementById("s_tips").innerHTML = "";
        document.getElementById("s_tips").style = "";
    }

}

//强度计算 截面未知 
function jmwz() {
    var a = document.getElementById("select1").value;
    var b = document.getElementById("select2").value;
    if (a == "0") {

        document.getElementById("s_tips").innerHTML = "请选择强度类型!";
        document.getElementById("s_tips").style = "color:#FF0000";
    }
    if (b == "0") {

        document.getElementById("s_tips1").innerHTML = "请选择输入参数!";
        document.getElementById("s_tips1").style = "color:#FF0000";
    }
    if (b != "0" && a != "0") {
        var platetolerance = 0.3; var squarerailheight = 40; var E = 210000;
        var M = parseInt($("#input0").val() * 1000);//最大弯矩 M
        var x1 = parseInt($("#input1").val());//上盖板宽 L1
        var x2 = parseInt($("#input2").val());//上盖板厚 t1 
        var x3 = parseInt($("#input3").val());//下盖板宽 L2 
        var x4 = parseInt($("#input4").val());//下盖板厚 t2 
        var x5 = parseInt($("#input5").val());//右腹板厚 t3 
        var x6 = parseInt($("#input6").val());//左腹板厚 t4 
        var x7 = parseInt($("#input7").val());//腹板高度 h
        var x9 = parseInt($("#input9").val());//腹板边距 t6
        var x10 = parseInt($("#input8").val());//腹板边距 t5
        var x8 = x3 - x10 - x9 - x5 - x6;//L2 - t6 - t5 - t3-t4 计算出来

        //计算各钢板面积
        var A1 = x1 * x2;//上盖板面积
        var A2 = x3 * x4;//下盖板面积
        var A3 = x5 * x7;//主腹板面积
        var A4 = x6 * x7;//副腹板面积
        //var A5 = squarerailwidth * squarerailwidth;        //计算方钢轨道的面积
        //计算上盖板面积形心坐标
        var coordinatesX_A1 = x1 / 2;
        var coordinatesY_A1 = x2 / 2 + x4 + x7;
        //计算下盖板面积形心坐标
        var coordinatesX_A2 = x3 / 2;
        var coordinatesY_A2 = x4 / 2;
        //计算主腹板面积形心坐标
        var coordinatesX_A3 = x3 - x9 - x5 / 2;
        var coordinatesY_A3 = x7 / 2 + x4;
        //计算副腹板面积形心坐标
        var coordinatesX_A4 = x10 + x6 / 2;
        var coordinatesY_A4 = x7 / 2 + x4;
        //计算横梁截面形心坐标
        var coordinatesX = (A1 * coordinatesX_A1 + A2 * coordinatesX_A2 + A3 * coordinatesX_A3 + A4 * coordinatesX_A4) / (A1 + A2 + A3 + A4);
        var coordinatesY = (A1 * coordinatesY_A1 + A2 * coordinatesY_A2 + A3 * coordinatesY_A3 + A4 * coordinatesY_A4) / (A1 + A2 + A3 + A4);
        //计算垂直X轴和水平Y轴的惯性距
        var distancetoX = (x2 + x7 + x4) - coordinatesY - x2 / 2;//计算上盖板形心距形心x轴距离
        var maindistancetoY = x1 - coordinatesX - x9 - x5 / 2;//计算主腹板形心距形心y轴距离
        var assistantdistancetoY = coordinatesX - x10 - x6 / 2;//计算副腹板形心距形心y轴距离
        //var squarerailtoX = distancetoX;//计算方钢轨道距截面形心X轴距离  + squarerailheight / 2
        //垂直惯性矩Ix
        var inertiaIx = (x1 * x2 * x2 * x2 / 12) + (distancetoX * distancetoX * A1) + (x3 * x4 * x4 * x4 / 12) + ((coordinatesY - x4 / 2) * (coordinatesY - x4 / 2) * A2) + (x5 * x7 * x7 * x7 / 12) + (x6 * x7 * x7 * x7 / 12);
        //水平惯性距
        var inertiaIy = (x1 * x1 * x1 * x2 / 12) + (x3 * x3 * x3 * x4 / 12) + (x5 * x5 * x5 * x7 / 12) + (A3 * maindistancetoY * maindistancetoY) + (x6 * x6 * x6 * x7 / 12) + (A3 * assistantdistancetoY * assistantdistancetoY);
        //抗弯截面系数
        var W = inertiaIx / distancetoX;
        //弯曲强度
        var Msigma = M / W;
        //var Ixop = document.getElementById("txt_showresult").value =Msigma;

        var Ixop = document.getElementById("txt_showresult").value = "≈" + Math.round(Msigma * 100) / 100;

        document.getElementById("s_tips1").innerHTML = "";
        document.getElementById("s_tips1").style = "";
    }


}
//模型一计算垂直弯矩 M： 强度                             
function modle1() {
    var M, S;
    var p = parseInt($("#input0").val());// sti_force,sti_span,sti_L1,sti_t1,sti_L2
    var L = parseInt($("#input1").val());
    var Qx = parseInt($("#input1").val());
    var Ix = parseInt($("#input1").val());
    var Yx = parseInt($("#input1").val());
    alert(p + L);
    //M = M1 + M2;M1 = p * L /4 ;M2 = Qx*9.81*l*l/8
    var M1 = p * L / 4; var M2 = Qx * 9.81 * L * L / 8;
    M = M1 + M2;
    //var WJ = document.getElementById("txt_showresult").value = p*L;
    //var strength = document.getElementById("txt_showresult2").value = M * Yx / Ix;
    var hidenx = document.getElementById("hidenx").value = "modle1";
    //return M1, M2;
    alert("计算已生成\nM1=" + M1 + "M2=" + M2 + "M=" + M + "\n" + strength);

}
//模型2计算垂直弯矩 M： 强度
function model2() {
    var M, S;
    var p = parseInt($("#sti_force0").val());
    var L = parseInt($("#sti_span0").val());
    var Ax = parseInt($("#sti_span01").val());
    var Qx = parseInt($("#sti_L01").val());
    var Ix = parseInt($("#sti_t01").val());
    var Yx = parseInt($("#sti_L02").val());

    var M1 = Qx * Ax;
    var M2 = Qx * 9.81 * L * L / 8;
    M = M1 + M2;
    var WJ = document.getElementById("txt_showresult").value = M;
    var strength = document.getElementById("txt_showresult2").value = M * Yx / Ix;
    var hidenx = document.getElementById("hidenx").value = "modle2";

    alert("计算已生成\nM=" + M + "\n" + strength);

}
function daochu() {

    var idTmr = "";
    function killExcelProcess(appExcel_) {
        appExcel_.Quit();
        appExcel_ = null;
        idTmr = window.setInterval("Cleanup();", 1);
    }

    //导出到excel，参数tableid为JSP页面需要导出的table的id，需要更改IE的安全设置，ActiveX都打开，如果还是不能使用，再服务端运行“regsvr32 scrrun.dll” 
    function exportToExcel(tableid, notitleandsearch) {
        try {
            clipboardData.setData('Text', '');
            var appExcel = new ActiveXObject("Excel.Application");

            killExcelProcess(appExcel);
            appExcel.workbooks.add;

            //标题 
            if (notitleandsearch == null || notitleandsearch == false) {
                var elTable = document.getElementById('div_title');
                var oRangeRef = document.body.createTextRange();
                oRangeRef.moveToElementText(elTable);
                oRangeRef.execCommand("Copy");
                appExcel.ActiveSheet.Cells(1, 3).select();
                appExcel.ActiveSheet.Paste();

                clipboardData.setData('Text', '');
                appExcel.ActiveSheet.Cells(2, 1).select();
                appExcel.ActiveSheet.Paste();
            }

            var elTable1 = document.getElementById(tableid);
            var oRangeRef1 = document.body.createTextRange();
            oRangeRef1.moveToElementText(elTable1);
            oRangeRef1.execCommand("Copy");

            appExcel.WorkSheets(1).Activate;
            if (notitleandsearch == null || notitleandsearch == false) {
                appExcel.ActiveSheet.Cells(3, 1).select();
            } else {
                appExcel.ActiveSheet.Cells(1, 1).select();
            }
            appExcel.WorkSheets(1).Activate;
            appExcel.ActiveSheet.Paste();
            appExcel.Visible = true;

        } catch (e) {
            alert("请确认IE安全设置，ActiveX都启用！");
            return false;
        }
        clipboardData.setData('text', '');
    }
}

/**
 *CreateFile: 测试在电脑上创建一个文件件，并在文件夹里写进一些数据。
 *
 */
function CreateFile() {
    var fso = new ActiveXObject("Scripting.FileSystemObject");//XMLHttpRequest
    var f1 = fso.createtextfile("E:\\myjstest.txt", true);
    alert("文件最后创建日期: ");
}
/**
 *Folder的API：
 *任务 方法 
 *创建文件夹。 FileSystemObject.CreateFolder 
 *删除文件夹。 Folder.Delete 或 FileSystemObject.DeleteFolder 
 *移动文件夹。 Folder.Move 或 FileSystemObject.MoveFolder 
 *复制文件夹。 Folder.Copy 或 FileSystemObject.CopyFolder 
 *检索文件夹的名字。 Folder.Name 
 *如果文件夹在驱动器上存在，则找出它。 FileSystemObject.FolderExists 
 *获得现有 Folder 对象的实例。 FileSystemObject.GetFolder 
 *找出文件夹的父文件夹名。 FileSystemObject.GetParentFolderName 
 *找出系统文件夹的路径。 FileSystemObject.GetSpecialFolder 
 */
function ManipFiles() {
    var fso, f1, f2, s;
    fso = new ActiveXObject("Scripting.FileSystemObject");
    f1 = fso.CreateTextFile("c:\\testfile.txt", true); //如果当前文件已经存在的话，则覆盖原有文件
    alert("Writing file <br>");
    // 写一行。
    f1.Write("This is a test.");
    // 关闭文件。
    f1.Close();
    alert("Moving file to c:\\tmp <br>");
    if (!fso.FolderExists("c:\\tmp")) { //如果tmp目录不存在，则创建一个目录
        fso.CreateFolder("c:\\tmp");
    }
    // 获取 C 的根目录(C:\)中的文件的句柄。
    f2 = fso.GetFile("c:\\testfile.txt");
    // 把文件移动到 \tmp 目录。如果这个tmp目录下已经有testfile.txt文件了，则会出错。（如果没有tmp这个文件目录也会出错）
    f2.Move("c:\\tmp\\testfile.txt");
    alert("Copying file to c:\\temp <br>");
    // 把文件复制到 \temp 目录
    if (!fso.FolderExists("c:\\temp")) {//如果temp目录不存在，则创建一个目录
        fso.CreateFolder("c:\\temp");
    }
    f2.Copy("c:\\temp\\testfile.txt");
    alert("Deleting files <br>");
    // 获得文件当前位置的句柄。
    f2 = fso.GetFile("c:\\tmp\\testfile.txt");
    f3 = fso.GetFile("c:\\temp\\testfile.txt");
    // 删除文件。
    f2.Delete();
    f3.Delete();
    //删除文件夹
    var fdTmp = fso.GetFolder("c:\\tmp");
    var fdTemp = fso.GetFolder("c:\\temp");
    fdTmp.DeleteFolder();
    fdTemp.DeleteFolder();
    alert("All done!");
}
//打印报表
function printff() {
    //t = new ActiveXObject("WScript.Shell");
    //t.RegWrite("HKCU\\Software\\Microsoft\\InternetExplorer\\PageSetup\\header", "");
    //t.RegWrite("HKCU\\Software\\Microsoft\\InternetExplorer\\PageSetup\\footer", "");
    document.getElementById("btn_print").hidden = 'hiddened';
    document.getElementById("btn_print1").hidden = 'hiddened';

    window.print();
    //alert("打印");

}
function testww1() {
    //this.ManipFiles();
    alert("^(*￣(oo)￣)^外部调用^(*￣(oo)￣)^");
}

/*************弯矩计算所需函数****************/
function addOption() {

    var obj = document.getElementById('select2');
    //var oo = document.getElementsByTagName("select") //测试
    //var id = oo[3].getAttribute("id");
    //alert(id);

    var key2 = document.getElementById('select2').value;//动态的
    var key1 = document.getElementById('select1').value;
    //alert("key1=="+key1+"\n\nkey2=="+key2);
    if (key2 != "") {
        if (key1 == "0") {

            obj.innerHTML = "";
            document.getElementById("select2").style.display = "";
            var oOption0 = document.createElement("OPTION");
            oOption0.text = "请选择加载力";
            oOption0.value = "0";
            obj.add(oOption0);
            var oOption1 = document.createElement("OPTION");
            oOption1.text = "跨中集中力";
            oOption1.value = "1";
            obj.add(oOption1);

            var oOption2 = document.createElement("OPTION");
            oOption2.text = "偏心集中力";
            oOption2.value = "2";
            obj.add(oOption2);

            var oOption3 = document.createElement("OPTION");
            oOption3.text = "两个集中力";
            oOption3.value = "3";
            obj.add(oOption3);

            var oOption4 = document.createElement("OPTION");
            oOption4.text = "均布载荷";
            oOption4.value = "4";
            obj.add(oOption4);
        }
        if (key1 == "5") {
            obj.innerHTML = "";
            //oo = document.getElementById("select2").setAttribute("id", "select3");
            document.getElementById("select2").style.display = "";
            //id = oo[3].getAttribute("id");
            //alert(id)
            var oOption0 = document.createElement("OPTION");
            oOption0.text = "请选择加载力";
            oOption0.value = "5";
            obj.add(oOption0);
            var oOption1 = document.createElement("OPTION");
            oOption1.text = "跨中集中力";
            oOption1.value = "6";
            obj.add(oOption1);

            var oOption2 = document.createElement("OPTION");
            oOption2.text = "偏心集中力";
            oOption2.value = "7";
            obj.add(oOption2);

            var oOption3 = document.createElement("OPTION");
            oOption3.text = "均布载荷";
            oOption3.value = "8";
            obj.add(oOption3);

        }

    }
    if (key2 == "") {
        if (key1 == "0") {
            document.getElementById("select2").style.display = "";
            var oOption0 = document.createElement("OPTION");
            oOption0.text = "请选择加载力";
            oOption0.value = "0";
            obj.add(oOption0);
            var oOption1 = document.createElement("OPTION");
            oOption1.text = "跨中集中力";
            oOption1.value = "1";
            obj.add(oOption1);

            var oOption2 = document.createElement("OPTION");
            oOption2.text = "偏心集中力";
            oOption2.value = "2";
            obj.add(oOption2);

            var oOption3 = document.createElement("OPTION");
            oOption3.text = "两个集中力";
            oOption3.value = "3";
            obj.add(oOption3);

            var oOption4 = document.createElement("OPTION");
            oOption4.text = "均布载荷";
            oOption4.value = "4";
            obj.add(oOption4);
        }
        if (key1 == "5") {
            //oo = document.getElementById("select2").setAttribute("id", "select3");
            document.getElementById("select2").style.display = "";
            var oOption0 = document.createElement("OPTION");
            oOption0.text = "请选择加载力";
            oOption0.value = "5";
            obj.add(oOption0);
            var oOption1 = document.createElement("OPTION");
            oOption1.text = "跨中集中力";
            oOption1.value = "6";
            obj.add(oOption1);

            var oOption2 = document.createElement("OPTION");
            oOption2.text = "偏心集中力";
            oOption2.value = "7";
            obj.add(oOption2);

            var oOption3 = document.createElement("OPTION");
            oOption3.text = "均布载荷";
            oOption3.value = "8";
            obj.add(oOption3);
        }
    }
}
//选择加载力模型图
function changeImg1() {
    //document.getElementById("select2").style.display = "";
    //document.getElementById("xuanbi").style.display = "none";
    var curIndex = 0;
    //时间间隔 单位毫秒 
    var timeInterval = 2100;
    var arrc = new Array();
    var arr = new Array();
    var arrb = new Array();
    arr[0] = "bending-jianzhi-1.png";
    arr[5] = "bending-xuanbi-1.png";

    arr[1] = "bending-jianzhi-2.png";
    arr[2] = "bending-jianzhi-3.png";
    arr[3] = "bending-jianzhi-4.png";
    arr[4] = "bending-jianzhi-5.png";

    arr[6] = "bending-xuanbi-2.png";
    arr[7] = "bending-xuanbi-3.png";
    arr[8] = "bending-xuanbi-4.png";
    var obj = document.getElementById("showpic");
    var sel = document.getElementById("select2");

    var a = sel.options[sel.selectedIndex].value;

    if (curIndex == arr.length - 1) {
        curIndex = 0;
    }
    else {
        curIndex += 1;
    }
    obj.src = "/Content/image/bendingcal/" + arr[a];

}
//下拉列表对号select1   下拉列表未选择 提示 必选项
function select() {
    var a = document.getElementById("select1").value;

    if (a != "9") {
        document.getElementById("select_1").className = "icon-checkmark";
        document.getElementById("s_tips").style = "";
        document.getElementById("s_tips").innerHTML = "";

    } else {
        document.getElementById("select2").style.display = "none";

        document.getElementById("select_2").className = "";
        document.getElementById("select_1").className = "";
        document.getElementById("s_tips").style = "";
        document.getElementById("s_tips").innerHTML = "";

        document.getElementById("s_tips1").style = "";
        document.getElementById("s_tips1").innerHTML = "";

    }

}
//下拉列表对号select2
function weqa() {
    var a = document.getElementById("select2").value;
    if (a != "5") {
        document.getElementById("select_2").className = "icon-checkmark";
        document.getElementById("s_tips1").style = "";
        document.getElementById("s_tips1").innerHTML = "";

    } else {
        document.getElementById("select_2").className = "";
        document.getElementById("s_tips1").style = "";
        document.getElementById("s_tips1").innerHTML = "";

    }
}
//gangdu刚度文本框
function txt_choice0() {
    var m1 = document.getElementById("select1").value;
    var m2 = document.getElementById("select2").value;
    if (m1 == "0") {
        if (m2 == "1") {
            document.getElementById("tr_A").hidden = "hidden";
            document.getElementById("tr_B").hidden = "hidden";
            document.getElementById("tr_Q").hidden = "hidden";
            document.getElementById("tr_E").hidden = "";
            document.getElementById("tr_Ix").hidden = "";
            document.getElementById("tr_F").hidden = "";
            document.getElementById("tr_L").hidden = "";
        }
        if (m2 == "2") {
            document.getElementById("tr_A").hidden = "";
            document.getElementById("tr_B").hidden = "";
            document.getElementById("tr_F").hidden = "";
            document.getElementById("tr_L").hidden = "";
            document.getElementById("tr_E").hidden = "";
            document.getElementById("tr_Ix").hidden = "";
            document.getElementById("tr_Q").hidden = "hidden";

        }
        if (m2 == "3") {
            document.getElementById("tr_F").hidden = "";
            document.getElementById("tr_A").hidden = "";
            document.getElementById("tr_E").hidden = "";
            document.getElementById("tr_Ix").hidden = "";
            document.getElementById("tr_L").hidden = "";
            document.getElementById("tr_Q").hidden = "hidden";
            document.getElementById("tr_B").hidden = "hidden";
        }
        if (m2 == "4") {
            document.getElementById("tr_L").hidden = "";
            document.getElementById("tr_Q").hidden = "";
            document.getElementById("tr_E").hidden = "";
            document.getElementById("tr_Ix").hidden = "";
            document.getElementById("tr_B").hidden = "hidden";
            document.getElementById("tr_A").hidden = "hidden";
            document.getElementById("tr_F").hidden = "hidden";
        }
    }
    else if (m1 == "5") {
        if (m2 == "6") {
            document.getElementById("tr_B").hidden = "";
            document.getElementById("tr_E").hidden = "";
            document.getElementById("tr_Ix").hidden = "";
            document.getElementById("tr_L").hidden = "";
            document.getElementById("tr_F").hidden = "";
            document.getElementById("tr_Q").hidden = "hidden";
            document.getElementById("tr_A").hidden = "hidden";

        }
        if (m2 == "7") {
            document.getElementById("tr_F").hidden = "";
            document.getElementById("tr_L").hidden = "";
            document.getElementById("tr_E").hidden = "";
            document.getElementById("tr_Ix").hidden = "";
            document.getElementById("tr_Q").hidden = "hidden";
            document.getElementById("tr_A").hidden = "hidden";
            document.getElementById("tr_B").hidden = "hidden";
        }
        if (m2 == "8") {
            document.getElementById("tr_A").hidden = "hidden";
            document.getElementById("tr_F").hidden = "hidden";
            document.getElementById("tr_B").hidden = "hidden";
            document.getElementById("tr_Q").hidden = "";
            document.getElementById("tr_L").hidden = "";
            document.getElementById("tr_E").hidden = "";
            document.getElementById("tr_Ix").hidden = "";
        }
    }
}
//文本框对号显示
function shoowClass() {
    var sti_F = document.getElementById("sti_force2").value;
    var sti_L = document.getElementById("sti_wheelbase").value;
    var sti_a = document.getElementById("sti_rec_L1").value;
    var sti_b = document.getElementById("sti_rec_t1").value;
    var sti_q = document.getElementById("sti_rec_t").value;


    if (sti_F != "") {
        document.getElementById("in_1").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_1").className = "";
    }


    if (sti_L != "") {
        document.getElementById("in_2").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_2").className = "";
    }


    if (sti_a != "") {
        document.getElementById("in_3").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_3").className = "";
    }


    if (sti_b != "") {

        document.getElementById("in_4").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_4").className = "";
    }


    if (sti_q != "") {

        document.getElementById("in_5").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_5").className = "";
    }

    var I = document.getElementById("sti_rec_I").value;

    var E = document.getElementById("sti_rec_E").value;

    if (I != "") {

        document.getElementById("in_7").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_7").className = "";
    }
    if (E != "") {

        document.getElementById("in_8").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_8").className = "";
    }
}
//选择隐藏文本框
function txt_choice() {
    var m1 = document.getElementById("select1").value;
    var m2 = document.getElementById("select2").value;
    if (m1 == "0") {
        if (m2 == "1") {
            document.getElementById("tr_A").hidden = "hidden";
            document.getElementById("tr_B").hidden = "hidden";
            document.getElementById("tr_Q").hidden = "hidden";
            document.getElementById("tr_F").hidden = "";
            document.getElementById("tr_L").hidden = "";
        }
        if (m2 == "2") {
            document.getElementById("tr_A").hidden = "";
            document.getElementById("tr_B").hidden = "";
            document.getElementById("tr_F").hidden = "";
            document.getElementById("tr_L").hidden = "";
            document.getElementById("tr_Q").hidden = "hidden";

        }
        if (m2 == "3") {
            document.getElementById("tr_F").hidden = "";
            document.getElementById("tr_A").hidden = "";
            document.getElementById("tr_Q").hidden = "hidden";
            document.getElementById("tr_L").hidden = "hidden";
            document.getElementById("tr_B").hidden = "hidden";
        }
        if (m2 == "4") {
            document.getElementById("tr_L").hidden = "";
            document.getElementById("tr_Q").hidden = "";
            document.getElementById("tr_B").hidden = "hidden";
            document.getElementById("tr_A").hidden = "hidden";
            document.getElementById("tr_F").hidden = "hidden";
        }
    }
    else if (m1 == "5") {
        if (m2 == "6") {
            document.getElementById("tr_B").hidden = "";
            document.getElementById("tr_A").hidden = "hidden";
            document.getElementById("tr_L").hidden = "hidden";
            document.getElementById("tr_Q").hidden = "hidden";
            document.getElementById("tr_F").hidden = "";
        }
        if (m2 == "7") {
            document.getElementById("tr_Q").hidden = "hidden";
            document.getElementById("tr_F").hidden = "";
            document.getElementById("tr_L").hidden = "";
            document.getElementById("tr_A").hidden = "hidden";
            document.getElementById("tr_B").hidden = "hidden";
        }
        if (m2 == "8") {
            document.getElementById("tr_A").hidden = "hidden";
            document.getElementById("tr_B").hidden = "hidden";
            document.getElementById("tr_Q").hidden = "";
            document.getElementById("tr_L").hidden = "";
            document.getElementById("tr_F").hidden = "hidden";
        }
    }
}

//刚度计算
function stiffness() {

    var m1 = document.getElementById("select1").value;
    var m2 = document.getElementById("select2").value;
    var F, L, a, b, q, I, E;
    var F1max;//定义结果
    //alert("m1=" + m1 + "\n\nm2=" + m2);

    F = document.getElementById("sti_force2").value;
    L = document.getElementById("sti_wheelbase").value;
    a = document.getElementById("sti_rec_L1").value;
    b = document.getElementById("sti_rec_t1").value;
    q = document.getElementById("sti_rec_t").value;

    I = document.getElementById("sti_rec_I").value;
    E = document.getElementById("sti_rec_E").value;//21000=e

    if (m1 == "0") {
        if (m2 == "1") {
            F1max = (F * L * L * L) / (48 * E * I);                //跨中集中力
            //alert("1=="+F1max)
            var txt_max = document.getElementById("txt_showresult").value = "≈" + "1/" + parseInt(L / F1max);//计算结果
        }
        if (m2 == "2") {
            F1max = (F * a * b * a * b) / (3 * E * I * L);//偏心集中力
            // alert("2=="+F1max)
            var txt_max = document.getElementById("txt_showresult").value = "≈" + "1/" + parseInt(L / F1max);//计算结果

        }
        if (m2 == "3") {
            F1max = ((F * a * L * L) / (24 * E * I)) * (3 - (4 * Math.sqrt((a / L), 2)));            //俩集中力
            //alert("3=="+F1max)
            var txt_max = document.getElementById("txt_showresult").value = "≈" + "1/" + parseInt(L / F1max);//计算结果

        }
        if (m2 == "4") {
            F1max = (5 * q * Math.sqrt(L, 4)) / (384 * E * I);//局部载荷
            //alert("4=="+F1max)
            var txt_max = document.getElementById("txt_showresult").value = "≈" + "1/" + parseInt(L / F1max);//计算结果

        }
        if (m2 == "0") {
            //alert("请选择加载力!!\n\n\nHanding \nTips");
            document.getElementById("s_tips1").innerHTML = "请选择加载力!";
            document.getElementById("s_tips1").style = "color:#FF0000";

        }

    }
    else if (m1 == "5") {
        if (m2 == "6") {
            F1max = (F * b * b * L) / (6 * E * I) * (3 - (b / L));
            var txt_max = document.getElementById("txt_showresult").value = "≈" + "1/" + parseInt(L / F1max);//计算结果

        }
        if (m2 == "7") {
            F1max = (F * L * L * L) / (3 * E * I);
            var txt_max = document.getElementById("txt_showresult").value = "≈" + "1/" + parseInt(L / F1max);//计算结果

        }
        if (m2 == "8") {
            F1max = (q * L * L * L * L) / (8 * E * I);
            var txt_max = document.getElementById("txt_showresult").value = "≈" + "1/" + parseInt(L / F1max);//计算结果
        }
        if (m2 == "5") {
            //alert("请选择加载力!!\n\n\nHanding\nTips");
            document.getElementById("s_tips").innerHTML = "请选择加载力!";
            document.getElementById("s_tips").style = "color:#FF0000";

        }
    }
    else {
        //alert("\n\n请选择力学模型!" + "\nHanDing\n参数输入")
        document.getElementById("s_tips").innerHTML = "请选择力学模型!";
        document.getElementById("s_tips").style = "color:#FF0000";
    }
}
//弯矩计算 Bending Moment
//1.跨中集中力：Mmax=F（L/1000）/4
//2.偏心集中力：Mmax=F（a/1000）（b/1000）/L
//3.两个集中力：Mmax=F(a/1000)
//4.均布载荷：Mmax=q（l/1000）^2/8

//1.跨中集中力：Mmax=-Fb
//2.偏心：Mmax=-FL
//3.均布：Mmax=FL/4
//3.均布：-FL2/2
function jianzhi_xuanbi() {
    var m1 = document.getElementById("select1").value;
    var m2 = document.getElementById("select2").value;
    var F, L, a, b, q;
    var F1max, F2max, F3max, F4max;
    //alert("m1=" + m1 + "\n\nm2=" + m2);

    F = document.getElementById("sti_force2").value;
    L = document.getElementById("sti_wheelbase").value;

    a = document.getElementById("sti_rec_L1").value;

    b = document.getElementById("sti_rec_t1").value;
    q = document.getElementById("sti_rec_t").value;
    //F = document.getElementById("").value;
    //F1max = F*(L / 1000) / 4;                //跨中集中力
    //F1max = F * (a / 1000) * (b / 1000) / L;//偏心集中力
    //F1max = F * (a / 1000);                 //俩集中力
    // F1max = Math.sqrt((L / 1000), 2) / 8;   //均布载荷
    if (m1 == "0") {


        if (m2 == "1") {
            F1max = F * (L / 1000) / 4;                //跨中集中力
            //alert("1=="+F1max)
            var txt_max = document.getElementById("txt_showresult").value = "≈" + Math.round(F1max * 100) / 100;//计算结果
        }
        if (m2 == "2") {
            F1max = F * (a / 1000) * (b / 1000) / (L / 1000);//偏心集中力
            // alert("2=="+F1max)
            var txt_max = document.getElementById("txt_showresult").value = "≈" + Math.round(F1max * 100) / 100;//计算结果

        }
        if (m2 == "3") {
            F1max = F * (a / 1000);                 //俩集中力
            //alert("3=="+F1max)
            var txt_max = document.getElementById("txt_showresult").value = "≈" + Math.round(F1max * 100) / 100;//计算结果

        }
        if (m2 == "4") {
            F1max = (L / 1000) * (L / 1000) * q * 9.81 / 8;  //局部载荷
            //alert("4=="+F1max)
            var txt_max = document.getElementById("txt_showresult").value = "≈" + Math.round(F1max * 100) / 100;//计算结果

        }
        if (m2 == "0") {
            //alert("请选择加载力!!\nTips");
            document.getElementById("s_tips1").innerHTML = "请选择加载力";
            document.getElementById("s_tips1").style = "color:#FF0000";
        }

    }
    else if (m1 == "5") {


        if (m2 == "6") {
            F1max = -(F * b / 1000);
            var txt_max = document.getElementById("txt_showresult").value = "≈" + Math.round(F1max * 100) / 100;//计算结果

        }
        if (m2 == "7") {
            F1max = -(F * L / 1000);
            var txt_max = document.getElementById("txt_showresult").value = "≈" + Math.round(F1max * 100) / 100;//计算结果

        }
        if (m2 == "8") {
            F1max = -(q * 9.81 * (L / 1000) * (L / 1000) / 2);
            var txt_max = document.getElementById("txt_showresult").value = "≈" + Math.round(F1max * 100) / 100;//计算结果
        }
        if (m2 == "5") {
            document.getElementById("s_tips1").innerHTML = "请选择加载力";
            document.getElementById("s_tips1").style = "color:#FF0000";
            //alert("请选择加载力!!\nTips");
        }
    }
    else {
        //alert("\n\n请选择力学模型!" + "\n\n参数输入");
        document.getElementById("s_tips").innerHTML = "请选择力学模型!";
        document.getElementById("s_tips").style = "color:#FF0000";
    }
}
//截面特性动态添加table
function createTable() {
    var tableNode;

    var a = document.getElementById("select1").value;
    tableNode = document.createElement("table");//获得对象  
    //tableNode.setAttribute("id", "table")
    var boxstring = new Array("上盖板宽 L1：", "上盖板厚 t1：", "下盖板宽 L2：", "下盖板厚 t2：", "右腹板厚 t3：", "左腹板厚 t4：", "腹板高 h:", "腹板边距 t5:", "腹板边距 t6:");
    var recstring = new Array("矩形管宽 L：", "矩形管高 h：", "矩形管厚 t：");
    switch (a) {
        //case "0":
        //document.getElementById("s_tips").style = "color:#FF0000";
        case "1":
            div1.innerHTML = "";
            for (var x = 0; x < boxstring.length; x++) {
                var trNode = tableNode.insertRow();
                trNode.innerHTML = "<td>" + boxstring[x] + "</td> <input oninput='bjxxl0();showorhiddenicon();' calss='form-control' type='text' id='" + "input" + x + "' placeholder='mm'/> <span id='" + "in_" + x + "' class=''></span>";
                document.getElementById("div1").appendChild(tableNode);//添加到那个位置 
            }
            document.getElementById("img-sticanshu").src = "../Content/image/cal_sti.png";
            document.getElementById("select_1").className = "icon-checkmark";

            document.getElementById("s_tips").innerHTML = "";
            document.getElementById("s_tips").style = "";
            break;
        case "2":
            div1.innerHTML = "";
            for (var x = 0; x < recstring.length; x++) {
                var trNode = tableNode.insertRow();
                trNode.innerHTML = "<td>" + recstring[x] + "</td> <input oninput='bjjxl0();showorhiddenicon();' type='text' id='" + "input" + x + "' placeholder='mm'/> <span id='" + "in_" + x + "' class=''></span>";
                document.getElementById("div1").appendChild(tableNode);//添加到那个位置 
            }
            document.getElementById("img-sticanshu").src = "../Content/image/cal_sti1.png";
            document.getElementById("select_1").className = "icon-checkmark";

            document.getElementById("s_tips").innerHTML = "";
            document.getElementById("s_tips").style = "";
            break;
    }
    //document.getElementById("input0").value = "123456414";
}
//截面特性根据文本框内容显示或隐藏图标
function showorhiddenicon() {
    var input_0 = document.getElementById("input0").value;
    var input_1 = document.getElementById("input1").value;
    var input_2 = document.getElementById("input2").value;

    //alert(input_0);
    //判断箱型梁√显示和矩形管√显示

    if (input_0 != "") {
        document.getElementById("in_0").className = "icon-checkmark";

    }
    else {
        document.getElementById("in_0").className = "";

    }


    if (input_1 != "") {
        document.getElementById("in_1").className = "icon-checkmark";

    }
    else {
        document.getElementById("in_1").className = "";

    }


    if (input_2 != "") {
        document.getElementById("in_2").className = "icon-checkmark";

    }
    else {
        document.getElementById("in_2").className = "";

    }
    //判断箱型梁√显示
    var input_3 = document.getElementById("input3").value;
    var input_4 = document.getElementById("input4").value;
    var input_5 = document.getElementById("input5").value;
    var input_6 = document.getElementById("input6").value;
    var input_7 = document.getElementById("input7").value;
    var input_8 = document.getElementById("input8").value;

    if (input_3 != "") {

        document.getElementById("in_3").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_3").className = "";
    }


    if (input_4 != "") {

        document.getElementById("in_4").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_4").className = "";
    }

    if (input_5 != "") {

        document.getElementById("in_5").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_5").className = "";
    }

    if (input_6 != "") {

        document.getElementById("in_6").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_6").className = "";
    }

    if (input_7 != "") {

        document.getElementById("in_7").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_7").className = "";
    }

    if (input_8 != "") {

        document.getElementById("in_8").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_8").className = "";
    }
}
//强度计算根据选择添加文本框
function sticreateTable() {
    var tableNode;
    var a = document.getElementById("select2").value;
    tableNode = document.createElement("table");//获得对象  
    //tableNode.setAttribute("id", "table")
    var boxstring = new Array("最大弯矩 M", "上盖板宽 L1", "上盖板厚 t1：", "下盖板宽 L2：", "下盖板厚 t2：", "右腹板厚 t3：", "左腹板厚 t4：", "腹板高 h:", "腹板边距 t5:", "腹板边距 t6:");
    var unitstring1 = new Array("N*m", "mm", "mm", "mm", "mm", "mm", "mm", "mm", "mm", "mm");
    var recstring = new Array("最大弯矩 M", "抗弯截面系数 W");
    var unitstring2 = new Array("N*m", "mm³");
    switch (a) {
        case "1":
            div1.innerHTML = "";
            for (var x = 0; x < recstring.length; x++) {
                var trNode = tableNode.insertRow();
                trNode.innerHTML = "<td>" + recstring[x] + "</td> <input oninput='jmyz();showorhiddeniconsti();' title='请填写此字段。' type='text' id='" + "input" + x + "' placeholder='" + unitstring2[x] + "'/> <span id='" + "in_" + x + "' class=''></span>";
                document.getElementById("div1").appendChild(tableNode);//添加到那个位置 
            }
            document.getElementById("img-sticanshu").src = "../Content/image/5aa02f4b68d20c9d8ed9caf527e3ba.png";
            document.getElementById("select_2").className = "icon-checkmark";

            document.getElementById("s_tips1").style = "";
            document.getElementById("s_tips1").innerHTML = "";

            break;
        case "2":
            div1.innerHTML = "";
            for (var x = 0; x < boxstring.length; x++) {
                var trNode = tableNode.insertRow();
                trNode.innerHTML = "<td>" + boxstring[x] + "</td> <input oninput='jmwz();showorhiddeniconsti();' title='请填写此字段。' type='text' id='" + "input" + x + "' placeholder='" + unitstring1[x] + "'/> <span id='" + "in_" + x + "' class=''></span>";
                document.getElementById("div1").appendChild(tableNode);//添加到那个位置 
            }
            document.getElementById("img-sticanshu").src = "../Content/image/cal_sti.png";
            document.getElementById("select_2").className = "icon-checkmark";

            document.getElementById("s_tips1").style = "";
            document.getElementById("s_tips1").innerHTML = "";
            break;

    }

}
//强度类型选择显示√图片
function iconshowsti() {
    var a = document.getElementById("select1").value;
    if (a != "0") {
        document.getElementById("s_tips").innerHTML = "";
        document.getElementById("s_tips").style = "";
    }
    document.getElementById("select_1").className = "icon-checkmark";
}
//强度根据文本框内容显示或隐藏图标
function showorhiddeniconsti() {
    var input_0 = document.getElementById("input0").value;
    var input_1 = document.getElementById("input1").value;
    //alert(input_0);
    //判断截面系数已知√显示和截面系数未知√显示

    if (input_0 != "") {
        document.getElementById("in_0").className = "icon-checkmark";

    }
    else {
        document.getElementById("in_0").className = "";

    }


    if (input_1 != "") {
        document.getElementById("in_1").className = "icon-checkmark";

    }
    else {
        document.getElementById("in_1").className = "";

    }

    //判断截面系数未知√显示
    var input_2 = document.getElementById("input2").value;
    var input_3 = document.getElementById("input3").value;
    var input_4 = document.getElementById("input4").value;
    var input_5 = document.getElementById("input5").value;
    var input_6 = document.getElementById("input6").value;
    var input_7 = document.getElementById("input7").value;
    var input_8 = document.getElementById("input8").value;
    var input_9 = document.getElementById("input9").value;

    if (input_2 != "") {
        document.getElementById("in_2").className = "icon-checkmark";

    }
    else {
        document.getElementById("in_2").className = "";

    }

    if (input_3 != "") {

        document.getElementById("in_3").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_3").className = "";
    }


    if (input_4 != "") {

        document.getElementById("in_4").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_4").className = "";
    }

    if (input_5 != "") {

        document.getElementById("in_5").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_5").className = "";
    }

    if (input_6 != "") {

        document.getElementById("in_6").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_6").className = "";
    }

    if (input_7 != "") {

        document.getElementById("in_7").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_7").className = "";
    }

    if (input_8 != "") {

        document.getElementById("in_8").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_8").className = "";
    }

    if (input_9 != "") {

        document.getElementById("in_9").className = "icon-checkmark";
    }
    else {
        document.getElementById("in_9").className = "";
    }
}
/*寿命计算-参数输入添加文本框*/
function liftaddtext() {
    var a = document.getElementById("li_0").value;

}
//  Bearing.cshtml
function Bearing_() {
    var radionum = document.getElementById("form1").radio;
    var val = "";
    var P = ""; var Lh = "";
    for (var i = 0; i < radionum.length; i++) {

        if (radionum[i].checked) {

            val = radionum[i].value;
        }
    }
    if (val != "") {
        //当量动载荷
        var T = document.getElementById("sti_Type").value.toString();
        var Fr = parseInt(document.getElementById("sti_Rad").value);
        var Fa = parseInt(document.getElementById("sti_Axi").value);
        var sti_e = parseFloat(document.getElementById("sti_Sel").value);
        var sti_X = parseFloat(document.getElementById("sti_X").value);
        var sti_Y1 = parseFloat(document.getElementById("sti_Y1").value);
        var sti_Y2 = parseFloat(document.getElementById("sti_Y2").value);
        ///寿命计算参数
        var N = document.getElementById("sti_v").value;
        var sti_c = document.getElementById("sti_c").value;
        var cc = document.getElementById("sti_Pmax").value;//最大温度
        ///中间值
        var mid = Fa / Fr;

        if (T == "1") { //深沟球轴承：Fr/Fa<=e:Pc=Fr  Fr/Fa>e:Pc=X*Fr+Y*Fa

            if (mid <= sti_e) {
                P = Fr;
                document.getElementById("txt_showresult").value = P + " N";
                Lh = parseInt((Math.pow(10, 6) / 60) * Math.pow((sti_c * cc) / (P * 1.2), 10 / 3));
                var txt_showresult_life = document.getElementById("txt_showresult_life").value = Lh + " h";

            }
            if (mid > sti_e) {
                P = sti_X * Fr + sti_Y1 * Fa;
                document.getElementById("txt_showresult").value = P + " N";
                Lh = parseInt((Math.pow(10, 6) / 60) * Math.pow((sti_c * cc) / (P * 1.2), 10 / 3));
                var txt_showresult_life = document.getElementById("txt_showresult_life").value = Lh + " h";

            }
        }
        if (T == "2") {//调心球轴承：Fa/Fr<=e:Pc=Fr+Y1*Fa Fa/Fr>e:Pc=0.65*Fr+Y2*Fa

            if (mid <= sti_e) {
                P = Fr + sti_Y1 * Fa;
                document.getElementById("txt_showresult").value = P + " N";
                Lh = parseInt((Math.pow(10, 6) / 60) * Math.pow((sti_c * cc) / (P * 1.2), 10 / 3));
                var txt_showresult_life = document.getElementById("txt_showresult_life").value = Lh + " h";

            }
            if (mid > sti_e) {
                P = 0.65 * Fr + sti_Y2 * Fa;
                document.getElementById("txt_showresult").value = P + " N";
                Lh = parseInt((Math.pow(10, 6) / 60) * Math.pow((sti_c * cc) / (P * 1.2), 10 / 3));
                var txt_showresult_life = document.getElementById("txt_showresult_life").value = Lh + " h";

            }
        }
        if (T == "3") {//圆柱滚子轴承：Fa/Fr<=e:Pc=Fr Fa/Fr>e:Pc=0.92*Fr+Y1*Fa

            if (mid <= sti_e) {
                P = Fr;
                document.getElementById("txt_showresult").value = P + " N";
                Lh = parseInt((Math.pow(10, 6) / 60) * Math.pow((sti_c * cc) / (P * 1.2), 10 / 3));
                var txt_showresult_life = document.getElementById("txt_showresult_life").value = Lh + " h";

            }
            if (mid > sti_e) {
                P = 0.92 * Fr + sti_Y1 * Fa;
                document.getElementById("txt_showresult").value = P + " N";
                Lh = parseInt((Math.pow(10, 6) / 60) * Math.pow((sti_c * cc) / (P * 1.2), 10 / 3));
                var txt_showresult_life = document.getElementById("txt_showresult_life").value = Lh + " h";

            }
        }
        if (T == "4") {//调心滚子轴承:Fa/Fr<=e:Pc=Fr+Y1*Fa Fa/Fr>e:Pc=0.67*Fr+Y2*Fa

            if (mid <= sti_e) {
                P = Fr + sti_Y1 * Fa;
                document.getElementById("txt_showresult").value = P + " N";
                Lh = parseInt((Math.pow(10, 6) / 60) * Math.pow((sti_c * cc) / (P * 1.2), 10 / 3));
                var txt_showresult_life = document.getElementById("txt_showresult_life").value = Lh + " h";

            }
            if (mid > sti_e) {
                P = 0.67 * Fr + sti_Y2 * Fa;
                document.getElementById("txt_showresult").value = P + " N";
                Lh = parseInt((Math.pow(10, 6) / 60) * Math.pow((sti_c * cc) / (P * 1.2), 10 / 3));
                var txt_showresult_life = document.getElementById("txt_showresult_life").value = Lh + " h";
            }
        }
    }
}
//  Drum.cshtml 算法设计
function Drum_() {
    var radionum = document.getElementById("form1").radio;
    var val = "";
    for (var i = 0; i < radionum.length; i++) {

        if (radionum[i].checked) {

            val = radionum[i].value;
        }
    }
    if (val == "li_0") {
        //车轮承载力参数================线接触允许轮压
        var D = document.getElementById("sti_Y").value;
        var L = document.getElementById("sti_D").value
        var K = document.getElementById("sti_H").value
        var c1 = document.getElementById("sti_c1").value
        var c2 = document.getElementById("sti_c2").value

        var rs = parseInt(D * L * K * c1 * c2 * 100) / 100;
        document.getElementById("txt_showresult").value = rs + " N"; //
    }
    if (val == "li_2") {
        //车轮计算载荷
        var Pmax = parseInt(document.getElementById("sti_Y1").value);
        var Pmin = parseInt(document.getElementById("sti_Y2").value);
        var Pc = (2 * Pmax + Pmin) / 3;
        var rs = parseInt(Pc * 100) / 100;
        var tx = document.getElementById("txt_showresult_life").value;
        if (tx == "" || tx == "NaN N" || Pmin == "" || Pmax == "") {
            document.getElementById("txt_showresult_life").value = "请完整输入参数!";
        }
        else {
            document.getElementById("txt_showresult_life").value = rs + " N";//车轮计算载荷

        }
    }
    if (val == "li_1") {
        //点接触允许轮压
        var pi = 0.3867;
        var D = document.getElementById("sti_Y").value;
        var k = document.getElementById("sti_v").value;//材料系数
        var c1 = document.getElementById("sti_c1").value;
        var c2 = document.getElementById("sti_c2").value;
        var r1 = document.getElementById("sti_c").value = D / 2;    //R=D/2  
        var r2 = document.getElementById("sti_Pmax").value;
        var m = document.getElementById("sti_e").value = pi * Math.pow((r2 / r1), -0.36);
        var R = Math.max(r1, r2);
        var Pc = k * ((R * R) / m * m * m) * c1 * c2;
        var rs = parseInt(Pc * 100) / 100;
        document.getElementById("txt_showresult_fu").value = rs + " N"; //点接触允许轮压

    }
}
//参数给文本框自动赋值
function GetTr() {
    //Javascript 取得table 中TD的值
    var rows = document.getElementById('table-right').getElementsByTagName('tr');//$("#MyTable").find("tr");
    var T = document.getElementById("sti_Type").value;
    var b;

    //alert("T=" + T);
    if (T == "1") {
        for (i = 0; i < rows.length; i++) {
            rows[i].onclick = function () {
                //alert("行:" + eval(this.rowIndex));
                b = this.rowIndex;
                //var VAL = document.getElementById("table-right").rows[1].cells[0].innerHTML; var tu = $("#table-right").find("tr").eq(1).find("td").eq(1).text();
                document.getElementById("sti_Sel").value = document.getElementById("table-right").rows[b].cells[3].innerHTML;
                document.getElementById("sti_X").value = document.getElementById("table-right").rows[b].cells[4].innerHTML;
                document.getElementById("sti_Y1").value = document.getElementById("table-right").rows[b].cells[5].innerHTML;
                document.getElementById("sti_c").value = document.getElementById("table-right").rows[b].cells[2].innerHTML;
            }
        }
    }
    if (T == "2") {
        for (i = 0; i < rows.length; i++) {
            rows[i].onclick = function () {
                //alert("行:" + eval(this.rowIndex));
                b = this.rowIndex;
                document.getElementById("sti_c").value = document.getElementById("table-right").rows[b].cells[2].innerHTML;
                document.getElementById("sti_Sel").value = document.getElementById("table-right").rows[b].cells[3].innerHTML;
                document.getElementById("sti_Y1").value = document.getElementById("table-right").rows[b].cells[4].innerHTML;
                document.getElementById("sti_Y2").value = document.getElementById("table-right").rows[b].cells[5].innerHTML;
            }
        }
    }
    if (T == "3") {
        for (i = 0; i < rows.length; i++) {
            rows[i].onclick = function () {
                //alert("行:" + eval(this.rowIndex));
                b = this.rowIndex;
                document.getElementById("sti_c").value = document.getElementById("table-right").rows[b].cells[2].innerHTML;
                document.getElementById("sti_Sel").value = document.getElementById("table-right").rows[b].cells[3].innerHTML;
                document.getElementById("sti_Y1").value = document.getElementById("table-right").rows[b].cells[4].innerHTML;
                //document.getElementById("sti_Y2").value = document.getElementById("table-right").rows[b].cells[5].innerHTML;
            }
        }
    }
    if (T == "4") {
        //alert(T)
        for (i = 0; i < rows.length; i++) {
            //alert("001")
            rows[i].onclick = function mmm() {
                //alert("行:" + eval(this.rowIndex));
                b = this.rowIndex;
                var a = document.getElementById("sti_c").value = document.getElementById("table-right").rows[b].cells[2].innerHTML;
                document.getElementById("sti_Sel").value = document.getElementById("table-right").rows[b].cells[3].innerHTML;
                document.getElementById("sti_Y1").value = document.getElementById("table-right").rows[b].cells[4].innerHTML;
                document.getElementById("sti_Y2").value = document.getElementById("table-right").rows[b].cells[5].innerHTML;
            }
        }
    }
}
//文本框初始化 函数
function Txt_ini() {
    //document.getElementById("sti_Type").value = "";
    document.getElementById("sti_Rad").value = "";
    document.getElementById("sti_Axi").value = "";
    document.getElementById("sti_Sel").value = "";
    document.getElementById("sti_X").value = "";
    document.getElementById("sti_Y1").value = "";
    document.getElementById("sti_Y2").value = "";
    ///寿命计算参数
    document.getElementById("sti_v").value = "";
    document.getElementById("sti_c").value = "";
    document.getElementById("sti_Pmax").value = "";//最大温度
}
//
function showtable1() {
    var a = document.getElementById("sti_Type").value;
    document.getElementById("table-right").innerHTML = "";
    switch (a) {
        case "1":
            Txt_ini();
            $("#table-right").append("<tr align='center'>"
                                      + '<th>轴承型号</th>'
                                      + '<th>外形尺寸</th>'
                                      + '<th>额定载荷C</th>'
                                      + '<th>选择系数e</th>'
                                      + '<th>载荷系数X</th>'
                                      + '<th>载荷系数Y</th>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>61812</td>'
                                      + '<td>78*60-10</td>'
                                      + '<td>9.1</td>'
                                      + '<td>0.3</td>'
                                      + '<td>0.56</td>'
                                      + '<td>1.45</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>61814</td>'
                                      + '<td>90*70-10</td>'
                                      + '<td>12.1</td>'
                                      + '<td>0.3</td>'
                                      + '<td>0.56</td>'
                                      + '<td>1.45</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>61816</td>'
                                      + '<td>100*80-10</td>'
                                      + '<td>12.7</td>'
                                      + '<td>0.3</td>'
                                      + '<td>0.56</td>'
                                      + '<td>1.45</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>61818</td>'
                                      + '<td>115*90-13</td>'
                                      + '<td>19.5</td>'
                                      + '<td>0.3</td>'
                                      + '<td>0.56</td>'
                                      + '<td>1.45</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>61820</td>'
                                      + '<td>125*100-13</td>'
                                      + '<td>20.1</td>'
                                      + '<td>0.3</td>'
                                      + '<td>0.56</td>'
                                      + '<td>1.45</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>61822</td>'
                                      + '<td>140*110-16</td>'
                                      + '<td>28.1</td>'
                                      + '<td>0.3</td>'
                                      + '<td>0.56</td>'
                                      + '<td>1.45</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>61824</td>'
                                      + '<td>150*120-16</td>'
                                      + '<td>28.9</td>'
                                      + '<td>0.3</td>'
                                      + '<td>0.56</td>'
                                      + '<td>1.45</td>'
                                      + "</tr>"
                                      )
            document.getElementById("table-right").hidden = "";
            //隐藏不需要的input                
            document.getElementById("sti_Y2").disabled = "disabled";
            break;
        case "2":
            Txt_ini();
            $("#table-right").append("<tr align='center'>"
                                      + '<th>轴承型号</th>'
                                      + '<th>外形尺寸</th>'
                                      + '<th>额定载荷C</th>'
                                      + '<th>选择系数e</th>'
                                      + '<th>载荷系数Y1</th>'
                                      + '<th>载荷系数Y2</th>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>1212</td>'
                                      + '<td>110*60-22</td>'
                                      + '<td>30.2</td>'
                                      + '<td>0.19</td>'
                                      + '<td>3.4</td>'
                                      + '<td>5.3</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>1214</td>'
                                      + '<td>150*70-24</td>'
                                      + '<td>34.5</td>'
                                      + '<td>0.18</td>'
                                      + '<td>3.5</td>'
                                      + '<td>5.4</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>1216</td>'
                                      + '<td>170*80-26</td>'
                                      + '<td>39.5</td>'
                                      + '<td>0.18</td>'
                                      + '<td>3.6</td>'
                                      + '<td>5.5</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>1218</td>'
                                      + '<td>160-90-30</td>'
                                      + '<td>56.5</td>'
                                      + '<td>0.17</td>'
                                      + '<td>3.8</td>'
                                      + '<td>5.7</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>1220</td>'
                                      + '<td>180*100-34</td>'
                                      + '<td>68.5</td>'
                                      + '<td>0.18</td>'
                                      + '<td>3.5</td>'
                                      + '<td>5.4</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>1222</td>'
                                      + '<td>200*100-38</td>'
                                      + '<td>87.2</td>'
                                      + '<td>0.17</td>'
                                      + '<td>3.6</td>'
                                      + '<td>5.6</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>2222</td>'
                                      + '<td>200*110-53</td>'
                                      + '<td>125</td>'
                                      + '<td>0.28</td>'
                                      + '<td>2.2</td>'
                                      + '<td>3.5</td>'
                                      + "</tr>"
                                      )
            document.getElementById("table-right").hidden = "";
            //显示需要的input
            document.getElementById("sti_X").disabled = "";
            document.getElementById("sti_Y2").disabled = "";
            break;
        case "3":
            Txt_ini();
            $("#table-right").append("<tr align='center'>"
                                      + '<th>轴承型号</th>'
                                      + '<th>外形尺寸</th>'
                                      + '<th>额定载荷C</th>'
                                      + '<th>选择系数e</th>'
                                      + '<th>载荷系数Y1</th>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>1012</td>'
                                      + '<td>95*60-18</td>'
                                      + '<td>48.7</td>'
                                      + '<td>0.3</td>'
                                      + '<td>0.4</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>2212</td>'
                                      + '<td>110*60-28</td>'
                                      + '<td>122</td>'
                                      + '<td>0.2</td>'
                                      + '<td>0.6</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>1014</td>'
                                      + '<td>110*70-20</td>'
                                      + '<td>47.5</td>'
                                      + '<td>0.3</td>'
                                      + '<td>0.4</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>2214</td>'
                                      + '<td>125*70-31</td>'
                                      + '<td>148</td>'
                                      + '<td>0.2</td>'
                                      + '<td>0.6</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>1016</td>'
                                      + '<td>125*80-22</td>'
                                      + '<td>59.2</td>'
                                      + '<td>0.3</td>'
                                      + '<td>0.4</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>2216</td>'
                                      + '<td>125*80-33</td>'
                                      + '<td>178</td>'
                                      + '<td>0.2</td>'
                                      + '<td>0.6</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>1018</td>'
                                      + '<td>140*90-24</td>'
                                      + '<td>74</td>'
                                      + '<td>0.3</td>'
                                      + '<td>0.4</td>'
                                      + "</tr>"
                                      )
            document.getElementById("table-right").hidden = "";
            //隐藏不需要的input
            document.getElementById("sti_X").disabled = "disabled";
            document.getElementById("sti_Y2").disabled = "disabled";
            break;
        case "4":
            Txt_ini();
            $("#table-right").append("<tr align='center'>"
                                      + '<th>轴承型号</th>'
                                      + '<th>外形尺寸</th>'
                                      + '<th>额定载荷C</th>'
                                      + '<th>选择系数e</th>'
                                      + '<th>载荷系数Y1</th>'
                                      + '<th>载荷系数Y2</th>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>22212</td>'
                                      + '<td>110*60-28</td>'
                                      + '<td>129</td>'
                                      + '<td>0.25</td>'
                                      + '<td>2.7</td>'
                                      + '<td>4.0</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>22214</td>'
                                      + '<td>125*70-31</td>'
                                      + '<td>163</td>'
                                      + '<td>0.24</td>'
                                      + '<td>2.8</td>'
                                      + '<td>4.2</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>22216</td>'
                                      + '<td>140*80-33</td>'
                                      + '<td>187</td>'
                                      + '<td>0.22</td>'
                                      + '<td>3.0</td>'
                                      + '<td>4.5</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>22218</td>'
                                      + '<td>160*90-40</td>'
                                      + '<td>257</td>'
                                      + '<td>0.23</td>'
                                      + '<td>2.1</td>'
                                      + '<td>3.1</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>22220</td>'
                                      + '<td>180*100-46</td>'
                                      + '<td>331</td>'
                                      + '<td>0.24</td>'
                                      + '<td>2.8</td>'
                                      + '<td>4.2</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>23022</td>'
                                      + '<td>170*110-45</td>'
                                      + '<td>293</td>'
                                      + '<td>0.26</td>'
                                      + '<td>2.6</td>'
                                      + '<td>3.9</td>'
                                      + "</tr>"
                                      + "<tr align='center'>"
                                      + '<td>23024</td>'
                                      + '<td>180*120-46</td>'
                                      + '<td>315</td>'
                                      + '<td>0.25</td>'
                                      + '<td>2.7</td>'
                                      + '<td>4</td>'
                                      + "</tr>"
                                      )
            document.getElementById("table-right").hidden = "";
            //显示需要的input
            document.getElementById("sti_X").disabled = "";
            document.getElementById("sti_Y2").disabled = "";
            break;
    }
}