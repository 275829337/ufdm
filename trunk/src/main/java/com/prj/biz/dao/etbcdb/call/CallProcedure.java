package com.prj.biz.dao.etbcdb.call;

/** 
* @Description: 存储过程参数
* @date 2016年4月20日 
* @author 1936
*/
public class CallProcedure {

	private String inputParam;
	private String outParam;
	
	public String getInputParam() {
		return inputParam;
	}
	
	public void setInputParam(String inputParam) {
		this.inputParam = inputParam;
	}
	
	public String getOutParam() {
		return outParam;
	}
	
	public void setOutParam(String outParam) {
		this.outParam = outParam;
	}
	
	@Override
	public String toString() {
		return "CallProcedure [inputParam=" + inputParam + ", outParam=" + outParam + "]";
	}
	
	
}
