<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="insert.css">
<title>房屋信息录入</title>
</head>
<body>
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
%>
	<img src="imgs/welcome_logo.png" alt="">
    <h1 style="color:indianred; text-align: center;">房屋信息录入表</h1>
    <div id="div1">
            <br/><br/><br/><br/><br/>
            <form action="house_info_insert.jsp" method="post">
                    <table>
                        <tr><td>建筑面积:</td><td><input type="text" name="area" required/></td></tr>
                        <tr><td>户型:</td><td><input type="text" name="huxin" required/></td></tr>
                        <tr><td>地址:</td><td><input type="text" name="add" required/></td></tr>
                        <tr><td>估计售价:</td><td><input type="text" name="price" required/></td></tr>
                        <tr><td>购买时间:</td><td><input type="text" name="date" required/></td></tr>
                        <tr><td>房屋描述:</td><td><input type="text" name="desc" required/></td></tr>
                        <tr style="text-align: center;"><td colspan="2"><input type="submit" value="上传"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="reset" value="重置"/></td></tr>
                    </table>
                </form>
    </div>
    <%} %>
</body>
</html>