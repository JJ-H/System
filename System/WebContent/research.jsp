<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base target="_blank">
<title>Insert title here</title>
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
	#shoucang{
	background-color:pink;
	}
	input[type="button"]{
        background-color:coral;
        height: 30px;
        font-size: 18px;
   		}
</style>
</head>
<body>
<%!
String result = null;
PreparedStatement sql = null;
ResultSet res = null;
String SQL = null;
int flag = 0;
%>
<%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动程序
//创建连接对象 连接URL为   jdbc:mysql//服务器地址/数据库名  ，后面的2个参数分别是登陆用户名和密码
Connection connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1/database","root","123456");
String info = request.getParameter("research");
if(info == null){
	info = "not found!";
}
SQL = "SELECT * FROM house";
sql = connect.prepareStatement(SQL);
ResultSet temp = sql.executeQuery();

if(!temp.next())
{%>
	<h3>未找到符合所选条件的二手房源，建议您调整筛选条件再试试</h3>
<%
}
else{
	ResultSet temp2 = sql.executeQuery();
	while(temp2.next())
	{
		String description = temp2.getString("房屋描述");
		if(description.contains(info)){
			flag = 1;
			break;
		}
		
	}
	//System.out.println(flag);
	if(flag == 1)
	{
		%>
		<table>
			<caption style="color:pink; font-style:oblique;font-size: 20px;">为您找到以下房源 &nbsp;&nbsp;&nbsp;<input type="button" value="搜索历史房源信息" onclick="location.href='research_history.jsp';"/></caption>
			<tr><td class="td1">建筑面积(m²)</td><td class="td1">户型</td><td class="td1">地址</td><td class="td1">估计售价(单位/万元)</td><td class="td1">购买时间</td><td class="td1">房屋简介</td><td class="td1"></td></tr>
		<%
		res = sql.executeQuery();
		while(res.next())
			{
				String description = res.getString("房屋描述");
				if(description.contains(info)){
		%>
					<tr><td><%=res.getDouble("建筑面积") %></td><td><%=res.getString("户型")%></td><td><%=res.getString("地址")%></td><td><%=res.getDouble("估计售价") %></td><td><%=res.getString("购买时间") %></td><td><%=res.getString("房屋描述") %></td><td style="width:60px;"><div id="shoucang" onclick="location.href = 'shoucang.jsp?num=<%= res.getInt("num")%>';">收藏</div></td></tr>
					<%
				}
			}
			
			%>
		</table>
		<%
	}else
	{
		%>
		<h3>未找到符合所选条件的二手房源，建议您调整筛选条件再试试</h3>
		<%
	}
}
//关闭数据库连接
connect.close();
%>
</body>
</html>