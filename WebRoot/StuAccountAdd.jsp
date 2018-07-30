<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>添加用户</title>
		<link rel="stylesheet" type="text/css" href="../css/css.css" />
		<script type="text/javascript" src="../js/jquery.min.js"></script>
	</head>
	<body>
		<div id="pageAll">
			<div class="pageTop">
				<div class="page">
					<img src="../images/coin02.png" />
					<span><a href="#">首页</a>&nbsp;-&nbsp;<a href="#">公共管理</a>&nbsp;-</span>&nbsp;意见管理
				</div>
			</div>
			<div class="page ">
				<form action="acc/addStuAccount" method="post">
					<div class="banneradd bor">
						<div class="baTopNo" align="center" style="margin-top: 20px;">
							<span>学员账号录入界面</span>
						</div>
						<div class="baBody" align="center"
							style="margin-left: -30px; margin-top: 50px;">
							<div class="bbD">
								学员名称：
								<select name="account.user_no" class="input3">
									<option value="0">请选择学员</option>
									<c:forEach items="${students}" var="stu">
										<option value="${stu.no }">${stu.stuname }</option>
									</c:forEach>
								</select>
							</div>
							<div class="bbD">
								学员账号：
								<input type="text" name="account.account" class="input3" />
							</div>
							<div class="bbD">
								学员密码：
								<input type="text" value="1234" name="account.pwd" readonly="readonly" class="input3" />
							</div>
							<input type="hidden" name="account.role_id" value="4"/>
							<div class="bbD">
								<p class="bbDP">
									<a><button type="submit" class="btn_ok btn_yes">
											提交
										</button>
									</a>
								</p>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>