<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>渠道详情</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
</head>
<body>

	<input type="hidden" id="id"  value="${channel.id}"/>
	<table class="table table-bordered">
		<tr>
			<td>渠道编码：</td>
			<td>${channel.code}</td>
		</tr>
		<tr>
			<td>渠道名称：</td>
			<td>${channel.name}</td>
		</tr>
		<tr>
			<td>渠道版本号：</td>
			<td>${channel.version}</td>
		</tr>
		<tr>
			<td>渠道描述：</td>
			<td>${channel.description}</td>
		</tr>
		<tr>
			<td>渠道创建时间：</td>
			<td><fmt:formatDate value="${channel.createDate}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
		</tr>
		<tr>
			<td>最后更新时间：</td>
			<td><fmt:formatDate value="${channel.lastUpdateDate}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
		</tr>
		<tr>
			<td>展示次序 ：</td>
			<td>${channel.sort}</td>
		</tr>
	</table>
	
	<div id="toolbar" class="btn-group col-sm-offset-4">
		<button id="cancel" type="button" class="btn btn-danger">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
		</button>
		<button id="btn_edit" type="button" class="btn btn-info">
			<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>编辑
		</button>
	</div>
	
	<script type="text/javascript">
	$(function() {
		$("#cancel").bind("click",function(){
			closeWindow(window.name);
		});
		
		$("#btn_edit").bind("click",function(){
			//进入编辑页面
			window.location.href='<spring:url value="/channel/doEnChannelEdit?id="/>'+$("#id").val();
		});
	});
	</script>
</body>
</html>