package com.prj.biz.action.sysuser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.prj.biz.action._base.BaseAction;
import com.prj.biz.bean.permission.PerResource;
import com.prj.biz.bean.permission.PerRole;
import com.prj.biz.bean.sysuser.SysUser;
import com.prj.biz.enums.RespMessEnum;
import com.prj.biz.service.permission.PerResourceService;
import com.prj.biz.service.permission.PerRoleService;
import com.prj.biz.service.sysuser.SysUserService;
import com.prj.core.bean.exp.UfdmException;
import com.prj.core.bean.resp.RespBean;
import com.prj.core.constant.SysConstants;
import com.prj.core.shiro.LoginResult;
import com.prj.core.shiro.UserLoginInterface;
import com.prj.core.shiro.UserLoginToken;
import com.prj.utils.UfdmCookieUtil;
import com.prj.utils.UfdmMd5Util;
import com.prj.utils.UfdmRegexUtil;

import net.sf.json.JSONArray;

/**
 * 描述: 系统用户ACTION<br>
 * @author 胡义振
 */
@Controller
@RequestMapping("sysuser/account")
public class SysUserAccountAction extends BaseAction
{
	private static final long serialVersionUID = 3304353109246337608L;
	@Resource
	private SysUserService  sysUserService;
	@Resource
	private PerRoleService perRoleService;
	@Resource
	private PerResourceService   perResourceService;
	
	private Logger dataLogger = Logger.getLogger("dataLogFile");
	
