<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>


</head>

<body style=" background: linear-gradient(to bottom right, #3b95c8 , #467793); width:100%;min-width:1300px;max-width:100%;width:expression_r( Math.max(1000, Math.min(100% , document.body.offsetWidth*0.99))+'px' " >

    <div class="topleft">
    <a href="main.jsp" target="_parent"><img src="images/idealogo.png" alt="logo" title="前程-学员管理系统" /></a>   <!-- logo  images/logo.png  -->
    </div>
    <div class="topright">    
    <ul>
    <li><span><img src="images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
   
    <li><a href="log/out" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <c:if test="${roleId!=1}">
       <a href="pwdUpdate.jsp" target="rightFrame">  <span>${account }</span></a>
       </c:if>
       <c:if test="${roleId==1}">
       <a><span>${account}</span></a>
       </c:if>
    </div>    
    
    </div> 
</body>
</html>
