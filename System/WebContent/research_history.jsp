<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
background-color:#feffef;
text-align:center;
}
	#div1{
            width: 635px;
            border: 2px solid #ff3f00;
            background-color: white;
            margin: 0px auto;
            margin-top:10px;
        	box-sizing: border-box;
        }
        img{
        display:block;
        margin:0 auto;
        }
    input[type="submit"]{
            width:80px; 
        	height:45px;
        	background-color:  #fd2d2d;
        	font-size:20px;
        }
</style>
<body>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<img alt="" src="imgs/666666.png">
<div id="div1">
	
	<form action="show_history.jsp" method="post" target="_blank">
	
	       <table style="text-align: center;">
	           <tr>
	               <td><div><img style="margin-right: 0px;"src="imgs/research.png" alt=""></div></td>
	               <td><div><input style="font-size: 20px; height:40px; width:500px; border: 0px; box-sizing: border-box; padding-left:8px;" type="text" name="research" placeholder="查找时间xxxx-xx-xx"/></div></td>
	               <td><div style="padding-right:10px;"><input type="submit" value="搜索" title="查找输入时间以前的房源"/></div></td>
	           </tr>
	       </table>        
	</form>
	
</div>
<h2 style="color:red;">温馨提示：</h2>
<p style="font-size:15px;">此搜索功能可查找您输入时间以前的房源信息，<br/>时间格式严格按照xxxx-xx-xx-xx，如有疑问，<br/>请联系管理员:<a href="#">1916787042@qq.com</a></p>
<p>&copy;版权所有：JJ</p>
</body>
</html>