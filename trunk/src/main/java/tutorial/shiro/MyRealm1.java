package tutorial.shiro;

import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.realm.Realm;

/** 
* @Description: TODO
* @date 2016年7月21日 
* @author 1936
*/
public class MyRealm1 implements Realm {

	@Override
	public String getName() {
		return "myrealm1";  
	}

	@Override
	public boolean supports(AuthenticationToken token) {
		return token instanceof UsernamePasswordToken;
	}

	@Override
	public AuthenticationInfo getAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = (String)token.getPrincipal();  //得到用户名  
        String password = new String((char[])token.getCredentials()); //得到密码  
        
        System.out.println("\n username:"+username);
        System.out.println("\n password:"+password);
        
        if("zhang".equals(username) && "123".equals(password)) {  
            return new SimpleAuthenticationInfo(username, password, getName()); 
        } 
        else{
        	throw new AccountException(); 
        }

	}

}
