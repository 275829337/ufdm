package com.prj.biz.bean.codetable;


import com.prj.biz.bean._base.BaseEntity;

/** 
* @Description: 码表BEAN
* @date 2016年3月29日 
* @author 1936
*/
public class CodeTable extends BaseEntity {
	
	private static final long serialVersionUID = 3860524527373210963L;
	
	// 主键
    private String id;
    // 上级ID
    private String parentId;
    // 编码
    private String code;
    // 描述
    private String description;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
	@Override
	public String toString() {
		return "CodeTable [id=" + id + ", parentId=" + parentId + ", code=" + code + ", description=" + description
				+ "]";
	}

}
