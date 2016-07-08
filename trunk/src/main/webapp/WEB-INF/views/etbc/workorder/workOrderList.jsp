<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户工单</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet"/>
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
			<label class="control-label" for="title" style="float: left;margin-left: 3%;">标题</label>
			<div class="col-sm-2">
			  <input type="text" class="form-control" id="title"/>
			</div>
			<label class="control-label" for="yhm" style="float: left;">用户名称</label>
			<div class="col-sm-2">
			  <input type="text" class="form-control" id="yhm"/>
			</div>
			<label class="control-label" style="float: left;" for="acceptanceGroupName">受理机构</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="acceptanceGroupName"/>
			</div>
			<label class="control-label" style="float: left;" for="yhdh">用户电话</label>
			<div class="col-sm-2">
			  <input type="text" class="form-control" id="yhdh"/>
			</div>
			<div style="clear: both;margin-left: 3%;margin-top: 4.5%;">
			<label class="control-label" for="yhdz" style="float: left;">用户地址</label>
			<div class="col-sm-2">
			  <input type="text" class="form-control" id="yhdz"/>
			</div>
			<label class="control-label" for="acceptPersonName" style="float: left;">受理人</label>
			<div class="col-sm-2">
			  <input type="text" class="form-control" id="acceptPersonName"/>
			</div>
			<div id="queryDiv" class="col-sm-5 RL" style="text-align: left;">
				<button type="button" id="btn_query" class="btn btn-primary">查询</button>
			</div>
			</div>
		</div>
	</form>
	<table id="tb_board"></table> 
</div>

    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/bootstrap-table.min.1.10.1.js"/>'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/locale/bootstrap-table-zh-CN.min.js"/>'></script>
    
	<script type="text/javascript">
	    var $table;
		$(function() {
			
			initTable();
			
			// 搜索
			$('#btn_query').click(function(){
				$('#tb_board').bootstrapTable('getOptions').pageNumber=1;
				$('#tb_board').bootstrapTable('refresh');
			});
		});
		
		// 初始化表格
		function initTable() {
            $table = $('#tb_board').bootstrapTable({
                method: 'get',
                url : '<spring:url value="/etbc/workorder/doReadBizWorkorderList" />',
                pagination: true,
                pageSize: 10,
                pageList: [10, 50, 100, 200, 500],
                sidePagination: "server", //服务端请求
                queryParams: queryParams,
                responseHandler: responseHandler,
                columns : [ {
                	field: 'state',
					checkbox : true
				}, {
					field : 'title',
					title : '工单标题'
				}, {
					field : 'channelName',
					title : '渠道'
				}, {
					field : 'acceptanceGroupName',
					title : '受理机构'
				}, {
					field : 'yhm',
					title : '用户名称'
				}, {
					field : 'yhdh',
					title : '用户电话'
				}, {
					field : 'yhdz',
					title : '用户地址'
				}, {
					field : 'acceptPersonName',
					title : '受理人'
				}, {
					field : 'statusName',
					title : '状态'
				}, {
					field : 'satTypeName',
					title : '满意度'
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
				title: $("#title").val(),
				yhm: $("#yhm").val(),
				acceptanceGroupName : $("#acceptanceGroupName").val(),
				yhdh: $("#yhdh").val(),
				yhdz: $("#yhdz").val(),
				acceptPersonName: $("#acceptPersonName").val() 
				
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

</body>
</html>
