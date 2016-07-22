package tutorial.shiro;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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
		System.out.println("\n 添加角色 role:"+roleString);
		List<Permission> listPermission = new ArrayList<Permission>();
		if("role1".equals(roleString)) {
		    Permission p1 = (Permission)new WildcardPermission("menu:user:*");
		    Permission p2 = (Permission)new WildcardPermission("menu:dept:create");
		    listPermission.add(p1);
		    listPermission.add(p2);
        }  
        return listPermission;  
	}

}
