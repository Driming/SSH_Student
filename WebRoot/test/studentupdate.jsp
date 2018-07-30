<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加用户</title>
<link rel="stylesheet" type="text/css" href="../css/css.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
      var con=${student.gradeid}
      $.ajax({
      url:"q",
      type:"post",
      dataType:"json",
      success:function(list){
          $.each(list,function(i,index){
                        if(con==this.id){
                        	$("#grade").append("<option selected='selected' value="+index.id+">"+index.name+"</option>");
                        
                        }else{
                        $("#grade").append("<option value="+index.id+">"+index.name+"</option>");
                        
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
				<img src="../img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp;-</span>&nbsp;学生信息修改
			</div>
		</div>
		<div class="page ">
			<!-- 会员注册页面样式 -->
			<div class="banneradd bor">
				<div class="baTopNo">
					<span>学生信息修改</span>
				</div>
				<form action="updatestudent" method="post">
				<div class="baBody">
					<div class="bbD">
						学号：<input type="text" class="input3" name="student.no" value="${student.no }"/>
					</div>
					<div class="bbD">
						姓名：<input type="text" class="input3" name="student.stuname" value="${student.stuname }"/>
					</div>
					<div class="bbD">
						生日：<input type="text" class="input3" name="student.birthday" value="${student.birthday }"/><span>如：1982-06-19</span>
					</div>
					<div class="bbD">
						院系：<input type="text" class="input3" name="student.collegeid" value="${student.college.name }" readonly="readonly"/>
					</div>
					<div class="bbD">
						专业：<input type="text" class="input3" name="student.majorid" value="${student.major.name }" readonly="readonly"/>
					</div>
					<div class="bbD">
						班级：<select id="grade" class="input3" name="student.gradeid"></select>
					</div>
					<div class="bbD">
						年龄：<input type="text" class="input3" name="student.age" value="${student.age }"/>
					</div>
					<div class="bbD">
						<p class="bbDP">
							<input class="btn_ok btn_yes" type="submit" value="提交"/>
							<a class="btn_ok btn_no" href="findStudent">取消</a>
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