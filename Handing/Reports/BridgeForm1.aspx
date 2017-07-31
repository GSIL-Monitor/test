<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BridgeForm1.aspx.cs" Inherits="Handing.Views.Product.BridgeForm1" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jQuery大型下拉菜单插件booNavigation - 站长素材</title>
    <script src="/Content/js/jquery-1.9.1.min.js"></script>
    <script src="/Content/js/booNavigation.js"></script>
    <link rel="stylesheet" type="text/css" href="/Content/css/booNavigation.css">
    <link rel="stylesheet" type="text/css" href="/Content/css/htmleaf-demo.css">
    <link href='http://fonts.googleapis.com/css?family=Maven+Pro:400,500,700,900' rel='stylesheet' type='text/css'>

</head>
<body>
<div class="htmleaf-container">
	<div class="htmleaf-content">
		<nav id="booNavigation" class="booNavigation">
				<ul>
					<li class="navItem">
						<a href="#" title="First Item">First Item</a>
						<ul class="navContent">
							<li>
								<ul>
									<li><a href="#" title="Boo the cat">Boo the cat</a><li/>
									<li><a href="#" title="The invisible cat">The invisible cat</a><li/>
									<li><a href="#" title="The amazing cat">The amazing cat</a><li/>
									<li><a href="#" title="Play with Boo the cat">Play with Boo the cat</a><li/>
									<li><a href="#" title="Pictures of Boo">Pictures of Boo</a><li/>
									<li><a href="#" title="The best cat">The best cat</a><li/>
									<li><a href="#" title="Boo the cat">Boo the cat</a><li/>
								</ul>
							</li>
							<li>
								<ul>
									<li><a href="#" title="Pictures of Boo">Pictures of Boo</a><li/>
									<li><a href="#" title="Boo the cat">Boo the cat</a><li/>
									<li><a href="#" title="The invisible cat">The invisible cat</a><li/>
									<li><a href="#" title="Play with Boo the cat">Play with Boo the cat</a><li/>
									<li><a href="#" title="The best cat">The best cat</a><li/>
									<li><a href="#" title="The amazing cat">The amazing cat</a><li/>
									<li><a href="#" title="Boo the cat">Boo the cat</a><li/>
								</ul>
							</li>
							<li>
								<ul>
									<li><a href="#" title="The amazing cat">The amazing cat</a><li/>
									<li><a href="#" title="Boo the cat">Boo the cat</a><li/>
									<li><a href="#" title="The invisible cat">The invisible cat</a><li/>
									<li><a href="#" title="Play with Boo the cat">Play with Boo the cat</a><li/>
									<li><a href="#" title="The best cat">The best cat</a><li/>
									<li><a href="#" title="Boo the cat">Boo the cat</a><li/>
									<li><a href="#" title="Pictures of Boo">Pictures of Boo</a><li/>
								</ul>
							</li>
						</ul>
					</li>

					<li class="navItem">
						<a href="#" title="Second Item">Second Item</a>
						<ul class="navContent">
							<li>
								<ul>
									<li><a href="#" title="Boo the cat">Boo the cat</a><li/>
									<li><a href="#" title="The invisible cat">The invisible cat</a><li/>
									<li><a href="#" title="The amazing cat">The amazing cat</a><li/>
									<li><a href="#" title="Play with Boo the cat">Play with Boo the cat</a><li/>
								</ul>
							</li>
							<li>
								<ul>
									<li><a href="#" title="Pictures of Boo">Pictures of Boo</a><li/>
									<li><a href="#" title="The amazing cat">The amazing cat</a><li/>
									<li><a href="#" title="Boo the cat">Boo the cat</a><li/>
								</ul>
							</li>
							<li>
								<ul>
									<li><a href="#" title="The amazing cat">The amazing cat</a><li/>
									<li><a href="#" title="Boo the cat">Boo the cat</a><li/>
									<li><a href="#" title="The invisible cat">The invisible cat</a><li/>
									<li><a href="#" title="Pictures of Boo">Pictures of Boo</a><li/>
								</ul>
							</li>
						</ul>
					</li>

					<li class="navItem">
						<a href="#" title="Third Item">Third Item</a>
						<ul class="navContent">
							<li>
								<ul>
									<li><a href="#" title="Boo the cat">Boo the cat</a><li/>
									<li><a href="#" title="The invisible cat">The invisible cat</a><li/>
									<li><a href="#" title="The amazing cat">The amazing cat</a><li/>
									<li><a href="#" title="The amazing cat">The amazing cat</a><li/>
									<li><a href="#" title="Play with Boo the cat">Play with Boo the cat</a><li/>
									<li><a href="#" title="Play with Boo the cat">Play with Boo the cat</a><li/>
								</ul>
							</li>
							<li>
								<ul>
									<li><a href="#" title="Pictures of Boo">Pictures of Boo</a><li/>
									<li><a href="#" title="The amazing cat">The amazing cat</a><li/>
									<li><a href="#" title="Play with Boo the cat">Play with Boo the cat</a><li/>
									<li><a href="#" title="The amazing cat">The amazing cat</a><li/>
									<li><a href="#" title="Boo the cat">Boo the cat</a><li/>
								</ul>
							</li>
							<li>
								<ul>
									<li><a href="#" title="The amazing cat">The amazing cat</a><li/>
									<li><a href="#" title="Boo the cat">Boo the cat</a><li/>
									<li><a href="#" title="The invisible cat">The invisible cat</a><li/>
									<li><a href="#" title="The amazing cat">The amazing cat</a><li/>
									<li><a href="#" title="Play with Boo the cat">Play with Boo the cat</a><li/>
									<li><a href="#" title="Pictures of Boo">Pictures of Boo</a><li/>
								</ul>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
	</div>
