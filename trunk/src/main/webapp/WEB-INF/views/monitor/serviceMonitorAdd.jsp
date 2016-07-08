<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>服务监控</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrapValidator/bootstrapValidator.min.css" />' rel="stylesheet">
</head>

<body>

	<form id="submitForm" class="form-horizontal">
	
		<label class="control-label col-sm-2">协议类型</label>
		<div class="col-sm-10">
			<!-- 从数据库查取 -->
		    <select class="form-control" id="protocoltypeCode">
		    	<c:forEach var="protocoltype" items="${protocoltypeList}">
		         	<option value="${protocoltype.code}" >${protocoltype.description}</option>
		         </c:forEach>
		   </select>
		</div>
		<label class="control-label col-sm-2">服务名称</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="serviceName" name="serviceName"/> 
		</div>
		<label class="control-label col-sm-2">服务IP</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="serviceIp" name="serviceIp" onblur="reg('ip')"/> 
		</div>
		<label class="control-label col-sm-2">服务端口</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="servicePort" name="servicePort" onblur="reg('port')"/> 
		</div>
		<label class="control-label col-sm-2">发送信息</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="requestMess" /> 
		</div>
		<label class="control-label col-sm-2">响应信息</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="responseMess" /> 
		</div>
		<label class="control-label col-sm-2">版本号</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="version"/> 
		</div>
		<label class="control-label col-sm-2">服务主机IP</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="hostIp" /> 
		</div>
		<label class="control-label col-sm-2">服务主机端口</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="hostPort" /> 
		</div>
		<label class="control-label col-sm-2">服务主机用户</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="hostUser" /> 
		</div>
		<label class="control-label col-sm-2">服务主机密码</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="hostPass" /> 
		</div>
		<label class="control-label col-sm-2">服务主机key</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="hostKey" /> 
		</div>
		<label class="control-label col-sm-2">联系人1名字</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="alarmContactName1" /> 
		</div>
		<label class="control-label col-sm-2">联系人1职务</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="alarmContactDuty1" /> 
		</div>
		<label class="control-label col-sm-2">联系人1手机</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="alarmContactMobile1" /> 
		</div>
		<label class="control-label col-sm-2">联系人1E-mail</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="alarmContactEmail1" /> 
		</div>
		<label class="control-label col-sm-2">联系人2名字</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="alarmContactName2" /> 
		</div>
		<label class="control-label col-sm-2">联系人2职务</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="alarmContactDuty2" /> 
		</div>
		<label class="control-label col-sm-2">联系人2手机</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="alarmContactMobile2" /> 
		</div>
		<label class="control-label col-sm-2">联系人2E-mail</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="alarmContactEmail2" /> 
		</div>
		<label class="control-label col-sm-2">监控频率</label>
		<div class="col-sm-10">
		    <input type="text" readonly="readonly" class="form-control" id="monitorRate" value="15"/>
		</div>
		<label class="control-label col-sm-2">阀值</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="threshold"/>
		</div>
		<label class="control-label col-sm-2">提醒频率设置</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="remindRate"/>
		</div>
		<label class="control-label col-sm-2">服务描述</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="serviceDescription"/>
		</div>
        <div class="col-sm-12">
		  <div class="navbar-btn">
		  	  <input type="submit" value="添加" class="btn btn-success col-sm-offset-5" id="add" />
		 	  <input type="button" value="取消" class="btn btn-danger col-sm-offset-1" id="cancel" />
		 	  <input type="button" value="测试" class="btn btn-info col-sm-offset-1" id="test"/>
		  </div>
        </div>
	  
	</form> 
</body>
<script type="text/javascript" src='<spring:url value="/js/plugin/bootstrapValidator/bootstrapValidator.min.js" />'></script>
<script type="text/javascript" src='<spring:url value="/js/common/common.js" />'></script>
<script type="text/javascript">
	
