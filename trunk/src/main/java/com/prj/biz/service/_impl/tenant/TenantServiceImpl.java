package com.prj.biz.service._impl.tenant;

import com.prj.biz.bean.tenant.Tenant;
import com.prj.biz.dao.maindb.tenant.TenantDao;
import com.prj.biz.service._impl._base.BaseServiceImpl;
import com.prj.biz.service.tenant.TenantService;
import org.springframework.stereotype.Service;

/**
 * 描述: 租户 Service 实现<br>
 * @author 开发
 * @date 2016-03-22
 */
@Service
public class TenantServiceImpl extends BaseServiceImpl<TenantDao,Tenant> implements TenantService
{

	/**
	 * @Description: 用户审核
	 * @param tenant
	 * @date 2016年3月28日 
	 * @author 1936
	 */
	@Override
	public void doCheckTenant(Tenant tenant) throws Exception {
		doModById(tenant);
	}
	

}
