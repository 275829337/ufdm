<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>工单查询</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet"/>
    <link href='<spring:url value="/css/plugin/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />' rel="stylesheet"/>
     <style>
    	.RL{
    		padding-left: 0px;
    		padding-right: 0px
    	}
    </style>
</head>
<body>
<div id="mainContent">
    <form id="formSearch" class="form-horizontal">
		<div class="form-group" style="margin-top: 15px;margin-left: -31px;">
			<label class="control-label col-sm-1 RL" for="woStatusCode">工单状态</label>
			<div class="col-sm-2">
				<select class="form-control" id="woStatusCode">
				   <option value="">请选择</option>
				   <option value="1">待受理</option>
				   <option value="2">处理中</option>
				   <option value="3">待反馈</option>
				   <option value="4">已完成</option>
				   <option value="5">已关闭</option>
				</select>
			</div>
			<label class="control-label" for="queryBeginDate" style="float: left;">创建日期:</label>
			<div class="col-sm-2">
				<div class='input-group date' id='datetimepicker1'>
                    <input type='text' class="form-control" id="queryBeginDate"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
			</div>
			<label class="control-label" for="queryEndDate" style="float: left;">— </label>
			<div class="col-sm-2"> 
				<div class='input-group date' id='datetimepicker2'>
                    <input type='text' class="form-control" id="queryEndDate"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
			</div>
			
			<div id="queryDiv" class="col-sm-3 RL" style="text-align: left;">
				<button type="button" id="btn_query" class="btn btn-primary">查询</button>
			</div>
		</div>
	</form>
	<table id="tb_board"></table> 
</div>

    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/bootstrap-table.min.1.10.1.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/locale/bootstrap-table-zh-CN.min.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-datetimepicker/moment-with-locales.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-datetimepicker/bootstrap-datetimepicker.js" />'></script>
    
	<script type="text/javascript">
	    var $table;
		$(function() {
			initTable();
			// 搜索
			$('#btn_query').click(function(){
				$('#tb_board').bootstrapTable('getOptions').pageNumber=1;
				$('#tb_board').bootstrapTable('refresh');
			});
			
			$('#datetimepicker1').datetimepicker({
				format: 'YYYY-MM-DD' 
			});
			$('#datetimepicker2').datetimepicker({
				format: 'YYYY-MM-DD' 
			});
		});
		
		// 初始化表格
		function initTable() {
            $table = $('#tb_board').bootstrapTable({
                method: 'get',
                url : '<spring:url value="/tenwok/doReadWorkOrderList" />',
                pagination: true,
                pageSize: 10,
                pageList: [10, 50, 100, 200, 500],
                sidePagination: "server", //服务端请求
                queryParams: queryParams,
                onDblClickRow: doubleClick,
                responseHandler: responseHandler,
                columns : [ {
					field : 'tenantName',
					title : '申请租户'
				}, {
					field : 'description',
					title : '内容',
					formatter:function (value){
						return value.substring(0,40);
					}
				}, {
					field : 'createdate',
					title : '创建日期',
					formatter: function (value, row, index){
						return dateFormat(value, "yyyy-mm-dd HH:MM:ss");
					}
				}, {
					field : 'woTypeDesc',
					title : '工单大类'
				}, {
					field : 'woSecondTypeDesc',
					title : '工单小类'
				}, {
					field : 'woStatusDesc',
					title : '工单状态'
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
				limit : params.limit,
				offset : params.offset,
				woStatusCode : $("#woStatusCode").val(),
				queryBeginDate : $("#queryBeginDate").val(),
				queryEndDate: $("#queryEndDate").val(),
			};
			return temp;
		};
		
		function doubleClick(row){
			parent.layer.open({
				title:"工单详细",
			    type: 2,
			    fix: false, //不固定
			    area : ['90%', '90%'],
			    maxmin: true,
			    content: '<spring:url value="/tenwok/doEnWorkOrderDetail"/>'+'?workOrderId='+row.id
			});
		}
		
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

</body>
</html>
