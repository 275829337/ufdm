<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>登录成功首页</title>
    <%@ include file="/WEB-INF/views/common/headCommon.jsp"%>
    <style>
		*{margin: 0; padding: 0; list-style: none;}
		a{color: #000; text-decoration: none;}
		.panel-heading{ background: #eff1f9;}
		a:hover{ text-decoration: none;}
		.title{width: 100%; height: 34px; border-bottom: 1px solid #c7c7c7; font-size: 14px; line-height: 34px; background: url('<spring:url value="/img/login/titleArr1.png" />') no-repeat 130px 15px; overflow: hidden; text-indent: 1em; cursor: pointer;}
		.list{width: 100%; z-index: 999; display: block;}
		.list a{ width: 100%; height: 100%; display: inline-block;}
		.list li{width: 158px; height: 34px; line-height: 34px; font-size: 14px; color: #666; border-left: 2px solid #eff1f9; position: relative; z-index: 999; cursor: pointer;}
		.list li a{ text-indent: 1.8em;}
		.list li:hover,.list li.active{background: #fff; color: #66c9e9; border-left: 2px solid #66c9e9;}
		.list li:hover a,.list li.active a{color: #66c9e9;}
	</style>
</head>

<body>
	<div id="navigationDiv" class="navbar navbar-fixed-top bs-docs-nav navbar-default">
		<div class="container-fluid">
			<div class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
			
				<ul class="nav navbar-nav">
					<li class="dropdown dropdown-big"><a class="open">UFDM（统一格式开发模型）系统&nbsp;|&nbsp;后台管理系统</a></li>
				</ul>
				
				<ul class="nav navbar-nav pull-right">
					<li class="dropdown pull-right"><a class="open pull-left">您好，${sessionScope.sessionSysUser.loginName}</a>
						<a class="pull-left" href="javascript:;" id="LogOut">退出登录</a>
						<div class="clearfix"></div>
					</li>
				</ul>
				
			</div>
		</div>
	</div>

	<div id="content" class="container-fluid">
		<div class="row">
			<div class="col-md-2" style="padding-right:0px">
				<div id="sidebar" class="panel-heading"></div>
			</div>

			<div class="col-md-10" style="padding-left:0px">
				<div id="wrapper">
					<iframe style="display: block; height: 100%; width: 100%; min-height: 768px;" id="adminContent" name="contFrame" frameborder="0">
					</iframe>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			//根据导航栏设置内容的margin-top属性
			$("#content").css("margin-top", $("#navigationDiv").outerHeight(true));
			$("#LogOut").bind("click",function(){
				top.layer.confirm("确定要退出吗？", function(){
					location='<spring:url value="/sysuser/account/doSysUserLogout"/>';
				});
			});
		});
	
		var _jsonMenuData = $.parseJSON('${sessionScope.sessionSysUser.hxResourceMenuListJson}');
		var _menuItem="",_direct="<spring:url value='/'/>".replace(/\/$/,"");
	    $.each(_jsonMenuData, function(a,b){
	         var _strFirst="",_strSec="";
			if(b.parentId=="0")
			{
				var _parentId=b.id;
				if(b.resName)
				{
					_strFirst=b.resName;	
				}
				$.each(_jsonMenuData,function(c,d){
					if(_parentId==d.parentId)
					{
						if(d.resName)
						{
							_strSec+='<li><a data-href="'+_direct+d.resUrl+'">'+d.resName+'</a></li>';
						}
					}	
				});
			}
			if(_strFirst)
			{
				if(_strSec)
				{
					_menuItem+='<div><div class="title" dataId="'+a+'"><a>'+_strFirst+'</a></div><div class="list">';
					_menuItem+='<ul>'+_strSec+'</ul></div></div>';
				}else
				{
					_menuItem+="<div>"+_strFirst+"</div>";
				}
			}else
			{
				_menuItem+="";
			}
	    }); 
      _menuItem = "<div class='nav' id='mainMenu'>" + _menuItem + "</div>";
        $("#sidebar").html(_menuItem);
        $("#mainMenu li a").click(function(){
          var url = $(this).attr("data-href");
          $("#adminContent").attr("src",url);
          window.location.href="javascript:scroll(0,0)";
        });
        
        //子菜单点击变色
         $("#mainMenu ul li").click(function(){
        	$("#mainMenu ul li").removeClass("active");
        	$(this).addClass("active");
        	//点击子，父的其他兄弟合并
        	var titles = $(".title");
        	var parent = $(this).parents(".list");
        	var thisTitle = parent.prev();
        	for(var i=0;i<$(".title").length ;i++ ){
        		if($($(".title")[i]).attr("dataId")!=thisTitle.attr("dataId")){
        			var list = $($(".title")[i]).siblings('.list');
                	if(list.css('display') == 'block'){
                		$($(".title")[i]).css('background-image','url(<spring:url value="/img/login/titleArr2.png"/>)');
                		list.css('display','none');
                	}
        		} 
        	}
        	
        }); 
        
        $('.title').click(function(){
        	var list = $(this).siblings('.list');
        	if(list.css('display') == 'block'){
        		$(this).css('background-image','url(<spring:url value="/img/login/titleArr2.png"/>)');
        		list.css('display','none');
        	}else{
        		$(this).css('background-image','url(<spring:url value="/img/login/titleArr1.png"/>)');
        		list.css('display','block');
        	}
        });


        
    </script>
</body>

