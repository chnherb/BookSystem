<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.util.*"%>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<title>图书馆管理系统</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script src="js/artDialog/lib/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="js/artDialog/css/ui-dialog.css">
<script src="js/artDialog/dist/dialog-min.js"></script>
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css.css" rel="stylesheet" type="text/css" />
<script src="js/artDialog/lib/sea.js"></script>
<script type="text/javascript">
	$(function() {
		//var param = $("#queryform").serialize();
		var content = $("#content").val();
		var url = "/BookSystem/bookinfo/findnjust.do?content=" + content;
		$.post(url, function(data) {
			$("#tushuxinxi").html(data);
		});
		//"xinshu"
		var url1 = "/BookSystem/bookinfo/newlist.do";
		$.post(url1, function(data) {
			$("#xinshu").html(data);
		});
		//zhuijinjieyue
		var url2 = "/BookSystem/library/newlist.do";
		$.post(url2, function(data) {
			$("#reshu").html(data);
		});
		//xinxi
		var url3 = "/BookSystem/infopublish/userlist.do";
		$.post(url3, function(data) {
			$("#info").html(data);
		});
		//tongji
		var url4 = "/BookSystem/bookinfo/tonglist.do";
		$.post(url4, function(data) {
			$("#tonji").html(data);
		});
	});

	$(function() {
		$("#search").click(function() {
			var content = $("#content").val();
			var url = "/BookSystem/bookinfo/userlist.do?content=" + content;
			$.post(url, function(data) {
				$("#tushuxinxi").html(data);
			});
		});
	$("#logout").click(function(){
		var action = "/BookSystem/login/logout.do";
		//alert("click");
	    $.post(action,function(data){
       	if(data=="1"){
            alert("注销成功");
            
       	}else{
       		alert("修改失败");
       	}
    }); 
});
		
	});
	
$(function(){
//var js_message = request.getAttribute("readerno");
//alert(js_message );

	var id='<%=session.getAttribute("readerno")%>';
		//alert(id+"func");
		//var readerno = $("#readerno").html();
		if (id == null || id == "" || id == "null") {
			$("#logout").css("display", "none");
			//alert("readerno=null");
		} else {
			$("#login").css("display", "none");
		}

	});
</script>
<style type="text/css">
</style>
</head>
<body>
	<script type="text/javascript">
		function mouseover(obj) {
			var id = $(obj).attr("id");
			document.getElementById(id).src = "images/" + id + "_01.png";
			
		}
		function mouseout(obj) {
			var id = $(obj).attr("id");
			document.getElementById(id).src = "images/" + id + ".png";
		}

		function changeMenuContent(menu) {
			var url = "";
			if (menu == "menu1") {
				var content = $("#content").val();
				url = "/BookSystem/bookinfo/findnjust.do?content=" + content;
				$.post(url, function(data) {
					$("#menuContent").html(data);
				});
			} else if (menu == "menu2") {
				//"xinshu"
				url = "/BookSystem/bookinfo/find..do?content=" + content;
				$.post(url, function(data) {
					$("#menuContent").html(data);
				});

			} else if (menu == "menu3") {
				//zhuijinjieyue
				url = "/BookSystem/library/newlist.do";
				$.post(url, function(data) {
					$("#menuContent").html(data);
				});

			} else if (menu == "menu4") {
				//xinxi
				url = "/BookSystem/infopublish/userlist.do";
				$.post(url, function(data) {
					$("#menuContent").html(data);
				});

			}
		}
		
		function clickPic(obj){
			var id = $(obj).attr("id");
			changeMenuContent(id);
		}
	</script>

	<div id="wrap">
		<div id="top">
			<img alt="ahut" src="images/ahut.jpg" height="200px" width="1200px">
		</div>

		<div style="margin-top:10px">
			<span > <a href="/BookSystem/login.jsp" id="login" style="font-size:15px;">登录</a>&nbsp;&nbsp;
				<a href="/BookSystem/readerquery/list.do?readerno=${readerno}"
				target="blank" style="font-size:15px;font-weight:bold;">${readerno}</a>&nbsp;&nbsp; <a href="" id="logout"
				name="logout" style="font-size:15px;">注销</a>&nbsp;&nbsp; </span>
		</div>
		<table>
			<tr>
				<td>
					<div id="menu">
						<img id="menu1" alt="" src="images/menu1.png"  onclick="clickPic(this)"
							onmouseover="mouseover(this)" onmouseout="mouseout(this)">
						<img id="menu2" alt="" src="images/menu2.png" onclick="clickPic(this)"
							onmouseover="mouseover(this)" onmouseout="mouseout(this)">
						<img id="menu3" alt="" src="images/menu3.png" onclick="clickPic(this)"
							onmouseover="mouseover(this)" onmouseout="mouseout(this)">
						<img id="menu4" alt="" src="images/menu4.png" onclick="clickPic(this)"
							onmouseover="mouseover(this)" onmouseout="mouseout(this)">
					</div>
				</td>
				<td rowspan="2">
					<div id="tip">
						<h2>
							<p align="center">读者指南</p>
						</h2>
						<p align="center">开馆时间</p>
						<p align="center">总馆南区：周一至周日9:00-17:00</p>
						<p align="center">周六至周日9:00-17:00</p>
						<p align="center">少年儿童馆：</p>
						<p align="center">周一至周日9:00-17:00</p>
						<p align="center">古 籍 馆：</p>
						<p align="center">周一至周五9:00-17:00</p>
						<p align="center">国家典籍博物馆：</p>
						<p align="center">周二至周日9:00-16:45</p>


					</div>
				</td>
			<tr>
				<td>
					<div id="menuContent"></div>
				</td>
				<td></td>
			</tr>
		</table>
		<div id="footer">
			<p align="center">地址：XX省XX市XX区XX街道  邮编：025025</p>
				<p align="center">版权所有：豆瓣图书馆</p>
		</div>

	</div>
</body>
</html>
