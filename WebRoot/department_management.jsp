<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8"> 
    <title></title>
    <script src="${APP_PATH }/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH }/css/bootstrap.min.css">
   
</head>
<style>
    .tap{ width: 94%;margin-left: 3%; border:1px solid #d9d9d9;border-radius: 4px;}
    .tasod tr td{display: table-cell;vertical-align:middle; }
    .lotir{ display: inline; width: 65px;}
    .faoosd{display: inline;width: 152px;}
    .shou-do{width: 18px; height: 16px;margin-top: -6px;}
</style>
<body>


<ol class="breadcrumb">
    <li><a href="#">组织架构</a></li>
    <li><a href="#">机构管理</a></li>
    <li class="active">部门信息</li>
</ol>
<div style="padding:30px 30px 0px 30px;width: 94%; border: 1px solid #ddd;margin-left: 3%;border-radius: 6px;">
<ul id="myTab" class="nav nav-tabs">
    <li class="active">
        <a href="#home" data-toggle="tab">
             部门信息
        </a>
    </li>
    <button type="button" class="btn  btn-default pull-right">导出 <img src="${APP_PATH }/images/right.png" class="shou-do" ></button>
</ul>
<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="home">
   		
    
        <table class="table tasod "  width="100%">
            <tr>
                <td>姓名：</td>
                <td>
                    <select  class="form-control" style="width: 152px;display: inline; ">
                        <option>人力资源部</option>
                        <option>商务部</option>
                        <option>行政办公室</option>
                        <option>信息中心</option>
                    </select>
                    <input type="checkbox" name=""><span> 仅直属 </span>
                </td>
                <td>部门名称：</td>
                <td> <input type="text" class="form-control faoosd"  name=""></td>
            </tr>
           
            <tr>
                <td colspan="4"> <button type="button" class="center-block btn btn-success"><img src="${APP_PATH }/images/fangdajing.png" class="shou-do" /> 保存 </button></td>
            </tr>
        </table>   
    </div>
 
</div>
    
</div>

<!---------------------------- 分割线 ------------------------------->
<div><span>&nbsp;</span></div>
<div>
 <div class="col-md-4 col-md-offset-8">
         <button class="btn btn-default" id="add_btn">新增</button>
         <button class="btn btn-default" id="delete_all_btn">删除</button>
 </div>
		
     
<table class="table table-hover tap " id="depts_table">
        <thead>
        <tr>
        <th><input name="" type="checkbox" id="check_all" /></th>
     <th>部门编号</th>
      <th>部门名称</th>
      <th>部门领导</th>
      <th>上级部门</th>
      <th>人员上限</th>
      <th>尚需人数</th>
      <th>部门职责</th>
      <th>办公地址</th>
	  <th>办公电话</th>
      <th>传真号码</th>
      <th>操作</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <div class="row">
          <div class="col-md-offset-1" id="page_info_area"></div>
          <div class="col-md-offset-8" id="page_nav_area"></div>
       </div>

</div>

</body>
<script type="text/javascript">

var totalRecord,currentPage;  //定义一个全局的总记录和一个当前页数

	//1、页面加载完成后，直接去发送一个ajax请求，要到分页数据
	$(function(){
	//1、页面加载完成后，直接去发送一个ajax请求，要到分页数据
		to_page(1);
	});
	
	function to_page(pn){
		$.ajax({
			url:"${APP_PATH }/depts",
			data:"pn="+pn,
			type:"GET",
			success:function(result){
				
				build_depts_table(result);
				//2.解析并显示分页信息
				build_page_info(result);
				//3.解析并显示分页条数据
				build_page_nav(result);
			}
		});
	}
	
	
	function build_depts_table(result){
		//清空table(必须清空)
	$("#depts_table tbody").empty();
		
		var depts = result.extend.pageInfo.list;
		$.each(depts,function(index,item){
			
		var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
		var deptidTd = $("<td></td>").append(item.deptid);
		var deptnameTd = $("<td></td>").append(item.deptname);
		var leadernameTd = $("<td></td>").append(item.leadername);
		var updeptTd = $("<td></td>").append(item.updept);
		var dutydeptTd = $("<td></td>").append(item.dutydept);
		var uplingnumTd = $("<td></td>").append(item.uplingnum);
		var peoplenumTd = $("<td></td>").append(item.peoplenum);
		var addressTd = $("<td></td>").append(item.address);
		var deptphoneTd = $("<td></td>").append(item.deptphone);
		var facsimileTd = $("<td></td>").append(item.facsimile);
		
		var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
					.append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
					.append("编辑");
		
		editBtn.attr("edit-id",item.deptid);
		var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm detele_btn")
					.append($("<span></span>").addClass("glyphicon glyphicon-trash"))
					.append("删除");
		delBtn.attr("del-id",item.deptid);
		var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
		//append方法执行完以后还是返回原来的元素
		$("<tr></tr>").append(checkBoxTd)
					.append(deptidTd)
					.append(deptnameTd)
					.append(leadernameTd)
					.append(updeptTd)
					.append(uplingnumTd)
					.append(peoplenumTd)
					.append(dutydeptTd)
					.append(addressTd)
					.append(deptphoneTd)
					.append(facsimileTd)
					.append(btnTd)
					.appendTo("#depts_table tbody");
		});
	}
	
	//解析并显示分页信息
function build_page_info(result){
	//清空table
	$("#page_info_area").empty();
	
	$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，共"+
			result.extend.pageInfo.pages+"页，共"+result.extend.pageInfo.total+"条记录");
	totalRecord = result.extend.pageInfo.total;
	currentPage = result.extend.pageInfo.pageNum;
}
	
	//解析显示分页条，点击分页功能
