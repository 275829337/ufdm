package tutorial.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.testng.annotations.Test;

/** 
* @Description: TODO
* @date 2016年7月21日 
* @author 1936
*/
public class LoginLogoutTest {

	@Test
	public static void main(String args [] ) { 
		
		String loginName = "bruce";
		String loginPass = "888888";
		// 获取 SecurityManager 工厂，此处使用Ini配置文件初始化 SecurityManager
		Factory<SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro.ini");
		// 得到SecurityManager实例 并绑定给SecurityUtils  
		SecurityManager securityManager = factory.getInstance();
		SecurityUtils.setSecurityManager(securityManager);
		// 得到Subject及创建用户名/密码身份验证Token（即用户身份/凭证）  
		Subject subject = SecurityUtils.getSubject();  
		UsernamePasswordToken token = new UsernamePasswordToken(loginName, loginPass);  
		token.setRememberMe(true);
	    try {  
	    	/** 用户登录  */
	        subject.login(token);
	        
	    	/** 判断是否拥有角色  */
	    	System.out.println("\n 是否拥有 role2 角色："+subject.hasRole("role2"));  
		    
		    /** 判断是否拥有权限,如果无抛出异常 */
	    	System.out.println("\n 是否拥有 user:create 权限：" + subject.isPermitted("menu:dept:update"));
	    	
	        // 通过二进制位的方式表示权限  
	        //System.out.println("\n 是否拥有user1+2 权限：" + subject.isPermitted("+user1+2"));   //新增权限  
	        //System.out.println("\n 是否拥有user1+4 权限：" + subject.isPermitted("+user1+4"));   //没有删除权限
	        //System.out.println("\n 是否拥有user1+8 权限：" + subject.isPermitted("+user1+8"));   //查看权限  
	        //System.out.println("\n 是否拥有user1+10 权限：" + subject.isPermitted("+user2+10")); //新增及查看  
	          
	        // 通过MyRolePermissionResolver解析得到的权限  
	        //System.out.println("\n 是否拥有menu:view 权限：" + subject.isPermitted("menu:view"));
		    
	    } catch (AuthenticationException e) {  
	    	System.out.println("\n 登录失败");
	    }
	    catch (UnauthorizedException e) {  
	    	System.out.println("\n 权限授权异常");
	    }
	    
	    
	    
	    //6、退出  
	    subject.logout();  
	    
	}  

}
