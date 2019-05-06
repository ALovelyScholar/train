<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>意念火车票预订系统</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
  <script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
 <jsp:include page="top.jsp"></jsp:include>
  <div class="searchTable" align="center">
   	车次
  <div class="layui-inline">
    <input class="layui-input" name="name" id="name"   autocomplete="off">
  </div>
  	出发地
  <div class="layui-inline">
    <input class="layui-input" name="start" readonly="readonly" value="${order.startAddress}" id="start" autocomplete="off">
  </div>
 	目的地
  <div class="layui-inline">
    <input class="layui-input" name="end" id="end" readonly="readonly" value="${order.endAddress}" autocomplete="off">
  </div>
 	出发时间
  <div class="layui-inline">
    <input class="layui-input" name="nowDate" id="nowDate" readonly="readonly" class="Wdate" onClick="WdatePicker()" autocomplete="off">
  </div>
  <button id="searchButton" class="layui-btn" data-type="reload">搜索</button>
</div>         
<table style="width: 95%" class="layui-hide" id="list_data" lay-filter="user"></table> 
<form id="bookForm" name="bookForm" action="../order/book" method="post">
	<input type="hidden" name="orderId" value="${order.id}">
	<input type="hidden" id="startDate" name="nowDate" >
	<input type="hidden" id="startAddress" name="start" >
	<input type="hidden" id="endAddress" name="end" >
	<input type="hidden" id="trainId" name="trainId" >
</form>
<script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
 <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">预订</a>
</script>
<script>

layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#list_data'
    ,url:'../product/list'
    ,cellMinWidth: 130 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
    ,cols: [[
       {field:'name', minWidth:100, title: '车次'}
      ,{field:'startAddress', width:120, title: '始发站/出发地'}
      ,{field:'endAddress', width:120, title: '终点站/目的地'}
      ,{field:'startTime', width:100, title: '发车时间'}
      ,{field:'typeMsg',width:100, title: '类型'}
      ,{field:'sleepNum',width:100, title: '卧铺数'}
      ,{field:'sleepPrice',width:100, title: '卧票价'}
      ,{field:'seatNum',width:100, title: '座票数'}
      ,{field:'seatPrice',width:100, title: '座票价'}
      ,{field:'standNum',width:100, title: '无座数'}
      ,{field:'standPrice',width:100, title: '站票价'}
      ,{fixed: 'right', width:108, align:'center', toolbar: '#barDemo'}
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
		  
		  
		//监听工具条
		  table.on('tool(user)', function(obj){
		    var data = obj.data;
		     if(obj.event === 'edit'){
		    	 if(data.sleepNum==0&&data.seatNum==0&&data.standNum==0){
		    		 layer.msg("票已售光");
		    		 return;
		    	 }
		    	  var start = $('#start').val();
			      var end=$("#end").val();
			      var nowDate=$("#nowDate").val();
			      if($.trim(start)==''){
			    	  layer.msg("出发地不能为空");
			    	  return;
			      }
			      if($.trim(end)==''){
			    	  layer.msg("目的地不能为空");
			    	  return;
			      }
			      if($.trim(nowDate)==''){
			    	  layer.msg("出发时间不能为空");
			    	  return;
			      }
			    $("#startDate").val(nowDate);
			    $("#startAddress").val(start);
			    $("#endAddress").val(end);
			    $("#trainId").val(data.id);
			    document.bookForm.submit();
		    }
		  });
});


function logOut(){
	$.post("../login/out",null,function(data){
		var html="";
		if(data.code=='0'){
			 window.location.href="index";
		}
	});
}
 
</script>

</body>
</html>