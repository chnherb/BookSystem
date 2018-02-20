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
    <form action = "/BookSystem/bookinfo/save.do" method="post" id="editForm">
    	<table border="1px" style="text-align:center;">
    		<input type ="hidden" name = "id" id="id" value="${bookinfo.id }"/>
    		<tr>
    			<td>编号</td>
    			<td><input type="text" name ="bookcode" id ="code" value ="${bookinfo.bookcode }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>书名</td>
    			<td><input type="text" name ="bookname" id ="bookname" value ="${bookinfo.bookname }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>ISBN</td>
    			<td><input type="text" name ="isbn" id ="isbn" value ="${bookinfo.isbn }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>出版社</td>
    			<td><input type="text" name ="bookaddress" id ="bookaddress" value ="${bookinfo.bookaddress }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>价格</td>
    			<td><input type="text" name ="bookprice" id ="price" value ="${bookinfo.bookprice }" class="{required:true,minlength:5}"/></td> 
    		</tr>
    		<tr>
    			<td>作者</td>
    			<td><input type="text" name ="bookauthor" id ="author" value ="${bookinfo.bookauthor }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>数量</td>
    			<td><input type="text" name ="totalbook" id ="page" value ="${bookinfo.totalbook }" class="{required:true,minlength:5}"/>
    			<input type="hidden" name ="currbook" id ="currpage" value ="${bookinfo.currbook }" class="{required:true,minlength:5}"/></td>
    			
    		</tr>
    		<tr>
    			<td>进书时间</td>
    			<td><input type="text" name ="bookintime" id ="datepicker" value ="${bookinfo.bookintime }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>位置</td>
    			<!-- <td><input type="text" name ="managerid.id" id ="managerid" class="{required:true,minlength:5}"/></td> -->
    			<td><select name ="bookcase.id" id ="bookcase" style="width:170px;">
    				<option value ="" >请选择..</option>
    				<c:forEach var="boocase" items="${bookCaseList }">
    					<option value="${boocase.id }" ${bookinfo.bookcase.id eq boocase.id?'selected':''  } >${boocase.name }</option>
    				</c:forEach>
    			</select></td>
    		</tr>
    		<tr>
    			<td>分类</td>
    			<!-- <td><input type="text" name ="managerid.id" id ="managerid" class="{required:true,minlength:5}"/></td> -->
    			<td><select name ="booktype.id" id ="booktype" style="width:170px;">
    				<option value ="" >请选择..</option>
    				<c:forEach var="bookType" items="${bookTypeList }">
    					<option value="${bookType.id }" ${bookinfo.booktype.id eq bookType.id?'selected':''  } >${bookType.typeName }</option>
    				</c:forEach>
    			</select></td>
    		</tr>
    		<tr>
    			<td>备注</td>
    			<td><input type="text" name ="bookcomment" id ="comment" value="${bookinfo.bookcomment }" class="{required:true,minlength:5}"/></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
