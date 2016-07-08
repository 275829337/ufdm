<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>修改租户管理员</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet">
</head>

<body>

	<form id="submitForm" class="form-horizontal">
	
		<input type="hidden" id="tenantUserId" value="${tenantUser.id}" />
	
	    <div class="form-group">
			<label class="col-sm-2 control-label ">名称</label>
			<div class="col-sm-10">
			    <input type="text" class="form-control" id="userName" value="${tenantUser.userName}" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">电话</label>
			<div class="col-sm-10">
			    <input type="text" class="form-control" id="phone" value="${tenantUser.phone}" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">电子邮件</label>
			<div class="col-sm-10">
			    <input type="text" class="form-control" id="email" value="${tenantUser.email}" />
			</div>
		</div>
		
		<div class="checkbox">
			<div class="col-sm-1"></div>
		    <label class="col-sm-11 checkbox-inline"><input id="modiPassCheck" type="checkbox" value="1" />&nbsp;修改密码</label>
		</div>
		
        
		<div id="modiPassView">
		    <div class="form-group">
				<label class="control-label col-sm-2">输入新密码</label>
				<div class="col-sm-10">
				    <input type="password" class="form-control" id="userPass1" /> 
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">再次输入密码</label>
				<div class="col-sm-10">
				    <input type="password" class="form-control" id="userPass2" /> 
				</div>
			</div>
		</div>
		
        <div class="col-sm-12">
		  <div class="navbar-btn">
		  	  <input type="button" value="确定" class="btn btn-primary col-sm-offset-3" id="commit" />
		 	  <input type="button" value="取消" class="btn btn-primary col-sm-offset-1" id="cancel" />
		  </div>
        </div>
	  
	</form> 
</body>

<script type="text/javascript">
	
	$(function() {

		$("#cancel").bind("click",function(){
			closeWindow(window.name);
		});
		
		$("#modiPassCheck").bind("click",function(){
			if($("#modiPassCheck").is(':checked')){
				$("#modiPassView").show();
			}
			else{
				$("#modiPassView").hide();
			}
		});
		
		// 修改密码默认不显示
		$("#modiPassView").hide();
				
	});
		
	$("#commit").bind("click",function(){
		
		var newPass = "";
		if($("#modiPassCheck").is(':checked')){
			if($("#userPass1").val()==''){
				top.layer.alert("新密码不能为空");
				return;
			}
			if($("#userPass1").val()!=$("#userPass2").val()){
				top.layer.alert("两次密码不一致");
				return;
			}
			newPass = $("#userPass1").val();
		}
		
		$.ajax({
			type: "POST",
			url: '<spring:url value="/tenuser/doEditTenantUser"/>',
			data:{
				id:$("#tenantUserId").val(),
				userName:$('#userName').val(),
				phone:$('#phone').val(),
				userPass:newPass,
				email:$('#email').val()
			},
			dataType: "json",
			async: false,
			success: function(data){
				if("0000000"==data.head.respCode){
					parent.window.contFrame.window.beCalled(data);
 					closeWindow(window.name);
				}
				else{
					alert(data.head.respContent);
				}
			}
		});
	});	
	
	
</script>
</html>
