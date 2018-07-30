<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录日志管理</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<%-- 	<script type="text/javascript" src="../js/jquery.js"></script> --%>
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
//Deletion confirm window
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
	
	
	
	
	$("#id_all").click(function() {

		$(".id").prop("checked", $(this).prop("checked"));
	});

	//当子级的单选框(".check_item")选全部被中后，父级的单选框("#check_all")自动被选中
	$(".id").click(function() {

		var flag = $(".id:checked").length == $(".id").length;
		$("#id_all").prop("checked", flag);
	});
	
	
	
	var delId = "";
	$("#del_all").click(function(){
		
		$.each($(".id:checked"),function(){
			delId += $(this).parents("tr").find("td:eq(0)").children(".id").val()+"-";
		});
		delId = delId.substring(0,delId.length-1);
		
		$(".tipAll").fadeIn(200);
	});

	//关闭按钮
	$(".tiptopAll a").click(function() {
		$(".tipAll").fadeOut(200);
	});

	//确定按钮
	$(".sureAll").click(function() {
		location.href = "deleteAll?did=" + delId;
		$(".tipAll").fadeOut(100);
	});

	//取消按钮
	$(".cancelAll").click(function() {
		$(".tipAll").fadeOut(100);
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
		    <li><a href="#">登入时间</a></li>
	    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    	<ul class="toolbar">
	       
	        <li  id="del_all"><span><img src="../images/t03.png" />
				</span>删除</li>
        </ul>
        <ul class="toolbar1">
        	<li><span><img src="../images/t05.png" /></span>设置</li>
        </ul>
    </div>
    
    <table class="tablelist">
	<thead>
		<tr>
		    <th><input name="" id="id_all" type="checkbox"/></th>
		    <th>编号<i class="sort"><img src="../images/px.gif" /></i></th>
		    <th>账号</th>
		    <th>登录时间</th>
		    <th>退出时间</th>
	    </tr>
    </thead>
    <tbody>
	    <c:forEach var="log" items="${logs}" varStatus="i" >
		    <tr>
			    <td><input name="" class="id" type="checkbox" value="${log.id }" /></td>
				<td>${i.count }</td>
				<td id=name>${log.account }</td>
				<td>${log.loginIn }</td>
				<td>${log.loginOut }</td>
		    </tr> 
	   </c:forEach>
    </tbody>
    </table>
   
 
			<div class="pagin">
				<div class="message">
					当前显示第&nbsp;
					<i class="blue">${page }&nbsp;</i>页，共&nbsp;
					<i class="blue">${total }</i>&nbsp;页
				</div>
				<ul class="paginList">
					<s:if test="page>1">
						<li class="paginItem">
							<a href="list?page=<s:property value="page-1"/> ">上一页</a>
						</li>
					</s:if>
					<s:else>
						<li class="paginItem">
							<a> 上一页</a>
						</li>
					</s:else>

					<s:if test="page < total">
						<li class="paginItem">
							<a href="list?page=<s:property value="page+1"/> ">下一页</a>
						</li>
					</s:if>
					<s:else>
						<li class="paginItem">
							<a>下一页</a>
						</li>
					</s:else>
				</ul>
			</div>

    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="../images/ticon.png" /></span>
        <div class="tipright">
        <p>是否删除所选信息 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    </div>
    
 <!-- 批量删除 -->
		<div class="tipAll">
			<div class="tiptopAll">
				<span>提示信息(批量删除)</span><a></a>
			</div>

			<div class="tipinfo">
				<span><img src="../images/ticon.png" /> </span>
				<div class="tipright">
					<p>是否批量删除</p>
					<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
				</div>
			</div>

			<div class="tipbtn">
				<input name="" type="button" class="sureAll" value="确定" /> &nbsp; <input
					name="" type="button" class="cancelAll" value="取消" />
			</div>
		</div>

    </div>
</body>
</html>