</div>

<script>
    $(function () {
        $('#booNavigation').booNavigation({
            slideSpeed: 200// 控制速度
        });
    })
</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';clear:both;color:#ffffff">
<br><br><br><br>
<p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. 不支持IE8及以下浏览器。</p>
<p>来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></p>
</div>
</body>
</html>












<%--<!DOCTYPE html>
<html>
<head>
    <title> </title>
    <script src="/Content/js/jquery-1.9.1.min.js"></script>
    <script src="/Content/js/booNavigation.js"></script>
    <script src="/Content/css/booNavigation.css"></script>
    <script src="/Content/css/htmleaf-demo.css"></script>

    <script>
        $(document).ready(function () {
            $("button").click(function () {
                    var div=$("div");
                div.animate({height:'300px',opacity:'0.4'},"slow");
                div.animate({width:'300px',opacity:'0.8'},"slow");
                div.animate({height:'100px',opacity:'0.4'},"slow");
                div.animate({width:'100px',opacity:'0.8'},"slow");
            });
            $("#btnn").click(function mm() {
                $("#div1").fadeToggle();
                $("#div2").fadeToggle("slow");
                $("#div3").fadeToggle(3000);
            });
        });
    </script>
    <script>
          
       
</script>
</head>

<body >




    <div class="panel">
<p>W3School - 领先的 Web 技术教程站点</p>
<p>在 W3School，你可以找到你所需要的所有网站建设教程。</p>
</div>
 
<p class="flip">请点击这里</p>
    <button>开始动画</button>
    <p>默认情况下，所有 HTML 元素的位置都是静态的，并且无法移动。如需对位置进行操作，记得首先把元素的 CSS position 属性设置为 relative、fixed 或 absolute。</p>
    <div style="background:#98bf21;height:100px;width:100px;position:absolute;">
    </div>
    <p>演示带有不同参数的 fadeIn() 方法。</p>
<button id="btnn">点击这里，使三个矩形淡入</button>
<br><br>
<div id="div1" style="width:80px;height:80px;display:none;background-color:red;"></div>
<br>
<div id="div2" style="width:80px;height:80px;display:none;background-color:green;"></div>
<br>
<div id="div3" style="width:80px;height:80px;display:none;background-color:blue;"></div>


    <script type="text/javascript">
        $(document).ready(function () {
            $(".flip").click(function () {
                $(".panel").slideToggle("slow");
            });
        });
</script>
 
<style type="text/css"> 
div.panel,p.flip
{
margin:0px;
padding:5px;
text-align:center;
background:#e5eecc;
border:solid 1px #c3c3c3;
}
div.panel
{
height:120px;
display:none;
}
</style>
 

 

 
</body>
</html>
--%>
