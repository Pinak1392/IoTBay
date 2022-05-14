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
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" \r\n");
      out.write("              rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\r\n");
      out.write("        <script type=\"text/javascript\" src=\"js/script.js\"></script>\r\n");
      out.write("        <title>Staff Home Page</title>\r\n");
      out.write("    </head> \r\n");
      out.write("    \r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            \r\n");
      out.write("            ");
 User u = (User)session.getAttribute("user"); 
      out.write("\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <span>\r\n");
      out.write("                    <h3 class=\"h3 col\"> Welcome \r\n");
      out.write("                    \r\n");
      out.write("                        <span>\r\n");
      out.write("                            ");
 if(u != null){ 
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                <h3 class=\"h3\"> ");
      out.print( u.getName() );
      out.write("! </h3>\r\n");
      out.write("\r\n");
      out.write("                            ");
} else { 
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                <h3 class=\"h3\"> Guest! </h3>\r\n");
      out.write("\r\n");
      out.write("                            ");
}
      out.write("\r\n");
      out.write("                        </span>\r\n");
      out.write("                \r\n");
      out.write("                    </h3>\r\n");
      out.write("                </span>\r\n");
      out.write("                \r\n");
      out.write("                <h2 class=\"h2 col\"> IoTBay - Home </h2>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"col\">\r\n");
      out.write("                    <!-- The Buttons on the third column -->     \r\n");
      out.write("                    ");
 if(u == null){ 
      out.write("\r\n");
      out.write("\r\n");
      out.write("                      <a href=\"Login.jsp\" class=\"btn btn-primary\"> Login </a>\r\n");
      out.write("                      <a href=\"Register.jsp\" class=\"btn btn-primary\"> Register </a>\r\n");
      out.write("\r\n");
      out.write("                    ");
} else { 
      out.write("\r\n");
      out.write("\r\n");
      out.write("                      <a href=\"Logout.jsp\" class=\"btn btn-primary\"> Logout </a>\r\n");
      out.write("\r\n");
      out.write("                    ");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("                      <a href=\"Catalogue.jsp\" class=\"btn btn-primary\"> Catalogue </a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>  \r\n");
      out.write("                    \r\n");
      out.write("            <img class=\"bg obj-fit-cover\" src=\"index.jpeg\">\r\n");
      out.write("        </div>\r\n");
      out.write("                    \r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/ConnServlet", out, true);
      out.write("\r\n");
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
