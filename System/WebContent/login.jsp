<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录-house sale</title>
<style>
        form{
            text-align: center;
            
        }
        table{
            margin: 0 auto;
        }
        body{
        	background: url(imgs/login_bg.png) no-repeat;
        }
        #div1{
        	padding-top:30px;
        	margin:0 auto;
        	margin-top:50px;
        	width:400px;
        	height:450px;
        	
        	box-sizing: border-box;
        }
        #div2{
        	margin:0 auto;
        	width:350px;
        	height:107px;
        }
        .input_size{
        	width: 300px;
        	height:40px;
        	font-size: 18px;
        	padding-left:10px;
        	box-sizing:border-box;;
        	margin-bottom:5px;
        }
        .input_button_size{
        	width:300px;
        	height:40px;
        	background-color: #ff3f00;
        	font-size: 15px;
        	color:white;
        	border-radius: 15px;
        }
        hr{
        	border-color:#ff3f00;
        }
    </style>
<script type="text/javascript">
function redirect_regist() {
	//alert("即将跳转至注册界面!!!");
	location.href="register.html";
}
function redirect_admin(){
	location.href="admin_login.jsp";
}
</script>
</head>
<body>
<div id="div1">
	<div id="div2">
		<a href="#"><img alt="house sale.png" src="imgs/logo.png" title="house sale为您提供优质房源"></a>
	</div>
	
	<form  action="check_login.jsp" method="post">
            <table>
            	<tr><td colspan="2"><input class="input_size" placeholder="用户名" type="text" name="uname" required></td></tr>
            	<tr><td colspan="2"><input class="input_size" placeholder="密码" type="password" name="pwd" required></td></tr>
                <tr><td colspan="2"><input type="submit" class="input_button_size" value="登录"/></td></tr>
                <tr><td colspan="2"><input type="button" class="input_button_size" value="管理员登录" onclick="redirect_admin()"></td></tr>
                <tr><td colspan="2"><input type="button" class="input_button_size" value="注册" onclick="redirect_regist()"/></td></tr>
            </table>
        
    </form>
</div>
</body>
</html>