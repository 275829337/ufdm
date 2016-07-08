package com.prj.biz.bean.codetable;

import com.prj.biz.bean._base.BaseEntity;
import java.math.BigDecimal;

/** 
 * 描述: 租户状态 实体类<br>
 * @author 1936
 * @date 2016-03-28
 * 
 */
public class TenantStatus extends BaseEntity  
{

    private static final long	serialVersionUID	= 1L;

    // 主键
    private BigDecimal id;
    // 状态
    private String desc;


    public BigDecimal getId() {
        return id;
    }
    public void setId(BigDecimal id) {
        this.id = id;
    }


    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
	@Override
	public String toString() {
		return "TenantStatus [id=" + id + ", desc=" + desc + "]";
	}
    
    

}
