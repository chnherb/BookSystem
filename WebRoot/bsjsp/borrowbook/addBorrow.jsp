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
$().ready(function() {
 /* $("#editForm").validate(); */
});
$(function() {
	$( "#datepicker" ).datepicker();
	$( "#datepicker1" ).datepicker();
	$( "#datepicker" ).datepicker( $.datepicker.regional[ "zh-CN" ] );
});

</script>
</head> 
  <body>
    <form action = "/BookSystem/library/save.do" method="post" id="editForm">
    	<table border="1px" style="text-align:center;">
    		<input type ="hidden" name = "id" id="id" value="${borrow.id }"/>
    		<tr>
    			<!-- class="{required:true,minlength:5,messages:{required:'请输入内容'}}" -->
    			<!-- class="{required:true,minlength:5}" -->
    			<!-- http://www.w3cschool.cc/jquery/jquery-plugin-validate.html -->
    			<td>读者编号</td>
    			<td><select name ="reader.id" id ="readerid" style="width:170px;">
    				<option value ="" >请选择..</option>
    				<c:forEach var="reader" items="${readerList }">
    					<option value="${reader.id }" ${borrow.reader.id eq reader.id?'selected':''  }>${reader.readerno }</option>
    				</c:forEach>
    			</select></td>
    			<!-- <input type="hidden" name ="reader.id" id ="readerid" value="" class="{required:true,minlength:5}"/> -->
    		</tr>
    		<tr>
    			<td>书号</td>
    			<!-- <td><input type="text" name ="bookinfo.id" id ="bookinfoid" class="{required:true,minlength:5}"/></td> -->
    			<td><select name ="bookinfo.id" id ="bookinfoid" style="width:170px;">
    				<option value ="" >请选择..</option>
    				<c:forEach var="book" items="${bookList }">
    					<option value="${book.id }" ${borrow.bookinfo.id eq book.id?'selected':''  }>${book.bookcode }</option>
    				</c:forEach>
    			</select></td>
    		</tr>
    		<tr>
    			<td>借阅时间</td>
    			<td><input type="text" name ="borrowTime" id ="datepicker" value ="${borrow.borrowTime }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>还书时间</td>
    			<td><input type="text" name ="backTime" id ="datepicker1" value ="${borrow.backTime }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>是否还回</td>
    			<td>
    				<%-- <input type="text" name ="isback" id ="isback" value ="${borrow.isback }" class="{required:true,minlength:5}"/> --%>
    				<select name ="isback" id ="isback" style="width:172px;">
		   				<option value="未还" ${borrow.isback eq '未还'?'selected':'' }>未还</option>
		   				<option value="已还" ${borrow.isback eq '已还'?'selected':'' }>已还</option>
		   			</select>
    			</td>
    		</tr>
    		<tr>
    			<td>办理人</td>
    			<!-- <td><input type="text" name ="managerid.id" id ="managerid" class="{required:true,minlength:5}"/></td> -->
    			<td><select name ="managerid.id" id ="managerid" style="width:170px;">
    				<option value ="" >请选择..</option>
    				<c:forEach var="manager" items="${managerList }">
    					<option value="${manager.id }" ${borrow.managerid.id eq manager.id?'selected':''  } >${manager.name }</option>
    				</c:forEach>
    			</select></td>
    		</tr>
    		<tr>
    			<td>续借次数</td>
    			<td><input type="text" name ="money" id ="money" value="${borrow.money }" class="{required:true,minlength:5}"/></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
