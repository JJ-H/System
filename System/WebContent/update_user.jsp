<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息修改页面</title>
<link rel="stylesheet" href="register.css">
</head>
<body>
<%!
	String SQL = null;
	PreparedStatement sql = null;
	ResultSet res = null;
%>
<%
	request.setCharacterEncoding("utf-8");
	
	String name = (String)session.getAttribute("uname");
	if(name == null){
		%>
		<script type="text/javascript">
			alert("请先登录!!!");
		</script>
		<%
		response.setHeader("refresh", "1;login.jsp");
		//response.sendRedirect("login.jsp");
	}
	else{
		Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动程序
		//创建连接对象 连接URL为   jdbc:mysql//服务器地址/数据库名  ，后面的2个参数分别是登陆用户名和密码
		Connection connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1/database","root","123456");
		String id = request.getParameter("id");
		SQL = "SELECT * FROM user where id = '"+id+"'";
		sql = connect.prepareStatement(SQL);
		res = sql.executeQuery();
		res.first();
	%>
		<img style="display:block; margin: 0 auto;"src="imgs/welcome_logo.png" alt="">
		        <h1 style="color:indianred; text-align: center;">用户注册表</h1>
		        <div id="div1">
		                <br/><br/><br/><br/><br/>
		                <!-- 将表单结果交给本页面自身处理 -->
		            <form action="update1.jsp?id=<%=request.getParameter("id") %>" method="post">
		                    <table>
		                    	<tr><td>姓&nbsp;&nbsp;&nbsp;名:</td><td><input class="border-radius" type="text" name="name" value = "<%=res.getString("姓名") %>" required/></td></tr>
		                        <tr><td>密&nbsp;&nbsp;&nbsp;码:</td><td><input class="border-radius" type="password" name="pwd" required/></td></tr>
		                        <tr><td>身份证号:</td><td><input class="border-radius" type="text" name="personid" value = "<%=res.getString("身份证号") %>" required/></td></tr>
		                        <tr><td>性&nbsp;&nbsp;&nbsp;别:</td><td><input type="radio" name="sex" value="男" checked/>男&nbsp;&nbsp;<input type="radio" name="sex" value="女"/>女</td></tr>
		                        <tr><td>电子邮件:</td><td><input class="border-radius" type="email" name="email" value = "<%=res.getString("电子邮件") %>" required/></td></tr>
		                        <tr><td>电&nbsp;&nbsp;&nbsp;话:</td><td><input class="border-radius" type="text" name="tel" value = "<%=res.getString("电话") %>" required/></td></tr>
		                        <tr><td colspan="2">&nbsp;&nbsp;&nbsp;<input type="submit" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/></td></tr>
		                    </table>       
		            </form>
		        </div>
        <%
	}
	%>
</body>
</html>