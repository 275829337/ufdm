package com.prj.core.shiro;

import java.io.Serializable;

/** 
 * 描述: 登录结果信息<br>
 * @author 胡义振
 * @date 2013-6-25  
 */
public class LoginResult implements Serializable 
{
	private static final long	serialVersionUID	= 7799392275294182333L;
	
    //登录成功返回的用户ID
    private String userId;
    //登录成功返回用户对象
    private Object userObject;  

	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}

	public Object getUserObject()
	{
		return userObject;
	}
	public void setUserObject(Object userObject)
	{
		this.userObject = userObject;
	}
	
	@Override
	public String toString() {
		return "LoginResult [userId=" + userId + ", userObject=" + userObject
				+ "]";
	}

}
