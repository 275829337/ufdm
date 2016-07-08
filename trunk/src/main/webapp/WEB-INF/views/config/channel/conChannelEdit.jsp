<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>渠道编辑</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
</head>
<body>
	<form id="submitForm" class="form-horizontal">
		<input type="hidden" id="id" value="${channel.id}" />
		<div class="form-group" style="margin-top: 15px">
			<label class="control-label col-sm-2" for="code">渠道编码：</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="code" value="${channel.code}" />
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="name">渠道名称：</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="name" value="${channel.name}" />
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="version">渠道版本号：</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="version" value="${channel.version}" />
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="description">渠道描述：</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="description" value="${channel.description}" />
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label col-sm-2" for="sort">展示次序 ：</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="sort" value="${channel.sort}" />
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
	

	<script type="text/javascript">
	$(function() {
		$("#cancel").bind("click",function(){
			closeWindow(window.name);
		});
		
		$("#commit").bind("click",function(){
			$.ajax({
				type: "POST",
				url: '<spring:url value="/channel/doEditChannel" />',
				dataType:"json",
				data:{
					id:$("#id").val(),
					code:$("#code").val(),
					name:$("#name").val(),
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