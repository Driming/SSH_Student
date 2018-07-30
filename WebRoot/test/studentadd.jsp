<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加用户</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var c_id;
      $.ajax({
          url:"stu/s",
          type:"post",
          dataType:"json",
          success:function(list){
   
    $.ajax({
      url:"stu/q",
      type:"post",
      dataType:"json",
      success:function(list){
          $.each(list,function(i,index){
                                                                     
                        $("#grade").append("<option value="+index.id+">"+index.name+"</option>");                       
         
          
          })
      
      }
      
      })
   
   
   
   
               $.each(list,function(i,index){
               	$("#college").append("<option value="+index.id+">"+index.name+"</option>");
               })
               
            
              
               
          }
      })
      
      
      $("#college").change(function(){
      	$("#major"). empty();
      	c_id = $('#college option:selected').val();  
		$.ajax({
		 	url:"stu/m",
		 	type:"post",
			data:"cid="+c_id,
		 	dataType:"json",
		 	success:function(list){
		 		$.each(list,function(i,index){
		 			$("#major").append("<option value="+index.id+">"+index.name+"</option>");
		 		})
		 	}
		 	});
		});
});
</script>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="images/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp;-</span>&nbsp;学生信息添加
			</div>
		</div>
		<div class="page ">
			<!-- 会员注册页面样式 -->
			<div class="banneradd bor">
				<div class="baTopNo">
					<span>学生信息添加</span>
				</div>
				<form action="stu/addstudent" method="post">
				<div class="baBody">
					<div class="bbD">
						学号：<input type="text" class="input3" name="student.no"/>
					</div>
					<div class="bbD">
						姓名：<input type="text" class="input3" name="student.stuname"/>
					</div>
					<div class="bbD">
						生日：<input type="text" class="input3" name="student.birthday"/><span>如：1982-06-19</span>
					</div>
					<div class="bbD">
						院系：<select id="college" class="input3" name="student.collegeid">
							<option value="0">请选择院系</option></select>

					</div>
					<div class="bbD">
						专业：<select id="major" class="input3" name="student.majorid">
						<option value="0">请选择专业</option></select>
					</div>
					<div class="bbD">
						班级：<select id="grade" class="input3" name="student.gradeid">
						<option value="0">请选择班級</option></select>
					</div>
					<div class="bbD">
						年龄：<input type="text" class="input3" name="student.age"/>
					</div>
					<div class="bbD">
						<p class="bbDP">
							<input class="btn_ok btn_yes" type="submit" value="提交"/>
							<a class="btn_ok btn_no" href="/SSH_Student/stu/findStudent">取消</a>
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