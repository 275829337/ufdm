<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>试用租户平台配置</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
</head>
<body>
<div id="mainContent">
    <form id="myForm" class="form-horizontal">
    	<input id="id" type="hidden"/>
		<table class="table table-bordered">
			
			<tr>
				<td colspan="2"></td>
				<c:forEach var="channel" items="${channelList}">
					<td>${channel.name}</td>
				</c:forEach>
			</tr>
		
		<c:forEach var="industryService" items="${industryServiceList}">
		
		    <c:forEach var="servicetype" items="${servicetypeList}" varStatus="status">
		    
			    <c:if test="${industryService.industryCode==servicetype.industryCode}">
				    <tr>
				        <!-- 判断与上一条行业编码是否相等 -->
					    <c:if test="${servicetypeList[status.index].industryCode!=servicetypeList[status.index-1].industryCode}">
						   <c:if test="${servicetype.industryName!=null}">
						  	 <td rowspan="${industryService.industryCount}">${servicetype.industryName}</td>
						   </c:if>
						   <c:if test="${servicetype.industryName==null}">
					   		<td rowspan="${industryService.industryCount}">基础行业</td>
					       </c:if>
					    </c:if>
					    
					    <td>${servicetype.name}</td>
				       <c:forEach var="channel" items="${channelList}">
				        <td>
				        <center>
				        <input type="checkbox" dataChannelCode="${channel.code}" dataServicetypeCode="${servicetype.code}" dataServicetypeId="${servicetype.id}" dataPSTId="${servicetype.servicetypeId}"
				           <c:forEach var="cs" items="${csList}">
						       <c:if test="${cs.channelCode==channel.code&&cs.serviceTypeCode==servicetype.code}">
							      dataId="${cs.id}"
							      <c:if test = "${cs.valid==true}">
							     	 checked="checked"
							      </c:if>
							   </c:if>
							</c:forEach>  />
						</center>
						</td>
				    	</c:forEach>
				    </tr>
			    </c:if>
			    
		    </c:forEach>
	    
	    </c:forEach>
	</table>
	</form>
	<div id="toolbar" class="btn-group">
		<button id="btn_edit" type="button" class="btn btn-success btn-center">
			<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>更新
		</button>
	</div>
</div>

	<script type="text/javascript">
		$(function() {
			var textAll=$("input[type='text']");
			for(var i=0;i<textAll.length;i++){
				if($(textAll[i]).attr("dataValid")=="true"){
					$($(textAll[i]).attr("readonly",false));
				}else{
					$($(textAll[i]).attr("readonly",true));
				}
			}
         	//编辑
            $('#btn_edit').click(function () {
            	editRecord();
            });
         	
         	//关于依赖服务 子选中则其依赖服务选中 父取消 则其子服务取消
         	$("input[type='checkbox']").change(function(){
       		 	this.blur();     
                this.focus();
         		var servicetypeId = $(this).attr("dataServicetypeId");//服务id
         		
         		var servicetypeCode = $(this).attr("dataServicetypeCode");//服务code
         		
         		var channelCode = $(this).attr("dataChannelCode");//渠道code
         		
         		var PId = $(this).attr("dataPSTId");//服务父id
         		var isChecked = $(this).is(':checked');
         		var allObj=$("input[type='checkbox']");
         		
         		for(var i=0;i<allObj.length;i++){
         			if(channelCode==$(allObj[i]).attr("dataChannelCode")){ //同一渠道
         				if(isChecked){
         					$(this).next().attr("readonly",false);
         					//判断是否有父 dataPSTId
             				if(PId==$(allObj[i]).attr("dataServicetypeId")){
             					$(allObj[i]).prop("checked",true);
             					$(allObj[i]).next().attr("readonly",false);
             				}
             			}else{
             				$(this).next().attr("readonly",true);
             				//判断是否有子
             				if(servicetypeId==$(allObj[i]).attr("dataPSTId")){
             					$(allObj[i]).attr("checked",false);
             					$(allObj[i]).next().attr("readonly",true);
             				}
             			}
         			}
         		}
         	});
		});
		
		// 编辑操作
        function editRecord() {
			
        	top.layer.confirm('确定要更新数据吗?', {icon: 3, title:'注意'}, function(index){
        		top.layer.close(index);
        		var allObj=$("input[type='checkbox']");
        		var selectedObj=$("input[type='checkbox']:checked");
        		
        		var list =new Array();
				$("input[type='checkbox']:checked").each(function(index){ 
					var entry={};
					entry={id:$(this).attr("dataId"),channelCode:$(this).attr("dataChannelCode"),serviceTypeCode:$(this).attr("dataServicetypeCode"),configType:"1"};
					list.push(entry);
				}); 
				$("#id").val(JSON.stringify(list));
				$.ajax({
					type: "POST",
					url: '<spring:url value="/channelServicetype/doEditChannelServicetypeTryout" />',
					dataType:"json",
					data:{
						jsonString:$("#id").val()
					},
					async: false,
					success: function(data){
						if("0000000"==data.head.respCode){
							window.location.href = '<spring:url value="/channelServicetype/doEnServicetypeTryoutList" />';
						}
					}
				});
        	});
        }
        
	</script>

</body>
</html>
