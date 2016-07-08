<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ page import="cc.eslink.common.constant.ProConstants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>工单详情</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet">
</head>
<body>
     
	<input type="hidden" id="workOrderId" value="${workOrder.id}" />
	
	<div class="container">
		<h3>基本信息</h3>
		<div class="row">
			<label class="col-md-2" >租户名称:</label>
			<div class="col-md-2">
				${workOrder.tenantName}
			</div>
			
			<label class="col-md-2" >工单大类:</label>
			<div class="col-md-2">
			    ${workOrder.woTypeDesc}
			</div>
			
			<label class="col-md-2" >工单小类:</label>
			<div class="col-md-2">
			     ${workOrder.woSecondTypeDesc}
			</div>
		</div>
		
		<div class="row">
			<label class="col-md-2" >申请时间:</label>
			<div class="col-md-6" >
			    <fmt:formatDate value="${workOrder.createdate}" pattern="yyyy-MM-dd  HH:mm:ss" /> 
			</div>
			<label class="col-md-2" >当前状态:</label>
			<div class="col-md-2" >
			    ${workOrder.woStatusDesc}
			</div>
		</div>

		<div class="row">
			<label class="col-md-2" >联系人:</label>
			<div class=col-md-2">
			    ${workOrder.tusername}
			</div>
			<label class="col-md-2" >联系电话:</label>
			<div class="col-md-2">
			    ${workOrder.tuserTel} 
			</div>
			<label class="col-md-2" >电子邮件:</label>
			<div class="col-md-2">
			    ${workOrder.tuserEmail} 
			</div>
		</div>

		<div class="row">
			<label class="col-md-2" >问题描述:</label>
			<div class="col-md-10">
			    ${workOrder.description}
			</div>
		</div>
		<div class="row" style="float: none;">
			<label class="col-md-1" >图片1:</label>
			<div class="col-md-2" style="float: left;">
			    <c:if test="${workOrder.attachment1!=null && workOrder.attachment1!=''}"> 
			        <a href="<%=ProConstants.IMAGE_SERVER%>${workOrder.attachment1}" target="_blank">附件1</a>
			    </c:if>
			</div>
			<label class="col-md-1" >图片2:</label>
			<div class="col-md-2" style="float: left;">
				<c:if test="${workOrder.attachment2!=null && workOrder.attachment2!=''}"> 
			    	<a href="<%=ProConstants.IMAGE_SERVER%>${workOrder.attachment2}" target="_blank">附件2</a> 
			    </c:if>
			</div>
			<label class="col-md-1" >图片3:</label>
			<div class="col-md-2" style="float: left;">
				<c:if test="${workOrder.attachment3!=null && workOrder.attachment3!=''}"> 
			    	<a href="<%=ProConstants.IMAGE_SERVER%>${workOrder.attachment3}" target="_blank">附件3</a>  
			    </c:if>
			</div>
		</div>
		<h3 style="clear: both; ">处理记录</h3>
		<div class="row">
			<table id="tb_board"></table> 
		</div>
		
	</div>
</body>

    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/bootstrap-table.min.1.10.1.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/locale/bootstrap-table-zh-CN.min.js" />'></script>
    
	<script>
		var treeObj,$table;
		$(function() {
			initTable();
		});
		
		// 初始化表格
		function initTable() {
	        $table = $('#tb_board').bootstrapTable({
	            method: 'get',
	            url : '<spring:url value="/tenwok/doReadWorkOrderProcessList"/>',
	            pagination: true,
	            pageSize: 5,
	            pageList: [10, 50, 100, 200, 500],
	            sidePagination: "server", //服务端请求
	            queryParams: queryParams,
	            responseHandler: responseHandler,
	            columns : [ {
					field : 'processUserName',
					title : '处理人',
					formatter:function (value, row, index){
						if(value == null || value==''){
							return row.feedbackUserName;
						}
						else{
							return value;
						}
					} 
				}, {
					field : 'feedbackUserId',
					title : '处理类型',
					formatter:function (value, row, index){
						if(value == null || value==''){
							return '后台处理';
						}
						else{
							return '客户反馈';
						}
					} 
				}, {
					field : 'createdate',
					title : '处理时间日期'
				}, {
					field : 'processContent',
					title : '处理类容',
					formatter:function (value, row, index){
						if(value == null || value==''){
							return row.feedbackContent;
						}
						else{
							return value;
						}
					} 
				}, {
					field : 'woStatusDesc',
					title : '工单状态'
				}, {
					field : 'id',
					title : '附件',
					formatter:function (value, row, index){
						var returnAttachment="";
						if(row.attachment1!= null && row.attachment1!=''){
						    returnAttachment = returnAttachment + '&nbsp;<a href="<%=ProConstants.IMAGE_SERVER%>'+row.attachment1+' " target="_blank">附件</a>';
						}
						if(row.attachment2!= null && row.attachment2!=''){
							returnAttachment = returnAttachment + '&nbsp;<a href="<%=ProConstants.IMAGE_SERVER%>'+row.attachment2+' " target="_blank">附件</a>';
						}
						if(row.attachment3!= null && row.attachment3!=''){
							returnAttachment = returnAttachment + '&nbsp;<a href="<%=ProConstants.IMAGE_SERVER%>'+row.attachment3+' " target="_blank">附件</a>';
						}
						return returnAttachment;
					} 
	            }],
	            onLoadSuccess:function(){
	
	            },
	            onLoadError: function () {
	                alert("数据加载失败！");
	            }
	        });
	    }
		
		// 查询参数设置  
		function queryParams(params) {
			var temp = {
				//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的    
				limit : params.limit, //页面大小    
				offset : params.offset, //页码   
				woId : $("#workOrderId").val() 
			};
			return temp;
		};
			
		// json 数据处理
	    function responseHandler(res) {
			if (res.body.total > 0) {
				return {
					"rows" : res.body.rows,
					"total" : res.body.total
				}
			} else {
				return {
					"rows" : [],
					"total" : 0
				}
			}
		}
	
	</script>
	
</html>
