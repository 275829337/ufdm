package org.apache.jsp.WEB_002dINF.views.permission.role;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class perRoleList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  static {
    _jspx_dependants = new java.util.Vector(1);
    _jspx_dependants.add("/WEB-INF/views/common/headCommon.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_spring_url_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_spring_url_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_spring_url_value_nobody.release();
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
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("    <title>权限-角色管理</title>\r\n");
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
      out.write("' rel=\"stylesheet\"/>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div id=\"mainContent\">\r\n");
      out.write("\t\t<div style=\"margin-bottom: 1%;\">\r\n");
      out.write("\t\t\t<button id=\"btn_add\"    type=\"submit\" class=\"btn btn-default\">\r\n");
      out.write("\t\t\t\t<span class=\"glyphicon glyphicon-plus\" aria-hidden=\"true\"></span>添加\r\n");
      out.write("\t\t\t</button>\r\n");
      out.write("\t\t\t<button id=\"btn_delete\" type=\"button\" class=\"btn btn-default\">\r\n");
      out.write("\t\t\t\t\t<span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span>删除\r\n");
      out.write("\t\t\t</button>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t    <table id=\"tb_role\"></table>\r\n");
      out.write("\t    \r\n");
      out.write("\t    <!-- 编辑模态框 -->\r\n");
      out.write("\t\t<div id=\"editModal\" class=\"modal fade\" tabindex=\"-1\">\r\n");
      out.write("\t\t\t<div class=\"modal-dialog\">\r\n");
      out.write("\t\t\t\t<div class=\"modal-content\"></div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("    <script type=\"text/javascript\" src='");
      if (_jspx_meth_spring_url_9(_jspx_page_context))
        return;
      out.write("'></script>\r\n");
      out.write("    <script type=\"text/javascript\" src='");
      if (_jspx_meth_spring_url_10(_jspx_page_context))
        return;
      out.write("'></script>\r\n");
      out.write("    \r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t    var $table;\r\n");
      out.write("\t\t$(function() {\r\n");
      out.write("\t\t\tinitTable();\r\n");
      out.write("\t\t\t// 搜索\r\n");
      out.write("\t\t\t$('#btn_query').click(function(){\r\n");
      out.write("\t\t\t\t$('#tb_role').bootstrapTable('refresh');\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\t// 添加\r\n");
      out.write("            $('#btn_add').click(function () {\r\n");
      out.write("            \taddRecord();\r\n");
      out.write("            });\r\n");
      out.write("\t\t\t// 删除\r\n");
      out.write("            $('#btn_delete').click(function () {\r\n");
      out.write("            \tdeleteRecord();\r\n");
      out.write("            });\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t// 初始化表格\r\n");
      out.write("\t\tfunction initTable() {\r\n");
      out.write("            $table = $('#tb_role').bootstrapTable({\r\n");
      out.write("                method: 'get',\r\n");
      out.write("                url : '");
      if (_jspx_meth_spring_url_11(_jspx_page_context))
        return;
      out.write("',\r\n");
      out.write("                pagination: false,\r\n");
      out.write("                sidePagination: \"server\", //服务端请求\r\n");
      out.write("                queryParams: queryParams,\r\n");
      out.write("                responseHandler: responseHandler,\r\n");
      out.write("                columns : [ {\r\n");
      out.write("                \tfield: 'state',\r\n");
      out.write("\t\t\t\t\tcheckbox : true\r\n");
      out.write("\t\t\t\t}, {\r\n");
      out.write("\t\t\t\t\tfield : 'roleName',\r\n");
      out.write("\t\t\t\t\ttitle : '角色名称'\r\n");
      out.write("\t\t\t\t}, {\r\n");
      out.write("\t\t\t\t\tfield : 'roleType',\r\n");
      out.write("\t\t\t\t\ttitle : '角色类型'\r\n");
      out.write("\t\t\t\t}, {\r\n");
      out.write("\t\t\t\t\tfield : 'userNum',\r\n");
      out.write("\t\t\t\t\ttitle : '用户数'\r\n");
      out.write("\t\t\t\t}, {\r\n");
      out.write("\t\t\t\t\tfield : 'roleIntroduce',\r\n");
      out.write("\t\t\t\t\ttitle : '简介'\r\n");
      out.write("\t\t\t\t}, {\r\n");
      out.write("                    title: '操作',\r\n");
      out.write("                    field: 'id',\r\n");
      out.write("                    align: 'center',\r\n");
      out.write("                    formatter:operateFormatter\r\n");
      out.write("                }],\r\n");
      out.write("                onLoadSuccess:function(){\r\n");
      out.write("\r\n");
      out.write("                },\r\n");
      out.write("                onLoadError: function () {\r\n");
      out.write("                    alert(\"数据加载失败！\");\r\n");
      out.write("                }\r\n");
      out.write("            });\r\n");
      out.write("        }\r\n");
      out.write("\t\t// 查询参数设置  \r\n");
      out.write("\t\tfunction queryParams(params) {\r\n");
      out.write("\t\t\tvar guidStr = generateGuid();\r\n");
      out.write("\t\t\tvar temp = {\r\n");
      out.write("\t\t\t\t//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的    \r\n");
      out.write("\t\t\t\tlimit : params.limit, //页面大小    \r\n");
      out.write("\t\t\t\toffset : params.offset, //页码   \r\n");
      out.write("\t\t\t\trealName : $(\"#realName\").val(),\r\n");
      out.write("\t\t\t\tloginName: $(\"#loginName\").val(),\r\n");
      out.write("\t\t\t\tmobile : $(\"#mobile\").val(),\r\n");
      out.write("\t\t\t\tguidStr:guidStr\r\n");
      out.write("\t\t\t};\r\n");
      out.write("\t\t\treturn temp;\r\n");
      out.write("\t\t};\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t// 删除操作\r\n");
      out.write("        function deleteRecord() {\r\n");
      out.write("        \ttop.layer.confirm('确定要删除记录吗?', {icon: 3, title:'注意'}, function(index){\r\n");
      out.write("        \t\ttop.layer.close(index);\r\n");
      out.write("        \t\tvar ids = \"\";\r\n");
      out.write("\t\t\t    var rows = $table.bootstrapTable('getSelections');\r\n");
      out.write("\t\t\t    for (var i = 0; i < rows.length; i++) {\r\n");
      out.write("\t\t\t        ids += rows[i].id + ',';\r\n");
      out.write("\t\t\t    }\r\n");
      out.write("\t\t\t    ids = ids.substring(0, ids.length - 1);\r\n");
      out.write("\t\t\t    if (ids == \"\") {\r\n");
      out.write("\t\t\t    \ttop.layer.alert(\"请选择您要删除的记录！\",{icon:2});\r\n");
      out.write("\t\t\t        return;\r\n");
      out.write("\t\t\t    }\r\n");
      out.write("\t\t\t    $.post('");
      if (_jspx_meth_spring_url_12(_jspx_page_context))
        return;
      out.write("',{\r\n");
      out.write("\t\t\t    \troleIds : ids\r\n");
      out.write("\t\t\t    },function(res,status){\r\n");
      out.write("\t\t\t    \tif(\"0000000\"==res.head.respCode){\r\n");
      out.write("\t\t\t    \t\ttop.layer.msg(\"删除成功!\",{icon:1});\r\n");
      out.write("\t\t\t    \t\t$('#tb_role').bootstrapTable('refresh');\r\n");
      out.write("\t\t\t    \t}\r\n");
      out.write("\t\t\t    },\"json\");\r\n");
      out.write("        \t});\r\n");
      out.write("\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("      //被子页面调用\r\n");
      out.write("\t\tfunction beCalled(data){\r\n");
      out.write("\t\t\t$('#tb_role').bootstrapTable('refresh');\r\n");
      out.write("\t\t\ttop.layer.msg(\"操作成功!\",{icon:1});\r\n");
      out.write("\t\t}\r\n");
      out.write("      \r\n");
      out.write("\t\t// 编辑操作\r\n");
      out.write("\t\tfunction editRecord(index) {\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tvar row=$table.bootstrapTable('getData')[index];\r\n");
      out.write("\t\t\tparent.layer.open({\r\n");
      out.write("\t\t\t\ttitle:\"编辑角色\",\r\n");
      out.write("\t\t\t    type: 2,\r\n");
      out.write("\t\t\t    area: ['800px', '500px'],\r\n");
      out.write("\t\t\t    fix: false, //不固定\r\n");
      out.write("\t\t\t    maxmin: true,\r\n");
      out.write("\t\t\t    content: '");
      if (_jspx_meth_spring_url_13(_jspx_page_context))
        return;
      out.write("'+row.id\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t//添加操作\r\n");
      out.write("\t\tfunction addRecord(){\r\n");
      out.write("\t\t\tparent.layer.open({\r\n");
      out.write("\t\t\t\ttitle:\"添加角色\",\r\n");
      out.write("\t\t\t    type: 2,\r\n");
      out.write("\t\t\t    area: ['800px', '600px'],\r\n");
      out.write("\t\t\t    fix: false, //不固定\r\n");
      out.write("\t\t\t    maxmin: true,\r\n");
      out.write("\t\t\t    content: '");
      if (_jspx_meth_spring_url_14(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t// 操作列格式化\r\n");
      out.write("\t\tfunction operateFormatter(value, row, index) {\r\n");
      out.write("\t\t\tvar e = '<a href=\"#\" mce_href=\"#\" onclick=\"editRecord(\\'' + index\t+ '\\')\">编辑</a> ';\r\n");
      out.write("\t\t\treturn e;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t// json 数据处理\r\n");
      out.write("\t\tfunction responseHandler(res) {\r\n");
      out.write("\t\t\tif (res.body.total > 0) {\r\n");
      out.write("\t\t\t\treturn {\r\n");
      out.write("\t\t\t\t\t\"rows\" : res.body.rows,\r\n");
      out.write("\t\t\t\t\t\"total\" : res.body.total\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\treturn {\r\n");
      out.write("\t\t\t\t\t\"rows\" : [],\r\n");
      out.write("\t\t\t\t\t\"total\" : 0\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>");
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
    _jspx_th_spring_url_8.setValue("/css/plugin/bootstrap-table/bootstrap-table.min.1.10.1.css");
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

  private boolean _jspx_meth_spring_url_9(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_9 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_9.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_9.setParent(null);
    _jspx_th_spring_url_9.setValue("/js/plugin/bootstrap-table-1.10.1/bootstrap-table.min.1.10.1.js");
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
    _jspx_th_spring_url_10.setValue("/js/plugin/bootstrap-table-1.10.1/locale/bootstrap-table-zh-CN.min.js");
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
    _jspx_th_spring_url_11.setValue("/role/doReadRoleList");
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

  private boolean _jspx_meth_spring_url_12(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_12 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_12.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_12.setParent(null);
    _jspx_th_spring_url_12.setValue("/role/doDelRole");
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

  private boolean _jspx_meth_spring_url_13(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_13 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_13.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_13.setParent(null);
    _jspx_th_spring_url_13.setValue("/role/doEnEditRole?perRoleId=");
    int[] _jspx_push_body_count_spring_url_13 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_13 = _jspx_th_spring_url_13.doStartTag();
      if (_jspx_th_spring_url_13.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_13[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_13.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_13.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_13);
    }
    return false;
  }

  private boolean _jspx_meth_spring_url_14(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:url
    org.springframework.web.servlet.tags.UrlTag _jspx_th_spring_url_14 = (org.springframework.web.servlet.tags.UrlTag) _jspx_tagPool_spring_url_value_nobody.get(org.springframework.web.servlet.tags.UrlTag.class);
    _jspx_th_spring_url_14.setPageContext(_jspx_page_context);
    _jspx_th_spring_url_14.setParent(null);
    _jspx_th_spring_url_14.setValue("/role/doEnAddRole");
    int[] _jspx_push_body_count_spring_url_14 = new int[] { 0 };
    try {
      int _jspx_eval_spring_url_14 = _jspx_th_spring_url_14.doStartTag();
      if (_jspx_th_spring_url_14.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_url_14[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_url_14.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_url_14.doFinally();
      _jspx_tagPool_spring_url_value_nobody.reuse(_jspx_th_spring_url_14);
    }
    return false;
  }
}
