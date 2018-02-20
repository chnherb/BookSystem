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

<link rel="stylesheet" href="../js/jquery-ui-1.9.2.custom/development-bundle/themes/base/jquery.ui.all.css">
<script src="../js/jquery-ui-1.9.2.custom/development-bundle/jquery-1.8.3.js"></script>
<script src="../js/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.core.js"></script>
<script src="../js/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.widget.js"></script>
<script src="../js/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.datepicker.js"></script>
<link rel="stylesheet" href="../js/jquery-ui-1.9.2.custom/development-bundle/demos/demos.css">
<script src="../js/jquery-ui-1.9.2.custom/development-bundle/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
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
	
	$("#daochu").click(function(){
		var select = $("#select").val();
		var endtime = $("#endtime").val();
		var form_1 = document.createElement("form");
		document.body.appendChild(form_1); 
		form_1.action = "/BookSystem/library/report.do";
		form_1.method="post";
		var i = document.createElement("input"); i.type = "hidden"; form_1.appendChild(i); i.value = select; i.name = "select";
		var j = document.createElement("input"); j.type = "hidden"; form_1.appendChild(j); j.value = endtime; j.name = "endtime";
		form_1.submit();
		//$("#queryform").submit();
	});
	
	
});


function deletedata(id){
	var action = "/BookSystem/library/delete.do";
	params = "id="+id;
	$.post(action,params,function(data) {
		if (data=="1") {
			var d = dialog({
			    title: '删除',
			    /* width: 50, */
			    content: '删除成功',
			    cancel: false,
			    ok: function () {
			    	/* var form_1 = document.createElement("form");
					document.body.appendChild(form_1); 
					form_1.action = "/BookSystem/library/list.do";
					form_1.method="post";
					form_1.submit(); */
					$("#currPage").attr("value",0);
					$("#queryform").submit(); 
			    }
			});
			d.show();
		} else {
			var d = dialog({
			    title: '删除',
			    content: '删除失败',
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
	var url = "/BookSystem/library/add.do";
	if(id!=''){
		url = "/BookSystem/library/add.do?id="+id;
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
						    	/* var form_1 = document.createElement("form");
								document.body.appendChild(form_1); 
								form_1.action = "/BookSystem/library/list.do";
								form_1.method="post";
								form_1.submit(); */
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

$(function() {
	$( "#endtime" ).datepicker();
	$( "#datepicker" ).datepicker( $.datepicker.regional[ "zh-CN" ] );
});

$(function(){
	
	var d = new Date();
	var str;
	if((d.getMonth()+1)<10){
		str = d.getFullYear()+"-0"+(d.getMonth()+1);
	}else{
		str = d.getFullYear()+"-"+(d.getMonth()+1);
	}
	if(d.getDate() < 10){
		str += "-0"+d.getDate();
	}else{
		str += "-"+d.getDate();
	}
	var sum = $("#sum").val();
	for(var i=1; i<=sum;i++){
		var isback = $("#isback"+i).val();
		var backTime = $("#backTime"+i).val();
		if(backTime <= str&&isback=='未还'){
			$("#backTime"+i).parent().parent().css('backgroundColor','red');
		}
		
	}
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
		${managername}
	</span>
</div>
 <div id="nav">
 </div>
 </div>
 <div id="main">
  <div class="mainleft">
   <ul>
    <li><a href="/BookSystem/library/list.do" class="hover">借阅管理</a></li>
    <li><a href="/BookSystem/readerinfo/list.do">读者管理</a></li>
    <li><a href="/BookSystem/bookinfo/list.do">图书管理</a></li>
    <li><a href="/BookSystem/booktype/list.do">书籍类别</a></li>
    <li><a href="/BookSystem/bookcase/list.do">馆藏管理</a></li>
    <li><a href="/BookSystem/readertype/list.do">读者类别 </a></li>
    <li><a href="/BookSystem/manager/list.do">权限管理</a></li>
     <li><a href="/BookSystem/infopublish/list.do" >公告管理 </a></li>
    
   </ul>
  </div>
  <div class="mainright">
   <div class="content">
   	<div style="margin-top:15px; text-align:center;">
   		<form action="/BookSystem/library/list.do" method="post" id ="queryform">
	   		<input type="hidden" id ="page" name ="page" value="${pageData.page}"/>
	   		<input type="hidden" id ="currPage" name ="currPage" value="${pageData.currPage}"/>
	   		<span >
	   			<select id="select" name ="select" style="width:60px;">
	   				<option value="">全部</option>
	   				<option value="未还" ${param.select eq '未还'?'selected':'' }>未还</option>
		   			<option value="已还" ${param.select eq '已还'?'selected':'' }>已还</option>
	   			</select>
	   			<input type="text" id = "readerno" name = "readerno" value ="${readerno }" placeholder="读者编号"/>
	   			<img title="查找" style="top: 9px;position: relative;" width="30px" height="30px" src="../images/find.png" id="search"/>
	   		</span>
   		</form>
   	</div>
   	<div style="margin-left:570px;">
   		<span ><span style="float:left">还书时间：</span><input type="text" style="float:left" value ="" id = "endtime" name = "endtime"/>&nbsp;&nbsp;<img title="导出文档" width="20px" height="20px" src="../images/export.png" id = "daochu"/></span>
   		<span >&nbsp;&nbsp;<img title="添加" width="20px" height="20px" src="../images/add.png" id = "add" name = "add"/></span>
   	</div>
   <!--  <h3>123<sub>JOINS US</sub></h3> -->
	<!-- <p>&nbsp;</p> -->
	<!-- <br/> -->
	<div style="margin-top:10px; text-align:center;">
		<input type="hidden" id ="sum" value="${pageData.list.size()}"/>
   		<table class="table table-hover table-bordered MT10" border="1" >
					<tr>
						<th width="75px;">书号</th>
						<th width="75px;">书名</th>
						<th width="95px;">借书日期</th>
						<th width="95px;">还书日期</th>
						<th width="95px;">馆藏地</th>
						<th width="95px;">借书人姓名</th>
						<th width="95px;">借书人编号</th>
						<th width="75px;">是否已还</th>
						<th width="60px;">续借次数</th>
						<th width="95px;">操作</th>
					</tr>
					<c:if test="${pageData.list.size() > 0}">
						<c:forEach items="${pageData.list}" var="item" varStatus="vs">
							<tr>
								<td id="code" style="text-align:center;"><c:out value="${item.bookinfo.bookcode}" /></td>
								<td id="bookname" style="text-align:center;"><c:out value="${item.bookinfo.bookname}" /></td>
								<td id="borrowTime" style="text-align:center;"><c:out value="${item.borrowTime}" /></td>
								<td id="backTime" style="text-align:center;"><c:out value="${item.backTime}" />
									<input type="hidden" id="backTime${vs.count }" value="${item.backTime}"/>
								</td>
								<td id="bookcase" style="text-align:center;"><c:out value="${item.bookinfo.bookcase.name}" /></td>
								<td id="reader" style="text-align:center;"><c:out value="${item.reader.name}" /></td>
								<td id="readerno" style="text-align:center;"><c:out value="${item.reader.readerno}" /></td>
								<td id="isback" style="text-align:center;"><c:out value="${item.isback}" />
									<input type="hidden" id="isback${vs.count }" value="${item.isback}"/>
								</td>
								<td id="money" style="text-align:center;"><c:out value="${item.money}" /></td>
								<td style="text-align:center;">
									<a href="javascript:void(0)" id = "modity" name = "modity" onclick = "modity('${item.id}');"><img title="编辑" width="20px" height="20px" src="../images/edit.png"></img></a>
									<a href="javascript:void(0)" id = "delete" name = "delete" onclick = "deletedata('${item.id}');"><img title="删除" width="20px" height="20px" src="../images/delete.png"></img></a>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				<c:if test="${pageData.total < 1}">
					<tr>
						<td colspan="11" style="color: red">没有记录</td>
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
