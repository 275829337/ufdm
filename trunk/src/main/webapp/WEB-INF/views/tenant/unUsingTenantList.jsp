<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>潜在用户</title>
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
			<label class="control-label" for="description" style="float: left;margin-left: 3%;">企业名</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="description"/>
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
                url : '<spring:url value="/tenant/doReadTenantList" />',
                pagination: true,
                pageSize: 10,
                pageList: [10, 50, 100, 200, 500],
                sidePagination: "server", //服务端请求
                queryParams: queryParams,
                responseHandler: responseHandler,
                onDblClickRow: doubleClick,
                columns : [ {
					field : 'description',
					title : '企业名称'
				}, {
					field : 'tenanttypeDesc',
					title : '租户类型'
				}, {
					field : 'businessdurationDesc',
					title : '营业年限'
				}, {
					field : 'enterprisescaleDesc',
					title : '企业规模'
				}, {
					field : 'tenantstatusDesc',
					title : '租户状态'
				}, {
					field : 'createdate',
					title : '创建时间',
					formatter: function (value, row, index){
						return dateFormat(value, "yyyy-mm-dd HH:MM:ss");
					}
				}, {
					field : 'lastupdatedate',
					title : '更新时间',
					formatter: function (value, row, index){
						return dateFormat(value, "yyyy-mm-dd HH:MM:ss");
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
				tenanttypeCode: 1,
				queryBeginDate : $("#queryBeginDate").val(),
				queryEndDate: $("#queryEndDate").val(),
				description : $("#description").val()
			};
			return temp;
		};
			
		function doubleClick(row){
			parent.layer.open({
				title:"租户详细",
			    type: 2,
			    fix: false, //不固定
			    area : ['90%', '90%'],
			    maxmin: true,
			    content: '<spring:url value="/tendet/doEnViewTenantDetail"/>'+'?tenantId='+row.id
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
