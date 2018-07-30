<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>添加用户</title>
		<link rel="stylesheet" type="text/css" href="css/css.css" />
		<script type="text/javascript" src="js/jquery.min.js"></script>
	</head>
	<body>
		<div id="pageAll">
			<div class="pageTop">
				<div class="page">
					<img src="images/coin02.png" />
					<span><a href="#">首页</a>&nbsp;-&nbsp;<a href="#">公共管理</a>&nbsp;-</span>&nbsp;意见管理
				</div>
			</div>
			<div class="page ">
				<!-- 教工添加页面 -->
				<form action="teac/addTeacher" method="post">
					<div class="banneradd bor">
						<div class="baTopNo" align="center" style="margin-top: 20px;">
							<span>教工添加页面</span>
						</div>
						<div class="baBody" align="center"
							style="margin-left: -30px; margin-top: 50px;">
							<div class="bbD">
								教工编号
								<s:textfield name="teacher.no" cssClass="input3" />
							</div>
							<div class="bbD">
								教工姓名
								<s:textfield name="teacher.name" cssClass="input3" />
							</div>
							<div class="bbD">
								教工职位
								<s:textfield name="teacher.manager" cssClass="input3" />
							</div>
							<div class="bbD">
								<p class="bbDP">
									<a><button type="submit" class="btn_ok btn_yes" />
											提交
										</button> </a>
									<a href="teac/teacherList"><button type="button"
											style="color: black" class="btn_ok btn_no" />
											取消
										</button> </a>
								</p>
							</div>
						</div>

					</div>
				</form>
			</div>
		</div>
	</body>
</html>