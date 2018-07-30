<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>角色管理</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<script type="text/javascript" src="../js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var did,name;
	$(".click").click(function(){
		name=$(this).parents("tr").find("#name").text();
		$("#pName").html("确定删除【"+name+"】吗？");
		did=$(this).parents("tr").find("td:eq(0)").children("#id").val();
	    $(".tip").fadeIn(200);
	});
	//关闭按钮
	$(".tiptop a").click(function(){
			$(".tip").fadeOut(200);
	});
	//确定按钮
	$(".sure").click(function(){
		location.href = "deleteRole?id="+did;
	  	$(".tip").fadeOut(100);
	});
	//取消按钮
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
    <li><a href="#">角色</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    	<ul class="toolbar">
	        <li class="tangchu"><span><img src="../images/t01.png" /></span>
	        	<a href="loadRole?id=${ role.id }&page=${total}">添加</a>
	        </li>
	        <li class="click"><span><img src="../images/t03.png" /></span>删除</li>
        </ul>
        <ul class="toolbar1">
        	<li><span><img src="../images/t05.png" /></span>设置</li>
        </ul>
    </div>
    
    <table class="tablelist">
	<thead>
    	<tr>
	        <th><input name="" type="checkbox" value="" checked="checked"/></th>
	        <th>角色编号<i class="sort"><img src="../images/px.gif" /></i></th>
	        <th>角色名称</th>
	        <th>角色备注</th>
	        <th>对应页面</th>
	        <th colspan="2">操作</th>
        </tr>
	</thead>
	<tbody>
        <c:forEach var="role" items="${roles}" varStatus="i" >
	        <tr>
		        <td><input name="" type="checkbox" value="${role.id}" id="id"/></td>
		   		<td>${i.count }</td>
		   		<td id="name">${role.name }</td>
		   		<td>${role.text }</td>
		   		<td>${role.page }</td>
		        <td class="td_w"><a href="modifyRole?id=${role.id}&page=${pages}" class="updatetc"><img src="../images/t02.png" />修改</a></td>
		        <td class="td_w"><a class=" click"><span><img src="../images/t03.png" /></span> 删除</a></td>
	        </tr> 
       </c:forEach>
	</tbody>
    </table>
   
    <div class="pagin">
    	<div class="message">当前页共<i class="blue">&nbsp;${pageSize }&nbsp;</i>条记录，当前显示第&nbsp;<i class="blue">${pages }&nbsp;</i>页，共&nbsp;<i class="blue">${total }</i>&nbsp;页</div>
        <ul class="paginList">
	        <li class="paginItem">
		        <s:if test="pages>1">
		        	<a href="queryRole?pages=<s:property value="pages-1"/>">上一页</a>
		        </s:if>
		        <s:else>
		        	<a href="#">上一页</a>
		        </s:else>
	        </li>
	        <li class="paginItem">
	        	<s:if test="pages < total">
		        	<a href="queryRole?pages=<s:property value="pages+1"/>">下一页</a>
		        </s:if>
		        <s:else>
		        	<a href="#">下一页</a>
		        </s:else>
	        </li>
    	</ul>
    </div>
    
    <!-- 删除框 -->
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="../images/ticon.png" /></span>
        <div class="tipright">
        <p id="pName"></p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    </div>
    
   </div>
</body>
</html>
