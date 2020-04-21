<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	body{
	background: url(imgs/house_info.png) fixed;
	
	}
	h3{text-align: center;}
	table{
		margin:0 auto;
		border: 1px solid black;
	}
	.td1{
		background-color: #7ed506;
		position: sticky; top: 0px;
	}
	td{
	border: 1px solid black;
	text-align:center;
	background-color:#a6a6a6;
	}
</style>
<body>
<%!
String SQL = null;
PreparedStatement sql = null;
ResultSet res = null;
ResultSet res_temp = null;
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
	SQL = "SELECT id FROM user WHERE 姓名 = '"+name+"'";
	sql = connect.prepareStatement(SQL);
	res = sql.executeQuery();
	res.first();
	id = res.getInt("id");
	SQL = "SELECT num FROM collection WHERE id = '"+id+"'";
	sql = connect.prepareStatement(SQL);
	res = sql.executeQuery();
	%>
	<table>
		<caption style="color:pink; font-style:oblique;font-size: 20px;">您收藏的房源如下</caption>
		<caption style="font-style:oblique;font-size: 15px;"><span style="color:red"> 温馨提示:</span>如有信息缺失，则该房源已出售或下架</caption>
		<tr><td class="td1">建筑面积</td><td class="td1">户型</td><td class="td1">地址</td><td class="td1">估计售价</td><td class="td1">购买时间</td><td class="td1">房屋描述</td><td class="td1"></td></tr>
	
	<%
	while(res.next())
	{
		int num = res.getInt("num");
		System.out.println(num);
		
		SQL = "SELECT * FROM house WHERE num = '"+num+"'";
		sql = connect.prepareStatement(SQL);
		res_temp = sql.executeQuery();
		res_temp.first();
		%>
		<tr><td><%=res_temp.getDouble("建筑面积") %></td><td><%=res_temp.getString("户型") %></td><td><%=res_temp.getString("估计售价") %></td><td><%=res_temp.getDouble("建筑面积") %></td><td><%=res_temp.getString("购买时间") %></td><td><%=res_temp.getString("房屋描述") %></td><td style="width:90px; background-color:pink;"><div id="shoucang" onclick="location.href = 'delete_collection.jsp?num=<%= res.getInt("num")%>';">取消收藏</div></td></tr>
		<%
	}
	%>
	</table>
	<%
} %>
</body>
</html>