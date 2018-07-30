<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>添加用户</title>
		<link rel="stylesheet" type="text/css" href="../css/css.css" />
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<script type="text/javascript">
$(function(){
      var con=${score.courseid}
      $.ajax({
          url:"stu/sel",
          type:"post",
          dataType:"json",
          success:function(list){
               $.each(list,function(i,index){
               if(con==this.id){
                $("#sel").append("<option selected='selected' value="+index.id+">"+index.name+"</option>")
               }else{
               $("#sel").append("<option value="+index.id+">"+index.name+"</option>")
               
               }
              
               })
                   
          }
      })


})

</script>
	</head>
	<body>
		<div id="pageAll">
			<div class="pageTop">
				<div class="page">
					<img src="../images/coin02.png"" />
					<span><a href="#">首页</a>&nbsp;-&nbsp;<a href="#">公共管理</a>&nbsp;-</span>&nbsp;成绩修改
				</div>
			</div>
			<div class="page ">
				<!-- 会员注册页面样式 -->
				<div class="banneradd bor">
					<div class="baTopNo" align="center" style="margin-top: 20px;">
						<span>成绩修改</span>
					</div>
					<form action="stu/updatescore" method="post">
						<div class="baBody" align="center"
							style="margin-left: -30px; margin-top: 50px;">
							<div class="bbD">
								年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份：&nbsp;
								<input type="text" class="input3" name="score.year"
									value="${score.year}" />
							</div>
							<div class="bbD">
								科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目：&nbsp;
								<select id="sel" name="score.courseid" class="input3"></select>
							</div>
							<div class="bbD">
								分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数：&nbsp;
								<input type="text" class="input3" name="score.score"
									value="${score.score }" />
							</div>
							<div class="bbD">
								学员学号：
								<input type="text" class="input3" name="score.stuno"
									value="${score.stuno }" />
							</div>
							<div class="bbD">
								学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期：&nbsp;&nbsp;
								<select name="score.term" class="input3">
									<option value="上学期">
										上学期
									</option>
									<option value="下学期">
										下学期
									</option>
								</select>

							</div>
							<div class="bbD" style="width: 500px">
								<p class="bbDP" style="width: 500px">
									<a><button type="submit" class="btn_ok btn_yes" />
											提交
										</button> </a>
									<a href="findScore"><button type="button"
											style="color: black" class="btn_ok btn_no">
											取消
										</button> 
									</a>
								</p>
							</div>
						</div>
					</form>
				</div>

				<!-- 会员注册页面样式end -->
			</div>
		</div>
	</body>
</html>