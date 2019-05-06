<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>系统公告</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
 <jsp:include page="top.jsp"></jsp:include>
  <div class="searchTable">
   	标题
  <div class="layui-inline">
    <input class="layui-input" name="title" id="title" autocomplete="off">
  </div>
  <button id="searchButton" class="layui-btn" data-type="reload">搜索</button>
</div>         
 
<table class="layui-hide" id="list_data" lay-filter="user"></table> 
              

<script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
 
<script>

layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#list_data'
    ,url:'../notice/list'
    ,cellMinWidth: 200 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
    ,cols: [[
        {field:'title', width:280, title: '标题'}
      ,{field:'content', minWidth:220, title: '内容'}
      ,{field:'pubTime', width:170, title: '发布时间'}
    ]]
    ,id: 'testReload'
     ,page: true
     ,height: 315
  });
  
  var $ = layui.$, active = {
		    reload: function(){
		      var title = $('#title');
		      
		      if(title==''){
		    	  layer.msg("请输入标题");
		    	  return;
		      }
		      //执行重载
		      table.reload('testReload', {
		        page: {
		          curr: 1 //重新从第 1 页开始
		        }
		        ,where: {
		            title:title.val()		            
		        }
		      });
		    }
		  };
		  
		  $('#searchButton').on('click', function(){
		    var type = $(this).data('type');
		    active[type] ? active[type].call(this) : '';
		  });
		  
		  
});

</script>

</body>
</html>