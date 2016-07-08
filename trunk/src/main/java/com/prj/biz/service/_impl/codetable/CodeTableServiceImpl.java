package com.prj.biz.service._impl.codetable;

import java.util.List;
import org.springframework.stereotype.Service;
import com.prj.biz.bean.codetable.CodeTable;
import com.prj.biz.dao.maindb.codetable.CodeTableDao;
import com.prj.biz.service._impl._base.BaseServiceImpl;
import com.prj.biz.service.codetable.CodeTableService;

/**
 * 描述: 码表 Service 实现<br>
 * @author 1936
 * @date 2016-03-28
 */
@Service
public class CodeTableServiceImpl extends BaseServiceImpl<CodeTableDao,CodeTable> implements CodeTableService
{

	/**
	 * @Description: 租户状态
	 * @return
	 * @throws Exception
	 * @date 2016年3月29日 
	 * @author 1936
	 */
	@Override
	public List<CodeTable> doGetTenantStatusList() throws Exception {
		return genDao.selectTenantStatusList();
	}

	/**
	 * @Description: 租户类型
	 * @return
	 * @throws Exception
	 * @date 2016年3月29日 
	 * @author 1936
	 */
	@Override
	public List<CodeTable> doGetTenantTypeList() throws Exception {
		return genDao.selectTenantTypeList();
	}

	/**
	 * @Description: 营业年限
	 * @return
	 * @throws Exception
	 * @date 2016年3月29日 
	 * @author 1936
	 */
	@Override
	public List<CodeTable> doGetBusinessDurationList() throws Exception {
		return genDao.selectBusinessDurationList();
	}

	/**
	 * @Description: 企业规模
	 * @return
	 * @throws Exception
	 * @date 2016年3月29日 
	 * @author 1936
	 */
	@Override
	public List<CodeTable> doGetEnterpriseScaleList() throws Exception {
		return genDao.selectEnterpriseScaleList();
	}

	/**
	 * @Description: 国家
	 * @return
	 * @throws Exception
	 * @date 2016年3月29日 
	 * @author 1936
	 */
	@Override
	public List<CodeTable> doGetCountyList() throws Exception {
		return genDao.selectCountyList();
	}

	/**
	 * @Description: 省份
	 * @return
	 * @throws Exception
	 * @date 2016年3月29日 
	 * @author 1936
	 */
	@Override
	public List<CodeTable> doGetProvinceList() throws Exception {
		return genDao.selectProvinceList();
	}

	/**
	 * @Description: 城市
	 * @return
	 * @throws Exception
	 * @date 2016年3月29日 
	 * @author 1936
	 */
	@Override
	public List<CodeTable> doGetCityList() throws Exception {
		return genDao.selectCityList();
	}
	

}
