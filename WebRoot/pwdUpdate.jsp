<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>修改密码</title>
		<link rel="stylesheet" type="text/css" href="css/css.css" />
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
		$(function(){
			var pwd,newPwd,checkPwd;
			$("#pwd").blur(function(){
				pwd = $("#pwd").val();
				if(pwd==null||pwd==""){
					$("#msg").text("不能为空");
					$("#sub_btn").attr('disabled',true);
				}else{
					$.ajax({
						url:"acc/checkPwd",
						type:"post",
						dataType:"json",
						data:"pagePwd="+pwd,
						success:function(list){
							if(list.checkpwd!=""){
								$("#msg").text(list.checkpwd);
								$("#sub_btn").attr('disabled',true);
							}	
							else{
								$("#msg").text(list.checkpwd);
								$("#sub_btn").attr('disabled',false);
							}
						}	
					});
				}
			});

		$("#newPwd").blur(function(){
			newPwd = $("#newPwd").val();
			if(newPwd==""||newPwd==null){
				$("#msg1").text("不能为空");
				$("#sub_btn").attr('disabled',true);
			}else{
				$("#msg1").text("");
				$("#sub_btn").attr('disabled',false);
			}
			
		});

		$("#checkPwd").blur(function(){
			checkPwd = $("#checkPwd").val();
			if(checkPwd==""||checkPwd==null){
				$("#msg2").text("不能为空");
				$("#sub_btn").attr('disabled',true);
			}else{
				if(checkPwd!=newPwd){
					$("#msg2").text("密码输入不一致，请重新输入密码");
					$("#sub_btn").attr('disabled',true);
				}else{
					$("#msg2").text("");
					$("#sub_btn").attr('disabled',false);
				}
			}
			
		});
			

		});
		</script>
		
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
				<form action="acc/updatePwd" method="post">
					<div class="banneradd bor">
						<div class="baTopNo">
							<span>修改密码</span>
						</div>
						<div class="baBody">
							
							<div class="bbD">
								用户账号：<input type="text" name="account.account" value="${account }" readonly="readonly" class="input3"/>
							</div>
							<div class="bbD">
								&emsp;原密码：<input type="password" id="pwd" class="input3"/> <span style="color:red" id="msg"></span>
								
							</div>
							<div class="bbD">
								&emsp;新密码：<input type="password" id="newPwd" name="newPwd" class="input3"/><span style="color:red" id="msg1"></span>
							</div>
							<div class="bbD">
								确认密码：<input type="password" id="checkPwd" name="account.pwd" class="input3"/>
								<span style="color:red" id="msg2"></span>
							</div>
							<div class="bbD">
								<p class="bbDP">
									<a><button type="submit" id="sub_btn" class="btn_ok btn_yes">
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