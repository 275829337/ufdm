<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="height: 100%;">
<head>
    <title>系统用户登录</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <style>
    	.main{
    		background:#4d61f3;
		}
		input {
			background: #fff;
			font-size: 24px;
		}
		label {
			font-size: 24px;
		}

    </style>
</head>
<body class="main">
<form id="formSearch" class="form-horizontal">
    <div class="container">
			<div class="row">
				<div class="column">
					<div>
<%-- 						<img src = '<spring:url value="/img/login/logo-yun.png" />' alt="logo" class="img-circle center-block" />   --%>
						<div class="imglogo">1</div>
						<div class="text-center" style="margin-top: 20%;font-size: 32px;color: #000;cursor: default; font-family: '微软雅黑';">UFDM（统一格式开发模型）系统</div>
					</div>
				</div>
			</div>
			<div class="row" style="margin-top: 7%;">
				<div class="column">
					<div class="form-group">
						<label for="username" class="control-label col-sm-5">用户名：</label>
						<div class="col-sm-7">
							<input type="text" id="loginName" />
						</div>
					</div>
					<div class="form-group">
						<label for="userpswd" class="control-label col-sm-5">密&nbsp;码：</label>
						<div class="col-sm-7">
							<input type="password" id="loginPass"/>
						</div>
					</div>
					<div class="btn-group col-sm-offset-6" style="margin-top: 4%;">
						<a href="javascript:void(0);" style="font-size: 30px; border: 1px solid #000;color: #000" id="btn_submit">登录</a>
					</div>
				</div>
			</div>
		</div>
   </form>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/bootstrap-table.min.1.10.1.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/locale/bootstrap-table-zh-CN.min.js" />'></script>
	<script type="text/javascript">
	$(function() {
		//再跳转login界面时保持顶层显示
		if (window.top != null && window.top.location != window.location) {
            window.top.location = window.location;
        }
		
		 $(document).keypress(function(e) {  
			    // 回车键事件  
			if(e.which == 13) {  
				$("#btn_submit").click();
		    }  
		 }); 
		 var u = navigator.userAgent, app = navigator.appVersion;
		 if(u.indexOf('Android')!=-1||u.indexOf('iPhone')!=-1){
		 	var inputs = $(".form-group");
		 	for(var input in inputs){
		 		$(input).addClass("text-center");
		 	}
		 }
		 
	});
	$("#btn_submit").bind("click",function(){
		$.ajax({
			type: "get",
			url: '<spring:url value="/sysuser/account/doSysUserLogin" />',
			data:{
				loginName:$("#loginName").val(),
				loginPass:$("#loginPass").val(),
				guidStr:generateGuid()
			},
			dataType: "json",
			async: false,
			success: function(data){
				if(data.head.respCode=='0000000'){
					window.location='<spring:url value="/sysuser/account/doEnSysUserLoginSuccess" />';
				}
				else{
					top.layer.alert(data.head.respContent);
				}
			}
		});
	});
	</script>
</body>
</html>