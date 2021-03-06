package com.prj.biz.enums;

/** 
* @Description: 请求响应编码
* @date 2016年1月11日 
* @author 1936
*/
public enum RespMessEnum {

	
	RESP_CODE_000000("0000000","执行成功"),
	RESP_CODE_999999("9999990","系统异常"),
	
	/* 用户登陆模块（系统内部（两位：00）+ 用户模块（两位：01）+ 错误编号（三位））*/
	RESP_CODE_0001000("0001000","登录名为空"),
	RESP_CODE_0001001("0001001","登录密码为空"),
	RESP_CODE_0001002("0001002","错误的用户名密码"),
	RESP_CODE_0001003("0001003","用户名已存在"),
	
	/* 用户密码修改模块（系统内部（两位：00）+ 用户模块（两位：01）+ 错误编号（三位））*/
	RESP_CODE_0001004("0001004","原密码不匹配"),
	RESP_CODE_0001005("0001005","新密码与确认密码不一致"),
	RESP_CODE_0001006("0001006","数据格式应为6-20位数字"),

	RESP_CODE_100103("100300","异常1003");
	
	private String respCode;
	private String respContent;
	
	
	RespMessEnum(String code,String content){
		respCode = code;
		respContent = content;
	}


	public String getRespCode() {
		return respCode;
	}


	public void setRespCode(String respCode) {
		this.respCode = respCode;
	}


	public String getRespContent() {
		return respContent;
	}


	public void setRespContent(String respContent) {
		this.respContent = respContent;
	}

	

}
