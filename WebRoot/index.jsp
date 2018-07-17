<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>登录界面</title>
<style type="text/css">
* {
	font: 13px/1.5 '微软雅黑';
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-box-sizing: border-box;
	padding: 0;
	margin: 0;
	list-style: none;
	box-sizing: border-box;
}

body,html {
	height: 100%;
	overflow: hidden;
}

body {
	background: #93defe;
	background-size: cover;
}

a {
	color: #27A9E3;
	text-decoration: none;
	cursor: pointer;
}

img {
	border: none;
}

.login_box {
	width: 1100px;
	margin: 120px auto 0;
}

.login_box .login_l_img {
	float: left;
	width: 432px;
	height: 440px;
	margin-left: 50px;
}

.login_box .login_l_img img {
	width: 500px;
	height: 440px;
}

.login {
	height: 360px;
	width: 400px;
	padding: 50px;
	background-color: #ffffff;
	border-radius: 6px;
	box-sizing: border-box;
	float: right;
	margin-right: 50px;
	position: relative;
	margin-top: 50px;
}

.login_logo {
	width: 120px;
	height: 120px;
	border: 5px solid #93defe;
	border-radius: 100px;
	background: #fff;
	text-align: center;
	line-height: 110px;
	position: absolute;
	top: -60px;
	right: 140px;
}

.login_name {
	width: 100%;
	float: left;
	text-align: center;
	margin-top: 20px;
}

.login_name p {
	width: 100%;
	text-align: center;
	font-size: 18px;
	color: #444;
	padding: 10px 0 20px;
}

.login_logo img {
	width: 60px;
	height: 60px;
	display: inline-block;
	vertical-align: middle;
}

input[type=text],input[type=file],input[type=password],input[type=email],select
	{
	border: 1px solid #DCDEE0;
	vertical-align: middle;
	border-radius: 3px;
	height: 50px;
	padding: 0px 16px;
	font-size: 14px;
	color: #555555;
	outline: none;
	width: 100%;
	margin-bottom: 15px;
	line-height: 50px;
	color: #888;
}

input[type=text]:focus,input[type=file]:focus,input[type=password]:focus,input[type=email]:focus,select:focus
	{
	border: 1px solid #27A9E3;
}

input[type=submit],input[type=button] {
	display: inline-block;
	vertical-align: middle;
	padding: 12px 24px;
	margin: 0px;
	font-size: 16px;
	line-height: 24px;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	color: #ffffff;
	background-color: #27A9E3;
	border-radius: 3px;
	border: none;
	-webkit-appearance: none;
	outline: none;
	width: 100%;
}

.copyright {
	font-size: 14px;
	color: #fff;
	display: block;
	width: 100%;
	float: left;
	text-align: center;
	margin-top: 60px;
}

#password_text {
	border: 1px solid #DCDEE0;
	vertical-align: middle;
	border-radius: 3px;
	height: 50px;
	padding: 0px 16px;
	font-size: 14px;
	color: #888;
	outline: none;
	width: 100%;
	margin-bottom: 15px;
	display: block;
	line-height: 50px;
}
</style>
</head>
<%@ include file="/common/common.jspf"%>
<body>
	<div class="login_box">
		<div class="login_l_img">
			<img src="${proPath}/images/index/login-img.png" />
		</div>
		<div class="login">
			<div class="login_logo">
				<a href="#"><img src="${proPath}/images/index/login_logo.png" />
				</a>
			</div>
			<div class="login_name">
				<p>仓库管理</p>
			</div>
			<form  form id="ff" method="post" action="${proPath}/account/login.action">
				<input name="accLogin" type="text" value="用户名" id="accLogin" onfocus="this.value=''"  />
				<input name="accPass" type="password"  id="accPass" value="mima" onfocus="this.value=''" />
				<input value="登录" style="width:100%;" type="submit" name="sub">
			</form>
			<div style="color:red">${requestScope.msg}</div>
		</div>
	</div>
	<div class="copyright">第九小组 版权所有©2018</div>
	</div>

	<script type="text/javascript">
		/*
		 *＄｛选择器｝把ｄｏｍ对象转为ｊｑｕｅｒｙ对象，一般再处理成easyUI对象
		 *例如　把$("name='accName'")validatebox({})转为easyUI对象
		 *easyUI对象就可以使用相关的语法进行处理，如：$('selector').plugin('method', parameter); 
		 */
		//alert("ddddd");
		//这里的大括号相关于写json格式的数据：{属性：值，属性：值}
		//alert("ddddd");
		$("[name='accLogin']").validatebox({
			required : true,
			missingMessage : '请填写账号！'
		});
		$("[name='accPass']").validatebox({
			required : true,
			missingMessage : '请填写密码！'
		});
		//禁用验证
        $("#ff").form("disableValidation");
		//把div的内容作为对话框方式弹出
		$('#loginDiv').dialog({
			title : '登陆入口',
			width : 250,
			height : 150,
			closed : false,
			cache : false,
			//设置关闭按钮可见
			closable : false,
			//模式化窗口.如果为true将锁屏
			modal : true,
			buttons : [ {
				text : '登陆',
				handler : function() {
					//启用验证
					$("#ff").form("enableValidation");
					//进行验证，通过就提交
					if ($("#ff").form("validate")) {
						//提交
						$("#ff").submit();

					}

				}
			}, {
				text : '取消',
				handler : function() {

				}
			} ]

		});
	</script>
</body>
</html>