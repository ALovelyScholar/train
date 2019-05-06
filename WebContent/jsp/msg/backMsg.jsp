<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>留言</title>
		<link type="text/css" rel="stylesheet" href="../css/window.css">
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>
	</head>

	<body class="openWinPage">
		<form id='form' name="form" style="margin: 0px;">
			<input type="hidden" name="id" value="${msgId}">
			<table width="100%" class="avidmTable">
					<tr class="left_col">
					<td align="right">
						<span>*</span>内容：
					</td>
					<td align="left">
					    <textarea rows="10" cols="40" name="message" id="content"></textarea>
					</td>
				</tr>
				 
			</table>
		</form>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 20px;">
			<tr>
				<td class="exegesis" style="width: 220px;">
					<span>*</span> 为必选/必填项
				</td>
				<td>
					<input id="save" type="button"
						value="确定" />
					&nbsp;&nbsp;
					<input onclick="window.close()" type="button"
						value="关闭" />
				</td>
			</tr>
		</table>
	</body>
	<script type="text/javascript">
		
		layui.use('layer', function(){ //独立版的layer无需执行这一句
			  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
			  
			$("#save").on("click",function(){
				var content=$("#content").val();
				if(content==''){
					layer.msg("内容不能为空");
					return;
				}
				  $.post("../msg/saveBack",$("form").serialize(),function(data){
						if(data.code=='0'){
							 layer.alert("保存成功！");
							window.close();
						}else{
							 layer.msg("保存失败！");
						}
					});	
			})
		});
		
	</script>
</html>