$(function() {
	//取消
	$("#cancel").bind("click",function(){
		closeWindow(window.name);
	});
	//测试
	$("#test").click(function(){
		testRecord();
	});
	$('#submitForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	serviceName: {
                validators: {
                    notEmpty: {
                        message: '服务名称不能为空'
                    },
                }
            },
            serviceIp: {
                validators: {
                    notEmpty: {
                        message: '服务IP不能为空'
                    },
                }
            },
            servicePort: {
                validators: {
                    notEmpty: {
                        message: '服务端口不能为空'
                    },
                    regexp: {
                        regexp: /^(6553[0-6]|655[0-2]\d|65[0-4]\d{2}|6[0-4]\d{3}|[1-5]\d{4}|[1-9]\d{1,3}|1)$/,
                        message: '端口介于[1~65536]之间'
                    }
                }

            }
           
        }
    })
    .on('success.form.bv', function(e) {
    	//阻止默认事件提交
    	e.preventDefault();
	    	$.ajax({
				type: "POST",
				url: '<spring:url value="/serviceMonitor/doMonitorentryAdd" />',
				dataType:"json",
				data:{
					version:$("#version").val(),
					serviceName:$('#serviceName').val(),
					protocoltypeCode:$('#protocoltypeCode').val(),
					serviceIp:$('#serviceIp').val(),
					servicePort:$('#servicePort').val(),
					requestMess:$('#requestMess').val(),
					responseMess:$('#responseMess').val(),
					hostIp:$('#hostIp').val(),
					hostPort:$('#hostPort').val(),
					hostUser:$('#hostUser').val(),
					hostPass:$('#hostPass').val(),
					hostKey:$('#hostKey').val(),
					alarmContactName1:$('#alarmContactName1').val(),
					alarmContactDuty1:$('#alarmContactDuty1').val(),
					alarmContactMobile1:$('#alarmContactMobile1').val(),
					alarmContactEmail1:$('#alarmContactEmail1').val(),
					alarmContactName2:$('#alarmContactName2').val(),
					alarmContactDuty2:$('#alarmContactDuty2').val(),
					alarmContactMobile2:$('#alarmContactMobile2').val(),
					alarmContactEmail2:$('#alarmContactEmail2').val(),
					monitorRate:$('#monitorRate').val(),
					threshold:$('#threshold').val(),
					remindRate:$('#remindRate').val(),
					serviceDescription:$('#serviceDescription').val()
				},
				dataType: "json",
				async: false,
				beforeSend:function(){
					var flag = confirm("确定要添加监控条目吗?");
					$("#add").attr("disabled",false);
					return flag;
				},
				success: function(data){
					if("0000000"==data.head.respCode){
						//关闭
						parent.window.contFrame.window.beCalled(data);
	 					closeWindow(window.name);
					}
					else{
						top.layer.alert("添加失败",{icon:2});
					}
				}
			}); 
    	});
    	
});
	function reg(regData){
		var serviceIp = $("#serviceIp").val();
		var servicePort = $("#servicePort").val();
		if("ip"==regData){
			if(serviceIp.trim()==""){
				top.layer.msg("服务IP不能为空",{icon:2,time:800});
				$("#test").attr("disabled",true);
			}
		}else{
			if(servicePort.trim()==""){
				top.layer.msg("服务端口不能为空",{icon:2,time:800});
				$("#test").attr("disabled",true);
			}
		}
		if(serviceIp.trim()!=""&&servicePort.trim()!=""){
			$("#test").attr("disabled",false);
		}
	}
	//测试应用
	function testRecord(){
		var serviceIp = $("#serviceIp").val();
		var servicePort = $("#servicePort").val();
		$.ajax({
			type: "POST",
			url: '<spring:url value="/serviceMonitor/testMonitorentry" />',
			data:{
				protocoltypeCode:$('#protocoltypeCode').val(),
				serviceIp:$('#serviceIp').val(),
				servicePort:$('#servicePort').val(),
				requestMess:$('#requestMess').val(),
				responseMess:$('#responseMess').val()
			},
			dataType: "json",
			async: false,
			beforeSend:function(){
				if(serviceIp.trim()==""||servicePort.trim()==""){
					top.layer.msg("服务IP或端口不能为空",{icon:2,time:800});
					$("#test").attr("disabled",true);
					return false;
				}else{
					$("#test").attr("disabled",false);
					return true;
				}
			},
			success: function(data){
				if(true==data.body){
					alert("测试成功");
				}else{
					console.log(data);
					alert("测试失败");
				}
			}
		});
	}
	
	
</script>
</html>
