<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>租户编辑</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <link href='<spring:url value="/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css" />' rel="stylesheet">
</head>

<body>

	<form id="submitForm" class="form-horizontal">
	
		<input type="hidden" id="tenantId" value="${tenant.id}" />
	
		<label class="control-label col-sm-2">名称</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="description" value="${tenant.description}" />
		</div>
		<label class="control-label col-sm-2">租户状态</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="${tenant.tenanttypeDesc}" disabled />
		</div>
		<label class="control-label col-sm-2">主营业务</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="mainbusiness" value="${tenant.mainbusiness}" />
		</div>
		<label class="control-label col-sm-2">网址</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="website" value="${tenant.website}" />
		</div>
		
		<label class="control-label col-sm-2">地址</label>
		<div class="col-sm-10">
		    <div class="form-control" >
			    <select id="sel_country"></select>
	            <select id="sel_province"></select>
	            <select id="sel_city"></select>
            </div>
		</div>
		
		<label class="control-label col-sm-2">街道</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="street" value="${tenant.street}" />
		</div>
		<label class="control-label col-sm-2">电话</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="telephone" value="${tenant.telephone}" />
		</div>
		<label class="control-label col-sm-2">传真</label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" id="fax" value="${tenant.fax}" />
		</div>
		
		<label class="control-label col-sm-2" >租户类型</label>
		<div class="col-sm-10">
			<select class="form-control" id="tenanttypeCode">
		        <c:forEach var="item" items="${tenantTypeList}" > 
		            <option value="${item.code}" <c:if test="${item.code==tenant.tenanttypeCode}">selected</c:if> > ${item.description}</option>
		        </c:forEach>
		    </select>
		</div>
		
		<label class="control-label col-sm-2" >企业规模规模</label>
		<div class="col-sm-10">
			<select class="form-control" id="enterprisescaleCode">
		        <c:forEach var="item" items="${enterpriseScaleList}" > 
		            <option value="${item.code}" <c:if test="${item.code==tenant.enterprisescaleCode}">selected</c:if> > ${item.description}</option>
		        </c:forEach>
		    </select>
		</div>
		
		<label class="control-label col-sm-2" >营业年限</label>
		<div class="col-sm-10">
			<select class="form-control" id="businessdurationCode">
		        <c:forEach var="item" items="${businessDurationList}" > 
		            <option value="${item.code}" <c:if test="${item.code==tenant.businessdurationCode}">selected</c:if> > ${item.description}</option>
		        </c:forEach>
		    </select>
		</div>
		
		<label class="control-label col-sm-2" >申请时间 </label>
		<div class="col-sm-10">
		    <input type="text" class="form-control" value="<fmt:formatDate value="${tenant.lastupdatedate}" pattern="yyyy-MM-dd  HH:mm:ss" />" disabled /> 
		</div>

        <div class="col-sm-12">
		  <div class="navbar-btn">
		  	  <input type="button" value="确定" class="btn btn-primary col-sm-offset-3" id="commit" />
		 	  <input type="button" value="取消" class="btn btn-primary col-sm-offset-1" id="cancel" />
		  </div>
        </div>
	  
	</form> 
</body>

<script type="text/javascript">
	
	$(function() {

		select_Init();
		
		$("#cancel").bind("click",function(){
			closeWindow(window.name);
		});
				
	});
		
	$("#commit").bind("click",function(){
		
		$.ajax({
			type: "POST",
			url : '<spring:url value="/tenant/doEditTenant" />',
			data:{
				id:$("#tenantId").val(),
				description:$('#description').val(),
				mainbusiness:$('#mainbusiness').val(),
				website:$('#website').val(),
				countryId:$('#sel_country').text(),
				countryName:$("#sel_country").find('option:selected').text(), 
				provinceId:$('#sel_province').val(),
				provinceName:$("#sel_province").find('option:selected').text(), 
				cityId:$('#sel_city').val(),
				cityName:$("#sel_city").find('option:selected').text(), 
				street:$('#street').val(),
				telephone:$('#telephone').val(),
				fax:$('#fax').val(),
				tenanttypeCode:$('#tenanttypeCode').val(),
				tenanttypeDesc:$("#tenanttypeCode").find('option:selected').text(), 
				enterprisescaleCode:$('#enterprisescaleCode').val(),
				enterprisescaleDesc:$("#enterprisescaleCode").find('option:selected').text(), 
				businessdurationCode:$('#businessdurationCode').val(),
				businessdurationDesc:$("#businessdurationCode").find('option:selected').text()
			},
			dataType: "json",
			async: false,
			success: function(data){
				if("0000000"==data.head.respCode){
					parent.window.contFrame.window.beCalled(data);
 					closeWindow(window.name);
				}
				else{
					alert(data.head.respContent);
				}
			}
		});
	});	
	
	
	// 下拉列表初始化
	function select_Init(){
		// 初始化国家
		country_Init();
		// 默认选中中国且不可修改
		$("#sel_country").find("option[value='1']").attr("selected", true);
		$("#sel_country").attr("disabled",true);
		
		// 初始化省份
		province_Init();
        $("#sel_province").find("option[value='${tenant.provinceId}']").attr("selected", true);
        
		// 初始化城市
		city_Init();
        $("#sel_city").find("option[value='${tenant.cityId}']").attr("selected", true);
	}
	
	// 国家下拉事件
	$('#sel_country').change(function(){
		province_Init();
	});
	
	// 省份下拉事件
	$('#sel_province').change(function(){
		city_Init();
	});
	
	// 初始化国家
	function country_Init(){
		$("#sel_country").append('<option>请选择</option>');
		<c:forEach var="item" items="${countryList}">
	    if(${item.parentId==0}){
	    	$("#sel_country").append('<option value=${item.id}>${item.description}</option>');
	    }
		</c:forEach>
	}
	
	// 初始化省份
	function province_Init(){
		$("#sel_province").empty();
		$("#sel_province").append('<option>请选择</option>');
		$("#sel_city").empty();
		$("#sel_city").append('<option>请选择</option>');
		<c:forEach var="item" items="${provinceList}">
            if($('#sel_country option:selected').val()==${item.parentId}){
            	$("#sel_province").append('<option value=${item.id}>${item.description}</option>');
            }
        </c:forEach>
	}
	
	// 初始化城市
	function city_Init(){
		$("#sel_city").empty();
		$("#sel_city").append('<option>请选择</option>');
		<c:forEach var="item" items="${cityList}">
            if($('#sel_province option:selected').val()==${item.parentId}){
            	$("#sel_city").append('<option value=${item.id}>${item.description}</option>');
            }
        </c:forEach>
	}

</script>
</html>
