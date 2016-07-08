package com.prj.biz.dao.maindb.codetable;

import java.util.List;

import com.prj.biz.bean.codetable.CodeTable;
import com.prj.biz.dao._base.BaseDao;

/** 
* @Description: 码表DAO
* @date 2016年3月29日 
* @author 1936
*/
public interface CodeTableDao extends BaseDao<CodeTable>{

	// 租户状态
	List<CodeTable> selectTenantStatusList();
	
	// 租户类型
	List<CodeTable> selectTenantTypeList();
	
	// 营业年限
	List<CodeTable> selectBusinessDurationList(); 
	
	// 企业规模
	List<CodeTable> selectEnterpriseScaleList(); 
	
	// 国家
	List<CodeTable> selectCountyList();
	
	// 省份
	List<CodeTable> selectProvinceList();
	
	// 城市
	List<CodeTable> selectCityList();
	
}
