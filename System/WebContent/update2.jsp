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
request.setCharacterEncoding("UTF-8");
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
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动程序
	//创建连接对象 连接URL为   jdbc:mysql//服务器地址/数据库名  ，后面的2个参数分别是登陆用户名和密码
	Connection connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1/database","root","123456");
	int num = Integer.parseInt(request.getParameter("num"));
	Double area = Double.parseDouble(request.getParameter("area")); 
	String hx = request.getParameter("huxin");
	String add = request.getParameter("add");
	Double price = Double.parseDouble(request.getParameter("price"));
	String date = request.getParameter("date");
	String desc = request.getParameter("desc");
	SQL = "UPDATE house SET 建筑面积 = '"+area+"',户型 = '"+hx+"', 地址 = '"+add+"', 估计售价 = '"+price+"',购买时间 = '"+date+"',房屋描述 = '"+desc+"' WHERE num ='"+num+"'";
	sql = connect.prepareStatement(SQL);
	sql.execute();
	%>
	<script type="text/javascript">
	alert("修改成功!!!")
	location.href="welcome_admin.jsp";
	</script>
	<%
}
%>
</body>
</html>