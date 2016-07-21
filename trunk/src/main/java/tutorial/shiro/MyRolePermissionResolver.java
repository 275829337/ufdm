package tutorial.shiro;

import java.util.Arrays;
import java.util.Collection;

import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.permission.RolePermissionResolver;
import org.apache.shiro.authz.permission.WildcardPermission;

/** 
* @Description: RolePermissionResolver用于根据角色字符串来解析得到权限集合
* @date 2016年7月21日 
* @author 1936
*/
public class MyRolePermissionResolver implements RolePermissionResolver{

	@Override
	public Collection<Permission> resolvePermissionsInRole(String roleString) {
		if("role1".equals(roleString)) {  
            return Arrays.asList((Permission)new WildcardPermission("menu:*"));  
        }  
        return null;  
	}

}
