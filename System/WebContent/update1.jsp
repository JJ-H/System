<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String SQL = null;
	PreparedStatement sql = null;
	ResultSet res = null;
%>
<%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动程序
//创建连接对象 连接URL为   jdbc:mysql//服务器地址/数据库名  ，后面的2个参数分别是登陆用户名和密码
Connection connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1/database","root","123456");
String id = request.getParameter("id");
String user_name = request.getParameter("name");
String password = request.getParameter("pwd");
String personid = request.getParameter("personid");
String sex = request.getParameter("sex");
String email = request.getParameter("email");
String tel = request.getParameter("tel");
SQL = "UPDATE user SET id = '"+id+"',密码 = '"+password+"',姓名 = '"+user_name+"',身份证号 = '"+personid+"',性别 = '"+sex+"'"+",电子邮件 = '"+email+"',电话 = '"+tel+"' where id = '"+id+"'";
sql = connect.prepareStatement(SQL);
sql.execute();
%>
<script type="text/javascript">
	alert("修改成功!!!")
	location.href = "welcome_admin.jsp";
</script>

</body>
</html>