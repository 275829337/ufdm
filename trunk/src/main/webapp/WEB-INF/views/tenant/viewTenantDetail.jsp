<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>租户详细信息</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet"/>
    <style>
       body {
          margin:2px;
          line-height:22px;
       }
       div {
          font-weight:bold;
       }
       
       table, .row {
           margin-left:10px;
       }
    </style>
</head>

<body>

	<div class="container-fluid">
		<h3>基本信息</h3>
		<div class="row">
			<div class="col-md-2">名称:</div>
			<div class="col-md-10">${tenant.description}</div>
		</div>
		<div class="row">
			<div class="col-md-2">类型:</div>
			<div class="col-md-10">${tenant.tenanttypeDesc}</div>
		</div>
		<div class="row">
			<div class="col-md-2">规模:</div>
			<div class="col-md-10">${tenant.enterprisescaleDesc}</div>
		</div>
		<div class="row">
			<div class="col-md-2">营业年限:</div>
			<div class="col-md-10">${tenant.businessdurationDesc}</div>
		</div>
		<div class="row">
			<div class="col-md-2">状态:</div>
			<div class="col-md-10">${tenant.tenantstatusDesc}</div>
		</div>
		<div class="row">
			<div class="col-md-2">网址:</div>
			<div class="col-md-10">${tenant.website}</div>
		</div>
		<div class="row">
			<div class="col-md-2">行业:</div>
			<div class="col-md-10">${tenant.industryDesc}</div>
		</div>
		<div class="row">
			<div class="col-md-2">主营业务:</div>
			<div class="col-md-10">${tenant.mainbusiness}</div>
		</div>
		<div class="row">
			<div class="col-md-2">地址:</div>
			<div class="col-md-10">${tenant.provinceName}${tenant.cityName}${tenant.street}</div>
		</div>
		<div class="row">
			<div class="col-md-2">电话:</div>
			<div class="col-md-10">${tenant.telephone}</div>
		</div>
		<div class="row">
			<div class="col-md-2">传真:</div>
			<div class="col-md-10">${tenant.fax}</div>
		</div>
		<div class="row">
			<div class="col-md-2">创建时间:</div>
			<div class="col-md-10">
				<fmt:formatDate value="${tenant.lastupdatedate}"
					pattern="yyyy-MM-dd  HH:mm:ss" />
			</div>
		</div>
		
		<h3>账户信息</h3>
		<div class="row">
			<div class="col-md-2">余额:</div>
			<div class="col-md-10">${tenantAccount.balance}</div>
		</div>
		
		<h3>管理员信息</h3>
		<div class="row">
			<div class="col-md-2">名称:</div>
			<div class="col-md-10">${tenantUser.userName}</div>
		</div>
		<div class="row">
			<div class="col-md-2">电话:</div>
			<div class="col-md-10">${tenantUser.phone}</div>
		</div>
		<div class="row">
			<div class="col-md-2">电子邮件:</div>
			<div class="col-md-10">${tenantUser.email}</div>
		</div>
		
		<h3>发票信息</h3>
		<table id="tb_invoice"></table> 
				
		<h3>服务协议</h3>
		<table id="tb_agreement"></table>
		
	</div>

</body>

    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/bootstrap-table.min.1.10.1.js" />'></script>
    <script type="text/javascript" src='<spring:url value="/js/plugin/bootstrap-table-1.10.1/locale/bootstrap-table-zh-CN.min.js" />'></script>
    
	<script type="text/javascript">
    
		$(function() {
			initVoiceTable();
			initAgreementTable();
			$("#cancel").bind("click",function(){
				closeWindow(window.name);
			});
		});
		
		// 初始化表格
		function initVoiceTable() {
            $('#tb_invoice').bootstrapTable({
                method: 'get',
                url : '<spring:url value="/tendet/doReadTenantInvoiceList" />',
                pagination: true,
                pageSize: 5,
                pageList: [10, 50, 100, 200, 500],
                sidePagination: "server", //服务端请求
                queryParams: function queryParams(params) {
        			var temp = {
        					limit : params.limit,
        					offset : params.offset,
        					tid : '${tenant.id}'
        				};
        				return temp;
        			},
                responseHandler: responseHandler,
                columns : [ {
					field : 'title',
					title : '发票抬头'
				}, {
					field : 'taxregno',
					title : '税务登记证号'
				}, {
					field : 'bankname',
					title : '开户银行'
				}, {
					field : 'bankaccount',
					title : '开户账户'
				}, {
					field : 'regaddress',
					title : '注册场所地址'
				}],
                onLoadSuccess:function(){

                },
                onLoadError: function () {
                    alert("数据加载失败！");
                }
            });
        }
		
		// 初始化表格
		function initAgreementTable() {
			$('#tb_agreement').bootstrapTable({
                method: 'get',
                url : '<spring:url value="/tendet/doReadTenantAgreementList" />',
                pagination: true,
                pageSize: 5,
                pageList: [10, 50, 100, 200, 500],
                sidePagination: "server", //服务端请求
                queryParams: function queryParams(params) {
        			var temp = {
        					limit : params.limit,
        					offset : params.offset,
        					tid : '${tenant.id}'
        				};
        				return temp;
        			},
                responseHandler: responseHandler,
                columns : [ {
					field : 'sano',
					title : '协议编号'
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
