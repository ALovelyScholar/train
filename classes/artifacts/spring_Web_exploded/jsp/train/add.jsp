<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>新增车次</title>
		<link type="text/css" rel="stylesheet" href="../css/window.css">
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
	</head>

	<body class="openWinPage">
		<form id='form' name="form" style="margin: 0px;">
			<table width="100%" class="avidmTable">
				<tr class="left_col">
					<td align="right">
						<span>*</span>车次：
					</td>
					<td align="left">
						<input type="text" id="name" name="name" maxlength="25"
							class='AvidmW150' />
					</td>
					<td align="right">
						<span>*</span>类型：
					</td>
					<td align="left">
						<select name="type">
							<option value="1">动车</option>
							<option value="2">高铁</option>
							<option value="3">普快</option>
							<option value="4">特快</option>
						</select>
					</td>
					</tr>
					<tr class="left_col">
					<td align="right">
						<span>*</span>运营开始时间：
					</td>
					<td align="left">
					    <input type="text" name="startDate" id="startDate"  readonly="readonly" class="Wdate" onClick="WdatePicker()" /> 
					</td>
					<td align="right">
						<span>*</span>运营结束时间：
					</td>
					<td align="left">
						  <input type="text" name="endDate" id="endDate" readonly="readonly"  class="Wdate" onClick="WdatePicker()" /> 
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						<span>*</span>始发站：
					</td>
					<td align="left">
					<input type="text" id="startAddress" name="startAddress" maxlength="20"
							class='AvidmW150' />			
				</td>
				<td align="right">
						 <span>*</span>终点站：
					</td>
					<td align="left">
					<input type="text" id="endAddress" name="endAddress" maxlength="20"
							class='AvidmW150' />		
				</td>
				</tr>
				 <tr class="left_col">
					<td align="right">
						<span>*</span>卧铺价格：
					</td>
					<td align="left">
					<input type="text" id="sleepPrice" name="sleepPrice" maxlength="20"
							class='AvidmW100' />			
				</td>
				<td align="right">
						 <span>*</span>坐票价格：
					</td>
					<td align="left">
					<input type="text" id="seatPrice" name="seatPrice" maxlength="20"
							class='AvidmW100' />		
				</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						<span>*</span>站票价格：
					</td>
					<td align="left">
					<input type="text" id="standPrice" name="standPrice" maxlength="20"
							class='AvidmW100' />			
				</td>
				</tr>
			</table>
			<table class="openWinPage" id="train_car">
				<tr><td>车厢信息</td></tr>
				<tr class="left_col">
					<td align="right">
						<span>*</span>车厢：
					</td>
					<td>
					<input type="text" id="carNo" name="cars[0].carNo" maxlength="20"
							class='AvidmW50' />			
				</td>
				<td align="right">
						<span>*</span>类型：
					</td>
					<td>
						<select name="cars[0].type">
							<option value="1">卧铺</option>
							<option value="2">坐票</option>
						</select>			
				</td>
				<td align="right">
						<span>*</span>卧铺（座位）数：
					</td>
					<td>
						<input type="text" id="seatNum" name="cars[0].seatNum" maxlength="20"
							class='AvidmW50' />			
				</td>
				<td align="right">
						<span>*</span>无座数量：
					</td>
					<td>
						<input type="text" id="noNum" name="cars[0].noMun" maxlength="20"
							class='AvidmW50' />			
				</td>
				<td><input type="button" value="+"  onclick="addElement()"></td>
				</tr>
			</table>
			<table class="openWinPage" id="train_station">
				<tr><td>站点信息</td></tr>
				<tr class="left_col">
					<td align="right">
						<span>*</span>站点：
					</td>
					<td>
					<input type="text" id="address" name="stations[0].address" maxlength="20"
							class='AvidmW100' />			
				</td>
				<td align="right">
						<span>*</span>到站时间：
					</td>
					<td>
						<input type="text" id="endTime" name="stations[0].endTime" maxlength="20"
							class='AvidmW50' />			
				</td>
				<td align="right">
						<span>*</span>发站时间：
					</td>
					<td>
						<input type="text" id="startTime" name="stations[0].startTime" maxlength="20"
							class='AvidmW50' />			
				</td>
				<td align="right">
						<span>*</span>顺序：
					</td>
					<td>
						<input type="text" id="sort" name="stations[0].sort" maxlength="20"
							class='AvidmW50' />			
				</td>
				<td align="right">
						<span>*</span>卧铺价：
					</td>
					<td>
						<input type="text" id="sort" name="stations[0].sleepPrice" maxlength="20"
							class='AvidmW50' />			
				</td>
				<td align="right">
						<span>*</span>座票价：
					</td>
					<td>
						<input type="text" id="sort" name="stations[0].seatPrice" maxlength="20"
							class='AvidmW50' />			
				</td>
				<td align="right">
						<span>*</span>站票价：
					</td>
					<td>
						<input type="text" id="sort" name="stations[0].standPrice" maxlength="20"
							class='AvidmW50' />			
				</td>
				<td><input type="button" value="+"  onclick="addElement1()"></td>
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
	 var count1=1;
	 var count2=1;
		function addElement(){
			var html='<tr class="left_col"><td align="right"><span>*</span>车厢：</td><td>';
				html+='<input type="text" id="carNo" name="cars['+count1+'].carNo" maxlength="20" class="AvidmW50" />';
				html+='</td><td align="right"><span>*</span>类型：</td><td>';
				html+='<select name="cars['+count1+'].type"><option value="1">卧铺</option><option value="2">坐票</option></select>';
				html+='</td><td align="right"><span>*</span>卧铺（座位）数：</td><td>';	
				html+='<input type="text" id="seatNum" name="cars['+count1+'].seatNum" maxlength="20" class="AvidmW50"/>';					
				html+='</td><td align="right"><span>*</span>无座数量：</td><td>';
				html+='<input type="text" id="noNum" name="cars['+count1+'].noMun" maxlength="20" class="AvidmW50"/>';
				html+='</td><td><input type="button" value="-"  onclick="deleteElement(this)"></td></tr>';	
			$("#train_car").append(html)
			count1++;
		}
		
		function addElement1(){
			var html='<tr class="left_col"><td align="right"><span>*</span>站点：</td><td>';
			html+='<input type="text" id="address" name="stations['+count2+'].address" maxlength="20" class="AvidmW100"/>';		
			html+='</td><td align="right"><span>*</span>到站时间：</td><td>';
			html+='<input type="text" id="endTime" name="stations['+count2+'].endTime" maxlength="20" class="AvidmW50"/>';			
			html+='</td><td align="right"><span>*</span>发站时间：</td><td>';
			html+='<input type="text" id="startTime" name="stations['+count2+'].startTime" maxlength="20" class="AvidmW50"/>';			
			html+='</td><td align="right"><span>*</span>顺序：</td><td>';
			html+='<input type="text" id="sort" name="stations['+count2+'].sort" maxlength="20" class="AvidmW50"/>';			
			html+='<td align="right"><span>*</span>卧铺价：</td><td>';
			html+='<input type="text" id="sort" name="stations['+count2+'].sleepPrice" maxlength="20" class="AvidmW50"/>';	
			html+='</td><td align="right"><span>*</span>座票价：</td><td>';
			html+='<input type="text" id="sort" name="stations['+count2+'].seatPrice" maxlength="20" class="AvidmW50"/>';			
			html+='</td><td align="right"><span>*</span>站票价：</td><td>';
			html+='<input type="text" id="sort" name="stations['+count2+'].standPrice" maxlength="20"class="AvidmW50"/></td>';
			html+='</td><td><input type="button" value="-"  onclick="deleteElement(this)"></td></tr>';
			$("#train_station").append(html)
			count2++;
		}
		
		function deleteElement(ths){
			$(ths).parent().parent().remove();
		}
		
		layui.use('layer', function(){ //独立版的layer无需执行这一句
			  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
			  
			$("#save").on("click",function(){
				  $.post("save",$("form").serialize(),function(data){
						if(data.code=='0'){
							 layer.msg("保存成功！");
							window.close();
							window.opener.page();
						}else{
							 layer.msg("保存失败！");
						}
					});	
			})
		});
		
	</script>
</html>