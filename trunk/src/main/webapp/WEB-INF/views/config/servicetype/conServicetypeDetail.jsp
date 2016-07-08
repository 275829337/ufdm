<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>服务详情</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
</head>
<body>

	<input type="hidden" id="id"  value="${servicetype.id}"/>
	<table class="table table-bordered">
		<tr>
			<td>服务编码：</td>
			<td>${servicetype.code}</td>
		</tr>
		<tr>
			<td>服务名称：</td>
			<td>${servicetype.name}</td>
		</tr>
		<tr>
			<td>所属行业：</td>
			<td>${servicetype.industryName}</td>
		</tr>
		<tr>
			<td>服务状态：</td>
			<td>${servicetype.valid}</td>
		</tr>
		<tr>
			<td>版本号：</td>
			<td>${servicetype.version}</td>
		</tr>
		<tr>
			<td>创建时间：</td>
			<td><fmt:formatDate value="${servicetype.createDate}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
		</tr>
		<tr>
			<td>依赖服务：</td>
			<td>${servicetype.servicetypeName}</td>
		</tr>
		<tr>
			<td>展示次序：</td>
			<td>${servicetype.sort}</td>
		</tr>
		<tr>
			<td>服务描述：</td>
			<td>${servicetype.description}</td>
		</tr>
		<tr>
			<td>最后更新时间：</td>
			<td><fmt:formatDate value="${servicetype.lastUpdateDate}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
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
	

    <script type="text/javascript" src='<spring:url value="/js/common/common.js" />'></script>
	<script type="text/javascript">
	$(function() {
		$("#cancel").bind("click",function(){
			closeWindow(window.name);
		});
		
		$("#btn_edit").bind("click",function(){
			//进入编辑页面
			window.location.href='<spring:url value="/servicetype/doEnServicetypelEdit?id=" />'+$("#id").val();
		});
	});
	</script>
</body>
</html>