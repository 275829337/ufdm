package org.apache.jsp.WEB_002dINF.views.permission.role;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class perRoleEdit_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  static {
    _jspx_dependants = new java.util.Vector(1);
    _jspx_dependants.add("/WEB-INF/views/common/headCommon.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_spring_url_value_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_varStatus_var_items;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_spring_url_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_forEach_varStatus_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_spring_url_value_nobody.release();
    _jspx_tagPool_c_if_test.release();
    _jspx_tagPool_c_forEach_varStatus_var_items.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write(" \r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("    <title>角色编辑</title>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("\t<meta charset=\"utf-8\">\r\n");
      out.write("\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/>\r\n");
      out.write("\t<link href='");
      if (_jspx_meth_spring_url_0(_jspx_page_context))
        return;
      out.write("' rel=\"stylesheet\">\r\n");
      out.write("\t<link href='");
      if (_jspx_meth_spring_url_1(_jspx_page_context))
        return;
      out.write("' rel=\"stylesheet\">\r\n");
      out.write("\t<!--[if lt IE 9]>\r\n");
      out.write("\t<script src='");
      if (_jspx_meth_spring_url_2(_jspx_page_context))
        return;
      out.write("'></script>\r\n");
      out.write("\t<script src='");
      if (_jspx_meth_spring_url_3(_jspx_page_context))
        return;
      out.write("'></script>\r\n");
      out.write("\t<![endif]-->\r\n");
      out.write("\t<script type=\"text/javascript\" src='");
      if (_jspx_meth_spring_url_4(_jspx_page_context))
        return;
      out.write("'></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src='");
      if (_jspx_meth_spring_url_5(_jspx_page_context))
        return;
      out.write("'></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src='");
      if (_jspx_meth_spring_url_6(_jspx_page_context))
        return;
      out.write("'></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src='");
      if (_jspx_meth_spring_url_7(_jspx_page_context))
        return;
      out.write("'></script>");
      out.write("\r\n");
      out.write("    <link href='");
      if (_jspx_meth_spring_url_8(_jspx_page_context))
        return;
      out.write("' rel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\t<form id=\"submitForm\" class=\"form-horizontal\">\r\n");
      out.write("\t<input type=\"hidden\" id=\"roleId\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${perRole.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" />\r\n");
      out.write("\t<div class=\"form-group\" style=\"margin-top: 15px\">\r\n");
      out.write("\t\t<label class=\"control-label col-sm-2\" for=\"roleName\">角色名称：</label>\r\n");
      out.write("\t\t<div class=\"col-sm-10\"> \r\n");
      out.write("\t\t\t<input type=\"text\" class=\"form-control\" id=\"roleName\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${perRole.roleName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" />\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<label class=\"control-label col-sm-2\" for=\"roleType\">角色类型：</label>\r\n");
      out.write("\t\t<div class=\"col-sm-10\"> \r\n");
      out.write("\t\t\t<select id=\"roleType\" class=\"select form-control\">\r\n");
      out.write("\t\t\t\t<option value=\"0\"\r\n");
      out.write("\t\t\t\t\t");
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write(">系统默认</option>\r\n");
      out.write("\t\t\t\t<option value=\"1\"\r\n");
      out.write("\t\t\t\t\t");
      if (_jspx_meth_c_if_1(_jspx_page_context))
        return;
      out.write(">类型1</option>\r\n");
      out.write("\t\t\t\t<option value=\"2\"\r\n");
      out.write("\t\t\t\t\t");
      if (_jspx_meth_c_if_2(_jspx_page_context))
        return;
      out.write(">类型2</option>\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<label class=\"control-label col-sm-2\" for=\"roleIntroduce\">角色介绍：</label> \r\n");
      out.write("\t\t<div class=\"col-sm-10\"> \r\n");
      out.write("\t\t\t<input type=\"text\" class=\"form-control\" id=\"roleIntroduce\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${perRole.roleIntroduce}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" />\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<label class=\"control-label col-sm-2\" for=\"roleResourceTree\">角色资源：</label>\r\n");
      out.write("\t\t<div class=\"col-sm-10\"> \r\n");
      out.write("\t\t\t<ul id=\"roleResourceTree\" class=\"ztree\"></ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"navbar-btn\">\r\n");
      out.write("\t\t<button type=\"button\" class=\"btn btn-danger col-sm-offset-3\" id=\"cancel\" >关闭</button>\r\n");
      out.write("\t\t<button type=\"button\" class=\"btn btn-success col-sm-offset-1\" id=\"submit\">更新</button>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</form>\r\n");
      out.write("\r\n");
      out.write("    <script type=\"text/javascript\" src='");
      if (_jspx_meth_spring_url_9(_jspx_page_context))
        return;
      out.write("'></script>\r\n");
      out.write("    <script type=\"text/javascript\" src='");
      if (_jspx_meth_spring_url_10(_jspx_page_context))
        return;
      out.write("'></script>\r\n");
      out.write("    <script type=\"text/javascript\" src='");
      if (_jspx_meth_spring_url_11(_jspx_page_context))
        return;
      out.write("'></script>\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\tvar treeObj;\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\t$(\"#cancel\").bind(\"click\",function(){\r\n");
      out.write("\t\t\tcloseWindow(window.name);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\tvar setting = {\r\n");
      out.write("\t\t\tcheck: {\r\n");
      out.write("\t\t\t\tenable: true,\r\n");
      out.write("\t\t\t\tchkStyle: \"checkbox\",\r\n");
      out.write("\t\t\t\tchkboxType: { \"Y\" : \"ps\", \"N\" : \"ps\" },\r\n");
      out.write("\t\t\t\tradioType: \"all\"\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tdata: {\r\n");
      out.write("\t\t\t\tsimpleData: {\r\n");
      out.write("\t\t\t\t\tenable: true\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t};\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar zNodes =[\r\n");
      out.write("\t        ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t];\r\n");
      out.write("\t\t\r\n");
      out.write("\t\ttreeObj = $.fn.zTree.init($(\"#roleResourceTree\"),setting, zNodes);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t// 获取选中ID\r\n");
      out.write("\t\tfunction doGetAllChecked(){\r\n");
      out.write("\t\t\tvar checkedResourceIds;\r\n");
      out.write("\t\t\tvar sNodes =  treeObj.getCheckedNodes(true);\r\n");
      out.write("\t\t\tvar innerHtml = \"\";\r\n");
      out.write("\t\t\tfor(i=0;i<sNodes.length;i++){\r\n");
      out.write("\t\t\t\tif(checkedResourceIds=='' || checkedResourceIds==null){\r\n");
      out.write("\t\t\t\t\tcheckedResourceIds = sNodes[i].id;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\telse{\r\n");
      out.write("\t\t\t\t\tcheckedResourceIds = checkedResourceIds + \",\" +sNodes[i].id;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\treturn checkedResourceIds;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t$(\"#submit\").bind(\"click\",function(){\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\ttype: \"POST\",\r\n");
      out.write("\t\t\t\turl: '");
      if (_jspx_meth_spring_url_12(_jspx_page_context))
        return;
      out.write("',\r\n");
      out.write("\t\t\t\tdata:{\r\n");
      out.write("\t\t\t\t\tid:$(\"#roleId\").val(),\r\n");
      out.write("\t\t\t\t\troleName:$(\"#roleName\").val(),\r\n");
      out.write("\t\t\t\t\troleType:$(\"#roleType\").val(),\r\n");
      out.write("\t\t\t\t\troleIntroduce:$(\"#roleIntroduce\").val(),\r\n");
      out.write("\t\t\t\t\tperResourceIds: doGetAllChecked()\r\n");
      out.write("\t\t\t\t},\r\n");
      out.write("\t\t\t\tdataType: \"json\",\r\n");
      out.write("\t\t\t\tasync: false,\r\n");
      out.write("\t\t\t\tsuccess: function(data){\r\n");
      out.write("\t\t\t\t\tif(\"0000000\"==data.head.respCode){\r\n");
      out.write("\t\t\t\t\t\t//关闭\r\n");
      out.write("\t\t\t\t\t\tparent.window.contFrame.window.beCalled(data);\r\n");
      out.write("\t \t\t\t\t\tcloseWindow(window.name);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\telse{\r\n");
      out.write("\t\t\t\t\t\talert(\"编辑失败\");\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t});\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("\t</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_spring_url_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_0 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_0.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_0.setParent(null);
    _jspx_th_spring_url_0.setValue("/css/_base/bootstrap.min.css");
    int[] _jspx_push_body_count_spring_url_0 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_0 = _jspx_th_spring_url_0.doStartTag();
      if (_jspx_th_spring_url_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_0.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_0);
    }
    return false;
  }

  private boolean _jspx_meth_spring_url_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_1 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_1.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_1.setParent(null);
    _jspx_th_spring_url_1.setValue("/css/common/common.css");
    int[] _jspx_push_body_count_spring_url_1 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_1 = _jspx_th_spring_url_1.doStartTag();
      if (_jspx_th_spring_url_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_1[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_1.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_1.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_1);
    }
    return false;
  }

  private boolean _jspx_meth_spring_url_2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_2 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_2.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_2.setParent(null);
    _jspx_th_spring_url_2.setValue("/js/common/html5shim.js");
    int[] _jspx_push_body_count_spring_url_2 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_2 = _jspx_th_spring_url_2.doStartTag();
      if (_jspx_th_spring_url_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_2[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_2.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_2.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_2);
    }
    return false;
  }

  private boolean _jspx_meth_spring_url_3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_3 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_3.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_3.setParent(null);
    _jspx_th_spring_url_3.setValue("/js/common/respond.js");
    int[] _jspx_push_body_count_spring_url_3 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_3 = _jspx_th_spring_url_3.doStartTag();
      if (_jspx_th_spring_url_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_3[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_3.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_3.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_3);
    }
    return false;
  }

  private boolean _jspx_meth_spring_url_4(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_4 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_4.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_4.setParent(null);
    _jspx_th_spring_url_4.setValue("/js/_base/jquery-1.12.1.min.js");
    int[] _jspx_push_body_count_spring_url_4 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_4 = _jspx_th_spring_url_4.doStartTag();
      if (_jspx_th_spring_url_4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_4[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_4.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_4.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_4);
    }
    return false;
  }

  private boolean _jspx_meth_spring_url_5(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_5 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_5.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_5.setParent(null);
    _jspx_th_spring_url_5.setValue("/js/_base/bootstrap.min.3.3.5.js");
    int[] _jspx_push_body_count_spring_url_5 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_5 = _jspx_th_spring_url_5.doStartTag();
      if (_jspx_th_spring_url_5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_5[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_5.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_5.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_5);
    }
    return false;
  }

  private boolean _jspx_meth_spring_url_6(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_6 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_6.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_6.setParent(null);
    _jspx_th_spring_url_6.setValue("/js/plugin/layer/layer.js");
    int[] _jspx_push_body_count_spring_url_6 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_6 = _jspx_th_spring_url_6.doStartTag();
      if (_jspx_th_spring_url_6.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_6[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_6.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_6.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_6);
    }
    return false;
  }

  private boolean _jspx_meth_spring_url_7(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_7 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_7.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_7.setParent(null);
    _jspx_th_spring_url_7.setValue("/js/common/common.js");
    int[] _jspx_push_body_count_spring_url_7 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_7 = _jspx_th_spring_url_7.doStartTag();
      if (_jspx_th_spring_url_7.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_7[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_7.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_7.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_7);
    }
    return false;
  }

  private boolean _jspx_meth_spring_url_8(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_8 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_8.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_8.setParent(null);
    _jspx_th_spring_url_8.setValue("/js/plugin/zTree/zTreeStyle/zTreeStyle.css");
    int[] _jspx_push_body_count_spring_url_8 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_8 = _jspx_th_spring_url_8.doStartTag();
      if (_jspx_th_spring_url_8.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_8[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_8.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_8.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_8);
    }
    return false;
  }

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${perRole.roleType==\"0\"}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("selected");
        int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
    return false;
  }

  private boolean _jspx_meth_c_if_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_1.setPageContext(_jspx_page_context);
    _jspx_th_c_if_1.setParent(null);
    _jspx_th_c_if_1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${perRole.roleType==\"1\"}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_1 = _jspx_th_c_if_1.doStartTag();
    if (_jspx_eval_c_if_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("selected");
        int evalDoAfterBody = _jspx_th_c_if_1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
    return false;
  }

  private boolean _jspx_meth_c_if_2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_2 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_2.setPageContext(_jspx_page_context);
    _jspx_th_c_if_2.setParent(null);
    _jspx_th_c_if_2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${perRole.roleType==\"2\"}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_2 = _jspx_th_c_if_2.doStartTag();
    if (_jspx_eval_c_if_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("selected");
        int evalDoAfterBody = _jspx_th_c_if_2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_2);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_2);
    return false;
  }

  private boolean _jspx_meth_spring_url_9(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_9 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_9.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_9.setParent(null);
    _jspx_th_spring_url_9.setValue("/js/plugin/zTree/jquery.ztree.core.min.3.5.2.js");
    int[] _jspx_push_body_count_spring_url_9 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_9 = _jspx_th_spring_url_9.doStartTag();
      if (_jspx_th_spring_url_9.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_9[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_9.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_9.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_9);
    }
    return false;
  }

  private boolean _jspx_meth_spring_url_10(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_10 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_10.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_10.setParent(null);
    _jspx_th_spring_url_10.setValue("/js/plugin/zTree/jquery.ztree.excheck.min.3.5.2.js");
    int[] _jspx_push_body_count_spring_url_10 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_10 = _jspx_th_spring_url_10.doStartTag();
      if (_jspx_th_spring_url_10.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_10[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_10.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_10.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_10);
    }
    return false;
  }

  private boolean _jspx_meth_spring_url_11(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_11 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_11.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_11.setParent(null);
    _jspx_th_spring_url_11.setValue("/js/common/common.js");
    int[] _jspx_push_body_count_spring_url_11 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_11 = _jspx_th_spring_url_11.doStartTag();
      if (_jspx_th_spring_url_11.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_11[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_11.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_11.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_11);
    }
    return false;
  }

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_varStatus_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setVar("item");
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${perRole.perResourceList}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_0.setVarStatus("st");
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("     \r\n");
          out.write("\t\t\t{ \r\n");
          out.write("\t\t\t\tid : \"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${item.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\", \r\n");
          out.write("\t\t\t\tpId : \"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${item.parentId}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\", \r\n");
          out.write("\t\t\t\tname: \"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${item.resName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          if (_jspx_meth_c_if_3((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_forEach_0, _jspx_page_context, _jspx_push_body_count_c_forEach_0))
            return true;
          out.write("\", \r\n");
          out.write("\t\t\t\tchecked: ");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${item.roleOwner}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write(",\r\n");
          out.write("\t\t\t\topen:true\r\n");
          out.write("\t\t\t},\r\n");
          out.write("\t\t\t");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_varStatus_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }

  private boolean _jspx_meth_c_if_3(javax.servlet.jsp.tagext.JspTag _jspx_th_c_forEach_0, PageContext _jspx_page_context, int[] _jspx_push_body_count_c_forEach_0)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_3 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_3.setPageContext(_jspx_page_context);
    _jspx_th_c_if_3.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_forEach_0);
    _jspx_th_c_if_3.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${item.menuFlag==0}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_3 = _jspx_th_c_if_3.doStartTag();
    if (_jspx_eval_c_if_3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("[菜单]");
        int evalDoAfterBody = _jspx_th_c_if_3.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_3);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_3);
    return false;
  }

  private boolean _jspx_meth_spring_url_12(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_12 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_12.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_12.setParent(null);
    _jspx_th_spring_url_12.setValue("/role/doEditRole");
    int[] _jspx_push_body_count_spring_url_12 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_12 = _jspx_th_spring_url_12.doStartTag();
      if (_jspx_th_spring_url_12.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_12[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_12.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_12.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_12);
    }
    return false;
  }
}
