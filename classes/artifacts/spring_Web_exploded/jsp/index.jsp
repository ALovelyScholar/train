<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>意念火车票预定系统</title>
  <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">意念火车票预定系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;" >
          <img src="img/logo.jpg" class="layui-nav-img">
         ${sessionScope.loginUser.name}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="product/index">首页</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="javascript:logOut()">退了</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" id="menuList"  lay-filter="test">
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
	<iframe src="main" frameborder="0" name="mainFrame" width="100%" height="500px" class="layadmin-iframe"></iframe>
</div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    意念火车票预订系统
  </div>
</div>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/jquery.min.js?v=2.1.4"></script>
<script>
$(function(){
	$.post("role/menu",null,function(data){
		console.log(data);
		var html="";
		if(data.code=='0'){
			for(var i=0;i<data.data.length;i++){
				html+='<li class="layui-nav-item"><a target="mainFrame" href='+data.data[i].url+'>'+data.data[i].name+'</a></li>';
			}
			$("#menuList").html(html);
		}
	});
	
});
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});


</script>
</body>
</html>