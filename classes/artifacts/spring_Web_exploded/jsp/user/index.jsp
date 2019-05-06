<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
  <div class="searchTable">
 	 账户
  <div class="layui-inline">
    <input class="layui-input" name="account" id="account" autocomplete="off">
  </div>
   	姓名
  <div class="layui-inline">
    <input class="layui-input" name="name" id="name" autocomplete="off">
  </div>
  <button id="searchButton" class="layui-btn" data-type="reload">搜索</button>
</div>         
<div align="right">
<div class="layui-btn-group">
	<button class="layui-btn layui-btn-sm" id="add"><i class="layui-icon"></i></button>
	<button class="layui-btn layui-btn-sm" id="edit"><i class="layui-icon"></i></button>
    <button  id="deleteButton" class="layui-btn layui-btn-sm"><i class="layui-icon"></i></button>
  </div>
</div>
<table class="layui-hide" id="list_data" lay-filter="user"></table> 
              

<script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
 <script type="text/javascript" src="../js/openwindow.js"></script>
<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#list_data'
    ,url:'list'
    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
    ,cols: [[
         {checkbox: true, fixed: true}
      ,{field:'account', width:150, title: '账户'}
      ,{field:'name', width:150, title: '姓名'}
      ,{field:'sex', width:80, title: '性别'}
      ,{field:'cardNo', width:180, title: '身份证'}
      ,{field:'mobile',width:150, title: '联系方式'}
      ,{field:'roleName',width:150, title: '角色'}
      ,{field:'createTime',width:180, title: '创建时间'}
    ]]
    ,id: 'testReload'
     ,page: true
     ,height: 315
  });
  
  var $ = layui.$, active = {
		    reload: function(){
		      var account = $('#account');
		      var name=$("#name");
		      //执行重载
		      table.reload('testReload', {
		        page: {
		          curr: 1 //重新从第 1 页开始
		        }
		        ,where: {
		            account: account.val(),
		            name:name.val()
		        }
		      });
		    }
		  };
		  
		  $('#searchButton').on('click', function(){
		    var type = $(this).data('type');
		    active[type] ? active[type].call(this) : '';
		  });
		  
		  $('#deleteButton').on('click', function(){
			  var checkStatus = table.checkStatus('testReload')
		      ,data = checkStatus.data;
			  if(data.length<=0){
				  layer.msg("请选择要删除的数据");
				  return;
			  }
		      	var arry="";
				for(var i=0;i<data.length;i++){
						if(arry==''){
						arry+="ids="+data[i].id;
						}else{
						arry+="&ids="+data[i].id;
						}
				}
		      $.post("delete",arry,function(data){
					if(data.code=="0"){
						 layer.msg("删除数据成功！");
						 table.reload('testReload', {
						        page: {
						          curr: 1 //重新从第 1 页开始
						        }
						      });
					}else{
						 layer.msg("删除数据失败！");
					}
				});
			  });
		  
		  $('#add').on('click', function(){
			  var url="init";
				openWindow(url,500,450);
		  });
		  
		  $('#edit').on('click', function(){
			  var checkStatus = table.checkStatus('testReload')
		      ,data = checkStatus.data;
			  if(data.length<=0||data.length>1){
				  layer.msg("请选择一条数据数据");
				  return;
			  }
			  
			  var url="detail?id="+data[0].id;
				openWindow(url,500,450);
		  });
});
</script>

</body>
</html>