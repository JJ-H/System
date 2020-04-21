<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="insert.css">
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
	Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动程序
	//创建连接对象 连接URL为   jdbc:mysql//服务器地址/数据库名  ，后面的2个参数分别是登陆用户名和密码
	Connection connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1/database","root","123456");
	String num = request.getParameter("num");
	SQL = "SELECT * FROM house where num = '"+num+"'";
	sql = connect.prepareStatement(SQL);
	res = sql.executeQuery();
	res.first();
%>
	<img src="imgs/welcome_logo.png" alt="">
    <h1 style="color:indianred; text-align: center;">房屋信息录入表</h1>
    <div id="div1">
            <br/><br/><br/><br/><br/>
            <form action="update2.jsp?num=<%=res.getInt("num") %>" method="post">
                    <table>
                        <tr><td>建筑面积:</td><td><input type="text" name="area" value="<%=res.getDouble("建筑面积") %>" required/></td></tr>
                        <tr><td>户型:</td><td><input type="text" name="huxin" value="<%=res.getString("户型") %>" required/></td></tr>
                        <tr><td>地址:</td><td><input type="text" name="add" value="<%=res.getString("地址") %>" required/></td></tr>
                        <tr><td>估计售价:</td><td><input type="text" name="price" value="<%=res.getDouble("估计售价") %>" required/></td></tr>
                        <tr><td>购买时间:</td><td><input type="text" name="date" value="<%=res.getString("购买时间") %>" required/></td></tr>
                        <tr><td>房屋描述:</td><td><input type="text" name="desc" value="<%=res.getString("房屋描述") %>" required/></td></tr>
                        <tr style="text-align: center;"><td colspan="2"><input type="submit" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="reset" value="重置"/></td></tr>
                    </table>
                </form>
    </div>
    <%} %>
</body>
</html>