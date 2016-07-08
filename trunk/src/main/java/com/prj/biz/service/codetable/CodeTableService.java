package com.prj.biz.service.codetable;

import java.util.List;

import com.prj.biz.bean.codetable.CodeTable;
import com.prj.biz.service._base.BaseService;

/**
 * 描述: 码表 Service 接口<br>
 * @author 1936
 * @date 2016-03-28
 */
public interface CodeTableService extends BaseService<CodeTable>{
	
	List<CodeTable> doGetTenantStatusList() throws Exception;
	
	List<CodeTable> doGetTenantTypeList() throws Exception;
	
	List<CodeTable> doGetBusinessDurationList() throws Exception;
	
	List<CodeTable> doGetEnterpriseScaleList() throws Exception;
	
	List<CodeTable> doGetCountyList() throws Exception;
	
	List<CodeTable> doGetProvinceList() throws Exception;
	
	List<CodeTable> doGetCityList() throws Exception;
}
