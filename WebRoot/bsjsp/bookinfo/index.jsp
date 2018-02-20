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
	var page = $("#page").val();
	var currPage = $("#currPage").val();
	if(currPage==0){
		$("#perv").css("display","none");
	}	
	if(currPage==(page-1)){
		$("#next").css("display","none");
	}
});



$(function(){
	$("#next").click(function(){
		var currPage = $("#currPage").val();
		var pag= parseInt(currPage)+1;
		$("#currPage").attr("value",pag);
		$("#queryform").submit();
		return false;
	});
	
	$("#perv").click(function(){
		var currPage = $("#currPage").val();
		var pag= parseInt(currPage)-1;
		$("#currPage").attr("value",pag);
		$("#queryform").submit();
		return false;
	});
	
	$("#search").click(function(){
		$("#currPage").attr("value",0);
		$("#queryform").submit();
	});
	
	
});


function deletedata(id){
	var action = "/BookSystem/bookinfo/delete.do";
	params = "id="+id;
	$.post(action,params,function(data) {
		if (data=="1") {
			var d = dialog({
			    title: '删除',
			    content: '删除成功',
			    cancel: false,
			    ok: function () {
			    	$("#currPage").attr("value",0);
					$("#queryform").submit(); 
			    }
			});
			d.show();
		} else {
			var d = dialog({
			    title: '删除',
			    content: '删除失败,请先删除关联数据',
			    cancel: false,
			    ok: function () {}
			});
			d.show();
		}
	});

}

function modity(id){
	toSave(id);
}

$(function(){
	$("#add").click(function(){
		toSave();
	});
	
});

 //修改
function toSave(id) {
	var url = "/BookSystem/bookinfo/add.do";
	if(id!=''){
		url = "/BookSystem/bookinfo/add.do?id="+id;
	}
	seajs.config({
		  alias: {
		    "jquery": "jquery-1.10.2.js"
		  }
	});
	seajs.use(['../js/artDialog/src/dialog-plus'], function (dialog) {
		var d = dialog({
		    title: id==undefined?'添加':'编辑',
		   	height:400,
		    width:400, 
		    url: url,
		    okValue: '确定',
		    ok: function () {
		   		var params =this.iframeNode.contentWindow.frames.$('#editForm').serialize();
				var action = this.iframeNode.contentWindow.frames.$('#editForm').attr("action");
				//alert(params);
				//如果验证通过
				 $.post(action,params,function(data) {
					if (data=="1") {
						var d = dialog({
						    title: id==undefined?'添加':'编辑',
						    content: id==undefined?'添加成功':'编辑成功',
						    cancel: false,
						    ok: function () {
						    	$("#currPage").attr("value",0);
								$("#queryform").submit(); 
						    }
						});
						d.show();
					} else {
						var d = dialog({
						    title: id==undefined?'添加':'编辑',
						    content: id==undefined?'添加成功':'编辑成功',
						    cancel: false,
						    ok: function () {}
						});
						d.show();
					}
				});
		    },
		    cancelValue: '取消',
		    cancel: function () {}
		});
		d.show();
	}); 
} 

</script>
</head>
<body>
 <div id="wrap">
 <div id="top">
 <div class="logo"><img alt="ahut" src="../images/ahut.jpg" height="200px" width="1200px"></div>
 <div style="margin-top:10px">
	<span style="font-size:15px;font-weight:bold;">
		&nbsp;&nbsp;
		${managername}
	</span>
