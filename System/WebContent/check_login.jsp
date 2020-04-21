<%@page import="sun.font.Script"%>
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
		String name = null;
		String pwd = null;
		String SQL = null;
		ResultSet res = null;
		PreparedStatement sql = null;
	%>
	<%
		request.setCharacterEncoding("utf-8");
		Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动程序
		//创建连接对象 连接URL为   jdbc:mysql//服务器地址/数据库名  ，后面的2个参数分别是登陆用户名和密码
		Connection connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1/database","root","123456");
		name = request.getParameter("uname");
		pwd = request.getParameter("pwd");
		SQL = "SELECT 密码 FROM USER WHERE 姓名='"+name+"'";
		sql = connect.prepareStatement(SQL);
		res = sql.executeQuery();
		if(res.next()){
			if(pwd.equals(res.getString("密码"))){
				//登录成功,为用户设置session
				session.setAttribute("uname", request.getParameter("uname"));
				//设置session有效非活动时长为30分钟。
		    	session.setMaxInactiveInterval(60*30);
				response.sendRedirect("welcome.jsp");
				//request.getRequestDispatcher("welcome.jsp").forward(request, response);
			}
			else{%>
				<script type="text/javascript">
					alert("用户名与密码不匹配!!!");
				</script>
				<!--  out.print("用户名与密码不匹配!!!");-->
				<%
				//response.sendRedirect("login.jsp");
				response.setHeader("refresh", "1;login.jsp");
			}
		}
		else{%>
			<script type="text/javascript">
				alert("用户名不存在!!!");
			</script>
			<!-- out.print("用户名不存在!!!"); -->
			<%
			//response.sendRedirect("login.jsp");
			response.setHeader("refresh", "1;login.jsp");
		}
		//关闭数据库连接
		connect.close();
	%>
</body>
</html>