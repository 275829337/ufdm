<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>修改用户信息</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet"/>
    <link href='<spring:url value="/js/plugin/zTree/zTreeStyle/zTreeStyle.css" />' rel="stylesheet"/>
</head>
<body>

<form id="submitForm" class="form-horizontal">
<input type="hidden" id="sysUserId" value="${sessionSysUser.id}"/>
<div class="form-group" style="margin-top: 15px">
	<div>
		<label class="control-label col-sm-2" for="loginName">登录名</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" id="loginName" value="${sysUser.loginName}"/>
	</div>
	<label class="control-label col-sm-2" for="realName">姓名</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" id="realName" value="${sysUser.realName}"/>
	</div>
	<label class="control-label col-sm-2" for="mobile">手机</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" id="mobile"  value="${sysUser.mobile}"/>
	</div>
	<label class="control-label col-sm-2" for="telephone">电话</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" id="telephone"  value="${sysUser.telephone}"/>
	</div>
	<label class="control-label col-sm-2" for="email">邮箱</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" id="email"  value="${sysUser.email}"/>
	</div>
	<input id="roleIds" type="hidden" value="${sysUser.hxRoleIds}"/>
	</div>
   
     <div id="toolbar" class="container" style="margin-top: 20%;">
		<button id="cancel" type="button" class="btn btn-default col-sm-offset-4" onclick=" window.history.go( -1 );">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消
		</button>
		<button id="commit" type="button" class="btn btn-default col-sm-offset-1">
			<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>更新
		</button>
	</div>
</div>
</form>
</body>
<script>
	$(function() {
		$("#cancel").bind("click",function(){
			if(confirm("确定要取消编辑操作吗？")){
				window.history.go(-1);
			}
		});
	});
	
	$("#commit").bind("click",function(){
		$.ajax({
			type: "get",
			url: '<spring:url value="/sysuser/doEditSysUser" />',
			data:{
				id:$("#sysUserId").val(),
				loginName:$("#loginName").val(),
				realName:$("#realName").val(),
				mobile:$("#mobile").val(),
				telephone:$("#telephone").val(),
				email:$("#email").val(),
				hxRoleIds:$("#roleIds").val().substring(1)
			},
			dataType: "json",
			async: false,
			success: function(data){
				if("0000000"==data.head.respCode){
					alert("修改成功");
				}else{
					alert("修改失败");
				}
			}
		});
	});	

</script>
</html>
