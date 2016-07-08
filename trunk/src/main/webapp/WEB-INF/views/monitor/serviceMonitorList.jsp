<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>监控条目</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet"/>
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
		<div class="form-group" style="margin-top: 15px; margin-left:-31px">
			<label class="control-label col-sm-1 RL" for="serviceStatus">监控状态</label>
			<div class="col-sm-2">
				<select id="serviceStatus" class="form-control">
					<option value="">--请选择--</option>
					<option value="1">正常</option>
					<option value="0">故障</option>
				</select>
			</div>
			<label class="control-label col-sm-1 RL" for="protocoltypeCode">监控协议类型</label>
			<div class="col-sm-2">
		     	<select id="protocoltypeCode" class="form-control">
					<option value="">--请选择--</option>
					<c:forEach var="protocoltype" items="${protocoltypeList}">
						<option value="${protocoltype.code}">${protocoltype.description}</option>
					</c:forEach>
				</select>
			</div>
			
			<div id="queryDiv" class="col-sm-5 RL" style="text-align: left;">
				<button type="button" id="btn_query" class="btn btn-primary">查询</button>
			</div>
		</div>
	</form>

	<div id="toolbar" style="margin-bottom: 1.5%;margin-top: 1%;">
		<button id="btn_add" type="button" class="btn btn-default"> 
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
		</button>
		<button id="btn_delete" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
		</button>
	</div>

	<table id="tb_monitorentry"></table> 
</div>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/bootstrap-table.min.1.10.1.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/locale/bootstrap-table-zh-CN.min.js" />'></script>
    
	<script type="text/javascript">
	    var $table;
		$(function() {
			initTable();
			// 搜索
			$('#btn_query').click(function(){
				$('#tb_monitorentry').bootstrapTable('getOptions').pageNumber=1;
				$('#tb_monitorentry').bootstrapTable('refresh');
			});
			// 删除
            $('#btn_delete').click(function () {
            	deleteRecord();
            });
         	// 新增
            $('#btn_add').click(function () {
            	addRecord();
            });
		});
		
		// 初始化表格
		function initTable() {
            $table = $('#tb_monitorentry').bootstrapTable({
                method: 'get',
                url : '<spring:url value="/serviceMonitor/doReadServiceMonitorList" />',
                pagination: true,
                pageSize: 10,
                pageList: [10, 50, 100, 200, 500],
                sidePagination: "server", //服务端请求
                queryParams: queryParams,
                responseHandler: responseHandler,
                onDblClickRow:dblClick,
                columns : [ {
                	field: 'state',
					checkbox : true
				},{
					field : 'serviceName',
					title : '名称'
				},{
					field : 'protocoltypeDesc',
					title : '协议'
				},{
					field : 'serviceIp',
					title : 'IP'
				},{
					field : 'servicePort',
					title : '端口'
				},{
					field : 'requestMess',
					title : '发送信息'
				},{
					field : 'responseMess',
					title : '响应信息'
				},{
					field : 'alarmContactName1',
					title : '联系人1'
				},{
					field : 'alarmContactName2',
					title : '联系人2'
				},{
					field : 'version',
					title : '版本号'
				},{
					field : 'monitorRate',
					title : '监控频率'
				},{
					field : 'threshold',
					title : '阀值'
				},{
					field : 'remindRate',
					title : '提醒频率'
				},{
					field : 'serviceDescription',
					title : '服务描述'
				},{
					field : 'serviceStatus',
					title : '监控状态',
					formatter:statusFormatter
				},{
					field : 'lastupdatedate',
					title : '最后更新时间',
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
		
		// 操作列格式化
	        function statusFormatter(value, row, index) { 
	            var e = '';  
	            if(value=="1"){
	            	e="正常";
	            }else{
	            	e="故障";
	            }
	            return e;  
	        }
		
		//行双击事件------>查看详情
		function dblClick(row){
			parent.layer.open({
				title:"服务监控详情",
			    type: 2,
			    area: ['800px', '600px'],
			    fix: false, //不固定
			    maxmin: true,
			    content: '<spring:url value="/serviceMonitor/doEnServiceMonitorDetail?id=" />'+row.id
			});
		}
		
		//添加操作
		function addRecord(){
			parent.layer.open({
				title:"新增渠道",
			    type: 2,
			    area: ['800px', '600px'],
			    fix: false, //不固定
			    maxmin: true,
			    content: '<spring:url value="/serviceMonitor/doEnServiceMonitorAdd" />'
			});
		}
		
		//被子页面调用
		function beCalled(data){
			$('#tb_monitorentry').bootstrapTable('refresh');
			top.layer.alert("操作成功！",{icon:1});
		}
		
		// 查询参数设置  
		function queryParams(params) {
			var guidStr = generateGuid();
			var temp = {
				//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的    
				limit : params.limit, //页面大小    
				offset : params.offset, //页码   
				serviceStatus : $("#serviceStatus").val(),
				protocoltypeCode: $("#protocoltypeCode").val(),
				guidStr:guidStr
			};
			return temp;
		};
		
		// 删除操作
        function deleteRecord() {
            var ids = "";
            var rows = $table.bootstrapTable('getSelections');
            for (var i = 0; i < rows.length; i++) {
                ids += rows[i].id + ',';
            }
            ids = ids.substring(0, ids.length - 1);
            if (ids == "") {
            	top.layer.alert("请选择要删除的记录！",{icon:2});
                return;
            }else{
            	top.layer.confirm('确定要删除记录吗?', {icon: 3, title:'注意'}, function(index){
            		top.layer.close(index);
            		 //渠道逻辑开关    后续添加此功能
                    $.post('<spring:url value="/serviceMonitor/doDelMonitorentry" />',{
                    	ids : ids
                    },function(res,status){
                    	if("0000000"==res.head.respCode){
                    		top.layer.msg("删除成功!",{icon:1});
                    		$('#tb_monitorentry').bootstrapTable('refresh');
                    	}else{
                    		top.layer.msg("删除失败！",{icon:2});
                    	}
                    },"json"); 
            	
            	});
            }
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
