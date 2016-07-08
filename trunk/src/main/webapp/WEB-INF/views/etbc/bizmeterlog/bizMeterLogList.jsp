<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>自报表信息</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet"/>
</head>
<body>
<div id="mainContent">
    <form id="formSearch" class="form-horizontal">
		<div class="form-group" style="margin-top: 15px;margin-left: -31px;">
			<label class="control-label" for="userno" style="float: left;margin-left: 3%;">户号</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="userno"/>
			</div>
			<label class="control-label" for="organizationno" style="float: left;">机构号</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="organizationno"/>
			</div>
			<div id="queryDiv" class="col-sm-3" style="text-align: left;padding-left: 0px;">
				<button type="button" id="btn_query" class="btn btn-primary">查询</button>
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
                url : '<spring:url value="/etbc/meter/doReadBizMeterLogList" />',
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
					field : 'userno',
					title : '户号'
				}, {
					field : 'username',
					title : '用户姓名'
				}, {
					field : 'useraddress',
					title : '用户地址'
				}, {
					field : 'meterno',
					title : '表号'
				}, {
					field : 'organizationno',
					title : '机构号'
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
				userno : $("#userno").val(),
				organizationno: $("#organizationno").val()
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
