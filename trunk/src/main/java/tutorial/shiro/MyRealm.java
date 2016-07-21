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
import org.apache.shiro.authz.permission.WildcardPermission;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

/** 
* @Description: TODO
* @date 2016年7月21日 
* @author 1936
*/
public class MyRealm extends AuthorizingRealm {
	
	@Override
	public String getName() {
		return "myrealm";  
	}
	
	@Override  
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {  
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();  
        authorizationInfo.addRole("role1");  
        authorizationInfo.addRole("role2");  
        authorizationInfo.addObjectPermission(new BitPermission("+user1+10"));  
        authorizationInfo.addObjectPermission(new WildcardPermission("user1:*"));  
        authorizationInfo.addStringPermission("+user2+10");  
        authorizationInfo.addStringPermission("user2:*");  
        return authorizationInfo;  
    }  
	
    @Override  
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {  
		String username = (String)token.getPrincipal();  //得到用户名  
        String password = new String((char[])token.getCredentials()); //得到密码  
        
        System.out.println("\n username:"+username);
        System.out.println("\n password:"+password);
        
        if("bruce".equals(username) && "123456".equals(password)) {  
            return new SimpleAuthenticationInfo(username, password, getName()); 
        } 
        else{
        	throw new AccountException(); 
        }
    }  
}
