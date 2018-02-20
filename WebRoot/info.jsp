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
<script type="text/javascript">
	function jiequ(str) {
		var lenght = str.lenght();
		alert(lenght);
		if (lenght < 10) {
			return str;
		} else {
			str = str.substring(0, 8);
			return str + "..";
		}
	}
</script>
<style>
td {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}
</style>
</head>
<body>
	<div style="background-color:#C0C0C0; width:450px;">
		<span>最新通知</span><span><a
			href="/BookSystem/infopublish/list.do?role=user" target="blank" style="float:right;">更多</a>
		</span>
	</div>
	
	<div style="margin-top:10px; text-align:center;">
		<input type="hidden" id="page" name="page" value="${pageData.page}" />
		<input type="hidden" id="currPage" name="currPage"
			value="${pageData.currPage}" />
		<table class="table table-hover table-bordered MT10"
			style="table-layout:fixed; width:450px;">
			<tr>
				<th width="65px;"></th>
				<th width="220px;"></th>
			</tr>
			<c:if test="${pageData.list.size() > 0}">
				<c:forEach items="${pageData.list}" var="item" varStatus="vs">
					<tr>
						<td id="createTime"><font color="#C0C0C0">[${item.createTime}]:</font>
						</td>
						<td id="title"><span title="${item.comment}"
							style="width:100px;overflow:hidden"><font face="黑体">${item.title}</font>
						</span></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${pageData.total < 1}">
				<tr>
					<td colspan="7" style="color: red">没有记录</td>
				</tr>
			</c:if>
		</table>

	</div>
</body>
</html>