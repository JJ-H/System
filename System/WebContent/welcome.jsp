<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>house sale</title>
<script src="wrap.js"></script>
<link rel="stylesheet" href="wrap.css">
<script type="text/javascript">
function send_house_info(){
	window.open("insert_info.jsp");
}

</script>
</head>
<body>
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
			%>
			
		    <div id="div1">
		    	<div class="div2" style="margin-right: 10px; "><a href="cancellation.jsp">注销</a></div>
		        <div class="div2"><a href="show_collection.jsp">我的收藏</a></div>
		        <div class="div2"><a href="show.jsp">个人中心</a></div>
		        <div class="div2" style="width:150px;">当前用户:&nbsp;&nbsp;<span style="color:#fd2d2d;"><%=(String)session.getAttribute("uname") %></span></div>
		        <div style="float: left; margin-left:10px;"><a href="welcome.jsp"><img src="imgs/welcome_logo.png" alt=""/></a></div>
		    </div>
		    <div id="div3">
		        <div id="div4">
		        	
		            <form action="research.jsp" method="post" target="_blank">
		                <table style="text-align: center;">
		                    <tr>
		                        <td><div><img style="margin-right: 0px;"src="imgs/research.png" alt=""></div></td>
		                        <td><div><input style="font-size: 20px; height:40px; width:500px; border: 0px; box-sizing: border-box; padding-left:8px;" type="text" name="research" placeholder="输入您想寻找的房源"/></div></td>
		                        <td><div style="padding-right:10px;"><input type="submit" value="搜索" title="可按照地区、房屋特性进行查找"/></div></td>
		                        <td><div style="padding-right:10px;"><input type="button" value="发布房源" onclick="send_house_info()"/></div></td>
		                    </tr>
		                </table>
                    
           			 </form>
		        </div>
		       	<h1 style="color:#fd8ba9; text-align: center; margin-top:10px;"><a href="welcome.jsp"><span style="font-style: italic;">house sale</span></a>&nbsp;&nbsp;&nbsp;为您甄选优质好房源</h1>
		        <div class="warp">
		            <div class="broadcast" id="broadcast">
		                    <ul id="img_list">
		                        <li><a href="#"><img src="imgs/bj2.jpg" alt="1"></a></li>
		                        <li><a href="#"><img src="imgs/bj3.jpg" alt="2"></a></li>
		                        <li><a href="#"><img src="imgs/bj4.jpg" alt="3"></a></li>
		                        <li><a href="#"><img src="imgs/bj5.jpg" alt="4"></a></li>
		                    </ul>
		                    <ol id="button_list"> <!-- 轮播按钮 -->
		                        <li class="first-li" id="olli1">1</li>
		                        <li id="olli2">2</li>
		                        <li id="olli3">3</li>
		                        <li id="olli4">4</li>
		                    </ol>
	                </div>
			    </div>
		</div>
		
		 
			
		<%}
	%>
	
</body>
</html>