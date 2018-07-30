<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
				<form action="m/updateMajor" method="post">
					<div class="banneradd bor">
						<div class="baTopNo" align="center" style="margin-top: 20px;">
							<span>专业信息修改页面</span>
						</div>
						<div class="baBody" align="center"
							style="margin-left: -30px; margin-top: 50px;">
							<div class="bbD">
								所在院系：
								<input class="input3" style="color: #CABEBE;" value="${major.college.name }" type="text" readonly="readonly"/>
							</div>
							
							<div class="bbD">
								专业名称：
								<s:textfield name="major.name" cssClass="input3" />
							</div>
							<div class="bbD">
								专业说明：
								<s:textfield name="major.text" cssClass="input3" />
							</div>
							
							<div class="bbD">
								<p class="bbDP">
									<a><button type="submit" class="btn_ok btn_yes">
											提交
										</button>
									</a>
									<a href="m/list"><button type="button"
											style="color: black" class="btn_ok btn_no">
											取消
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