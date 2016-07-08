package com.prj.biz.action.tenant;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.prj.biz.action._base.BaseAction;
import com.prj.biz.bean.tenant.Tenant;
import com.prj.biz.service.codetable.CodeTableService;
import com.prj.biz.service.tenant.TenantService;
import com.prj.core.bean.resp.RespBean;
import com.prj.core.bean.resp.RespPagination;

/**
* @Description: 租户ACTION
* @date 2016年3月29日 
* @author 1936
 */
@RestController
@RequestMapping("/tenant")
public class TenantAction extends BaseAction{

	private static final long serialVersionUID = 9129914883264602409L;

	@Resource
	private TenantService tenantService;
	
	@Resource
	private CodeTableService codeTableService;
	
	// 进入租户管理列表
	@RequestMapping("/doEnTenantList")
	public ModelAndView doEnTenantList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		return new ModelAndView("/tenant/tenantList");
	}
	
	// 进入编辑页面
	@RequestMapping("/doEnTenantEdit")
	public ModelAndView doEnTenantEdit(String tenantId) throws Exception{
		Tenant tenant = tenantService.doGetById(tenantId);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("tenant", tenant);
		model.put("tenantStatusList", codeTableService.doGetTenantStatusList());
		model.put("tenantTypeList", codeTableService.doGetTenantTypeList());
		model.put("businessDurationList", codeTableService.doGetBusinessDurationList());
		model.put("enterpriseScaleList", codeTableService.doGetEnterpriseScaleList());
		model.put("countryList", codeTableService.doGetCountyList());
		model.put("provinceList", codeTableService.doGetProvinceList());
		model.put("cityList", codeTableService.doGetCityList());
		return new ModelAndView("/tenant/tenantEdit",model);
	}
	
	// 编辑保存
	@RequestMapping("/doEditTenant")
	public RespBean<Tenant> doEditTenant(Tenant tenant) throws Exception{
		RespBean<Tenant> respBean = new RespBean<Tenant>();
		tenantService.doModById(tenant);
		return respBean;
	}
	
	
	
	// 进入租户待审核(实名认证申请)
	@RequestMapping("/doEnCheckTenantList")
	public ModelAndView doEnCheckTenantList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		return new ModelAndView("/tenant/checkTenantList");
	}
	
	// 进入审核页面
	@RequestMapping("/doEnCheckTenant")
	public ModelAndView doEnCheckTenant(String tenantId) throws Exception{
		Tenant tenant = tenantService.doGetById(tenantId);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("tenant", tenant);
		return new ModelAndView("/tenant/checkTenant",model);
	}
	
	// 审核
	@RequestMapping("/doCheckTenant")
	public RespBean<Tenant> doCheckTenant(Tenant tenant) throws Exception{
		RespBean<Tenant> respBean = new RespBean<Tenant>();
		tenantService.doCheckTenant(tenant);
		return respBean;
	}
	
	
	
	// 未使用用户
	@RequestMapping("/doEnUnUsingTenantList")
	public ModelAndView doEnUnUsingTenantList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		return new ModelAndView("/tenant/unUsingTenantList");
	}
	
	// 试用用户
	@RequestMapping("/doEnTryUsingTenantList")
	public ModelAndView doEnTryUsingTenantList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		return new ModelAndView("/tenant/tryUsingTenantList");
	}

	// 根据条件查询租户分页信息
	@RequestMapping("/doReadTenantList")
	@ResponseBody
	public RespBean<RespPagination<Tenant>> doReadTenantList(Tenant tenant) throws Exception{
		RespBean<RespPagination<Tenant>> respBean = new RespBean<RespPagination<Tenant>>();
		RespPagination<Tenant> respPagination = new RespPagination<Tenant>();
		Integer total = tenantService.doGetTotal(tenant);
		List<Tenant> tenantList = tenantService.doGetList(tenant);
		respPagination.setTotal(total);
		respPagination.setRows(tenantList);
		respBean.setBody(respPagination);
		return respBean;
	}

}
