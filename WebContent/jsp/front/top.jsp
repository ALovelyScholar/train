<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul class="layui-nav">
  <li class="layui-nav-item">
    <a href="/spring/product/index">购票</a>
  </li>
  <li class="layui-nav-item">
    <a href="/spring/product/notice">系统公告</a>
  </li>
  <c:if test="${sessionScope.loginUser!=null}">
  <li class="layui-nav-item">
    <a href="/spring/product/message">我的留言</a>
  </li>
   <li class="layui-nav-item">
    <a href="/spring/product/order">我的订单</a>
  </li>
  </c:if>
  <c:if test="${sessionScope.loginUser.roleId==1}">
  <li class="layui-nav-item">
  	<a href="/spring/index">意念后台</a>
  </li>
  </c:if>
  <li class="layui-nav-item" lay-unselect="">
  	<c:if test="${sessionScope.loginUser==null}">
  		<a href="/spring/login.jsp">登录</a>
  	</c:if>
  	<c:if test="${sessionScope.loginUser!=null}">
    <a href="javascript:;"><img src="../img/logo.jpg" class="layui-nav-img">${sessionScope.loginUser.name}</a>
    <dl class="layui-nav-child">
      <dd><a href="javascript:logOut();">退了</a></dd>
    </dl>
    </c:if>
  </li>
   	<c:if test="${sessionScope.loginUser==null}">
  <li class="layui-nav-item">
  	<a href="/spring/register.jsp">注册</a>
  </li>
  </c:if>
</ul>
<br>
<script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" >
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});

function logOut(){
	$.post("/spring/login/out",null,function(data){
		if(data.code=='0'){
            window.location.href="index";
		}
	});
}
</script>