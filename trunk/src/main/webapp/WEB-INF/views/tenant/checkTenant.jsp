<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>租户认证</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet"/>
</head>
<body>

	<form id="submitForm" class="form-horizontal">
	
		<input type="hidden" id="tenantId" value="${tenant.id}" />
	
		<label class="control-label col-sm-2" >名称</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenant.description}" disabled />
		</div>
		<label class="control-label col-sm-2" >租户类型</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenant.tenanttypeDesc}" disabled /> 
		</div>
		
		<label class="control-label col-sm-2" >规模</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenant.enterprisescaleDesc}" disabled /> 
		</div>
		
		<label class="control-label col-sm-2" >营业年限</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenant.businessdurationDesc}" disabled /> 
		</div>
		
		<label class="control-label col-sm-2" >申请时间 </label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="<fmt:formatDate value="${tenant.lastupdatedate}" pattern="yyyy-MM-dd  HH:mm:ss" />" disabled /> 
		</div>
		
		<label class="control-label col-sm-2">租户状态</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenant.tenantstatusCode}" disabled />
		</div>
		
		<label class="control-label col-sm-2" for="mobile">审核结果</label>
		<div class="col-sm-8">
			<input type="radio" name="tenantstatusCode" value="4" />认证通过
			<input type="radio" name="tenantstatusCode" value="3" />认证失败
		</div>
		
	  <div class="navbar-btn">
	  	  <input type="button" value="确定" class="btn btn-primary col-sm-offset-3" id="commit" />
	 	  <input type="button" value="取消" class="btn btn-primary col-sm-offset-1" id="cancel" />
	  </div>
	</form> 
</body>

<script>
	var treeObj;
	$(function() {
		$("#cancel").bind("click",function(){
			closeWindow(window.name);
		});
	});
		
	$("#commit").bind("click",function(){
		var tenantstatusCodeValue = $('input:radio[name="tenantstatusCode"]:checked').val();
		var tenantstatusDesc = "";
		
		if(tenantstatusCodeValue==undefined){
			top.layer.alert("请选择审核结果");
			return;
		}
		else
		{
			if(tenantstatusCodeValue=='4'){
				tenantstatusDesc = '认证通过';
			}
			else if(tenantstatusCodeValue=='3'){
				tenantstatusDesc = '认证失败';
			}
		}
		$.ajax({
			type: "POST",
			url: '<spring:url value="/tenant/doCheckTenant" />',
			data:{
				id:$("#tenantId").val(),
				tenantstatusCode:tenantstatusCodeValue,
				tenantstatusDesc:tenantstatusDesc
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
