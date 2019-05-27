package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import modelo.Login;

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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css_/bootstrap.min.css\"> \n");
      out.write("        <title>SIGERE</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"estilos.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"fonts.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"fonts/style.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/estilos.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/fonts.css\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("     \n");
      out.write("    </head>\n");
      out.write("    <body Style = \"background-image: url(img/back.jpg)\">\n");
      out.write("    <div class=\"contenedor\">\n");
      out.write("      <header>\n");
      out.write("        <h1 class=\"title\">SIGERE</h1>\n");
      out.write("        <a href=\"nuevo.jsp\">Registrate</a>\n");
      out.write("      </header>\n");
      out.write("      <div class=\"login\">\n");
      out.write("        <article class=\"fondo\">\n");
      out.write("          <img src=\"Iconos/user-icon.png\" alt=\"User\">\n");
      out.write("          <h3>Inicio de Sesión</h3><br>\n");
      out.write("          <form class=\"\" action=\"index.jsp\" method=\"post\">\n");
      out.write("            <h4>Usuario: </h4> <br>\n");
      out.write("            <span class=\"icon-user\"></span><input class=\"inp\" type=\"text\" name=\"txtUsuario\" \n");
      out.write("                                                  title=\"2-25 caracteres (letras o numeros)\" pattern=\"[A-Za-z0-9!?-]{2,25}\" required/>\n");
      out.write("                                           \n");
      out.write("            <br>\n");
      out.write("            <h4>Contraseña: </h4> <br>\n");
      out.write("            <span class=\"icon-key\"></span><input class=\"inp\" type=\"password\" name=\"txtContra\"\n");
      out.write("                                           title=\"5-20 caracteres (letras o numeros)\" pattern=\"[A-Za-z0-9!?-]{5,20}\" required/><br>\n");
      out.write("            <li role=\"presentation\">   \n");
      out.write("                <a href=\"#ventanaContra\" class=\"btn btn-link text-danger\" style=\"font-size: 20px\" data-toggle=\"modal\">He olvidado mi contraseña</a><br><br>\n");
      out.write("                <div class=\"modal fade\" id=\"ventanaContra\">\n");
      out.write("                    <div class=\"modal-dialog\">\n");
      out.write("                        <div class=\"modal-content\">\n");
      out.write("                            <div class=\"modal-header\">\n");
      out.write("                            <!--Header ventana -->\n");
      out.write("                                <button tyle=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n");
      out.write("                                <h3 class=\"modal-title\" style=\"color: #000\">Nueva contraseña\n");
      out.write("                                   <!--<span class=\"icon-documents\"></span>-->\n");
      out.write("                                </h3>\n");
      out.write("                            </div>\n");
      out.write("                            <!--body ventana -->\n");
      out.write("                            <div class=\"modal-body\">\n");
      out.write("                                <article class=\"fondo\">\n");
      out.write("                                    <!--<label for=\"correo\" >Correo:</label>--> <br>\n");
      out.write("                                    <input class=\"form-control\" type=\"text\" id=\"correo\"  placeholder=\"Ingrese su correo electronico\"><br>\n");
      out.write("                                    <!--<label for=\"nuevaContra\" >Nueva Contraseña:</label>--> <br>\n");
      out.write("                                    <input class=\"form-control\" type=\"text\" id=\"nuevaContra\"  placeholder=\"Ingrese la nueva contraseña\"><br>\n");
      out.write("                                </article>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"modal-footer\">\n");
      out.write("                                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cerrar</button>\n");
      out.write("                                <button type=\"button\" class=\"btn btn-success\">Enviar</button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </li>\n");
      out.write("                                \n");
      out.write("                                \n");
      out.write("            <div class=\"text-center\">\n");
      out.write("                <input class=\"btn btn-danger btn-lg\" type=\"submit\" name=\"btnIniciar\" value=\"Iniciar Sesión\">\n");
      out.write("            </div>\n");
      out.write("          </form>\n");
      out.write("        </article>\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        ");

            
            if(request.getParameter("btnIniciar")!=null){
                String txtUsuario = request.getParameter("txtUsuario");
                String contra = request.getParameter("txtContra");
                
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                
                try{
                   
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@186.115.183.198:1521:XE","Proyecto","proyecto");
                
                    sta=cnx.createStatement();
                    rs=sta.executeQuery("select * from usuarios where Usu = '"+txtUsuario+"' and ContraUsu = '"+contra+"' " );
                    
                    String res =null;
                    
                    while(rs.next()){
                       res = rs.getString(1);
                    }
                    
                    //out.print(res);
                    //out.print(usu);
                    
                    if(res != null){
                        
                        Login login = new Login(); 
                        login.setUsuario(txtUsuario);
                        
                        HttpSession sessionok = request.getSession();
                        sessionok.setAttribute("Usuario",login);
                        
                        response.sendRedirect("Main.jsp");
                        
                                
                       // request.getRequestDispatcher("Main.jsp").forward(request, response);
                    }
                    
                sta.close();
                rs.close();
                cnx.close();
                    
                }catch(Exception e){
      out.write("\n");
      out.write("                    <script type=\"text/javascript\">\n");
      out.write("                        alert('Error en la conexión');\n");
      out.write("                    </script>");

                ;}
                
                
            }

            
      out.write("\n");
      out.write("            \n");
      out.write("        <script src=\"js/jquery.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
