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
<script type="text/javascript" src="../js/jquery.js"></script>
<script src="../js/artDialog/lib/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="../js/artDialog/css/ui-dialog.css">
<script src="../js/artDialog/dist/dialog-min.js"></script>
<link href="../css.css" rel="stylesheet" type="text/css" />
<script src="../js/artDialog/lib/sea.js"></script>

<!-- <script src="../js/jquery.js" type="text/javascript"></script> -->
<script src="../js/validation/dist/jquery.validate.js" type="text/javascript"></script>
<script src="../js/validation/jquery.metadata.js" type="text/javascript"></script>

<link rel="stylesheet" href="../js/jquery-ui-1.9.2.custom/development-bundle/themes/base/jquery.ui.all.css">
<script src="../js/jquery-ui-1.9.2.custom/development-bundle/jquery-1.8.3.js"></script>
<script src="../js/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.core.js"></script>
<script src="../js/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.widget.js"></script>
<script src="../js/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.datepicker.js"></script>
<link rel="stylesheet" href="../js/jquery-ui-1.9.2.custom/development-bundle/demos/demos.css">
<script src="../js/jquery-ui-1.9.2.custom/development-bundle/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>

<script type="text/javascript">

</script>
</head> 
  <body>
  	<div style="width:600px; height:400px;">
  		<div style="width:600px; height:80px; text-align: center;">
  			
  			<font face="黑体"><h1>${infoPublish.title }</h1></font>
  		</div>
  		<div style="width:600px; height:2px; text-align: center; background-color:#ccc;">
  			
  		</div>
  		
  		<div style="width:600px; height:230px;  margin-top:10px;">
  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${infoPublish.comment }
  		</div>
  		<div style="width:200px; height:20px;  margin-bottom:2px; margin-left:500px;">
  			${infoPublish.createTime }
  		</div>
  	</div>
    <%-- <form action = "/BookSystem/infopublish/save.do" method="post" id="editForm">
    	<table border="1px" style="text-align:center;">
    		<input type ="hidden" name = "id" id="id" value="${infoPublish.id }"/>
    		<tr>
    			<td>标语</td>
    			<td><input type="text" name ="title" id ="title" value ="${infoPublish.title }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>内容</td>
    			<td><textarea name ="comment" id ="comment" value="${infoPublish.comment }"  style="width:170px; height:80px;">${infoPublish.comment }</textarea></td>
    		</tr>
    		<tr>
    			<td>发布时间</td>
    			<td><input type="text" name ="createTime" id ="datepicker" value ="${infoPublish.createTime }" class="{required:true,minlength:5}"/></td>
    		</tr>
    	</table>
    </form> --%>
  </body>
</html>
