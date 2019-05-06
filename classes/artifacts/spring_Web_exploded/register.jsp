<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <link rel="shortcut icon" href="favicon.ico"> 
     <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
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
    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name"></h1>
            </div>
            <h3>欢迎注册 意念火车票预定系统</h3>
            <form class="m-t" role="form">
            	<font color="red" id="errorCode"></font>
                <div class="form-group">
                    <input type="text" id="account" name="account" value="${account}" class="form-control" placeholder="请输入账户" required="">
                </div>
                 <div class="form-group">
                    <input type="text" id="mobile" name="mobile" value="${mobile}" class="form-control" placeholder="请输入手机号" required="">
                </div>
                <div class="form-group">
                    <input type="text" id="name" name="name" value="${name}" class="form-control" placeholder="请输入姓名" required="">
                </div>
                <div class="form-group">
                    <input type="text" id="cardNo" name="cardNo" value="${cardNo}" class="form-control" placeholder="请输入身份证" required="">
                </div>
                <div class="form-group">
                    <input type="password" id="psw" name="psw" class="form-control" placeholder="请输入密码" required="">
                </div>
                <div class="form-group">
                    <input type="password" id="pswForm" class="form-control" placeholder="请再次输入密码" required="">
                </div>
                 <div class="form-group">
                    <input type="radio" name="sex" value="男"  checked="checked">男&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="女">女
                </div>
                <div class="form-group">
                    <input type="text" name="code" id="code" class="check" placeholder="请输入验证码" ><a href="javascript:changeCode();"><img style="margin-bottom: 3px;" class="verifyCode" src="login/getCode"></a>
                </div>
                <button type="button" onclick="register()" class="btn btn-primary block full-width m-b">注 册</button>
                <p class="text-muted text-center"><small>已经有账户了？</small><a href="login.jsp">点此登录</a>
                </p>

            </form>
        </div>
    </div>

    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    
    <script type="text/javascript">
    function register(){
		var account=$("#account").val();
		var name=$("#name").val();
		var mobile=$("#mobile").val();
		var cardNo=$("#cardNo").val();
		var pswForm=$("#pswForm").val();
		var psw=$("#psw").val();
		var code=$("#code").val();
		var mobileReg = /^1\d{10}$/;
		var cardNoReg = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
		var nameReg = /^[\u4e00-\u9fa5]+(·[\u4e00-\u9fa5]+)*$/;
        if($.trim(account)==''){
			$("#errorCode").html("请输入登录账户");
			return;
		}
        if(account.length>12){
            $("#errorCode").html("账户名不能超过12位");
            return;
        }
		if($.trim(mobile)===''){
			$("#errorCode").html("请输入手机号");
			return;
		}
        if(!mobileReg.test(mobile)){
            $("#errorCode").html("手机号码格式不正确");
            return;
        }
		if($.trim(name)===''){
            $("#errorCode").html("请输入身份证对应姓名");
            return;
        }
        if(!nameReg.test(name)){
            $("#errorCode").html("姓名格式不正确");
            return;
        }
		if($.trim(cardNo)===''){
			$("#errorCode").html("请输入身份证号码");
			return;
		}
        if(!cardNoReg.test(cardNo)){
            $("#errorCode").html("身份证号码格式不正确");
            return;
        }
		if($.trim(psw)===''){
			$("#errorCode").html("请输入密码");
			return;
		}
        if(psw.length>16){
            $("#errorCode").html("密码长度不能超过十六位");
            return;
        }

		if($.trim(pswForm)===''){
			$("#errorCode").html("请再次确认密码");
			return;
		}
		if($.trim(pswForm)!==$.trim(psw)){
			$("#errorCode").html("两次密码不匹配");
			return;
		}
		if(code===''||code===null){
            $("#errorCode").html("请输入验证码");
            return;
        }
		$.post("login/register",$("form").serialize(),function(data){
			if(data.code!==0){
				$("#errorCode").html(data.msg);
                $("#code").val('');
                changeCode();
				return;
			}
			window.location.href="login.jsp";
		});
	}
    function changeCode(){
        var src = " login/getCode?"+new Date().getTime(); //加时间戳，防止浏览器利用缓存
        $('.verifyCode').attr("src",src);                  //jQuery写法
    }
</script>

</body>

</html>
