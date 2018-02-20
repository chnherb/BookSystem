<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*"%>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<!-- <script type="text/javascript" src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script> -->
<script type="text/javascript" src="js/Highcharts-3.0.10/highcharts.js"></script> 
<script type="text/javascript" src="js/Highcharts-3.0.10/modules/exporting.js"></script>

<script>
  $(function () { 
    $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '各类书籍统计'
        },
        xAxis: {
            categories: ['<%= request.getAttribute("booktype")%>']
        },
        yAxis: {
            title: {
                text: '总量'
            }
        },
        series: [
	       /* {
	           name: 'Jane',
	           data: [1, 0, 4]
	       }, */ 
	        {
	           name: '数量',
	           data: [ <%= request.getAttribute("booktotal")%> ]
	       }]
    });
}); 

  </script>
</head>
	
<body>
   <div id="container" style="min-width:150px;height:200px;"></div>
   <input type="hidden" id="booktype" value="${booktype }" />
    <input type="hidden" id="booktotal" value="${booktotal }" />
</body>
</html>
