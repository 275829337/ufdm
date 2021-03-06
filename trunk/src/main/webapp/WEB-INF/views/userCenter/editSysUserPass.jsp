<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>修改密码</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
</head>
<body>

<form id="submitForm" class="form-horizontal">
<input type="hidden" id="sysUserId" value="${sysUser.id}"/>
<div class="form-group" style="margin-top: 15px">
	<label class="control-label col-sm-2" for="oldPass">原密码</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" id="oldPass">
	</div>
	<label class="control-label col-sm-2" for="newPass">新密码</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" id="newPass">
	</div>
	<label class="control-label col-sm-2" for="confirmPass">确认密码</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" id="confirmPass">
	</div>
   
    <div id="toolbar" class="container" style="margin-top: 17%;">
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
		
	});
	
	$("#commit").bind("click",function(){
		$.ajax({
			type: "post",
			url: '<spring:url value="/sysuser/account/doEditSysUserPass" />',
			data:{
				id:$("#sysUserId").val(),
				oldLoginPass:$("#oldPass").val(),
				loginPass:$("#newPass").val(),
				repeatLoginPass:$("#confirmPass").val()
			},
			dataType: "json",
			async: false,
			success: function(data){
				if("0000000"==data.head.respCode){
					alert(data.body);
					location="'<spring:url value="/sysuser/account/doSysUserLogout" />'";
				}else{
					alert(data.head.respContent);
				}
			}
		});
	});	

</script>
</html>
