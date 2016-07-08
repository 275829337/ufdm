<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>服务监控条目详情</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
</head>
<body>

	<table class="table table-bordered">
		<tr>
			<td>服务名称：</td>
			<td>${monitorService.serviceName}</td>
		</tr>
		<tr>
			<td>服务协议：</td>
			<td>${monitorService.protocoltypeDesc}</td>
		</tr>
		<tr>
			<td>服务IP：</td>
			<td>${monitorService.serviceIp}</td>
		</tr>
		<tr>
			<td>服务端口：</td>
			<td>${monitorService.servicePort}</td>
		</tr>
		<tr>
			<td>发送信息：</td>
			<td>${monitorService.requestMess}</td>
		</tr>
		<tr>
			<td>响应信息：</td>
			<td>${monitorService.responseMess}</td>
		</tr>
		<tr>
			<td>监控状态：</td>
			<td>
			<c:if test="${monitorService.serviceStatus==1}">
			正常
			</c:if>
			<c:if test="${monitorService.serviceStatus==0}">
			故障
			</c:if>
			</td>
		</tr>
		<tr>
			<td>服务主机IP：</td>
			<td>${monitorService.hostIp}</td>
		</tr>
		<tr>
			<td>服务主机端口：</td>
			<td>${monitorService.hostPort}</td>
		</tr>	
		<tr>
			<td>服务主机用户：</td>
			<td>${monitorService.hostUser}</td>
		</tr>	
		<tr>
			<td>服务主机密码：</td>
			<td>${monitorService.hostPass}</td>
		</tr>
		<tr>
			<td>服务主机key：</td>
			<td>${monitorService.hostKey}</td>
		</tr>
		<tr>
			<td>版本号：</td>
			<td>${monitorService.version}</td>
		</tr>
		<tr>
			<td>联系人1名字：</td>
			<td>${monitorService.alarmContactName1}</td>
		</tr>
		<tr>
			<td>联系人1职务：</td>
			<td>${monitorService.alarmContactDuty1}</td>
		</tr>
		<tr>
			<td>联系人1手机：</td>
			<td>${monitorService.alarmContactMobile1}</td>
		</tr>
		<tr>
			<td>联系人1email：</td>
			<td>${monitorService.alarmContactEmail1}</td>
		</tr>
		<tr>
			<td>联系人2名字：</td>
			<td>${monitorService.alarmContactName2}</td>
		</tr>
		<tr>
			<td>联系人2职务：</td>
			<td>${monitorService.alarmContactDuty2}</td>
		</tr>
		<tr>
			<td>联系人2手机：</td>
			<td>${monitorService.alarmContactMobile2}</td>
		</tr>
		<tr>
			<td>联系人2email：</td>
			<td>${monitorService.alarmContactEmail2}</td>
		</tr>
		<tr>
			<td>监控频率：</td>
			<td>${monitorService.monitorRate}</td>
		</tr>
		<tr>
			<td>阀值：</td>
			<td>${monitorService.threshold}</td>
		</tr>
		<tr>
			<td>提醒频率：</td>
			<td>${monitorService.remindRate}</td>
		</tr>
		<tr>
			<td>服务描述：</td>
			<td>${monitorService.serviceDescription}</td>
		</tr>
		<tr>
			<td>创建时间：</td>
			<td><fmt:formatDate value="${monitorService.createdate}"  pattern="yyyy-MM-dd  HH:mm:ss" /></td>
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