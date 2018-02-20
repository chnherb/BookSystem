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

$(function(){
	$("#readerid").blur(function(){
		//alert("123");
		/* var param=""
		var action="/BookSystem/library/getReaderId.do";
		$.post(action,params,function(data) {
			if (data.flag) {
				var d = dialog({
				    title: '欢迎',
				    content: data
				});
				d.show();
			} else {
				var d = dialog({
				    title: '欢迎',
				    content: data
				});
				d.show();
			}
		}); */
	});
});


</script>
</head> 
  <body>
    <form action = "/BookSystem/readerinfo/save.do" method="post" id="editForm">
    	<table border="1px" style="text-align:center;">
    		<input type ="hidden" name = "id" id="id" value="${reader.id }"/>
    		<input type ="hidden" name = "pwd" id="pwd" value="${reader.pwd }"/>
    		<tr>
    			<td>姓名</td>
    			<td><input type="text" name ="name" id ="name" value="${reader.name }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>性别</td>
    			<!-- <td><input type="text" name ="bookinfo.id" id ="bookinfoid" class="{required:true,minlength:5}"/></td> -->
    			<td><select name ="sex" id ="sex" style="width:170px;">
    				<option value ="男" >男</option>
    				<option value ="女" >女</option>
    			</select></td>
    		</tr>
    		<tr>
    			<td>编号</td>
    			<td><input type="text" name ="readerno" id ="readerno" value ="${reader.readerno }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>电话</td>
    			<td><input type="text" name ="tel" id ="tel" value ="${reader.tel }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>邮箱</td>
    			<td><input type="text" name ="email" id ="email" value ="${reader.email }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>分类</td>
    			<!-- <td><input type="text" name ="managerid.id" id ="managerid" class="{required:true,minlength:5}"/></td> -->
    			<td><select name ="readerType.id" id ="readerTypeid" style="width:170px;">
    				<option value ="" >请选择..</option>
    				<c:forEach var="readertype" items="${readerTypeList }">
    					<option value="${readertype.id }" ${readertype.id eq reader.id?'selected':''  } >${readertype.typeName }</option>
    				</c:forEach>
    			</select></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
