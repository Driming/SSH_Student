<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>

<script type="text/javascript">/*增删改查  提示框*/
$(document).ready(function(){
  $(".click").click(function(){
  $("studentadd.jsp").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">数据表</a></li>
    <li><a href="#">学生信息</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li><span><img src="../images/t01.png" /></span><a href="../studentadd.jsp">添加</a></li>
        </ul>
        
        
        <ul class="toolbar1">
        <li><span><img src="../images/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>编号</th>
        <th>学号<i class="sort"><img src="../images/px.gif" /></i></th>
        <th>姓名</th>
        <th>生日</th>
        <th>院系</th>
        <th>专业</th>
        <th>班级</th>
        <th>年龄</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${students}" var="stu" varStatus="i">
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>${i.count}</td>
        <td>${stu.no}</td>
        <td>${stu.stuname }</td>
        <td>${stu.birthday }</td>
        <td>${stu.college.name }</td>
        <td>${stu.major.name }</td>
        <td>${stu.grade.name }</td> 
        <td>${stu.age }</td>
        <td><a href="modifystudent?id=${stu.id }" class="tablelink">修改</a>   <a href="deletestudent?id=${stu.id}" class="tablelink" onclick="return confirm('是否删除:${stu.stuname}')">删除</a></td>
        </tr>  
        </c:forEach>      
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message">共<i class="blue">${pages }</i>页记录，当前显示第&nbsp;<i class="blue">${page}&nbsp;</i>页</div>
        <ul class="paginList">
        <li>
        <c:if test="${page>1}">
        <a href="findStudent?page=${page-1 }">上一页</a>
        </c:if>
        <c:if test="${page<=1}">
        <a href="#">上一页</a>
        </c:if>
        <c:if test="${page<pages}">
        <a href="findStudent?page=${page+1 }">下一页</a>
        </c:if>
        <c:if test="${page>=pages}">
        <a href="#">下一页</a>
        </c:if>
        </li>
        </ul>
    </div>
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="../images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
