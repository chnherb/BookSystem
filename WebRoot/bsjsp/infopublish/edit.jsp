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
	
	$("#page").blur(function(){
		var currpage = $("#currpage").val();
		if(currpage==''){
		var page = $("#page").val();
		$("#currpage").attr("value", page);
		}
	});
	
});
$(function() {
	$( "#datepicker" ).datepicker();
	$( "#datepicker" ).datepicker( $.datepicker.regional[ "zh-CN" ] );
});

</script>
</head> 
  <body>
    <form action = "/BookSystem/infopublish/save.do" method="post" id="editForm">
    	<table border="1px" style="text-align:center;" width="400px";>
    		<input type ="hidden" name = "id" id="id" value="${infoPublish.id }"/>
    		<tr>
    			<td>标语</td>
    			<td><input type="text" name ="title" id ="title" value ="${infoPublish.title }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>内容</td>
    			<td><textarea name ="comment" id ="comment" value="${infoPublish.comment }"  style="width:250px; height:200px;">${infoPublish.comment }</textarea></td>
    		</tr>
    		<tr>
    			<td>发布时间</td>
    			<td><input type="text" name ="createTime" id ="datepicker" value ="${infoPublish.createTime }" class="{required:true,minlength:5}"/></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
