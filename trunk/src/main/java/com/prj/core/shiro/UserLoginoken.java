package com.prj.core.shiro;

import java.math.BigDecimal;

import org.apache.shiro.authc.UsernamePasswordToken;


/** 
 * 描述: 扩展用户凭证<br>
 * @author 胡义振
 * @date 2013-6-7  
 */
public class UserLoginoken  extends UsernamePasswordToken
{
	private static final long	serialVersionUID	= 6461485690257267152L;
	
	//用户要实现登录的接口
	private UserLoginInterface userLoginInterface; 
	
	private BigDecimal userId;

	public UserLoginoken() {
		super();
	}
	
	public UserLoginoken(String paramUserName, String paramPassword){
		super(paramUserName, paramPassword);
	}
	
	public UserLoginoken(String paramUserName, String paramPassword,UserLoginInterface paramUserLoginInterface){
		super(paramUserName, paramPassword);
		this.userLoginInterface = paramUserLoginInterface;
	}

	public UserLoginInterface getUserLoginInterface()
	{
		return userLoginInterface;
	}

	public void setUserLoginInterface(UserLoginInterface userLoginInterface)
	{
		this.userLoginInterface = userLoginInterface;
	}

	public BigDecimal getUserId()
	{
		return userId;
	}

	public void setUserId(BigDecimal userId)
	{
		this.userId = userId;
	}

	

}
