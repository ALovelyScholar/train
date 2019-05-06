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
  <script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<div class="searchTable">
 	出发时间
  <div class="layui-inline">
    <input class="layui-input" name="start" id="start" readonly="readonly" class="Wdate" onClick="WdatePicker()" autocomplete="off">
  </div>至
  <div class="layui-inline">
    <input class="layui-input" name="end" id="end" readonly="readonly" class="Wdate" onClick="WdatePicker()" autocomplete="off">
  </div>
  <button id="searchButton" class="layui-btn" data-type="reload">搜索</button>
</div>         
 
<table class="layui-hide" id="list_data" lay-filter="user"></table> 
              

<script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/openwindow.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
 
<script>

layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#list_data'
    ,url:'list'
    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
    ,cols: [[
         {checkbox: true, fixed: true}
      ,{field:'name', width:80, title: '车次'}
      ,{field:'startAddress', width:120, title: '始发站/出发地'}
      ,{field:'endAddress', width:120, title: '终点站/目的地'}
      ,{field:'trainDateMsg', width:120, title: '发车日期'}
      ,{field:'trainTime', width:100, title: '发车时间'}
      ,{field:'trainTypeMsg',width:80, title: '类型'}
      ,{field:'carNo',width:100, title: '车厢数'}
      ,{field:'seatNum',width:100, title: '座位号',templet: function(d){
    	  if(d.seatNum=='-1'){
    		  return '无座';
    	  }else{	
    		  return d.seatNum;
    		  }
       
      }}
      ,{field:'price',width:80, title: '票价'}
      ,{field:'stateMsg',width:100, title: '支付状态'}
    ]]
    ,id: 'testReload'
     ,page: true
     ,height: 315
  });
  
  var $ = layui.$, active = {
		    reload: function(){
		      var start = $('#start');
		      var end=$("#end");
		      if(start==''){
		    	  layer.msg("请输入时间");
		    	  return;
		      }
		      if(end==''){
		    	  layer.msg("请输入时间");
		    	  return;
		      }
		      //执行重载
		      table.reload('testReload', {
		        page: {
		          curr: 1 //重新从第 1 页开始
		        }
		        ,where: {
		            start: start.val(),
		            end: end.val() 
		        }
		      });
		    }
		  };
		  
		  $('#searchButton').on('click', function(){
		    var type = $(this).data('type');
		    active[type] ? active[type].call(this) : '';
		  });
		  
});


function page(){
	table.reload('testReload', {
        page: {
          curr: 1 //重新从第 1 页开始
        }
      });
}
</script>

</body>
</html>