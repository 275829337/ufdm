<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>优惠券创建</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrapValidator/bootstrapValidator.min.css" />' rel="stylesheet">
    <link href='<spring:url value="/css/plugin/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />' rel="stylesheet">
</head>
<body>
	<form id="submitForm" class="form-horizontal">
		<div class="form-group" style="margin-top: 15px">
			<label class="control-label col-sm-2" for="price">金额：</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="price" placeholder="金额"/>
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="coupontypeCode">优惠券类型：</label>
			<div class="col-sm-10"> 
				<select class="form-control" id="coupontypeCode">
					<c:forEach var="coupontype" items="${coupontypeList}">
						<option value="${coupontype.code}">${coupontype.remark}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="applicant">申请人：</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="applicant" placeholder="申请人"/>
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="validDate">有效时间：</label>
			<div class="col-sm-10"> 
				<div class='input-group date' id='datetimepicker'>
                    <input type='text' class="form-control" id="validDate"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
			</div>
		</div>
		<div class="form-group date" >
			<label class="control-label col-sm-2" for="remark">备注 ：</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="remark" placeholder="备注"/>
			</div>
		</div>
	
	<div id="toolbar" class="btn-group col-sm-offset-4">
		<button id="cancel" type="button" class="btn btn-danger">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
		</button>
		<button id="commit" type="button" class="btn btn-info">
			<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>提交
		</button>
	</div>
	</form>
	
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrapValidator/bootstrapValidator.min.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-datetimepicker/moment-with-locales.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-datetimepicker/bootstrap-datetimepicker.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/common/common.js" />'></script>
	<script type="text/javascript">
	$(function() {
		$('#datetimepicker').datetimepicker({
			format: 'YYYY-MM-DD HH:mm:ss'
		});
		$("#cancel").bind("click",function(){
			closeWindow(window.name);
		});
		
	});
	$("#commit").click(function(){
		$.ajax({
			type: "POST",
			url: '<spring:url value="/coupon/doEditCoupon" />',
			dataType:"json",
			data:{
				price:$("#price").val(),
				coupontypeCode:$("#coupontypeCode").val(),
				applicant:$("#applicant").val(),
				validDate:$("#validDate").val(),
				remark:$("#remark").val()
			},
			async: true,
			success:function(data){
				if("0000000"==data.head.respCode){
					//关闭
					parent.window.contFrame.window.beCalled(data);
 					closeWindow(window.name);
				}else{
					alert("添加失败");
				}
			}
		});
	});
	</script>
</body>
</html>