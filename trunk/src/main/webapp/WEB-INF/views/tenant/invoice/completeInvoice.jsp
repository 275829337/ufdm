<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>发票完成确认</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet"/>
</head>
<body>

	<form id="submitForm" class="form-horizontal">
	
		<input type="hidden" id="invoiceLogId" value="${tenantInvoiceLog.id}" />
		
		<label class="control-label col-sm-2" >租户</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenantInvoiceLog.tname}" disabled />
		</div>
		
		<label class="control-label col-sm-2" >发票抬头</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenantInvoiceLog.title}" disabled />
		</div>
		
		<label class="control-label col-sm-2" >发票类型</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenantInvoiceLog.invoicetypeDesc}" disabled />
		</div>
		
		<label class="control-label col-sm-2" >金额</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenantInvoiceLog.invoicemoney}" disabled /> 
		</div>
		
		<label class="control-label col-sm-2" >申请时间 </label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="<fmt:formatDate value="${tenantInvoiceLog.applytime}" pattern="yyyy-MM-dd  HH:mm:ss" />" disabled /> 
		</div>
		
		
		<label class="control-label col-sm-2" >收件人</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenantInvoiceLog.recipient}" disabled /> 
		</div>
		<label class="control-label col-sm-2" >收件地址</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenantInvoiceLog.recipientaddress}" disabled /> 
		</div>
		<label class="control-label col-sm-2" >联系电话</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenantInvoiceLog.phone}" disabled /> 
		</div>
		<label class="control-label col-sm-2" >备注</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenantInvoiceLog.remark}" disabled /> 
		</div>

		<label class="control-label col-sm-2" >发票代码</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="invoicecode" value="${tenantInvoiceLog.invoicecode}" disabled/> 
		</div>
		<label class="control-label col-sm-2" >发票号</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="invoiceno" value="${tenantInvoiceLog.invoiceno}"  disabled/> 
		</div>
		
		<label class="control-label col-sm-2" >快递公司</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="expressCompany" value="${tenantInvoiceLog.expressCompany}" disabled/>
		</div>
		<label class="control-label col-sm-2" >快递单号</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="expressNumber" value="${tenantInvoiceLog.expressNumber}"  disabled/> 
		</div>
		
		<label class="control-label col-sm-2" for="mobile">是否完成</label>
		<div class="col-sm-8">
			<input type="radio" name="invoicestatusCode" value="4" />已完成
			<input type="radio" name="invoicestatusCode" value="5" />作废
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
		
		var invoicestatusCodeValue = $('input:radio[name="invoicestatusCode"]:checked').val();
		var invoicestatusCodeText;
		if(invoicestatusCodeValue==undefined){
			top.layer.alert("请选择审核状态");
			return;
		}
		if(invoicestatusCodeValue==4){
			invoicestatusCodeText = '已完成';
		}
		else if(invoicestatusCodeValue==5){
			invoicestatusCodeText = '作废';
		}
		$.ajax({
			type: "POST",
			url: '<spring:url value="/teninv/doEditInvoice" />',
			data:{
				id:$("#invoiceLogId").val(),
				invoicecode:$("#invoicecode").val(),
				invoiceno:$("#invoiceno").val(),
				invoicestatusCode:invoicestatusCodeValue,
				invoicestatusDesc:invoicestatusCodeText
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
