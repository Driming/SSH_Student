<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>班级修改页面</title>
		<link rel="stylesheet" type="text/css" href="css/css.css" />
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript">
$(function(){
	var con=${grade.teac_no}
	var m = "辅导员";	
    $.ajax({
    url:"sel",
    type:"post",
    dataType:"json",
    data:"manager="+m,
    success:function(list1){
    	$.each(list1,function(i,index){
			if(con== this.id){
				$("#sel").append("<option  selected='selected'  value="+index.id+">"+index.name+"</option>")
				}
			else{
				$("#sel").append("<option value="+index.id+">"+index.name+"</option>")
			}
		})
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
				<!-- 班级修改页面 -->
				<form action="teac/updateGrade" method="post">
					<div class="banneradd bor">
						<div class="baTopNo" align="center" style="margin-top: 20px;">
							<span>班级修改页面</span>
						</div>
						<div class="baBody" align="center"
							style="margin-left: -30px; margin-top: 50px;">
							<div class="bbD">
								&nbsp;&nbsp;&nbsp;辅导员：
								<select id="sel" name="grade.teac_no" class="input3">

								</select>
							</div>
							<div class="bbD">
								班级名称：
								<s:textfield name="grade.name" cssClass="input3" />
							</div>

							<div class="bbD" style="width: 500px">
								<p class="bbDP" style="width: 500px">
									
											<a><button type="submit" class="btn_ok btn_yes" />
												提交</button></a>
									
											<a href="teac/gradeList"><button type="button" style="color: black"
												class="btn_ok btn_no" />
												取消</button></a>
								
								</p>
							</div>
						</div>

					</div>
				</form>
			</div>
		</div>
	</body>
</html>