package tutorial.shiro;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.Permission;

/** 
* @Description: 
* BitPermission 用于实现位移方式的权限，如规则是：
* 权限字符串格式：+资源字符串+权限位+实例ID；以+开头中间通过+分割；
* 权限：0 表示所有权限；1 新增（二进制：0001）、2 修改（二进制：0010）、4 删除（二进制：0100）、8 查看（二进制：1000）；如 +user+10 表示对资源user拥有修改/查看权限。
* @date 2016年7月21日 
* @author 1936
*/
public class BitPermission implements Permission {

	private String resourceIdentify;  
    private int permissionBit;  
    private String instanceId;  
    
    public BitPermission(String permissionString) {  
    	
    	System.out.println("\n permissionString:"+permissionString);
    	
        String[] array = permissionString.split("\\+");  
        if(array.length > 1) {  
            resourceIdentify = array[1];  
        }  
        if(StringUtils.isEmpty(resourceIdentify)) {  
            resourceIdentify = "*";  
        }  
        if(array.length > 2) {  
            permissionBit = Integer.valueOf(array[2]);  
        }  
        if(array.length > 3) {  
            instanceId = array[3];  
        }  
        if(StringUtils.isEmpty(instanceId)) {  
            instanceId = "*";  
        }  
        
        System.out.println("\n resourceIdentify:"+resourceIdentify);
        System.out.println("\n permissionBit:"+permissionBit);
        System.out.println("\n instanceId:"+instanceId);
    }  
  
    // Permission 接口提供了boolean implies(Permission p) 方法用于判断权限匹配的；
    @Override  
    public boolean implies(Permission p) {  
        if(!(p instanceof BitPermission)) {  
            return false;  
        }  
        BitPermission other = (BitPermission) p;  
        if(!("*".equals(this.resourceIdentify) || this.resourceIdentify.equals(other.resourceIdentify))) {  
            return false;  
        }  
        if(!(this.permissionBit ==0 || (this.permissionBit & other.permissionBit) != 0)) {  
            return false;  
        }  
        if(!("*".equals(this.instanceId) || this.instanceId.equals(other.instanceId))) {  
            return false;  
        }  
        return true;  
    }  

}
