package com.prj.core.shiro;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.prj.biz.bean.permission.PerRoleResource;
import com.prj.biz.service.permission.PerRoleResourceService;


/** 
 * 描述: 自定义的 Shiro Realm <br>
 * @author 胡义振
 */
public class LoginRealm extends AuthorizingRealm 
{
	//权限资源服务类
	@Resource
	private PerRoleResourceService hxRoleResourceService;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	/** 
	 * 描述: 用户登录
	 * @auther 胡义振
	 * @param token
	 * @return
	 * @throws AuthenticationException 
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException
    {  
	    try
		{
	    	UserLoginoken token = (UserLoginoken) authcToken;
	    	LoginResult loginResult = token.getUserLoginInterface().doCallLogin();
	    	return new SimpleAuthenticationInfo(loginResult,token.getPassword(),getName());
		}
	    catch (Exception e)
	    {
	    	throw new AuthenticationException("登录出现未知错误");
	    }
    }
	
	/** 
	 * 描述: 用户资源控制
	 * @auther 胡义振
	 * @date 2013-6-3 
	 * @param principals
	 * @return 
	 */
	@Override
    protected  AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals)
	{  
		try
		{
			//获取登录信息
			LoginResult loginResult = (LoginResult) principals.fromRealm(getName()).iterator().next();
			//用户ID
			String userId = loginResult.getUserId();
			//用户角色
		    Set<String> roleNames = new HashSet<String>();
		    //操作权限
		    Set<String> permissions = new HashSet<String>();

			PerRoleResource tmplRoleResource = new PerRoleResource();
			tmplRoleResource.setUserId(userId);
			
			List<PerRoleResource>  hxRoleResourceList = hxRoleResourceService.doGetList(tmplRoleResource);
			if(hxRoleResourceList!=null){
			    for(PerRoleResource hxRoleRes:hxRoleResourceList){
			    	if(hxRoleRes!=null && hxRoleRes.getResourceUrl()!=null && hxRoleRes.getResourceUrl().indexOf("/")!=-1){
				    	roleNames.add(hxRoleRes.getRoleName());
				    	permissions.add(hxRoleRes.getResourceUrl());
			    	}
			    }
			}
	        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roleNames);
		    info.setStringPermissions(permissions);
		    return info;
		}
		catch (Exception paramExp)
		{
			paramExp.printStackTrace();
			logger.info("load user permissions exception: "+paramExp);
			return null;
		}

    }  


}
