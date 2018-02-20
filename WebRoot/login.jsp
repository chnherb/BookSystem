<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<title>图书馆管理系统</title>

<script type="text/javascript" src="js/jquery.js"></script>

<script src="js/artDialog/lib/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="js/artDialog/css/ui-dialog.css">
<script src="js/artDialog/dist/dialog-min.js"></script>
<link href="css.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

$(function(){
	$("#submit").click(function(){
		var readerno = $("#readerno").val();
		var password = $("#password").val();
		$.ajax({
			url:"/BookSystem/login/readerlogin.do",
			data:{
				readerno:readerno,
				password:password
			},
			type: 'post',
			async: false,
			success: function(data, textStatus, jqXHR){
				//alert(data);
				if(data=="1"){
					//alert("123");
					/* var d = dialog({
					    title: '欢迎',
					    content: '欢迎使用 artDialog 对话框组件！'
					});
					d.show(); */
						
					var form = document.forms[0];
					//var form = document.createElement("form");
					//document.body.appendChild(form); 
					form.action = "/BookSystem";
					form.method="post";
					form.submit(); 
					
				}else{
					//$.dialog.alert({content:"用户名或密码错误"});
					alert("用户名或密码错误");
					/* $("#password").attr('value','');
					$("#name").attr('value',''); */
				}
			}
		});	
	});

});

</script>
</head>
<body>
<div id="wrap" >
	 <div id="top">
	 <div class="logo"><img alt="ahut" src="images/ahut.jpg" height="200px" width="1200px"></div>
	 <div id="nav">
	 </div>
	 </div>
</div>
 <br/>
 <p style="font-size: 30px" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;读者登录</p>
	<div style="margin-top:50px; text-align: center;" align="center">
		
		<form action="">
		
		<table style="text-align: center; margin-left: -133px;left: 50%;position: relative;" >
			
			<tr>
				<td>借阅编号：</td>
				<td>
					<input type="text" id="readerno" name = "readerno"/>
				</td>
			</tr>
			<tr>
				<td>密&nbsp;&nbsp;码：</td>
				<td>
					<input type="password" id ="password" name = "password"/>
				</td>
			</tr>
			<tr>
				<td style="text-align:right">
					<input type="submit" id="submit" value="登陆"/> 
				</td>
			</tr>
		</table>
	</form>
	
	</div>
</body>
</html>
