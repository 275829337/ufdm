package tutorial.shiro;

import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.permission.PermissionResolver;
import org.apache.shiro.authz.permission.WildcardPermission;

/** 
* @Description: PermissionResolver 用于解析权限字符串到Permission实例
* BitAndWildPermissionResolver 实现了 PermissionResolver 接口，并根据权限字符串是否以“+”开头来解析权限字符串为BitPermission或WildcardPermission。
* @date 2016年7月21日 
* @author 1936
*/
public class BitAndWildPermissionResolver implements PermissionResolver {
		
	@Override  
    public Permission resolvePermission(String permissionString) {  
        if(permissionString.startsWith("+")) {
            return new BitPermission(permissionString);
        }  
        return new WildcardPermission(permissionString);
    }  

}
