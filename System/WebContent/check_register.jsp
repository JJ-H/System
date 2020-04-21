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
		int id;
		String pwd = null;
		String name = null;
		String personid = null;
		String sex = null;
		String email = null;
		String tel = null;
		PreparedStatement sql = null;
		ResultSet res1 = null;
		ResultSet res2 = null;
		String SQL = null;
		ResultSet res = null;
	%>
	<%
		request.setCharacterEncoding("utf-8");
		Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动程序
		//创建连接对象 连接URL为   jdbc:mysql//服务器地址/数据库名  ，后面的2个参数分别是登陆用户名和密码
		Connection connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1/database","root","123456");
		SQL = "SELECT id FROM user";
		sql = connect.prepareStatement(SQL);
		res = sql.executeQuery();
		boolean flag = res.last();
		if(flag)
		{
			id = res.getInt("id");
		}else{
			id = 1000;
		}
        personid = request.getParameter("personid");
        SQL = "SELECT id FROM USER WHERE 身份证号='"+personid+"'";
        sql = connect.prepareStatement(SQL);
        res2 = sql.executeQuery();
       	if(res2.next()){
			%>
    		<script type="text/javascript">
    			alert("该身份证号已存在，请检查！！！");
    		</script>
    	<%
    	//response.sendRedirect("regist.html");
    	response.setHeader("refresh", "1;register.html");
        }
        else{
        	name = request.getParameter("name");
        	pwd = request.getParameter("pwd");
        	
        	sex = request.getParameter("sex");
        	email = request.getParameter("email");
        	tel = request.getParameter("tel");
        	SQL = "INSERT INTO USER VALUES(?,?,?,?,?,?,?)";
        	sql = connect.prepareStatement(SQL);
        	sql.setInt(1, id+1);
        	sql.setString(2, pwd);
        	sql.setString(3, name);
        	sql.setString(4, personid);
        	sql.setString(5, sex);
        	sql.setString(6, email);
        	sql.setString(7, tel);
        	if(sql.executeUpdate()>0){
        	%>
	        	<script type="text/javascript">
	        		alert("注册成功!!!")
	        	</script>
        	<%
        	}
        	response.setHeader("refresh", "1;login.jsp");
        }
        //关闭数据库连接
        connect.close();
	%>
</body>
</html>