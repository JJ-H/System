<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function send_continue(){
	location.href="insert_info.jsp";
}
function send_back(){
	location.href="welcome.jsp";
}

</script>
<style type="text/css">
table{
margin: 0 auto;
text-align:center;
}
input[type="button"]{
        margin-left: 25px;
        border-radius:10px;
            width:100px; 
        	height:40px;
        	background-color:  #fd2d2d;
        	font-size:20px;
        }

</style>
</head>
<body>
<%!
String SQL = null;
PreparedStatement sql = null;
ResultSet res = null;
DecimalFormat df=new DecimalFormat("#.0");
int id;
int num;
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

	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1/database","root","123456");
	SQL = "SELECT id FROM user WHERE 姓名='"+(String)session.getAttribute("uname")+"'";
	sql = connect.prepareStatement(SQL);
	res = sql.executeQuery();
	while(res.next())
	{
		id = res.getInt("id");
		break;
	}
	SQL = "SELECT num FROM house";
	sql = connect.prepareStatement(SQL);
	res = sql.executeQuery();
	boolean flag = res.last();
	if(flag)
	{
		num = res.getInt("num");
	}else{
		num = 0;
	}

	SQL = "INSERT INTO house VALUES(?,?,?,?,?,?,?,?)";
	sql = connect.prepareStatement(SQL);
	Double area = Double.parseDouble(request.getParameter("area"));
	String hx = request.getParameter("huxin");
	String add = request.getParameter("add");
	Double price = Double.parseDouble(request.getParameter("price"));
	String date = request.getParameter("date");
	String desc = request.getParameter("desc");
	num+=1;
	sql.setInt(1,num);
	sql.setInt(2, id);
	sql.setDouble(3, Double.parseDouble(df.format(area)));
	sql.setString(4, hx);
	sql.setString(5, add);
	sql.setDouble(6, Double.parseDouble(df.format(price)));
	sql.setString(7, date);
	sql.setString(8, desc);
	sql.execute();%>
	<script type="text/javascript">
		alert("添加成功!!!")
	</script>
	<table>
	<tr>
		
		<td><input type="button" value="继续添加" onclick="send_continue()"></td>
		<td><input type="button" value="返回首页" onclick="send_back()"></td>
	</tr>
	</table>
	<%
}%>

</body>
</html>