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
  <link href="../css/font-awesome.css?v=4.4.0" rel="stylesheet">

  <link href="../css/animate.css" rel="stylesheet">
    <link href="../css/style.css?v=4.1.0" rel="stylesheet">

</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
 <div class="wrapper wrapper-content animated fadeInUp">
        <div class="row">
            <div class="col-sm-12">

                <div class="ibox">
                    <div class="ibox-title">
                        <h5>列车信息（以下余票信息仅供参考）</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="project-list">
                            <table style="width:700px;">
                                    <tr>
                                        <td>
                                            ${nowDate}
                                        </td>
                                        <td>
                                            ${train.name}次
                                        </td>
                                        <td >
                                               	${train.startAddress}站(${train.startTime}开)-${train.endAddress}站(${train.endTime}到)
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                      		    卧铺(<font color="red">￥ ${train.sleepPrice}</font>)${train.sleepNum}张票
                                        </td>
                                        <td>
                                          	    硬座(<font color="red">￥ ${train.seatPrice}</font>)${train.seatNum}张票
                                        </td>
                                        <td >
                                                无座(<font color="red">￥ ${train.standPrice}</font>)${train.standNum}张票
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                      		${sessionScope.loginUser.name}
                                        </td>
                                        <td>
                                          	 ${sessionScope.loginUser.cardNo}
                                        </td>
                                        <td >
                                        	   选择购票类型：<select id="trainType">
                                           		<option value="1">卧铺</option>
                                           		<option value="2">座票</option>
                                           		<option value="3">无座</option>
                                           </select>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<div align="center">
	<input type="button"  class="layui-btn" onclick="javascript:history.go(-1)" value="上一步">
	<input type="button"  class="layui-btn layui-btn-normal" onclick="saveOrder()" value="提交订单">
  </div>
    <!-- 全局js -->
    <script src="../js/jquery.min.js?v=2.1.4"></script>
  

<script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>


function logOut(){
	$.post("../login/out",null,function(data){
		var html="";
		if(data.code=='0'){
			 window.location.href="index";
		}
	});
}
 
 
 function saveOrder(){
	 var trainType=$("#trainType").val();
	 if(trainType==1&&'${train.sleepNum}'<=0){
		 alert("卧铺已卖光,请选择其他类型");
		 return;
	 }
	 if(trainType==2&&'${train.seatNum}'<=0){
		 alert("座票已卖光,请选择其他类型");
		 return;
	 }
	 if(trainType==3&&'${train.standNum}'<=0){
		 alert("无座已卖光,请选择其他类型");
		 return;
	 }
	 var data={"trainId":'${train.id}',"nowDate":'${nowDate}',"start":'${train.startAddress}',"end":'${train.endAddress}',"trainType":trainType,"orderId":'${orderId}'};
	 $.post("save",data,function(data){
			var html="";
			if(data.code=='0'){
				 alert("车票预订成功，请到后台我的订单查看");
				 window.location.href="../product/index";
			}
		});
 }
</script>

</body>
</html>