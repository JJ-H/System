<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
        *{
            margin:0px;
            padding:0px;
        }
        body{
        background: url(imgs/house_info.png) fixed;
        }
        #div1{
            text-align: center;
            width: 80%;
            margin: 0 auto;
            margin-top:8px;
        }
        #div2{
            width:100%;
            margin: 0 auto;
        }
        #div3{
        	text-align:center;
            margin-top:20px;
            width:100%;
            height:770px;
            float: left;
        }
        #div4{
        text-align:center;
            margin-top:20px;
            width:100%;
            height:770px;
            
            
        }
        #div6{
        margin: 0 auto;
            width: 956px;
            height:600px;
            border: 4px dashed indianred;
            border-radius: 3%;
            }
        img{
        display:block;
        margin: 0 auto;
        }
        input[type="button"]{
        background-color:coral;
        height: 30px;
        font-size: 20px;
   		}
   		input[type="submit"]{
        margin-left: 25px;
        border-radius:10px;
            width:60px; 
        	height:30px;
        	background-color: gray;
        	font-size:20px;
        }
        input[type="reset"]{
        margin-left: 25px;
        border-radius:10px;
            width:60px; 
        	height:30px;
        	background-color:  gray;
        	font-size:20px;
        }
    	table{
    		margin:0 auto;
    		border: 1px solid black;
    		text-align:center;
    	}
    	td{
		border: 1px solid black;
		text-align:center;
		}
		.td1{
		background-color: #7ed506;
		position: sticky; top: 0px;
	}
		.td2{
		border:0px;
		}
	.table{
            background-color: blanchedalmond;
        
            height: 300px;
            border-radius: 3%;
            
            margin: 0 auto;
            
            text-align: right;
        }
        input[type="text"]{
            font-size: 18px;
        }
    </style>
    <script type="text/javascript">
    function send_insert(){
    	location.href = "send_insert.jsp";
    }
    function cancel(){
    	location.href = "cancellation.jsp";
    }
    </script>
</head>
<body>
<%!
String SQL = null;
PreparedStatement sql = null;
ResultSet res = null;
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
			request.setCharacterEncoding("utf-8");
			Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动程序
			//创建连接对象 连接URL为   jdbc:mysql//服务器地址/数据库名  ，后面的2个参数分别是登陆用户名和密码
			Connection connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1/database","root","123456");
			%>
		    <div id="div2">
		            
		            <div id="div1">
		                    <input type="button" value="管理用户信息" onclick="show1()"/>&nbsp;&nbsp;&nbsp;
		                    <input type="button" value="管理房源信息" onclick="show2()"/>&nbsp;&nbsp;&nbsp;
		                    <input type="button" value="添加房源信息" onclick="show3()"/>&nbsp;&nbsp;&nbsp;
		                    <input type="button" value="注销账户" onclick="cancel()"/>
		                </div>
		                <div id="div3" style="display: block;">
		            	<table>
		            		<tr><td class="td1">id</td><td class="td1">姓名</td><td class="td1">密码</td><td class="td1">身份证号</td><td class="td1">性别</td><td class="td1">电子邮件</td><td class="td1">电话</td><td class="td1"></td></tr>
		            		<%
		            		SQL = "SELECT * FROM user";
		            		sql = connect.prepareStatement(SQL);
		            		res = sql.executeQuery();
		            		while(res.next()){
		            			%>
		            			<tr><td><%=res.getInt("id") %></td><td><%=res.getString("姓名") %></td><td><%=res.getString("密码") %></td><td><%=res.getString("身份证号") %></td><td><%=res.getString("性别") %></td><td><%=res.getString("电子邮件") %></td><td><%=res.getString("电话") %></td><td><a href="delete_user.jsp?id=<%=res.getString("id") %>">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="update_user.jsp?id=<%=res.getString("id")%>">修改</a></td></tr>
		            			<%
		            		}
		            		%>
		            	</table>
		               	</div>
		                <div id="div4" style="display: none;">
		                <table>
		            		<tr><td class="td1">编号</td><td class="td1">id</td><td class="td1">建筑面积</td><td class="td1">户型</td><td class="td1">地址</td><td class="td1">估计售价</td><td class="td1">购买时间</td><td class="td1">房屋描述</td><td class="td1"></td></tr>
		            		<%
		            		SQL = "SELECT * FROM house";
		            		sql = connect.prepareStatement(SQL);
		            		res = sql.executeQuery();
		            		while(res.next()){
		            			%>
		            			<tr><td><%=res.getInt("num") %></td><td><%=res.getInt("id") %></td><td><%=res.getDouble("建筑面积") %></td><td><%=res.getString("户型") %></td><td><%=res.getString("地址") %></td><td><%=res.getDouble("估计售价") %></td><td><%=res.getString("购买时间") %></td><td><%=res.getString("房屋描述") %></td><td><a href="delete_house.jsp?num=<%=res.getInt("num") %>">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="update_house.jsp?num=<%= res.getInt("num")%>">修改</a></td></tr>
		            			<%
		            		}
		            		%>
		            	</table>
		               	</div>
		            	<div id="div5">
		            		<img src="imgs/welcome_logo.png" alt="">
    <h1 style="color:indianred; text-align: center;">房屋信息录入表</h1>
	    	<div id="div6">
	            <br/><br/><br/><br/><br/>
	            <form action="admin_house_info_insert.jsp" method="post">
	                    <table class="table">
	                    	<tr><td class="td2">id:</td><td class="td2"><input type="text" name="id" required/></td></tr>
	                        <tr><td class="td2">建筑面积:</td><td class="td2"><input type="text" name="area" required/></td></tr>
	                        <tr><td class="td2">户型:</td><td class="td2"><input type="text" name="huxin" required/></td></tr>
	                        <tr><td class="td2">地址:</td><td class="td2"><input type="text" name="add" required/></td></tr>
	                        <tr><td class="td2">估计售价:</td><td  class="td2"><input type="text" name="price" required/></td></tr>
	                        <tr><td class="td2">购买时间:</td><td  class="td2"><input type="text" name="date" required/></td></tr>
	                        <tr><td class="td2">房屋描述:</td><td  class="td2"><input type="text" name="desc" required/></td></tr>
	                        <tr style="text-align: center;"><td colspan="2"  class="td2"><input type="submit" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <input type="reset" value="重置"/></td></tr>
	                    </table>
                </form>
    </div>
		            	</div>
		            
		    </div>
		    <script>
		            var temp1 = document.getElementById("div3");
		            var temp2 = document.getElementById("div4");
		            var temp3 = document.getElementById("div5");
		
		            function show1(){
		            temp1.style.display = "block";
		            temp2.style.display = "none"; 
		            temp3.style.display = "none";
		            }
		            function show2(){
		            temp1.style.display = "none";
		            temp2.style.display = "block";
		            temp3.style.display = "none";
		            }
		        	function show3(){
		        		temp1.style.display = "none";
			            temp2.style.display = "none";
			            temp3.style.display = "block";
		        	}
		    </script>
		    <%
		
		}
		    %>
</body>
</html>