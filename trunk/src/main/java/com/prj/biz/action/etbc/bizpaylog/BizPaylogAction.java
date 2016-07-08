package com.prj.biz.action.etbc.bizpaylog;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.prj.biz.action._base.BaseAction;
import com.prj.biz.bean.etbc.BizPaylog;
import com.prj.biz.service.etbc.BizPaylogService;
import com.prj.core.bean.resp.RespBean;
import com.prj.core.bean.resp.RespPagination;

/** 
* @Description: 支付记录
* @date 2016年3月23日 
* @author 1936
*/
@Controller
@RequestMapping("/etbc")
public class BizPaylogAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private BizPaylogService bizPaylogService;
	
	@RequestMapping("/paylog/doEnBizPayLogList")
	public ModelAndView doEnBizPayLogList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		return new ModelAndView("/etbc/bizpaylog/bizPayLogList");
	}
	
	/**
	 * @Description: 查询用户
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 * @date 2016年3月11日 
	 * @author 1936
	 */
	@RequestMapping("/paylog/doReadBizPayLogList")
	@ResponseBody
	public RespBean<RespPagination<BizPaylog>> doReadBizPayLogList(BizPaylog bizPaylog) throws Exception{
		RespBean<RespPagination<BizPaylog>> respBean = new RespBean<RespPagination<BizPaylog>>();
		RespPagination<BizPaylog> respPagination = new RespPagination<BizPaylog>();
		Integer total = bizPaylogService.doGetTotal(bizPaylog);
		List<BizPaylog> rowsList = bizPaylogService.doGetList(bizPaylog);
		respPagination.setTotal(total);
		respPagination.setRows(rowsList);
		respBean.setBody(respPagination);
		return respBean;
	}
	
}
