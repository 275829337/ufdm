<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>待审核发票</title>
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
			<label class="control-label col-sm-1 RL" for="title">发票抬头</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="title"/>
			</div>
			<label class="control-label" for="queryBeginDate" style="float: left;">开始日期:</label>
			<div class="col-sm-2">
				<div class='input-group date' id='datetimepicker1'>
                    <input type='text' class="form-control" id="queryBeginDate"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
			</div>
			<label class="control-label" for="queryEndDate" style="float: left;">截止日期:</label>
			<div class="col-sm-2">
				<div class='input-group date' id='datetimepicker2'>
                    <input type='text' class="form-control" id="queryEndDate"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
			</div>
			
			<div id="queryDiv" class="col-sm-3 RL" style="text-align: left;">
				<button type="button"  id="btn_query" class="btn btn-primary">查询</button>
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
                url : '<spring:url value="/teninv/doReadInvoiceLogList" />',
                pagination: true,
                pageSize: 10,
                pageList: [10, 50, 100, 200, 500],
                sidePagination: "server", //服务端请求
                queryParams: queryParams,
                responseHandler: responseHandler,
                columns : [ {
					field : 'tname',
					title : '申请租户'
				}, {
					field : 'applytime',
					title : '申请日期',
					formatter: function (value, row, index){
						return dateFormat(value, "yyyy-mm-dd HH:MM:ss");
					}
				}, {
					field : 'invoicetypeDesc',
					title : '发票类型'
				}, {
					field : 'title',
					title : '发票抬头'
				}, {
					field : 'invoicemoney',
					title : '发票金额'
				}, {
                    title: '操作',
                    field: 'id',
                    align: 'center',
                    formatter:operateFormatter
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
				invoicestatusCode : 1,
				title : $("#title").val(),
				queryBeginDate : $("#queryBeginDate").val(),
				queryEndDate: $("#queryEndDate").val(),
				
			};
			return temp;
		};
			
		// 审核操作
        function editRecord(index) {
        	var row=$table.bootstrapTable('getData')[index];
			parent.layer.open({
			    type: 2,
			    area: ['900px', '530px'],
			    fix: false, //不固定
			    maxmin: true,
			    content: '<spring:url value="/teninv/doEnCheckInvoice"/>'+'?invoiceLogId='+row.id
			});
        }
		
		//被子页面调用
		function beCalled(data){
			$('#tb_board').bootstrapTable('refresh');
		}
		
		// 操作列格式化
        function operateFormatter(value, row, index) { 
            var e = '<a href="#" mce_href="#" onclick="editRecord(\''+ index + '\')">审核</a> ';  
            return e;  
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
