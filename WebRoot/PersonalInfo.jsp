<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加用户</title>
<link rel="stylesheet" type="text/css" href="../css/css.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="../images/coin02.png" /> <span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp;-</span>&nbsp;学生信息修改
			</div>
		</div>
		<div class="page ">
			<!-- 会员注册页面样式 -->
			<div class="banneradd bor">
				<div class="baTopNo">
					<span>个人信息展示</span>
				</div>
				<div class="baBody">
					<div class="bbD">
						姓名： <input type="text" class="input3" name="student.no"
							value="${student.stuname }"  readonly="readonly" />
					</div>
					<div class="bbD">
						学号： <input type="text" class="input3" name="student.stuname"
							value="${student.no }"  readonly="readonly" />
					</div>
					<div class="bbD">
						生日： <input type="text" class="input3" name="student.birthday"
							value="${student.birthday }"  readonly="readonly" />
					</div>
					<div class="bbD">
						年龄： <input type="text" class="input3" name="student.collegeid"
							value="${student.age }" readonly="readonly" />
					</div>
					<div class="bbD">
						院系： <input type="text" class="input3" name="student.majorid"
							value="${student.college.name }" readonly="readonly" />
					</div>
					<div class="bbD">
						专业： <input type="text" class="input3" name="student.majorid"
							value="${student.major.name }" readonly="readonly" />
					</div>
					<div class="bbD">
						班级： <input type="text" class="input3" name="student.age"
							value="${student.grade.name }"  readonly="readonly" />
					</div>

				</div>

			</div>

			<!-- 会员注册页面样式end -->
		</div>
	</div>
</body>
</html>