<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>系统管理员列表</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet"/>
</head>
<body>
<div id="mainContent">
    <form id="formSearch" class="form-horizontal">
		<div class="form-group" style="margin-top: 15px;margin-left: -31px;">
			<label class="control-label col-sm-1" for="loginName">登录名</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="loginName"/>
			</div>
			<label class="control-label" for="mobile" style="float: left;">手机</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="mobile"/>
			</div>
			<div id="queryDiv" class="col-sm-3" style="text-align: left;padding-left: 0px;">
				<button type="button" id="btn_query" class="btn btn-primary">查询</button>
			</div>
		</div>
	</form>

	<table id="tb_tenuser"></table> 
	
</div>

    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/bootstrap-table.min.1.10.1.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/locale/bootstrap-table-zh-CN.min.js" />'></script>
    
	<script type="text/javascript">
	    var $table;
		$(function() {
			initTable();
			// 搜索
			$('#btn_query').click(function(){
				$('#tb_tenuser').bootstrapTable('getOptions').pageNumber=1;
				$('#tb_tenuser').bootstrapTable('refresh');
			});

		});
		
		// 初始化表格
		function initTable() {
            $table = $('#tb_tenuser').bootstrapTable({
                method: 'get',
                url : '<spring:url value="/tenuser/doReadTenantUserList" />',
                pagination: true,
                pageSize: 10,
                pageList: [10, 50, 100, 200, 500],
                sidePagination: "server", //服务端请求
                queryParams: queryParams,
                responseHandler: responseHandler,
                columns : [ {
					field : 'userName',
					title : '登录名'
				}, {
					field : 'phone',
					title : '电话号码'
				}, {
					field : 'email',
					title : '电子邮件'
				}, {
					field : 'tenantName',
					title : '所属租户'
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
			var guidStr = generateGuid();
			var temp = {
				//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的    
				limit : params.limit, //页面大小    
				offset : params.offset, //页码   
				userName: $("#loginName").val(),
				phone : $("#mobile").val(),
				guidStr:guidStr
			};
			return temp;
		};
		
		// 编辑操作
        function editRecord(index) {
        	var row=$table.bootstrapTable('getData')[index];
			parent.layer.open({
			    type: 2,
			    area: ['70%', '70%'],
			    fix: false, //不固定
			    maxmin: true,
			    content: '<spring:url value="/tenuser/doEnTenantUserEdit"/>'+'?tenantUserId='+row.id
			});
        }
		
		//被子页面调用
		function beCalled(data){
			$('#tb_tenuser').bootstrapTable('refresh');
		}
		
		// 操作列格式化
        function operateFormatter(value, row, index) {
            var e = '<a href="#" mce_href="#" onclick="editRecord(\''+ index + '\')">编辑</a> ';  
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
