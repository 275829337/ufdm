package com.prj.biz.service.tenant;

import com.prj.biz.bean.tenant.Tenant;
import com.prj.biz.service._base.BaseService;

/**
 * 描述: 租户 Service 接口<br>
 * @author 开发
 * @date 2016-03-22
 */
public interface TenantService extends BaseService<Tenant>{
	
	void doCheckTenant(Tenant tenant) throws Exception;

}
