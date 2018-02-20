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
<script type="text/javascript">
$().ready(function() {
 $("#editForm").validate();
});

</script>
</head> 
  <body>
    <form action = "/BookSystem/booktype/save.do" method="post" id="editForm">
    	<table border="1px" style="text-align:center;">
    		<input type ="hidden" name = "id" id="id" value="${booktype.id }"/>
    		<tr>
    			<td style="width:100px">类名</td>
    			<td><input type="text" name ="typeName" id ="typeName" value ="${booktype.typeName }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>备注</td>
    			<td><input type="text" name ="comment" id ="comment" value="${booktype.comment }" class="{required:true,minlength:5}"/></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