function build_page_nav(result) {
	
	//清空table
	$("#page_nav_area").empty();
		
		var ul = $("<ul></ui>").addClass("pagination");
	
	var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
	var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
	if(result.extend.pageInfo.hasPreviousPage == false){
		firstPageLi.addClass("disabled");
		prePageLi.addClass("disabled");
	}else{
		//为四个按钮添加单击事件
		//首页
		firstPageLi.click(function(){
			to_page(1);
		});
		//上一页
		prePageLi.click(function(){
			to_page(result.extend.pageInfo.pageNum-1);
		});
	}
	var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
	var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页"));
	if(result.extend.pageInfo.hasNextPage  == false){
		nextPageLi.addClass("disabled");
		lastPageLi.addClass("disabled");
	}
	//添加首页和上一页 的提示
	ul.append(firstPageLi).append(prePageLi);
	//遍历给ul中添加页码（1 2 3 4 5）提示
	$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
		
		var numLi = $("<li></li>").append($("<a></a>").append(item));
		if(result.extend.pageInfo.pageNum == item){
			numLi.addClass("active");
		}else{
			//下一页
    		nextPageLi.click(function(){
    			to_page(result.extend.pageInfo.pageNum+1);
    		});
    		//尾页
    		lastPageLi.click(function(){
    			to_page(result.extend.pageInfo.pages);
    		});
		}
		//页码的单击事件
		numLi.click(function() {
			to_page(item);
		});
		ul.append(numLi);
		
	});
	//添加下一页和尾页
	ul.append(nextPageLi).append(lastPageLi);
	//把ul添加到nav
	var navEle = $("<nav></nav>").append(ul);
	navEle.appendTo("#page_nav_area");
	}
	//完整重置表单的方法
	function reset_form(ele){
		//清空数据
		$(ele)[0].reset();
		//清空表单样式
		$(ele).find("*").removeClass("has-success has-error");
		$(ele).find(".help-block").text("");
		
	}
	
	
	//点击新增按钮，弹出模态框
  	$("#add_btn").click(function(){
  	//清除表单数据(数据、样式)
  		reset_form("#addDeptModal form");
  		//发送ajax请求，查出部门信息，显示在下拉列表中
  		getDepts("#dept_add_select");
  		
  		
  		$("#addDeptModal").modal({
  			backdrop:"static"
  		});
  	});
	
 	function getDepts(ele) {
		//清空下拉列表
		$(ele).empty();
		var nullEle = $("<option></option>").append("--顶级--");
		nullEle.appendTo(ele);
		
		$.ajax({
			url:"${APP_PATH}/allDept",
			type:"GET",
			success:function(result){
				
				$.each(result.extend.allDept,function(){
					var optionEle = $("<option></option>").append(this.deptname).attr("value",this.deptname);
					optionEle.appendTo(ele);
				});
			}
		});
	}
 	
 	
 	//验证表单数据
  	function validate_add_form(){
		//验证部门名
		var deptName = $("#add_deptname").val().trim();
		var regdeptName = /^[\u4E00-\u9FA5]{3,10}$/; 
		
		if(!regdeptName.test(deptName)){
			show_validate_msg("#add_deptname","error","部门名可以是2-8位中文");
			return false;	
			
		}else{

			show_validate_msg("#add_deptname","success","");
		}
		
		//领导名
		var leadername = $("#add_leadername").val().trim();
		var regleadername = /(^[A-Za-z]{3,20}$)|(^[\u4E00-\u9FA5]{2,6}$)/; 
		
		if(!regleadername.test(leadername)){
			show_validate_msg("#add_leadername","error","领导名称不规范");
			return false;	
			
		}else{

			show_validate_msg("#add_leadername","success","");
		}
		
		//人员上限
		var uplingnum = $("#add_uplingnum").val().trim();
		var reguplingnum = /^[0-9]{1,}$/;
		if(!reguplingnum.test(uplingnum)){
			show_validate_msg("#add_uplingnum","error","请填写数字");
			return false;	
			
		}else{

			show_validate_msg("#add_uplingnum","success","");
		}
		//办公地址
		var address = $("#add_address").val().trim();
		
		if(address==null||address==""){
			show_validate_msg("#add_address","error","不能为空");
			return false;	
			
		}else{

			show_validate_msg("#add_address","success","");
		}
		
		//办公电话
		var deptphone = $("#add_deptphone").val().trim();
		
		if(deptphone==null||deptphone==""){
			show_validate_msg("#add_deptphone","error","不能为空");
			return false;	
			
		}else{
			show_validate_msg("#add_deptphone","success","");
		}
		//传真
		var facsimile = $("#add_facsimile").val().trim();
		if(facsimile==""||facsimile==null){
			show_validate_msg("#add_facsimile","error","不能为空");
			return false;	
			
		}else{

			show_validate_msg("#add_facsimile","success","");
		}
		return true;
	}
 
	//显示校验结果的提示信息
  	function show_validate_msg(ele,status,msg){
  		//清除当前的元素状态
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next("span").text("");
  		
  		if("success"==status){
  			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
  		}else if("error"==status){
  			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
  		}
  	}
 	
	
  	$("#add_deptname").change(function(){
  		//发送ajax校验用户名是否可用
  		var deptname = this.value;
  		$.ajax({
  			url:"${APP_PATH}/checkname",
  			data:"deptname="+deptname,
  			type:"POST",
  			success:function(result){
  				if(result.code == 100){
  					show_validate_msg("#add_deptname","success","部门名可用");
  					$("#save_dept").attr("ajax-va","success");
  				}else{
  					show_validate_msg("#add_deptname","error",result.extend.va_msg);
  					$("#save_dept").attr("ajax-va","error");
  				}
  			}
  		});
  	});
 	

  	$("#save_dept").click(function(){
  	
  		//1.模态框中填写信息的表单数据提交给服务器进行保存
  		
  		//先要对表单数据进行校验
  		if(!validate_add_form()){
  			return false;
  		}
  		
  		if($(this).attr("ajax-va")=="error"){
  			return false;
  		}
  		
  		//2.发送ajax请求保存员工
  		$.ajax({
  			url:"${APP_PATH}/dept",
  			type:"POST",
  			data:$("#addDeptModal form").serialize(),
  			success:function(result){
  				if(result.code == 100){

	  				
	  				$("#addDeptModal").modal('hide');
	  				//来到最后一页显示数据，发送ajax请求，显示最后一页数据即可
	  				to_page(totalRecord);
  				}else{
  					//显示失败信息
  					//console.log(result);
  					//有哪个字段的错误信息就显示哪个字段的错误信息
  					if(undefined != result.extend.errorFields.deptname){
  						
  						show_validate_msg("#add_deptname","error",result.extend.errorFields.deptname);
  					}
  					if(undefined != result.extend.errorFields.leadername){
  						
  						show_validate_msg("#add_leadername","error",result.extend.errorFields.leadername);
  					}
  					if(undefined != result.extend.errorFields.uplingnum){
  						
  						show_validate_msg("#add_uplingnum","error",result.extend.errorFields.uplingnum);
  					}
  					if(undefined != result.extend.errorFields.address){
  						
  						show_validate_msg("#add_address","error",result.extend.errorFields.address);
  					}
  					
  					if(undefined != result.extend.errorFields.deptphone){
  						
  						show_validate_msg("#add_deptphone","error",result.extend.errorFields.deptphone);
  					}
  					if(undefined != result.extend.errorFields.facsimile){
  						
  						show_validate_msg("#add_facsimile","error",result.extend.errorFields.facsimile);
  					}
  				}
  			}
  		});
  	});
	
	$(document).on("click",".edit_btn",function(){
  		//alert("修改");
  		
  		//查出部门信息，并显示部门列表
  		getDepts("#dept_Update_select");
  		
  		getdept($(this).attr("edit-id"));
  		
  		$("#Update_dept").attr("edit-id",$(this).attr("edit-id"));
  		
  		$("#UpdateDeptDeptModal").modal({
  			backdrop:"static"
  		});
  	});
	
	function getdept(id){
  		$.ajax({
  			url:"${APP_PATH}/dept/"+id,
  			type:"GET",
  			success:function(result){
  				//console.log(result);
  				var deptData = result.extend.dept;
  				$("#Updatedeptname").text(deptData.deptname);
  				$("#Updateleadername").val(deptData.leadername);
  				$("#dept_Update_select").val(deptData.updept);
  				$("#Updatedutydept").val(deptData.dutydept);
  				$("#Updateuplingnum").val(deptData.uplingnum);
  				$("#Updatepeoplenum").val(deptData.peoplenum);
  				$("#Updateaddress").val(deptData.address);
  				$("#Updatedeptphone").val(deptData.deptphone);
  				$("#Updatefacsimile").val(deptData.facsimile);
  				
  			}
  		});
  	}
  	
	$("#Update_dept").click(function(){
		//领导名
		var leadername = $("#Updateleadername").val().trim();
		var regleadername = /(^[A-Za-z]{3,20}$)|(^[\u4E00-\u9FA5]{2,6}$)/; 
		
		if(!regleadername.test(leadername)){
			show_validate_msg("#Updateleadername","error","领导名称不规范");
			return false;	
			
		}else{

			show_validate_msg("#Updateleadername","success","");
		}
		
		//人员上限
		var uplingnum = $("#Updateuplingnum").val().trim();
		var reguplingnum = /^[0-9]{1,}$/;
		if(!reguplingnum.test(uplingnum)){
			show_validate_msg("#Updateuplingnum","error","请填写数字");
			return false;	
			
		}else{

			show_validate_msg("#Updateuplingnum","success","");
		}
		
		//尚需人数
		var peoplenum = $("#Updatepeoplenum").val().trim();
		if(!reguplingnum.test(peoplenum)){
			show_validate_msg("#Updatepeoplenum","error","请填写数字");
			return false;	
			
		}else{

			show_validate_msg("#Updatepeoplenum","success","");
		}
		//办公地址
		var address = $("#Updateaddress").val().trim();
		
		if(address==null||address==""){
			show_validate_msg("#Updateaddress","error","不能为空");
			return false;	
			
		}else{

			show_validate_msg("#Updateaddress","success","");
		}
		
		//办公电话
		var deptphone = $("#Updatedeptphone").val().trim();
		
		if(deptphone==null||deptphone==""){
			show_validate_msg("#Updatedeptphone","error","不能为空");
			return false;	
			
		}else{
			show_validate_msg("#Updatedeptphone","success","");
		}
		//传真
		var facsimile = $("#Updatefacsimile").val().trim();
		if(facsimile==""||facsimile==null){
			show_validate_msg("#Updatefacsimile","error","不能为空");
			return false;	
			
		}else{

			show_validate_msg("#Updatefacsimile","success","");
		}
		
		$.ajax({
			url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
			type:"PUT",
			data:$("#UpdateDeptDeptModal form").serialize(),  //把post请求改为put请求
			success:function(result){ 
				//alert(result.msg);
				//关闭模态框
				$("#UpdateDeptDeptModal").modal("hide");
				//回到本页面
				to_page(currentPage);
			}
		}); 
  	});
	
	
	//单个删除
  	$(document).on("click",".detele_btn",function(){
  		//弹出是否确认删除对话框
  		var deptName = $(this).parents("tr").find("td:eq(2)").text();
  		var deptid = $(this).attr("del-id");
  	
  		if(confirm("确认删除【"+ deptName +"】吗?")){
  			//确认，发送ajax请求删除即可
  			$.ajax({
  				url:"${APP_PATH}/dept/"+deptid,
  				type:"DELETE",
  				success:function(result){
  					alert(result.msg);
  					//回到本页
  					to_page(currentPage);
  				}
  			});
  		}
  	});
	
  //点击单选框，全选/全不选
  	$("#check_all").click(function(){
  		
  		$(".check_item").prop("checked",$(this).prop("checked"));
  	});
  	
  	//当子级的单选框(".check_item")选全部被中后，父级的单选框("#check_all")自动被选中
  	$(document).on("click",".check_item",function(){
  		
  		var flag = $(".check_item:checked").length==$(".check_item").length;
  		$("#check_all").prop("checked",flag);
  	});
  	
  	
	//点击全部删除，批量删除
  	$("#delete_all_btn").click(function(){
  		var deptNames = "";
  		var del_idstr = "";
  		$.each($(".check_item:checked"),function(){
  			deptNames += $(this).parents("tr").find("td:eq(2)").text()+"，";
  		
  			del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
  		});
  		

  		deptNames = deptNames.substring(0,deptNames.length-1);
  		//去除删除的id多余的"-"
  		del_idstr = del_idstr.substring(0,del_idstr.length-1);
	  		
  		if(del_idstr==0){
  			alert("请选择要删除的部门");
  		}else{
  			if(confirm("确认删除【"+ deptNames +"】吗?")){
	  			//发送ajax请求删除
	  			$.ajax({
	  				url:"${APP_PATH}/dept/"+del_idstr,
	  				type:"DELETE",
	  				success:function(result){
	  					alert(result.msg)
	  					//回到当前页面
	  					to_page(currentPage);
	  				}
	  			});
	  		}
  		}
  	});
</script>


<script src="${APP_PATH }/js/bootstrap.min.js"></script>

</html>
