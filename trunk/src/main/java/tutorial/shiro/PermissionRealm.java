/** 
* @Description: TODO
* @date 2016年7月21日 
* @author 1936
*/
package tutorial.shiro;

import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

/** 
* @Description: TODO
* @date 2016年7月21日 
* @author 1936
*/
public class PermissionRealm extends AuthorizingRealm {
	
	@Override
	public String getName() {
		return "permissionRealm";  
	}
	
	@Override  
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {  
		
		System.out.println("\n 授权");
		
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();  
        authorizationInfo.addRole("role1");
        authorizationInfo.addRole("role2");
        //authorizationInfo.addObjectPermission(new BitPermission("+user1+10"));
        //authorizationInfo.addObjectPermission(new WildcardPermission("user1:*"));
        //authorizationInfo.addStringPermission("+user2+10");
        //authorizationInfo.addStringPermission("user2:*");
        return authorizationInfo;  
    }

	
    @Override  
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {  
		String username = (String)token.getPrincipal();
        String password = new String((char[])token.getCredentials());
        if("bruce".equals(username) && "888888".equals(password)) {  
            return new SimpleAuthenticationInfo(username, password, getName()); 
        } 
        else{
        	throw new AccountException("用户名、密码错误！"); 
        }
    }  
}
