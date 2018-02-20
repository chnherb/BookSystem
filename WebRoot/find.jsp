<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.util.*"%>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="sping"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>

<style>
td {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}
</style>

<script type="text/javascript">
	$(function() {
		//var param = $("#queryform").serialize();
		var content = $("#content").val();
		var url = "/BookSystem/bookinfo/booklist.do?content=" + content;
		$.post(url, function(data) {
			$("#findContent").html(data);
		});
	});

	$(function() {

		$("#search").click(function() {
			var searchtype = $("#searchtype").val();
			var content = $("#content").val();
			var url = "/BookSystem/bookinfo/booklist.do?content=" + content + "&searchtype=" + searchtype;

			$.post(url, function(data) {
				$("#findContent").html(data);
			});
		});
	});
</script>
</head>
<body>

	<div style="background-color:#C0C0C0; width:558px;">
		<span>本地图书查询</span><span><a
			href="/BookSystem/bookinfo/chaxunlist.do?role=user" target="blank"
			style="float:right;">更多</a> </span>
	</div>
	<div style="margin-top:20px;margin-left:60px;text-align:left">
		<span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name ="searchtype" id ="searchtype" >
    				<option value ="0" >书名</option>
    				<option value ="1" >作者</option>
    				<option value ="2" >出版社</option>
    	</select>
		<input type="text" id="content" name="content"
			value="${content }" placeholder="请输入书名" /> <input type="button"
			id="search" value="查询" /> </span>
	</div>

	<div id="findContent"></div>
</body>
</html>