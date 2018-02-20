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
<title>${apiInfo.title }</title>
<!-- <link type="text/css" href="https://img3.doubanio.com/f/book/4b96ff7f14f7e4afc66325721537b53f3a647545/css/book/master.css" rel="stylesheet" /> -->
<%-- <link type="text/css" href="<%=basePath %>master.css" rel="stylesheet" /> --%>
<link type="text/css" href="<%=basePath%>master.css" rel="stylesheet" />


<style type="text/css">
h2 {
	color: #007722;
}
</style>
</head>
<body>
	<h1 style="padding-left:280px; margin-top: 40px">
		<span property="v:itemreviewed">${apiInfo.title }</span>
		<div class="clear"></div>
	</h1>
	<div style="padding-left:260px;">
		<div class="subject clearfix">
			<div style="padding-left:20px;" id="mainpic" class="">
				<a class="nbg" href="${apiInfo.imageHref }"
					title="${apiInfo.title }"> <img src="${apiInfo.imageHref }"
					title="点击看大图" alt="${apiInfo.title }" rel="v:photo"
					style="vertical-align:middle;width:127px"> </a>
			</div>

			<div id="info" class="">
				<span> <span class="pl"> 作者</span>: <a class="" href=""
					target="_blank"> ${apiInfo.author }</a> </span><br /> <span class="pl">出版社:</span>
				${apiInfo.publisher }<br /> <span class="pl">出版年:</span>
				${apiInfo.pubdate }<br /> <span class="pl">页数:</span>
				${apiInfo.pages }<br /> <span class="pl">定价:</span>${apiInfo.price
				}<br /> <span class="pl">装帧:</span>${apiInfo.binding }<br /> <span
					class="pl">ISBN:</span>${apiInfo.isbn }<br />
				<%-- <span class="pl">余量:</span>${bookinfo.currbook }<br />
				<span class="pl">馆藏地:</span>${bookinfo.bookcase.name }<br /> --%>
			</div>

		</div>

		<div style="padding-left:100px;" id="interest_sectl" class="">
			<div class="rating_wrap clearbox" rel="v:rating">
				<div class="rating_logo">豆瓣评分</div>
				<div class="rating_self clearfix" typeof="v:Rating">
					<strong class="ll rating_num " property="v:average">${apiInfo.rate
						} </strong> <span property="v:best" content="10.0"></span>
					<div class="rating_right ">
						<div class="ll bigstar${iBigstar }"></div>
						<div class="rating_sum">
							<span class=""> <span property="v:votes">${apiInfo.numRaters
									}</span>人评价 </span>
						</div>
					</div>
				</div>


				<span class="stars5 starstop" title="力荐"> 5星 </span>

				<div class="power" style="width:${barPer.bar1}px"></div>

				<span class="rating_per">${barPer.per1 }%</span> <br> <span
					class="stars4 starstop" title="推荐"> 4星 </span>

				<div class="power" style="width:${barPer.bar2}px"></div>

				<span class="rating_per">${barPer.per2 }%</span> <br> <span
					class="stars3 starstop" title="还行"> 3星 </span>

				<div class="power" style="width:${barPer.bar3}px"></div>

				<span class="rating_per">${barPer.per3 }%</span> <br> <span
					class="stars2 starstop" title="较差"> 2星 </span>


				<div class="power" style="width:${barPer.bar4}px"></div>

				<span class="rating_per">${barPer.per4 }%</span> <br> <span
					class="stars1 starstop" title="很差"> 1星 </span>


				<div class="power" style="width:${barPer.bar5}px"></div>

				<span class="rating_per">${barPer.per5 }%</span> <br>
			</div>
		</div>

	</div>



	<div style="padding-left:260px;width:800px">
		<br clear="all">
		<div id="collect_form_26864773"></div>
		<div class="related_info">
			<h2 style="padding-left:10px;">
				<span class="">内容简介</span>
				&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
			</h2>
			<div class="indent" id="link-report">
				<span class="short">
					<style type="text/css" media="screen">
.intro p {
	text-indent: 2em;
}
</style>
					<div style="padding-left:10px;" class="intro">
						<p>${apiInfo.summary }</p>
					</div> </span>
				<style>
#link-report .report {
	text-align: right;
	font-size: 12px;
	visibility: hidden;
}

#link-report .report a {
	color: #BBB;
}

#link-report .report a:hover {
	color: #FFF;
	background-color: #BBB;
}
</style>
				<h2 style="padding-left:10px;">
					<span class="">作者简介</span>
					&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
				</h2>

				<div class="indent ">

					<div class="">
						<style type="text/css" media="screen">
.intro p {
	text-indent: 2em;
}
</style>
						<div style="padding-left:10px;" class="intro">
							<p>${apiInfo.authorIntro }</p>

						</div>
					</div>

				</div>
			</div>
		</div>
		<div>
			<table 
				style="table-layout:fixed; width:200px;font-size:36px;" >
				<tr bgcolor="#d8d8d8">
					<th width="150"><font face="楷体">索书号</font></th>
					<th width="150"><font face="楷体">条形码</font></th>
					<th width="300" style="text-align:center;"><font face="楷体">校馆-馆藏地</font></th>
					<th width="200" style="text-align:center;"><font face="楷体">书刊状态</font></th>
				</tr>
				<c:if test="${pageBookState.list.size() > 0}">
					<c:forEach items="${pageBookState.list}" var="item" varStatus="vs">
						<tr>
							<td id="callnum" title="${item.callnum}"><font face="楷体">
									<c:out value="${item.callnum}" /> </font></td>
							<td id="barcode" title="${item.barcode}"><font face="楷体">
									<c:out value="${item.barcode}" /> </font></td>
							<td id="readingroom" style="text-align:center;"><font face="楷体"><c:out
										value="${item.readingroom}" /> </font></td>
							<td id="state" style="text-align:center;"><font
								face="楷体"><c:out value="${item.state}" /> </font></td>
						</tr>

					</c:forEach>
				</c:if>
				<c:if test="${pageBookState.total < 1}">
					<tr>
						<td colspan="7" style="color: red">没有记录</td>
					</tr>
				</c:if>

			</table>
		</div>
	</div>
	<div id="footer">
		<p align="center">地址：XX省XX市XX区XX街道 邮编：025025</p>
		<p align="center">版权所有：豆瓣图书馆</p>
	</div>
</body>
</html>