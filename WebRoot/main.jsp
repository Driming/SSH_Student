
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">个人信息</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    
    <div class="welinfo">
    <b>您好，欢迎使用【前程-学员管理系统】</b>
   <c:if test="${roleId!=1}">
    <a href="pwdUpdate.jsp">帐号设置</a>
    </c:if>
    </div>
    
    <div class="welinfo">
    本次登录时间：${LoginIn }
    </div>
    
    <div class="xline"></div>
    
    <ul class="iconlist">
 
            
    </ul>
    
    
    <div class="xline"></div>
    <div class="box"></div>
    
    <div class="welinfo">
 
    </div>
    
    
    
    <div class="xline"></div>
    
    
    </div>
</body>
</html>
