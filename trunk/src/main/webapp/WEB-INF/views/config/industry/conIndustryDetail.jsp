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

	<input type="hidden" id="id"  value="${industry.id}"/>
	<table class="table table-bordered">
		<tr>
			<td>行业编码：</td>
			<td>${industry.code}</td>
		</tr>
		<tr>
			<td>行业名称：</td>
			<td>${industry.name}</td>
		</tr>
		<tr>
			<td>版本号：</td>
			<td>${industry.version}</td>
		</tr>
		<tr>
			<td>行业描述：</td>
			<td>${industry.description}</td>
		</tr>
		
		<tr>
			<td>包含服务：</td>
			<td>
				<c:forEach var="servicetype" items="${industry.hxServicetypeList}">
					${servicetype.name}&nbsp;&nbsp;
				</c:forEach>
			</td>
		</tr>
		
		<tr>
			<td>创建时间：</td>
					
			
			<td><fmt:formatDate value="${industry.createDate}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
		</tr>
		<tr>
			<td>最后更新时间：</td>
			<td><fmt:formatDate value="${industry.lastUpdateDate}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
		</tr>
	</table>
	<div id="toolbar" class="btn-group col-sm-offset-4">
		<button id="btn_edit" type="button" class="btn btn-info">
			<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>编辑
		</button>
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
		
		$("#btn_edit").bind("click",function(){
			//进入编辑页面
			window.location.href='<spring:url value="/industry/doEnEditIndustry?id=" />'+$("#id").val();
		});
	});
	</script>
</body>
</html>