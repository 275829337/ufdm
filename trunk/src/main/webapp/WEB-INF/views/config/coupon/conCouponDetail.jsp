<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>优惠券详情</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
</head>
<body>
	<input type="hidden" id="id"  value="${coupon.id}"/>
	<table class="table table-bordered">
		<tr>
			<td>优惠券编码：</td>
			<td>${coupon.code}</td>
		</tr>
		<tr>
			<td>金额：</td>
			<td>${coupon.price}</td>
		</tr>
		<tr>
			<td>类型：</td>
			<td>${coupon.coupontypeDesc}</td>
		</tr>
		<tr>
			<td>状态：</td>
			<td>${coupon.couponstatusDesc}</td>
		</tr>
		<tr>
			<td>申请人：</td>
			<td>${coupon.applicant}</td>
		</tr>
		<tr>
			<td>创建时间：</td>
			<td><fmt:formatDate value="${coupon.createDate}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
		</tr>
		<tr>
			<td>有效时间：</td>
			<td><fmt:formatDate value="${coupon.validDate}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
		</tr>
		<tr>
			<td>审核人：</td>
			<td>${coupon.auditorName}</td>
		</tr>
		<tr>
			<td>审核时间：</td>
			<td><fmt:formatDate value="${coupon.auditDate}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
		</tr>
		<tr>
			<td>使用者：</td>
			<td>${coupon.usePersonName}</td>
		</tr>
		<tr>
			<td>使用时间：</td>
			<td><fmt:formatDate value="${coupon.useDate}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
		</tr>
		<tr>
			<td>备注：</td>
			<td>${coupon.remark}</td>
		</tr>
	</table>
	
	<div id="toolbar" class="btn-group col-sm-offset-5">
		<button id="cancel" type="button" class="btn btn-danger">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
		</button>
	</div>
	
    <script type="text/javascript" src='<spring:url value="/js/common/common.js" />'></script>
	<script type="text/javascript">
	$(function() {
		$("#cancel").bind("click",function(){
			closeWindow(window.name);
		});
	});
	</script>
</body>
</html>