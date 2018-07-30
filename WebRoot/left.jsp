<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="js/jquery.js"></script>

		<script type="text/javascript">
	$(function() {
		//导航切换
		$(".menuson li").click(function() {
			$(".menuson li.active").removeClass("active")
			$(this).addClass("active");
		});

		$('.title').click(function() {
			var $ul = $(this).next('ul');
			$('dd').find('ul').slideUp();
			if ($ul.is(':visible')) {
				$(this).next('ul').slideUp();
			} else {
				$(this).next('ul').slideDown();
			}
		});
	})
</script>


	</head>

	<body style="background: #f0f9fd;">
		<div class="lefttop">
			<span></span>管理
		</div>


		<dl class="leftmenu">

			<dd>
				<div class="title">
					<span><img src="images/leftico04.png" /> </span>功能管理
				</div>
				<ul class="menuson">
					<li>
						<c:if test="${roleId == 4}">
						<cite></cite><a href="acc/showPersonal" target="rightFrame">个人信息管理</a><i></i>
						</c:if>
					</li>
					
					
					<li>
					<c:if test="${roleId == 1}">
						<cite></cite><a href="acc/addTeacAcc" target="rightFrame">账号录入</a><i></i>
						</c:if>
						<c:if test="${roleId == 2 || roleId == 3 }">
						<cite></cite><a href="acc/addStuAcc" target="rightFrame">账号录入</a><i></i>
						</c:if>
						<c:if test="${roleId == 4}">
						<cite></cite><a onclick="alert('抱歉，亲爱的【${account}】,您的权限不足！')" target="rightFrame">账号录入</a><i></i>
						</c:if>
					</li>

					
					<li>
						<c:if test="${roleId != 1}">
							<cite></cite>
							<a href="teac/gradeList" target="rightFrame">班级管理</a>
							<i></i>
						</c:if>
						<c:if test="${roleId == 1}">
							<cite></cite>
							<a onclick="alert('抱歉，亲爱的【${account}】,您的权限不足！')"
								target="rightFrame">班级管理</a>
							<i></i>
						</c:if>
					</li>
					<li>
						<c:if test="${roleId != 1}">
							<cite></cite>
							<a href="coll/list" target="rightFrame">院系信息管理</a>
							<i></i>
						</c:if>
						<c:if test="${roleId == 1}">
							<cite></cite>
							<a onclick="alert('抱歉，亲爱的【${account}】,您的权限不足！')"
								target="rightFrame">院系信息管理</a>
							<i></i>
						</c:if>
					</li>


					<li>
						<c:if test="${roleId != 1}">
							<cite></cite>
							<a href="m/list" target="rightFrame">专业信息管理</a>
							<i></i>
						</c:if>
						<c:if test="${roleId == 1}">
							<cite></cite>
							<a onclick="alert('抱歉，亲爱的【${account}】,您的权限不足！')"
								target="rightFrame">专业信息管理</a>
							<i></i>
						</c:if>
					</li>


					<li>
						<c:if test="${roleId != 1}">
							<cite></cite>
							<a href="stu/findScore" target="rightFrame">成绩信息管理</a>
							<i></i>
						</c:if>
						<c:if test="${roleId == 1}">
							<cite></cite>
							<a onclick="alert('抱歉，亲爱的【${account}】,您的权限不足！')"
								target="rightFrame">成绩信息管理</a>
							<i></i>
						</c:if>
					</li>
					

					<li>
						<c:if test="${roleId == 1}">
							<cite></cite>
							<a onclick="alert('抱歉，亲爱的【${account}】,您的权限不足！')"
								target="rightFrame">学员信息管理</a>
							<i></i>
						</c:if>
						<c:if test="${roleId != 1}">
							<cite></cite>
							<a href="stu/findStudent" target="rightFrame">学员信息管理</a>
							<i></i>
						</c:if>
					</li>
					
					<li>
						<c:if test="${roleId != 4}">
							<cite></cite>
							<a href="teac/teacherList" target="rightFrame">教工管理</a>
							<i></i>
						</c:if>
						<c:if test="${roleId == 4}">
							<cite></cite>
							<a onclick="alert('抱歉，亲爱的【${account}】,您的权限不足！')"
								target="rightFrame">教工管理</a>
							<i></i>
						</c:if>
					</li>
					<li>
						<c:if test="${roleId != 1}">
							<cite></cite>
							<a onclick="alert('抱歉，亲爱的【${account}】,您的权限不足！')"
								target="rightFrame">系统日志</a>
							<i></i>
						</c:if>
						<c:if test="${roleId == 1}">

							<cite></cite>
							<a href="role/list" target="rightFrame">系统日志</a>
							<i></i>

						</c:if>
					</li>
					<li>
						<c:if test="${roleId == 1}">
							<cite></cite>
							<a href="acc/list" target="rightFrame">账号信息管理</a>
							<i></i>
						</c:if>

						<c:if test="${roleId != 1}">
							<cite></cite>
							<a onclick="alert('抱歉，亲爱的【${account}】,您的权限不足！')"
								target="rightFrame">账号信息管理</a>
							<i></i>
						</c:if>
					</li>
				</ul>
			</dd>
		</dl>
	</body>
</html>
