package com.prj.core.shiro;


/** 
 * 描述: 业务系统实现的登录接口<br>
 * @author 胡义振
 */
public interface UserLoginInterface
{
	/**
	 * 描述: 登录操作
	 * @auther 胡义振
	 * @return 用户ID
	 */
	public LoginResult doCallLogin() throws Exception;
    
}
