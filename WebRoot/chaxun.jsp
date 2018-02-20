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
	function loadDetail(isbn) {
		window.location.href = "b.html";
	}
</script>

</head>
<body>
	<div style="margin-top:10px; text-align:center;" id="findContent">
		<input type="hidden" id="page" name="page" value="${pageData.page}" />
		<input type="hidden" id="currPage" name="currPage"
			value="${pageData.currPage}" />
		<table class="table table-hover table-bordered MT10"
			style="table-layout:fixed; width:200px;">
			<tr bgcolor="#d8d8d8">
				<th width="145"><font face="楷体">书名</font></th>
				<th width="95"><font face="楷体">ISBN</font></th>
				<th width="95"><font face="楷体">作者</font></th>
				<th width="105"><font face="楷体">出版社</font></th>
				<th width="35"><font face="楷体">余量</font></th>
				<th width="55"><font face="楷体">馆藏地</font></th>
			</tr>
			<c:if test="${pageData.list.size() > 0}">
				<c:forEach items="${pageData.list}" var="item" varStatus="vs">
					<tr>
						<td id="bookname" title="${item.bookname}"><font face="楷体">
								<c:out value="${item.bookname}" /> </font></td>
						<td id="bookname" title="${item.isbn}"><font face="楷体">
								<a style="font:楷体"
								href="/BookSystem/bookinfo/bookDetail.do?isbn=${item.isbn}"
								target="_blank"><c:out value="${item.isbn}" />
							</a> </font></td>
						<td id="bookauthor" style="text-align:center;"><font
							face="楷体"><c:out value="${item.bookauthor}" /> </font></td>
						<td id="bookaddress" style="text-align:center;"><font
							face="楷体"><c:out value="${item.bookaddress}" /> </font></td>
						<td id="currsum" style="text-align:center;"><font face="楷体"><c:out
									value="${item.currbook}" /> </font></td>
						<td id="bookcase" title="${item.bookcase.name}"
							style="text-align:center;"><font face="楷体"><c:out
									value="${item.bookcase.name}" /> </font></td>
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