<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="shortcut icon" href="favicon.ico">
     <link rel="stylesheet" href="layui/css/layui.css"  media="all">
     <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
    <style>
        .check{
            background-color: #FFFFFF;
            background-image: none;
            border: 1px solid #e5e6e7;
            border-radius: 1px;
            color: inherit;
            padding: 6px 12px;
            -webkit-transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
            transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
            width: 70%;
            font-size: 14px;
        }
    </style>
</head>

<body class="gray-bg">
	<jsp:include page="jsp/front/top.jsp"></jsp:include>
    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name"> </h1>

            </div>
            <h3>欢迎使用意念火车票预定系统</h3>
            <form class="m-t" role="form" >
            <font color="red" id="errorCode"></font>
                <div class="form-group">
                    <input type="email" id="account"  name="account" class="form-control" placeholder="用户名">
                </div>
                <div class="form-group">
                    <input type="password" id="psw" name="psw" class="form-control" placeholder="密码">
                </div>
                <div class="form-group">
                    <input type="text" name="code" id="code" class="check" placeholder="请输入验证码" ><a href="javascript:changeCode();"><img style="margin-bottom: 3px;" class="verifyCode" src="login/getCode"></a>
                </div>
                <button type="button" onclick="login()" class="btn btn-primary block full-width m-b">登 录</button>

            </form>
        </div>
    </div>

    <!-- 全局js -->
    <script type="text/javascript" src="js/jquery.min.js?v=2.1.4"></script>
	<script type="text/javascript">
		
		function login(){
			var account=$("#account").val();
			var psw=$("#psw").val();
            var userCode=$("#code").val();
			if($.trim(account)==''){
				$("#errorCode").html("账户不能为空");
				return;
			}
			if($.trim(psw)==''){
				$("#errorCode").html("密码不能为空");
				return;
			}
			if(userCode===''||userCode===null){
                $("#errorCode").html("请输入验证码");
                return;
            }
			$.post("login/in",{"account":account,"psw":psw,"userCode":userCode},function(data){
				if(data.code!==0){
					$("#errorCode").html(data.msg);
                    $("#code").val('');
                    changeCode();
					return;
				}
				window.location.href="product/index";
			});
		}

        function changeCode(){
            var src = " login/getCode?"+new Date().getTime(); //加时间戳，防止浏览器利用缓存
            $('.verifyCode').attr("src",src);                  //jQuery写法
        }
		 
	</script>
</body>

</html>
