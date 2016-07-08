package com.prj.biz.bean._base;

import java.io.Serializable;

public class BaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;

	public Integer limit;
	
	public Integer offset;

    private String queryBeginDate;
    
    private String queryEndDate;
    
	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public Integer getOffset() {
		return offset;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}

	
	public String getQueryBeginDate() {
		return queryBeginDate;
	}

	public void setQueryBeginDate(String queryBeginDate) {
		this.queryBeginDate = queryBeginDate;
	}

	public String getQueryEndDate() {
		return queryEndDate;
	}

	public void setQueryEndDate(String queryEndDate) {
		this.queryEndDate = queryEndDate;
	}

	@Override
	public String toString() {
		return "BaseEntity [limit=" + limit + ", offset=" + offset + ", queryBeginDate=" + queryBeginDate
				+ ", queryEndDate=" + queryEndDate + "]";
	}
	
	
	
}
