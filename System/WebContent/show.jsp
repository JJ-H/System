<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<style type="text/css">
	body{
	background: url(imgs/house_info.png) fixed;
	
	}
	table{
		margin:0 auto;
		border: 1px solid black;
	}
	.tr1{
		background-color: #7ed506;
	}
	td{
	border: 1px solid black;
	text-align:center;
	}
	h1 {
		color:hotpink;
		display:bolck;
		margin: 50px auto;
	}
</style>
</head>
<body>
<%!
String SQL = null;
PreparedStatement sql = null;
ResultSet res = null;
int id = 0;
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
	SQL = "SELECT id FROM user WHERE 姓名='"+(String)session.getAttribute("uname")+"'";
	sql = connect.prepareStatement(SQL);
	res = sql.executeQuery();
	while(res.next())
	{
		id = res.getInt("id");
		break;
	} 
	SQL = "SELECT * FROM house WHERE id = '"+id+"'";
	sql = connect.prepareStatement(SQL);

	ResultSet temp = sql.executeQuery();
	if(temp.next()){
		%>
		<table>
		<caption style="color:#810008; font-style:oblique;font-size: 20px;">您发布的房源信息如下</caption>
		<tr class="tr1"><td>建筑面积(m²)</td><td>户型</td><td>地址</td><td>估计售价(单位/万元)</td><td>购买时间</td><td>房屋简介</td></tr>
		<%
		res = sql.executeQuery();
		while(res.next()){
			
			%>
			<tr><td><%=res.getDouble("建筑面积") %></td><td><%=res.getString("户型")%></td><td><%=res.getString("地址")%></td><td><%=res.getDouble("估计售价") %></td><td><%=res.getString("购买时间") %></td><td><%=res.getString("房屋描述") %></td></tr>
			
			<%
		}
		%>
		</table>
		<%
	}else{
		%>
		<h1 style="display:block;color:hotpink;margin: 200px auto; width:400px;">您暂未发布任何房源信息!!!</h1>
		<%
	}
}
%>
</body>
</html>