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
<link type="text/css" href="my.css" rel="stylesheet" />

</head>
<body>
	<div id="interest_sectl" class="">
		<div class="rating_wrap clearbox" rel="v:rating">
			<div class="rating_logo">豆瓣评分</div>

			<div class="rating_self clearfix" typeof="v:Rating">
				<strong class="ll rating_num " property="v:average"> 7.6 </strong> <span
					property="v:best" content="10.0"></span>
				<div class="rating_right ">
					<div class="ll bigstar50"></div>
					<div class="rating_sum">
						<span class=""> <a href="collections" class="rating_people"><span
								property="v:votes">837</span>人评价</a> </span>
					</div>


				</div>
			</div>

			<span class="stars5 starstop" title="力荐"> 5星 </span>


			<div class="power" style="width:${width}px"></div>

			<span class="rating_per">${wper }%</span> <br> <span
				class="stars4 starstop" title="推荐"> 4星 </span>


			<div class="power" style="width:63px"></div>

			<span class="rating_per">42.4%</span> <br> <span
				class="stars3 starstop" title="还行"> 3星 </span>


			<div class="power" style="width:32px"></div>

			<span class="rating_per">21.4%</span> <br> <span
				class="stars2 starstop" title="较差"> 2星 </span>


			<div class="power" style="width:5px"></div>

			<span class="rating_per">3.3%</span> <br> <span
				class="stars1 starstop" title="很差"> 1星 </span>


			<div class="power" style="width:1px"></div>

			<span class="rating_per">1.2%</span> <br>
		</div>
	</div>


</body>