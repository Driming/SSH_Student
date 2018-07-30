<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>教工表</title>
		<link href="../css/style.css" rel="stylesheet" type="text/css" />
		<script src="../js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
	/*增删改查  提示框*/
	$(document).ready(function() {

		var did, name;
		$(".click").click(function() {
			name = $(this).parents("tr").find("#name").text();
			$("#pName").html("确定删除【" + name + "】吗？");
			did = $(this).parents("tr").find("td:eq(0)").children("#id").val();
			$(".tip").fadeIn(200);
		});

		//关闭按钮
			$(".tiptop a").click(function() {
				$(".tip").fadeOut(200);
			});

			//确定按钮
			$(".sure").click(function() {
				location.href = "deleteTeacher?id=" + did;
				$(".tip").fadeOut(100);
			});

			//取消按钮
			$(".cancel").click(function() {
				$(".tip").fadeOut(100);
			});

		});
</script>


	</head>


	<body>




		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">数据表</a>
				</li>
				<li>
					<a href="#">教工表</a>
				</li>
			</ul>
		</div>

		<div class="rightinfo">

			<div class="tools">

				<ul class="toolbar">
					<li>
						<span><img src="../images/t01.png" />
					
						</span><a href="../TeacherAdd.jsp">添加</a>
					</li>
					<li>
						<span><img src="../images/t03.png" />
						</span>删除
					</li>
				</ul>


				<ul class="toolbar1">
					<li>
						<span><img src="../images/t05.png" />
						</span>设置
					</li>
				</ul>

			</div>


			<table class="tablelist">
				<thead>
					<tr>
						<th>
							<input name="" type="checkbox" value="" checked="checked" />
						</th>
						<th>
							序号
						</th>
						<th>
							教工编号
						</th>
						<th>
							教工姓名
						</th>
						<th>
							教工职位
						</th>
						<th colspan="2">
							操作
						</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="list" status="status">
						<tr>
							<td>
								<input id="id" type="checkbox" value="<s:property value='id'/>" />
							</td>
							<td>
								<s:property value="#status.count" />
							</td>
							<td>
								<s:property value="no" />
							</td>
							<td id="name">
								<s:property value="name" />
							</td>
							<td>
								<s:property value="manager" />
							</td>
							<td class="td_w">
								<a href="modifyTeacher?id=<s:property value='id'/>"><img src="../images/t02.png" />修改</a>
									</td>
									
									<td class="td_w">
								<a class=" click"> <img src="../images/t03.png" /> 删除</a>
							</td>
						</tr>
					</s:iterator>
	</tbody>
			</table>
			
			
			
			<div class="pagin">
				<div class="message">
					当前显示第&nbsp;
					<i class="blue">${page }&nbsp;</i>页，共&nbsp;
					<i class="blue">${pages }</i>&nbsp;页
				</div>
				<ul class="paginList">
					<s:if test="page>1">
						<li class="paginItem">
							<a href="teacherList?page=<s:property value="page-1"/> ">上一页</a>
						</li>
					</s:if>
					<s:else>
						<li class="paginItem">
							<a> 上一页</a>
						</li>
					</s:else>

					<s:if test="page < pages">
						<li class="paginItem">
							<a href="teacherList?page=<s:property value="page+1"/> ">下一页</a>
						</li>
					</s:if>
					<s:else>
						<li class="paginItem">
							<a>下一页</a>
						</li>
					</s:else>
				</ul>
			</div>
			



			<div class="tip">
				<div class="tiptop">
					<span>提示信息</span><a></a>
				</div>

				<div class="tipinfo">
					<span><img src="../images/ticon.png" />
					</span>
					<div class="tipright">
						<p id="pName"></p>
						<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
					</div>
				</div>

				<div class="tipbtn">
					<input name="" type="button" class="sure" value="确定" />
					&nbsp;
					<input name="" type="button" class="cancel" value="取消" />
				</div>

			</div>

		</div>
	</body>
</html>
