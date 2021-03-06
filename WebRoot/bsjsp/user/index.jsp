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
		alert($("#currPage").val());
		$("#queryform").submit();
		return false;
	});
	
	$("#perv").click(function(){
		var currPage = $("#currPage").val();
		var pag= parseInt(currPage)-1;
		$("#currPage").attr("value",pag);
		alert($("#currPage").val());
		$("#queryform").submit();
		return false;
	});
	
	$("#search").click(function(){
		$("#currPage").attr("value",0);
		$("#queryform").submit();
	});
	
	
});


function deletedata(id){
	var action = "/BookSystem/infopublish/delete.do";
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
	var url = "/BookSystem/infopublish/add.do";
	if(id!=''){
		url = "/BookSystem/infopublish/add.do?id="+id;
	}
	seajs.config({
		  alias: {
		    "jquery": "jquery-1.10.2.js"
		  }
	});
	seajs.use(['../js/artDialog/src/dialog-plus'], function (dialog) {
		var d = dialog({
		    title: id==undefined?'添加':'编辑',
		   height:200,
		   width:250, 
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

function look(id) {
	var url = "/BookSystem/infopublish/look.do?id="+id;
	seajs.config({
		  alias: {
		    "jquery": "jquery-1.10.2.js"
		  }
	});
	seajs.use(['../js/artDialog/src/dialog-plus'], function (dialog) {
		var d = dialog({
		    title: '查看',
		   height:400,
		   width:600, 
		    url: url,
		    okValue: '确定',
		    ok: function () {
		   		
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
   		<li><a href="/BookSystem/bookinfo/list.do?role=user">书籍信息 </a></li>
   		<li><a href="/BookSystem/infopublish/list.do?role=user"  class="hover">信息发布</a></li>
   </c:if>
   <c:if test="${readerId=='root' }">
	    <li><a href="/BookSystem/library/list.do" >借阅管理</a></li>
	    <li><a href="/BookSystem/readerinfo/list.do">读者管理 </a></li>
	    <li><a href="/BookSystem/bookinfo/list.do" >图书管理 </a></li>
	    <li><a href="/BookSystem/booktype/list.do">书籍类别</a></li>
	    <li><a href="/BookSystem/bookcase/list.do">馆藏管理</a></li>
	    <li><a href="/BookSystem/readertype/list.do">读者管理 </a></li>
	    <li><a href="/BookSystem/manager/list.do">权限管理 </a></li>
	     <li><a href="/BookSystem/infopublish/list.do" class="hover">公告管理</a></li>
   </c:if>
   </ul>
  </div>
  <div class="mainright">
   <div class="content">
   	<div style="margin-top:15px; text-align:center;">
   		<form action="/BookSystem/infopublish/list.do" method="post" id ="queryform">
	   		<input type="hidden" id ="page" name ="page" value="${pageData.page}"/>
	   		<input type="hidden" id ="currPage" name ="currPage" value="${pageData.currPage}"/>
	   		<span >
	   			<input type="text" id = "content" name = "content" value ="${content }" placeholder="请输入标题"/>
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
						<th width="100px;">序号</th>
						<th width="380px;">标题</th>
						<th width="215px;">发布时间</th>
						<c:if test="${readerId=='user' }">
							<th width="195px;">操作</th>
						</c:if>
						<c:if test="${readerId=='root' }">
							<th width="95px;">操作</th>
						</c:if>
					</tr>
					<c:if test="${pageData.list.size() > 0}">
						<c:forEach items="${pageData.list}" var="item" varStatus="vs">
							<tr>
								<td id="count" style="text-align:center;"><c:out value="${vs.count}" /></td>
								<td id="title" style="text-align:center;"><c:out value="${item.title}" /></td>
								<td id="createTime" style="text-align:center;"><c:out value="${item.createTime}" /></td>
								<td style="text-align:center;">
									<c:if test="${readerId=='user' }">
										<a href="javascript:void(0)" id = "look" name = "look" onclick = "look('${item.id}');"><span> 查看 </span></a>
								    </c:if>
									<c:if test="${readerId=='root' }">
										<a href="javascript:void(0)" id = "modity" name = "modity" onclick = "modity('${item.id}');"><img title="编辑" width="20px" height="20px" src="../images/edit.png"></img></a>
										<a href="javascript:void(0)" id = "look" name = "look" onclick = "look('${item.id}');"><img title="查看" width="20px" height="20px" src="../images/detail.png"></img></a>
										<a href="javascript:void(0)" id = "delete" name = "delete" onclick = "deletedata('${item.id}');"><img title="删除" width="20px" height="20px" src="../images/delete.png"></img></a>
									</c:if>
								</td>
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
				<p align="center">版权所有：豆瓣图书馆</p>
	</div>
 </div>
</body>
</html>