</div>
 <div id="nav">
 </div>
 </div>
 <div id="main">
  <div class="mainleft">
   <ul>
   <c:if test="${readerId=='user' }">
   		<li><a href="/BookSystem/bookinfo/list.do?role=user" class="hover">书籍信息 </a></li>
   		<li><a href="/BookSystem/infopublish/list.do?role=user" >信息发布</a></li>
   </c:if>
   <c:if test="${readerId=='root' }">
	    <li><a href="/BookSystem/library/list.do" >借阅管理</a></li>
	    <li><a href="/BookSystem/readerinfo/list.do">读者管理 </a></li>
	    <li><a href="/BookSystem/bookinfo/list.do" class="hover">图书管理 </a></li>
	    <li><a href="/BookSystem/booktype/list.do">书籍类别</a></li>
	    <li><a href="/BookSystem/bookcase/list.do">馆藏管理</a></li>
	    <li><a href="/BookSystem/readertype/list.do">读者类别 </a></li>
	    <li><a href="/BookSystem/manager/list.do">权限管理</a></li>
	     <li><a href="/BookSystem/infopublish/list.do" >公告管理</a></li>
   </c:if>
   </ul>
  </div>
  <div class="mainright">
   <div class="content">
   	<div style="margin-top:15px; text-align:center;">
   		<form action="/BookSystem/bookinfo/list.do" method="post" id ="queryform">
	   		<input type="hidden" id ="page" name ="page" value="${pageData.page}"/>
	   		<input type="hidden" id ="currPage" name ="currPage" value="${pageData.currPage}"/>
	   		<span >
	   			<select name ="select" id ="booktype" style="width:170px;">
    				<option value ="" >请选择..</option>
    				<c:forEach var="bookType" items="${bookTypeList }">
    					<option value="${bookType.id }" ${param.select eq bookType.id?'selected':''  } >${bookType.typeName }</option>
    				</c:forEach>
    			</select>
	   		</span>
	   		<span >
	   			<input type="text" id = "content" name = "content" value ="${content }" placeholder="请输入书名"/>
	   			<img title="查找" style="top: 9px;position: relative;" width="30px" height="30px" src="../images/find.png" id="search"/>
	   		</span>
   		</form>
   	</div>
   	<c:if test="${readerId=='root' }">
	   	<div style="margin-left:860px;">
	   		<span ><img title="添加" width="20px" height="20px" src="../images/add.png" id = "add" name = "add"/></span>
	   	</div>
	</c:if>
   <!--  <h3>123<sub>JOINS US</sub></h3> -->
	<!-- <p>&nbsp;</p> -->
	<!-- <br/> -->
	<div style="margin-top:10px; text-align:center;">
   		<table class="table table-hover table-bordered MT10" border="1" >
					<tr>
						<th width="50px;">书号</th>
						<th width="121px;">书名</th>
						<th width="121px;">ISBN</th>
						<th width="121px;">出版社</th>
						<th width="80px;">馆藏地</th>
						<th width="105px;">类别</th>
						<th width="70px;">书总量</th>
						<th width="70px;">现有量</th>
						<th width="70px;">价格</th>
						<c:if test="${readerId=='root' }">
							<th width="95px;">操作</th>
						</c:if>
					</tr>
					<c:if test="${pageData.list.size() > 0}">
						<c:forEach items="${pageData.list}" var="item" varStatus="vs">
							<tr>
								<td id="code" style="text-align:center;"><c:out value="${item.bookcode}" /></td>
								<td id="bookname" style="text-align:center;"><c:out value="${item.bookname}" /></td>
								<td id="isbn" style="text-align:center;"><c:out value="${item.isbn}" /></td>
								<td id="bookaddress" style="text-align:center;"><c:out value="${item.bookaddress}" /></td>
								<td id="bookcase" style="text-align:center;"><c:out value="${item.bookcase.name}" /></td>
								<td id="booktype" style="text-align:center;"><c:out value="${item.booktype.typeName}" /></td>
								<td id="booksum" style="text-align:center;"><c:out value="${item.totalbook}" /></td>
								<td id="currsum" style="text-align:center;"><c:out value="${item.currbook}" /></td>
								<td id="price" style="text-align:center;"><c:out value="${item.bookprice}" /></td>
								<c:if test="${readerId=='root' }">
									<td style="text-align:center;">
										<a href="javascript:void(0)" id = "modity" name = "modity" onclick = "modity('${item.id}');"><img title="编辑" width="20px" height="20px" src="../images/edit.png"></img></a>
										<a href="javascript:void(0)" id = "delete" name = "delete" onclick = "deletedata('${item.id}');"><img title="删除" width="20px" height="20px" src="../images/delete.png"></img></a>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
				<c:if test="${pageData.total < 1}">
					<tr>
						<td colspan="7" style="color: red">没有记录</td>
					</tr>
				</c:if>
	        </table>
   		
   	</div>
   	<div>
		<span><a href="" id ="perv" name ="perv" value="">上一页</a>&nbsp;&nbsp;当前${pageData.currPage +1}页&nbsp;&nbsp;<a href="" id ="next" name ="next" value ="">下一页</a>&nbsp;&nbsp;总共${pageData.page }页</span>
   	</div>
  </div>
 </div>
 </div>
 	<div id="footer">
			<p align="center">地址：XX省XX市XX区XX街道  邮编：025025</p>
				<p align="center">版权所有：豆瓣图书馆<p>
	</div>
 </div>
</body>
</html>
