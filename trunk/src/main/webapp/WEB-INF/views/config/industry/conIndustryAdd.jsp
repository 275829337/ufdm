<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>新增行业</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrapValidator/bootstrapValidator.min.css" />' rel="stylesheet">
</head>
<body>

	<form id="submitForm" class="form-horizontal">
	<div class="form-group" style="margin-top: 15px">	
		<label class="control-label col-sm-2" for="name">行业名称：</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="name" placeholder="行业名称" name="name"/>
		</div>
		<label class="control-label col-sm-2" for="code">行业代码：</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="code" placeholder="行业代码" name="code" />
		</div>
		<label class="control-label col-sm-2" for="version">版本号：</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="version" placeholder="版本号" name="version"/>
		</div>
		<label class="control-label col-sm-2" for="industryStatus">行业状态：</label>
		<div class="col-sm-10"> 
		<select id="industryStatus" class="select form-control">
			<option value="0">开</option>
			<option value="1">关</option>
		</select>
		</div>
	    <label class="control-label col-sm-2" for="description">行业描述：</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="description" placeholder="行业描述" name="description"/>
		</div>
	</div>
	<div id="toolbar" class="btn-group col-sm-offset-4">
		<button id="cancel" type="button" class="btn btn-danger">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
		</button>
		<button id="commit" type="submit" class="btn btn-info">
			<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>提交
		</button>
	</div>
	</form>

    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrapValidator/bootstrapValidator.min.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/common/common.js" />'></script>
	<script type="text/javascript">
	$(function() {
		$("#cancel").bind("click",function(){
			closeWindow(window.name);
		});
		$('#submitForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    validators: {
                        notEmpty: {
                            message: '行业名称不能为空'
                        },
                    }
                },
                code: {
                    validators: {
                        notEmpty: {
                            message: '行业编码不能为空'
                        },
                    }
                },
                version: {
                    validators: {
                    	message: '版本号不能为空',
                        notEmpty: {
                            message: '版本号不能为空'
                        },
                    }
                },
                description: {
                    validators: {
                        notEmpty: {
                            message: '描述不能为空'
                        },
                    }
                },
               
            }
        })
        .on('success.form.bv', function(e) {
        	//阻止默认事件提交
        	e.preventDefault();
       		$.ajax({
   				type: "POST",
   				url: '<spring:url value="/industry/doEditIndustry" />',
   				dataType:"json",
   				data:{
   					name:$("#name").val(),
   					code:$("#code").val(),
   					version:$("#version").val(),
   					industryStatus:$("#industryStatus").val(),
   					description:$("#description").val(),
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
						top.layer.msg("添加失败！",{icon:2});
					}
   				}
   			});
        });
			
		
	});
	</script>
</body>
</html>