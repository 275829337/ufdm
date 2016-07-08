<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>服务编辑</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
</head>
<body>

	<form id="submitForm" class="form-horizontal">
		<input type="hidden" id="id" value="${servicetype.id}" />
		<div class="form-group" style="margin-top: 15px">
			<label class="control-label col-sm-2" for="code">服务编码：</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="code" value="${servicetype.code}" />
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="name">服务名称：</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="name" value="${servicetype.name}" />
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="industryCode">所属行业：</label>
			<div class="col-sm-2">
		      <select class="form-control" id="industryCode">
		         <option value="" >--请选择--</option>
		         <c:forEach var="industry" items="${industryList}">
		         	<option value="${industry.code}"
		         	<c:if test="${industry.code==servicetype.industryCode}">
		         		selected="selected"
		         	</c:if>
		         	>${industry.name}</option>
		         </c:forEach>
		      </select>
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="valid">服务状态：</label>
			<div class="col-sm-2">
		      <select class="form-control" id="valid">
		      	<option value="1" 
		      	<c:if test="${servicetype.valid==true}"> 
		      		selected="selected"
		      	</c:if>
		      	>有效</option>
		         <option value="0" 
		         	<c:if test="${servicetype.valid==false}"> 
		      			selected="selected"
		      		</c:if>
		         >无效</option>
		      </select>
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="version">版本号：</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="version" value="${servicetype.version}" />
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="servicetypeId">依赖服务：</label>
			<div class="col-sm-2">
		      <select class="form-control" id="servicetypeId">
		         <option value="" >--请选择--</option>
		         <c:forEach var="servicetypeT" items="${servicetypeList}">
		         	<option value="${servicetypeT.id}"
		         		<c:if test="${servicetypeT.id==servicetype.servicetypeId}">
		         			selected="selected"
		         		</c:if>
		         	>${servicetypeT.name}</option>
		         </c:forEach>
		      </select>
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="sort">展示次序 ：</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="sort" value="${servicetype.sort}" />
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="description">服务描述：</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="description" value="${servicetype.description}" />
			</div>
		</div>
		
	</form>
	
	<div id="toolbar" class="btn-group col-sm-offset-4">
		<button id="cancel" type="button" class="btn btn-danger">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
		</button>
		<button id="commit" type="button" class="btn btn-info">
			<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>提交
		</button>
	</div>
	
    <script type="text/javascript" src='<spring:url value="/js/common/common.js" />'></script>
	<script type="text/javascript">
	$(function() {
		$("#cancel").bind("click",function(){
			closeWindow(window.name);
		});
		
		$("#commit").bind("click",function(){
			$.ajax({
				type: "POST",
				url: '<spring:url value="/servicetype/doEditServicetype" />',
				dataType:"json",
				data:{
					id:$("#id").val(),
					code:$("#code").val(),
					name:$("#name").val(),
					industryCode:$("#industryCode").val(),
					valid:$("#valid").val(),
					servicetypeId:$("#servicetypeId").val(),
					version:$("#version").val(),
					description:$("#description").val(),
					sort:$("#sort").val()
				},
				async: true,
				success: function(data){
					if("0000000"==data.head.respCode){
						//关闭
						parent.window.contFrame.window.beCalled(data);
	 					closeWindow(window.name);
					}else if("1111111"==data.head.respCode){
						top.layer.msg(data.head.respContent,{icon:2});
					}else{
						top.layer.msg("编辑失败！",{icon:2});
					}
				}
			});
		});
	});
	</script>
</body>
</html>