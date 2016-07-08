<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>渠道配置</title>
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
			<label class="control-label col-sm-1 RL" for="code">渠道编码</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="code"/>
			</div>
			<label class="control-label" for="name" style="float: left;">渠道名称</label>
			<div class="col-sm-2">
		     	<input type="text" class="form-control" id="name"/>
			</div>
			
			<div id="queryDiv" class="col-sm-3 RL" style="text-align: left;">
				<button type="button" id="btn_query" class="btn btn-primary">查询</button>
			</div>
		</div>
	</form>

	<div id="toolbar" style="margin-bottom: 1%;margin-top: 2%;">
		<button id="btn_add" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
		</button>
		<button id="btn_edit" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>编辑
		</button>
		<button id="btn_delete" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
		</button>
	</div>

	<table id="tb_channel"></table> 
</div>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/bootstrap-table.min.1.10.1.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/locale/bootstrap-table-zh-CN.min.js" />'></script>
	<script type="text/javascript">
	    var $table;
		$(function() {
			initTable();
			// 搜索
			$('#btn_query').click(function(){
				$('#tb_channel').bootstrapTable('getOptions').pageNumber=1;
				$('#tb_channel').bootstrapTable('refresh');
			});
			// 删除
            $('#btn_delete').click(function () {
            	deleteRecord();
            });
         	// 新增
            $('#btn_add').click(function () {
            	addRecord();
            });
         	//编辑
            $('#btn_edit').click(function () {
            	editRecord();
            });
		});
		
		// 初始化表格
		function initTable() {
            $table = $('#tb_channel').bootstrapTable({
                method: 'get',
                url : '<spring:url value="/channel/doReadChannelList" />',
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
				}, {
					field : 'code',
					title : '渠道编码'
				}, {
					field : 'name',
					title : '渠道名称'
				}, {
					field : 'version',
					title : '渠道版本号'
				}, {
					field : 'description',
					title : '渠道描述'
				}],
                onLoadSuccess:function(){

                },
                onLoadError: function () {
                    alert("数据加载失败！");
                }
            });
        }
		//行双击事件------>查看详情
		function dblClick(row){
			parent.layer.open({
				title:"渠道详情",
			    type: 2,
			    area: ['800px', '600px'],
			    fix: false, //不固定
			    maxmin: true,
			    content: '<spring:url value="/channel/doEnChannelDetail?id="/>'+row.id
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
			    content: '<spring:url value="/channel/doEnChannelAdd"/>'  
			});
		}
		
		//被子页面调用
		function beCalled(data){
			$('#tb_channel').bootstrapTable('refresh');
			top.layer.alert("操作成功！",{icon:1});
		}
		// 查询参数设置  
		function queryParams(params) {
			var guidStr = generateGuid();
			var temp = {
				//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的    
				limit : params.limit, //页面大小    
				offset : params.offset, //页码   
				name : $("#name").val(),
				code : $("#code").val(),
				guidStr:guidStr
			};
			return temp;
		}
		
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
                    $.post('<spring:url value="/channel/doDelChannel"/>',{  
                    	ids : ids
                    },function(res,status){
                    	if("0000000"==res.head.respCode){
                    		top.layer.msg("删除成功!",{icon:1});
                    		$('#tb_channel').bootstrapTable('refresh');
                    	}else{
                    		top.layer.msg("删除失败！",{icon:2});
                    	}
                    },"json"); 
            	
            	});
            }
        }
		
		// 编辑操作
        function editRecord() {
        	var rows = $table.bootstrapTable('getSelections');
        	if(rows.length==1){
    			parent.layer.open({
    			    type: 2,
    			    area: ['900px', '530px'],
    			    fix: false, //不固定
    			    maxmin: true,
    			    content: '<spring:url value="/channel/doEnChannelEdit?id="/>'+rows[0].id
    			    
    			});
        	}else{
        		top.layer.alert("请选择一条记录进行编辑！",{icon:2});
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
