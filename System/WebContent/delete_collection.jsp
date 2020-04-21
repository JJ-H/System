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
String num = request.getParameter("num");
String name = (String)session.getAttribute("uname");
SQL = "SELECT id FROM user WHERE 姓名 = '"+name+"'";
sql = connect.prepareStatement(SQL);
res = sql.executeQuery();
res.first();
int id = res.getInt("id");
SQL = "DELETE FROM collection WHERE num='"+num+"' and id = '"+id+"'";
sql = connect.prepareStatement(SQL);
sql.execute();
%>
<script type="text/javascript">
	alert("取消成功!!!");
	location.href="show_collection.jsp";
</script>
</body>
</html>