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
		<span>最新借阅</span>
	</div>
	
	<div style="margin-top:10px; text-align:center;">
		<input type="hidden" id="page" name="page" value="${pageData.page}" />
		<input type="hidden" id="currPage" name="currPage"
			value="${pageData.currPage}" />
		<table class="table table-hover table-bordered MT10"
			style="table-layout:fixed; width:450px;">
			<tr>
				<th width="75px;"></th>
				<th width="195px;"></th>
			</tr>
			<c:if test="${pageData.list.size() > 0}">
				<c:forEach items="${pageData.list}" var="item" varStatus="vs">
					<tr>
						<td id="bookname" title="${item.bookinfo.bookname}"><font
							face="黑体"><c:out value="${item.bookinfo.bookname}" /> </font></td>
						<td id="bookcase" title="${item.bookinfo.bookcomment}"><font
							face="黑体"><c:out value="${item.bookinfo.bookcomment}" />
						</font></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${pageData.total < 1}">
				<tr>
					<td colspan="11" style="color: red">没有记录</td>
				</tr>
			</c:if>
		</table>

	</div>
</body>
</html>