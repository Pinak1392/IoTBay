package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.User;
import controller.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>IoTBay Home</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
 User u = (User)session.getAttribute("user"); 
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        ");
 if(u == null){ 
      out.write("\r\n");
      out.write("            <a href=\"Login.jsp\">Login</a>\r\n");
      out.write("            <a href=\"Register.jsp\">Register</a>\r\n");
      out.write("        ");
} else { 
      out.write("\r\n");
      out.write("            <a href=\"Logout.jsp\">Logout</a>\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("        <a href=\"Catalogue.jsp\">Catalogue</a>\r\n");
      out.write("        <h1>Welcome</h1>\r\n");
      out.write("        \r\n");
      out.write("        ");
 if(u != null){ 
      out.write("\r\n");
      out.write("            <h2>");
      out.print( u.getName() );
      out.write("</h2>\r\n");
      out.write("            <p>Your email is ");
      out.print( u.getEmail() );
      out.write(" and your date of birth is ");
      out.print( u.getDOB() );
      out.write(". Also your phone number is ");
      out.print( u.getPhoneNo() );
      out.write(".</p>\r\n");
      out.write("\r\n");
      out.write("        ");
} else { 
      out.write("\r\n");
      out.write("            <h2>Guest</h2>\r\n");
      out.write("            \r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        <style>\r\n");
      out.write("            body {background: #fdfdfd; color: #2f2f2f;}\r\n");
      out.write("        </style>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
}
