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
<title>图书馆管理系统</title>
<script type="text/javascript" src="/js/jquery.js"></script>
<script src="/js/artDialog/lib/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="/js/artDialog/css/ui-dialog.css">
<script src="/js/artDialog/dist/dialog-min.js"></script>
<link href="/css.css" rel="stylesheet" type="text/css" />
<script src="/js/artDialog/lib/sea.js"></script>

<!-- <script src="/js/jquery.js" type="text/javascript"></script> -->
<script src="/js/validation/dist/jquery.validate.js" type="text/javascript"></script>
<script src="/js/validation/jquery.metadata.js" type="text/javascript"></script>


<link rel="stylesheet" href="/js/jquery-ui-1.9.2.custom/development-bundle/themes/base/jquery.ui.all.css">
<script src="/js/jquery-ui-1.9.2.custom/development-bundle/jquery-1.8.3.js"></script>
<script src="/js/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.core.js"></script>
<script src="/js/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.widget.js"></script>
<script src="/js/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.datepicker.js"></script>
<link rel="stylesheet" href="/js/jquery-ui-1.9.2.custom/development-bundle/demos/demos.css">
<script src="/js/jquery-ui-1.9.2.custom/development-bundle/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'common.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
