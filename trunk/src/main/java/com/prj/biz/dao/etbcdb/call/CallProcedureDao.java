package com.prj.biz.dao.etbcdb.call;

import java.util.Map;

import com.prj.biz.dao._base.BaseDao;

/**
 * 描述: 租户 Dao 接口<br>
 * @author 1936
 * @date 2016-03-23
 */
public interface CallProcedureDao extends BaseDao<CallProcedure>
{
	// 调用ETBC创建账号的存储过程
    public Map<String,Object> callEtbcCreateTrial(Map<String, Object> parms);
}