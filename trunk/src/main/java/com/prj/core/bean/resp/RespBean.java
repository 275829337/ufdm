package com.prj.core.bean.resp;

import com.prj.biz.enums.RespMessEnum;

/** 
* @Description: 请求响应Bean
* @date 2016年1月11日 
* @author 1936
*/
public class RespBean<T> {

	// 响应头文件
	private RespBeanHead head;
	// 响应正确内容
	private T body;
	
	public RespBean(){
		head = new RespBeanHead();
		head.setRespCode(RespMessEnum.RESP_CODE_000000.getRespCode());
		head.setRespContent(RespMessEnum.RESP_CODE_000000.getRespContent());
	}

	public RespBeanHead getHead() {
		return head;
	}

	public void setHead(RespBeanHead head) {
		this.head = head;
	}

	public T getBody() {
		return body;
	}

	public void setBody(T body) {
		this.body = body;
	}

	@Override
	public String toString() {
		return "RespBean [head=" + head + ", body=" + body + "]";
	}
	
}
