<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>工单查询</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet">
    <link href='<spring:url value="/css/plugin/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />' rel="stylesheet">
</head>

<body>

	<div class="container-fluid">
		<h3>基本信息</h3>
		<div class="row">
			<label class="col-md-2">名称</label>
			<div class="col-md-4">${tenantAgreement.tname}</div>
			<label class="col-md-2">协议编号</label>
			<div class="col-md-4">${tenantAgreement.sano}</div>
		</div>
		
		<div class="row">
			<label class="col-md-2">协议类型</label>
			<div class="col-md-4">${tenantAgreement.satypeDesc}</div>
			<label class="col-md-2">协议状态</label>
			<div class="col-md-4">${tenantAgreement.sastatusDesc}</div>
		</div>
		
		<div class="row">
			<label class="col-md-2" >协议生效日期 </label>
			<div class="col-md-4"><fmt:formatDate value="${tenantAgreement.sabegindate}" pattern="yyyy-MM-dd  HH:mm:ss" /></div>
			<label class="col-md-2" >协议失效日期</label>
			<div class="col-md-4"><fmt:formatDate value="${tenantAgreement.saenddate}" pattern="yyyy-MM-dd  HH:mm:ss" /></div>
		</div>
		
		<div class="row">
			<label class="col-md-2">坐席数量</label>
			<div class="col-md-4">${tenantAgreement.saseatamount}</div>
			<label class="col-md-2">外勤数量</label>
			<div class="col-md-4">${tenantAgreement.saoutworkeramount}</div>
		</div>
		
		<div class="row">
			<label class="col-md-2">缴费前账户余额</label>
			<div class="col-md-4">${tenantAgreement.saaccountbalance}</div>
			<label class="col-md-2">费用合计</label>
			<div class="col-md-4">${tenantAgreement.satotalmoney}</div>
		</div>
		
		<div class="row">
			<label class="col-md-2">积分抵现</label>
			<div class="col-md-4">${tenantAgreement.satotalcoupon}</div>
			<label class="col-md-2">代金卷编号</label>
			<div class="col-md-4">${tenantAgreement.voucherno}</div>
		</div>
		
		<div class="row">
			<label class="col-md-2">代金卷金额</label>
			<div class="col-md-4">${tenantAgreement.vouchermoney}</div>
			<label class="col-md-2">代金卷消费金额</label>
			<div class="col-md-4">${tenantAgreement.voucherpaymoney}</div>
		</div>
		
		<div class="row">
			<label class="col-md-2">支付金额</label>
			<div class="col-md-4">${tenantAgreement.sapaymoney}</div>
			<label class="col-md-2">支付时间</label>
			<div class="col-md-4"><fmt:formatDate value="${tenantAgreement.sapaydate}" pattern="yyyy-MM-dd  HH:mm:ss" /></div>
		</div>
		
		<div class="row">
			<label class="col-md-2">交易流水号</label>
			<div class="col-md-10">${tenantAgreement.transactionno}</div>
		</div>
		
		<h3>服务信息</h3>
		<table id="tb_board"></table> 
		
	</div>
	
</body>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/bootstrap-table.min.1.10.1.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/locale/bootstrap-table-zh-CN.min.js" />'></script>
	<script type="text/javascript">
		
		$(function() {
			
			initDetailTable();
			
			$("#cancel").bind("click",function(){
				closeWindow(window.name);
			});
					
		});
			
		// 初始化表格
		function initDetailTable() {
            $('#tb_board').bootstrapTable({
                method: 'get',
                url : '<spring:url value="/tengree/doReadTenantAgreementDetailList"/>',
                pagination: true,
                pageSize: 5,
                pageList: [10, 50, 100, 200, 500],
                sidePagination: "server", //服务端请求
                queryParams: function queryParams(params) {
        			var temp = {
        					limit : params.limit,
        					offset : params.offset,
        					said : '${tenantAgreement.id}'
        				};
        				return temp;
        			},
                responseHandler: responseHandler,
                columns : [ {
					field : 'tname',
					title : '租户'
				}, {
					field : 'channelDesc',
					title : '渠道'
				}, {
					field : 'servicetypeDesc',
					title : '服务名称'
				}, {
					field : 'price',
					title : '服务价格'
				}],
                onLoadSuccess:function(){

                },
                onLoadError: function () {
                    alert("数据加载失败！");
                }
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
</html>
