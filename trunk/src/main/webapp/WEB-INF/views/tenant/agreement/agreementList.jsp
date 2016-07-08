<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>工单查询</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet"/>
    <link href='<spring:url value="/css/plugin/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />' rel="stylesheet"/>
     <style>
    	.RL{
    		padding-right: 0px;
    		padding-left: 0px;
    	}
    </style>
</head>
<body>
<div id="mainContent">
    <form id="formSearch" class="form-horizontal">
		<div class="form-group" style="margin-top: 15px;margin-left:-31px">
			<label class="control-label col-sm-1 RL" for="tname">租户名称</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="tname" />
			</div>
			<label class="control-label" for="satypeCode" style="float: left;">协议类型</label>
			<div class="col-sm-2">
				<select class="form-control" id="satypeCode">
				   <option value="">请选择</option>
				   <option value="1">试用</option>
				   <option value="2">新购</option>
				   <option value="3">续费</option>
				   <option value="4">升级</option>
				</select>
			</div>
			<label class="control-label" for="sastatusCode" style="float: left;">协议状态</label>
			<div class="col-sm-2">
				<select class="form-control" id="sastatusCode">
				   <option value="">请选择</option>
				   <option value="1">成功</option>
				   <option value="2">待支付</option>
				   <option value="3">作废</option>
				</select>
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
                url : '<spring:url value="/tengree/doReadTenantAgreementList"/>',
                pagination: true,
                pageSize: 10,
                pageList: [10, 50, 100, 200, 500],
                sidePagination: "server", //服务端请求
                queryParams: queryParams,
                responseHandler: responseHandler,
                onDblClickRow: doubleClick,
                columns : [ {
					field : 'tname',
					title : '租户名称'
				}, {
					field : 'satypeDesc',
					title : '协议类型'
				}, {
					field : 'saseatamount',
					title : '坐席数量'
				}, {
					field : 'saoutworkeramount',
					title : '外勤数量'
				}, {
					field : 'satotalmoney',
					title : '费用合计'
				}, {
					field : 'sabegindate',
					title : '生效日期',
					formatter: function (value, row, index){
						return dateFormat(value, "yyyy-mm-dd HH:MM:ss");
					}
				}, {
					field : 'saenddate',
					title : '失效日期',
					formatter: function (value, row, index){
						return dateFormat(value, "yyyy-mm-dd HH:MM:ss");
					}
				}, {
					field : 'sastatusDesc',
					title : '协议状态'
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
				tname : $("#tname").val(),
				satypeCode: $("#satypeCode").val(),
				sastatusCode: $("#sastatusCode").val(),
				mobile : $("#mobile").val()
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
			    content: '<spring:url value="/tengree/doEnTenantAgreementEdit"/>'+'?agreementId='+row.id
			});
		}
		
		//被子页面调用
		function beCalled(data){
			$('#tb_board').bootstrapTable('refresh');
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
