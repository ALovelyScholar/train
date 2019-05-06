<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>用户修改</title>
		<link type="text/css" rel="stylesheet" href="../css/window.css">
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>
	</head>

	<body class="openWinPage">
		<form id='form' name="form" style="margin: 0px;">
		<input type="hidden" name="id" value="${user.id}">
			<table width="100%" class="avidmTable">
				<tr class="left_col">
					<td align="right">
						<span>*</span>账户
					</td>
					<td align="left">
						<input type="text" id="account" name="account" value="${user.account}" maxlength="25"
							class='AvidmW250' />
					</td>
					</tr>
					<tr class="left_col">
					<td align="right">
						<span>*</span>密码
					</td>
					<td align="left">
						<input type="text" id="psw" name="psw" value="${user.psw}" maxlength="25"
							class='AvidmW250' />
					</td>
					</tr>
					<tr>
					<td align="right">
						<span>*</span>姓名
					</td>
					<td align="left">
						<input type="text" id="name" name="name" maxlength="25"
							class='AvidmW250' value="${user.name}"/>
					</td>
					</tr>
					<tr class="left_col">
					<td align="right">
						<span>*</span>身份证：
					</td>
					<td align="left">
					   <input type="text" id="cardNo" name="cardNo" maxlength="25"
							class='AvidmW250' value="${user.cardNo }"/>
					</td>
					</tr>
					<tr class="left_col">
					<td align="right">
						<span>*</span>联系方式：
					</td>
					<td align="left">
					   <input type="text" id="mobile" name="mobile" maxlength="25"
							class='AvidmW250' value="${user.mobile }"/>
					</td>
				</tr>
				 <tr class="left_col">
					<td align="right">
						<span>*</span>性别：
					</td>
					<td align="left">
					  <input type="radio" name="sex" value="男"  <c:if test="${user.sex=='男'}">checked="checked"</c:if>>男&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" <c:if test="${user.sex=='女'}">checked="checked"</c:if> value="女">女
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						<span>*</span>角色：
					</td>
					<td align="left">
					  <select id="roleId" name="roleId">
					  <c:forEach items="${list}" var="role">
					  	<option  value="${role.id}" <c:if test="${user.roleId==role.id}">selected="selected"</c:if>>${role.name}</option>
					  </c:forEach>
					  </select>
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
				var account=$("#account").val();
				var psw=$("#psw").val();
				var name=$("#name").val();
				var cardNo=$("#cardNo").val();
				var mobile=$("#mobile").val();
				if(account==''){
					layer.msg("账户不能为空");
					return;
				}
				if(psw==''){
					layer.msg("密码不能为空");
					return;
				}
				if(name==''){
					layer.msg("姓名不能为空");
					return;
				}
				if(cardNo==''){
					layer.msg("身份证不能为空");
					return;
				}
				if(mobile==''){
					layer.msg("联系方式不能为空");
					return;
				}
				  $.post("save",$("form").serialize(),function(data){
						if(data.code=='0'){
							 layer.alert("修改成功！");
							window.close();
							window.opener.page();
						}else{
							 layer.msg("修改失败！");
						}
					});	
			})
		});
		
	</script>
</html>