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
<meta http-equiv="content-Type" content="text/html; charset=utf-8">
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
		var keyword = $("#keyword").val();
		var url = "/BookSystem/bookinfo/listBooknjust.do?keyword=" + keyword;
		$.post(url, function(data) {
			$("#findkeyword").html(data);
		});
	});

	$(function() {

		$("#search").click(function() {
			var searchtype = $("#searchtype").val();
			var keyword = $("#keyword").val();
			/* var url = "/BookSystem/bookinfo/listBooknjust.do?keyword=" + keyword + "&searchtype=" + searchtype;
 */
	 		var url = "/BookSystem/bookinfo/listBooknjust.do?sType0=" + searchtype + "&keyword=" + keyword;
 
			$.post(url, function(data) {
				$("#findkeyword").html(data);
			});
		});
	});
</script>
</head>
<body>

	<div style="background-color:#C0C0C0; width:558px;">
		<span>南理工图书查询</span><span> </span>
	</div>
	<div style="margin-top:20px;margin-left:60px;text-align:left">
		<span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name ="searchtype" id ="searchtype" >
					<option value ="any" >任意词</option>
    				<option value ="02" >书名</option>
    				<option value ="03" >责任者</option>
    				<option value ="04" >主题词</option>
    				<option value ="08" >索书号</option>
    				<option value ="09" >出版社</option>
    				<option value ="10" >丛书名</option>
    	</select>
		<input type="text" id="keyword" name="keyword"
			value="${keyword }" placeholder="请输入书名" /> <input type="button"
			id="search" value="查询" /> </span>
	</div>

	<div id="findkeyword"></div>
</body>
</html>