	/**
	 * 描述: 进入用户登陆页面
	 * @auther 胡义振
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("doEnSysUserLogin")
	public ModelAndView doEnSysUserLogin() throws Exception
	{
		Subject currentUser = SecurityUtils.getSubject();
		
		System.out.println("isRemebered："+currentUser.isRemembered());
		System.out.println("isAuthenticated："+currentUser.isAuthenticated());
		System.out.println("getPrincipal："+currentUser.getPrincipal());
		
		if(currentUser.isAuthenticated() || currentUser.isRemembered()){
			return new ModelAndView("/common/loginSuccess");
		}
		
		return new ModelAndView("/sysuser/sysUserLogin");
	}
	
	@RequestMapping("doEnSysUserLoginSuccess")
	public ModelAndView doEnSysUserLoginSuccess() throws Exception
	{
		

		
		return new ModelAndView("/common/loginSuccess");
	}
	
	/**
	 * 描述: 用户登录
	 * @auther 胡义振
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("doSysUserLogin")
	@ResponseBody
	public RespBean<String> doSysUserLoginAction(HttpServletResponse response,SysUser sysUser) throws Exception
	{
		dataLogger.info("开始登录："+sysUser);
		
		RespBean<String> respBean = new RespBean<String>();
		if (sysUser == null || sysUser.getLoginName()==null || "".equals(sysUser.getLoginName()))	{			
			throw new UfdmException(RespMessEnum.RESP_CODE_0001000.getRespCode());
		}
		if (sysUser == null || sysUser.getLoginPass()==null || "".equals(sysUser.getLoginPass()))	{			
			throw new UfdmException(RespMessEnum.RESP_CODE_0001001.getRespCode());
		}
		// 登录
		sysUser.setLoginPass(UfdmMd5Util.MD5Encode(sysUser.getLoginPass()));
		final SysUser loginSysUser = sysUserService.doGetSysUserForLogin(sysUser);
		if (loginSysUser == null || loginSysUser.getId()==null || "".equals(loginSysUser.getId()))	{			
			throw new UfdmException(RespMessEnum.RESP_CODE_0001002.getRespCode());
		}
		
		String originPass = sysUser.getLoginPass(); 
		UserLoginToken token = new UserLoginToken(
			sysUser.getLoginName(),
			UfdmMd5Util.MD5Encode(sysUser.getLoginPass()),
			new UserLoginInterface(){
				@Override
				public LoginResult doCallLogin() throws Exception{
					List<PerRole> hxRoleList = perRoleService.doGetRoleListByUserId(loginSysUser.getId());
					//设置用户角色ID
					String hxRoleIds = "";
					if(hxRoleList!=null){
						for(PerRole hxRole: hxRoleList){
							hxRoleIds = hxRoleIds + "," + hxRole.getId();
						}
						loginSysUser.setHxRoleIds(hxRoleIds);
					}
					//设置用户角色对象
					loginSysUser.setHxRoleList(hxRoleList);
					LoginResult loginResult = new LoginResult();
					List<PerResource> menuList = sysUserService.doGetHxResourceForMenuList(perResourceService.doGetResourceMenuListByUserId(loginSysUser.getId()));
					loginSysUser.setHxResourceMenuList(menuList);
					loginSysUser.setHxResourceMenuListJson(JSONArray.fromObject(menuList));
					loginResult.setUserId(loginSysUser.getId());
					loginResult.setUserObject(loginSysUser);
					return loginResult;
				}
		    }
		);
		
		try
		{
			
			Subject currentUser = SecurityUtils.getSubject();
			token.setRememberMe(true);
			currentUser.login(token);
			
			System.out.println("isRemebered："+currentUser.isRemembered());
			System.out.println("isAuthenticated："+currentUser.isAuthenticated());
			System.out.println("getPrincipal："+currentUser.getPrincipal());
			
			System.out.println("\n**************************登陆成功******************************");
			
			Session session = currentUser.getSession();
			session.setAttribute(SysConstants.SESSION_SYS_USER, (SysUser) ((LoginResult) currentUser.getPrincipal()).getUserObject());
		}
		catch(Exception er){
			
			System.out.println("\n******login 出现异常*****************");
			
			er.printStackTrace();
			
		}
		
		//doSetSession(SysConstants.SESSION_SYS_USER, (SysUser) ((LoginResult) currentUser.getPrincipal()).getUserObject());
		//if(sysUser.getRemainPass()){ 
			//UfdmCookieUtil.addCookie(response, "loginName", sysUser.getLoginName(), 60*60*24*365);
			//UfdmCookieUtil.addCookie(response, "loginPass", originPass, 60*60*24*365);
		//}
		respBean.setBody("登录成功");
		return respBean;
	}

	/**
	 * 描述: 进入用户修改密码
	 * @auther 胡义振
	 * @date 2014-01-09
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("doEnEditSysUserPass")
	public ModelAndView doEnEditSysUserPassAction() throws Exception
	{
		SysUser sessionSysUser = (SysUser) doGetSession(SysConstants.SESSION_SYS_USER); 
		SysUser sysUser = sysUserService.doGetById(sessionSysUser.getId());
		Map<String,SysUser> model=new HashMap<String,SysUser>();
		model.put("sysUser", sysUser);
		return new ModelAndView("/userCenter/editSysUserPass", model);
	}
	
	/**
	 * 描述: 修改密码
	 * @auther 胡义振
	 * @date 2014-01-09
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("doEditSysUserPass")
	@ResponseBody
	public RespBean<String> doEditSysUserPassAction(SysUser sysUser) throws Exception
	{
		RespBean<String> resp=new RespBean<String>();
		SysUser currSysUser = sysUserService.doGetById(((SysUser) doGetSession(SysConstants.SESSION_SYS_USER)).getId());
		if (sysUser == null || sysUser.getOldLoginPass()==null || !currSysUser.getLoginPass().equals(UfdmMd5Util.MD5Encode(sysUser.getOldLoginPass()))){			
			//原密码不符
			throw new UfdmException(RespMessEnum.RESP_CODE_0001004.getRespCode());
		}
		if(sysUser == null || sysUser.getLoginPass()==null||!UfdmRegexUtil.isPwd(sysUser.getLoginPass())){
			//密码格式错误
			throw new UfdmException(RespMessEnum.RESP_CODE_0001006.getRespCode());
		}else{
			if(sysUser.getRepeatLoginPass()==null||!sysUser.getRepeatLoginPass().equals(sysUser.getLoginPass())){
				//新密码与确认密码不一致
				throw new UfdmException(RespMessEnum.RESP_CODE_0001005.getRespCode());
			}
		}
		currSysUser.setLoginPass(UfdmMd5Util.MD5Encode(sysUser.getLoginPass()));
		sysUserService.doModById(currSysUser);
		resp.setBody("修改成功！");
		return resp;
	}
	

	/**
	 * 描述: 退出登录
	 * @auther 胡义振
	 * @date 2014-1-14 
	 * @throws Exception
	 */
	@RequestMapping("doSysUserLogout")
	public ModelAndView doSysUserLogout() throws Exception{ 
		//doRemoveSession(SysConstants.SESSION_SYS_USER);
		return new ModelAndView("/sysuser/sysUserLogin");
	}

}
