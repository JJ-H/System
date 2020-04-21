<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
            background: ivory;
        }
        #div1{
            margin: 0 auto;
            width: 956px;
            height:600px;
            border: 4px dashed indianred;
            border-radius: 3%;
        }
        form{
            text-align: center;
        }
        table{
            margin: 0 auto;
            border: 1px solid blue;
        }
</style>
</head>
<body>
	<form action="check_admin.jsp" method="post">
        <h1 style="color:indianred; text-align: center;">house sale管理员登录</h1>
        <div id="div1">
                <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                <table>
                        <thead><td colspan="2" style="color:red; border-bottom:1px solid blue;">管理员登录入口</td></thead>
                        <tr><td>管理员id:</td><td><input type="text" name="id"/></td></tr>
                        <tr><td>密&nbsp;&nbsp;&nbsp;&nbsp;码:</td><td><input type="password" name="pwd"/></td></tr>
                        <tr><td colspan="2"><input type="submit" value="登录"/><input type="reset" value="重置"/></td></tr>
                    </table>

        </div>
		
	</form>
</body>
</html>