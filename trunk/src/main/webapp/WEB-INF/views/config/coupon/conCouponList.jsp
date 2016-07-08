<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>优惠券管理</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet" />
</head>
<body>
<div id="mainContent">
    <form id="formSearch" class="form-horizontal">
		<div class="form-group" style="margin-top: 15px;margin-left: -31px;">
			<label class="control-label" for="code" style="float: left;margin-left: 3%;">优惠券编码</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="code"/>
			</div>
			<label class="control-label" for="couponstatusCode" style="float: left;">优惠券状态</label>
			<div class="col-sm-2">
				<select class="form-control" id="couponstatusCode">
					<option value="">--请选择--</option>
					<c:forEach var="status" items="${couponstatusList}">
						<option value="${status.code}">${status.remark}</option>
					</c:forEach>
				</select>
			</div>
			<label class="control-label" for="createPersonName" style="float: left;">创建人</label>
			<div class="col-sm-2">
		     	<input type="text" class="form-control" id="createPersonName"/>
			</div>
			<label class="control-label" for="usePersonName" style="float: left;">使用者</label>
			<div class="col-sm-2">
		     	<input type="text" class="form-control" id="usePersonName"/>
			</div>
			
			<div id="queryDiv" style="text-align: left;float: left;">
				<button type="button"  id="btn_query" class="btn btn-primary">查询</button>
			</div>
		</div>
	</form>

	<div id="toolbar" style="margin-bottom: 1.5%;margin-top: 1%;">
		<button id="btn_add" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
		</button>
	</div>

	<table id="tb_coupon"></table> 
</div>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/bootstrap-table.min.1.10.1.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/locale/bootstrap-table-zh-CN.min.js" />'></script>
    
	<script type="text/javascript">
	    var $table;
		$(function() {
			initTable();
			// 搜索
			$('#btn_query').click(function(){
				$('#tb_coupon').bootstrapTable('getOptions').pageNumber=1;
				$('#tb_coupon').bootstrapTable('refresh');
			});
         	// 新增
            $('#btn_add').click(function () {
            	addRecord();
            });
		});
		
		// 初始化表格
		function initTable() {
            $table = $('#tb_coupon').bootstrapTable({
                method: 'get',
                url : '<spring:url value="/coupon/doReadCouponList" />',
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
					title : '优惠券编码'
				}, {
					field : 'price',
					title : '金额'
				}, {
					field : 'usePersonName',
					title : '使用者'
				}, {
					field : 'useDate',
					title : '使用时间',
					formatter: function (value, row, index){
						return dateFormat(value, "yyyy-mm-dd HH:MM:ss");
					}
				}, {
					field : 'createDate',
					title : '创建时间',
					formatter: function (value, row, index){
						return dateFormat(value, "yyyy-mm-dd HH:MM:ss");
					}
				}, {
					field : 'couponstatusDesc',
					title : '状态'
				},{
                    title: '操作',
                    field: 'couponstatusCode',
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
		//行双击事件------>查看详情
		function dblClick(row){
			parent.layer.open({
				title:"渠道详情",
			    type: 2,
			    area: ["800px", "600px"],
			    fix: false, //不固定
			    maxmin: true,
			    content: '<spring:url value="/coupon/doEnCouponDetail?id=" />'+row.id
			});
		}
		
		//添加操作
		function addRecord(){
			parent.layer.open({
				title:"创建优惠券",
			    type: 2,
			    area: ['800px', '600px'],
			    fix: false, //不固定
			    maxmin: true,
			    content: '<spring:url value="/coupon/doEnCouponAdd" />'
			});
		}
		
		//被子页面调用
		function beCalled(data){
			$('#tb_coupon').bootstrapTable('refresh');
			top.layer.alert("操作成功！",{icon:1});
		}
		// 查询参数设置  
		function queryParams(params) {
			var guidStr = generateGuid();
			var temp = {
				//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的    
				limit : params.limit, //页面大小    
				offset : params.offset, //页码   
				code : $("#code").val(),
				couponstatusCode:$("#couponstatusCode").val(),
				createPersonName :$("#createPersonName").val(),
				usePersonName : $("#usePersonName").val(),
				guidStr:guidStr
			};
			return temp;
		};
		
        function auditRecord(id){
        	parent.layer.open({
    			title:"审核",
    		    type: 2,
    		    area: ['800px', '600px'],
    		    fix: false, //不固定
    		    maxmin: true,
    		    content: '<spring:url value="/coupon/doEnCouponAudit?id=" />'+id
    		});
        }
        
		// 操作列格式化
        function operateFormatter(value, row, index) {
			var e="";
			if(value=="1"){
				e='<a href="#" mce_href="#" onclick="auditRecord(\''+ row.id + '\')">审核</a> '; 
			}
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
