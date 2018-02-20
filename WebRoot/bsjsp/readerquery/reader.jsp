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
<script type="text/javascript">


$(function(){
	
	$("#edit").click(function(){
		var params = $("#editForm").serialize();
		var action = $("#editForm").attr("action");
        $.post(action,params,function(data){
       	if(data=="1"){
            alert("修改成功");
       	}else{
       		alert("修改失败");
       	}
    	}); 
    });
});

</script>
</head>
<body>
 <div id="wrap">
 <div id="top">
 <div class="logo"><img alt="ahut" src="../images/ahut.jpg" height="200px" width="1200px"></div>
 <div style="margin-top:10px">
	<span style="font-size:15px;font-weight:bold;">
		&nbsp;&nbsp;
		${readerno}
	</span>
</div>
 <div id="nav">
 </div>
 </div>
 <div id="main">
  <div class="mainleft">
   <ul>
    <li><a href="/BookSystem/readerquery/list.do?readerno=${readerno}" >借阅历史</a></li>
    <li><a href="/BookSystem/readerquery/selfinfo.do?readerno=${readerno}" class="hover">个人信息 </a></li>
    <li><a href="/BookSystem/readerquery/alterpwd.do?readerno=${readerno}" >修改密码 </a></li>
   
   </ul>
  </div>
  <div class="mainright">
   <div class="content">
 
   
  
	<div style="margin-top:10px; text-align:center;">
	<form action = "/BookSystem/readerinfo/save.do" method="post" id="editForm">
    	<table border="1px" style="text-align:center;">
    		<input type ="hidden" name = "id" id="id" value="${reader.id }"/>
    		<input type ="hidden" name = "pwd" id="pwd" value="${reader.pwd }"/>
    		<tr>
    			<td>姓名</td>
    			<td><input readonly="true" type="text" name ="name" id ="name" value="${reader.name }" class="{required:true,minlength:5}"/></td>
    		</tr>
    		<tr>
    			<td>性别</td>
    			<td><select readonly="true" name ="sex" id ="sex" style="width:170px;">
    				<option value ="男" >男</option>
    				<option value ="女" >女</option>
    			</select></td>
    		</tr>
    		<tr>
    			<td>编号</td>
    			<td><input type="text" readonly="true" name ="readerno" id ="readerno" value ="${reader.readerno }" class="{required:true,minlength:5}"/></td>
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
    			<td><select name ="readerType.id" readonly="true" id ="readerTypeid" style="width:170px;">
    				<option value ="" >请选择..</option>
    				<c:forEach var="readertype" items="${readerTypeList }">
    					<option value="${readertype.id }" ${readertype.id eq reader.id?'selected':''  } >${readertype.typeName }</option>
    				</c:forEach>
    			</select></td>
    		</tr>
    	</table>
    	<input type="button" value="修改" id="edit"/>
    </form>
   	</div>
   	
  </div>
 </div>
 </div>
	<div id="footer">
			<p align="center">地址：XX省XX市XX区XX街道  邮编：025025</p>
				<p align="center">版权所有：豆瓣图书馆</p>
	</div>
 </div>
</body>
</html>
