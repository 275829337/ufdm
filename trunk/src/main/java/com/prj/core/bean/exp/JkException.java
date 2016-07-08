package com.prj.core.bean.exp;

/** 
* @Description: 业务异常
* @date 2016年1月11日 
* @author 1936
*/
public class JkException extends Exception{
	
	private static final long serialVersionUID = 1L;  
	  
    public JkException() {  
    	
    }  
  
    public JkException(String message) { 
        super(message);  
    }  
  
    public JkException(Throwable cause) { 
        super(cause);  
    }  
  
    public JkException(String message, Throwable cause) { 
        super(message, cause);  
    }  
}
