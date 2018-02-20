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
</head>
<body>
	<div style="background-color:#C0C0C0; width:450px;">
		<span>新书</span><span><a
			href="/BookSystem/bookinfo/chaxunlist.do?role=user" target="blank" style="float:right;">更多</a>
		</span>
	</div>
	
	<div style="margin-top:10px; text-align:center;">
		<input type="hidden" id="page" name="page" value="${pageData.page}" />
		<input type="hidden" id="currPage" name="currPage"
			value="${pageData.currPage}" />
		<table class="table table-hover table-bordered MT10"
			style="table-layout:fixed; width:450px;">
			<!-- <tr>
						<th width="115px;"></th>
						<th width="315px;"></th>
						<th width="105px;"></th>
					</tr> -->
			<c:if test="${pageData.list.size() > 0}">
				<c:forEach items="${pageData.list}" var="item" varStatus="vs">
					<tr>
						<td id="bookname" style="width:100px; " title="${item.bookname}"><font
							face="黑体"><c:out value="${item.bookname}" />
						</font>
						</td>
						<td id="bookcommont" style="width:300px; "
							title="${item.bookcomment}"><font face="黑体">${item.bookcomment}</font>
						</td>
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