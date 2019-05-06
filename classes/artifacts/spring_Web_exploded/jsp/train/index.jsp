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
   	车次
  <div class="layui-inline">
    <input class="layui-input" name="name" id="name" autocomplete="off">
  </div>
  	出发地
  <div class="layui-inline">
    <input class="layui-input" name="start" id="start" autocomplete="off">
  </div>
 	目的地
  <div class="layui-inline">
    <input class="layui-input" name="end" id="end" autocomplete="off">
  </div>
 	出发时间
  <div class="layui-inline">
    <input class="layui-input" name="nowDate" id="nowDate" readonly="readonly" class="Wdate" onClick="WdatePicker()" autocomplete="off">
  </div>
  <button id="searchButton" class="layui-btn" data-type="reload">搜索</button>
</div>         
<div align="right">
<div class="layui-btn-group">
    <button class="layui-btn layui-btn-sm" id="add"><i class="layui-icon"></i></button>
    <button class="layui-btn layui-btn-sm" id="delete"><i class="layui-icon"></i></button>
  </div>
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
      ,{field:'startTime', width:100, title: '发车时间'}
      ,{field:'typeMsg',width:80, title: '类型'}
      ,{field:'sleepNum',width:100, title: '卧铺数'}
      ,{field:'sleepPrice',width:80, title: '卧票价'}
      ,{field:'seatNum',width:100, title: '座票数'}
      ,{field:'seatPrice',width:80, title: '座票价'}
      ,{field:'standNum',width:100, title: '无座数'}
      ,{field:'standPrice',width:80, title: '站票价'}
    ]]
    ,id: 'testReload'
     ,page: true
     ,height: 315
  });
  
  var $ = layui.$, active = {
		    reload: function(){
		      var start = $('#start');
		      var name=$("#name");
		      var end=$("#end");
		      var nowDate=$("#nowDate");
		      if(start==''){
		    	  layer.msg("请输入出发地");
		    	  return;
		      }
		      if(end==''){
		    	  layer.msg("请输入目的地");
		    	  return;
		      }
		      if(nowDate==''){
		    	  layer.msg("请输入出发时间");
		    	  return;
		      }
		      //执行重载
		      table.reload('testReload', {
		        page: {
		          curr: 1 //重新从第 1 页开始
		        }
		        ,where: {
		            name:name.val(),
		            start: start.val(),
		            end: end.val(),
		            nowDate: nowDate.val()
		        }
		      });
		    }
		  };
		  
		  $('#searchButton').on('click', function(){
		    var type = $(this).data('type');
		    active[type] ? active[type].call(this) : '';
		  });
		  
		  $('#delete').on('click', function(){
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
			  var url="add";
				openWindow(url,900,500);
			  
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