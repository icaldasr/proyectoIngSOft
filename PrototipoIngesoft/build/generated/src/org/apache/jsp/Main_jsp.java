package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Login;
import java.sql.*;
import modelo.Login;

public final class Main_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css_/bootstrap.min.css\">\n");
      out.write("        <title>Inicio</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"estilos.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"estilos2.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"fonts.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"fonts/style.css\">\n");
      out.write("        \n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body Style = \"background-image: url(img/back.jpg)\">\n");
      out.write("        <header>\n");
      out.write("            <h1 class=\"title\">SIGERE</h1>\n");
      out.write("            <a href=\"cerrarSesion.jsp\">Cerrar Sesión</a>\n");
      out.write("\n");
      out.write("        </header>\n");
      out.write("        ");

            HttpSession sessionStatus = request.getSession();
            Login usuario = (Login) sessionStatus.getAttribute("Usuario");
            String txtUsuario = usuario.getUsuario();

        
      out.write("\n");
      out.write("        <h1 class=\"Bienvenido\">BIENVENIDO ");
      out.print(txtUsuario);
      out.write(" </h1><br>\n");
      out.write("\n");
      out.write("        <form class=\"form1\" action=\"usuario.jsp\" method=\"post\">\n");
      out.write("            <h1 class=\"labelMiPerfil\">Mi Perfil</h1>\n");
      out.write("            <input class =\"imgusuario\" type=image src=\"Iconos/user-icon.png\" title=\"Ir al Perfil\"><br>\n");
      out.write("\n");
      out.write("        </form>\n");
      out.write("        <div class=\"divBotones\">\n");
      out.write("             \n");
      out.write("            <table>\n");
      out.write("                   <button class=\"boton_personalizado icon-briefcase\" onclick=\"location.href='crearProyecto.jsp'\"> Crear Proyecto</button><br>\n");
      out.write("                   <br>\n");
      out.write("                   <!--<button type=\"button\" onclick=\"\" style='width:150px; height:75px'>Mis Proyectos</button><br>-->\n");
      out.write("                   <button class=\"boton_personalizado icon-check\" onclick=\"location.href='ProyectosCompletados.jsp'\">Mis proyectos</button><br>\n");
      out.write("                   <br>\n");
      out.write("                   <button class=\"boton_personalizado icon-tools\" onclick=\"location.href='Herramientas.jsp'\">Herramientas</button><br>\n");
      out.write("                   <br>\n");
      out.write("                   <button class=\"boton_personalizado icon-chat\" onclick=\"location.href='foro.jsp'\">Foro</button><br>\n");
      out.write("                   <!--<button type=\"button\" onclick=\"\" style='width:150px; height:75px'>Grupos de Trabajo</button><br>-->\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"screenMain\">\n");
      out.write("        ");

            Connection cnx=null;
            Statement sta=null;
            ResultSet rs=null;

            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
                cnx=DriverManager.getConnection("jdbc:oracle:thin:@186.115.183.198:1521:XE","Proyecto","proyecto");

                sta=cnx.createStatement();
                rs=sta.executeQuery("select * from usuxproy where usu = '"+txtUsuario+"'");

            while(rs.next()){
                
      out.write("\n");
      out.write("\n");
      out.write("            <div action=\"usuario.jsp\" class=\"contproy\">\n");
      out.write("\n");
      out.write("                ");
      out.print(rs.getString(3));
      out.write(" <br> Estado: ");
      out.print(rs.getString(5));
      out.write("\n");
      out.write("                \n");
      out.write("                ");
 String nomProyecto = rs.getString(3);
      out.write("\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                <br>\n");
      out.write("                <a href=\"mainProyecto.jsp\" title=\"EditarProyecto\"> <input class =\"imgusuario2\" type=image src=\"Iconos/project2.png\" onclick=\"");
 request.setAttribute("attributeName",nomProyecto);
      out.write("\" ></a> <!-- llamar función acá-->\n");
      out.write("                \n");
      out.write("                System.out.println( \"Evaluating date now\" );\n");
      out.write("                java.util.Date date = new java.util.Date();\n");
      out.write("                \n");
      out.write("                <a href=\"AgregarUsuProy.jsp\" title=\"AgregarColaborador\"> <input class =\"imgusuario2\" name =");
      out.print(rs.getString(3));
      out.write(" value=");
      out.print(rs.getString(3));
      out.write(" type=image src=\"Iconos/New.png\" ></a>\n");
      out.write("                <a href=\"#ventana1\" data-toggle=\"modal\" title=\"AgregarRequisito\"> <input class =\"imgusuario2\" type=image src=\"Iconos/requisito.png\" ></a>\n");
      out.write("                <div class=\"modal fade\" id=\"ventana1\">\n");
      out.write("                    <div class=\"modal-dialog\">\n");
      out.write("                        <div class=\"modal-content\">\n");
      out.write("                            <div class=\"modal-header\">\n");
      out.write("                            <!--Header ventana -->\n");
      out.write("                                <button tyle=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n");
      out.write("                                <h3 class=\"modal-title\">Nuevo Requisito\n");
      out.write("                                   <!--<span class=\"icon-documents\"></span>-->\n");
      out.write("                                </h3>\n");
      out.write("                            </div>\n");
      out.write("                            <!--body ventana -->\n");
      out.write("                            <div class=\"modal-body\">\n");
      out.write("                                <article class=\"fondo\">\n");
      out.write("                                     <!--<img src=\"iconos/requisito.png\" alt=\"User\">-->\n");
      out.write("\n");
      out.write("                                    <form class=\"\" action=\"\" method=\"\">\n");
      out.write("                                        <label for=\"titulo\">Titulo requisito: </label> <br>\n");
      out.write("                                        <input class=\"form-control\" type=\"text\" id=\"titulo\" placeholder=\"titulo\"><br>\n");
      out.write("\n");
      out.write("                                        <label for=\"grado\">Grado de necesidad: </label> <br>\n");
      out.write("\n");
      out.write("                                        <select class=\"form-control\" name=\"\" id=\"opcionesGrado\">\n");
      out.write("                                            <option value=\"\">1</option>\n");
      out.write("                                            <option value=\"\">2</option>\n");
      out.write("                                            <option value=\"\">3</option>\n");
      out.write("                                            <option value=\"\">4</option>\n");
      out.write("                                            <option value=\"\">5</option>\n");
      out.write("                                            <option value=\"\">6</option>\n");
      out.write("                                            <option value=\"\">7</option>\n");
      out.write("                                            <option value=\"\">8</option>\n");
      out.write("                                            <option value=\"\">9</option>\n");
      out.write("                                            <option value=\"\">10</option>\n");
      out.write("                                        </select> <br>\n");
      out.write("\n");
      out.write("                                        <label for=\"tipo\">Tipo de requisito: </label> <br>\n");
      out.write("                                        <select class=\"form-control\" name=\"\" id=\"opcionesTipo\">\n");
      out.write("                                            <option value=\"\">Funcional</option>\n");
      out.write("                                            <option value=\"\">No Funcional</option>\n");
      out.write("                                            <option value=\"\">Restriccion</option>\n");
      out.write("                                        </select><br> \n");
      out.write("\n");
      out.write("                                        <label for=\"Descripcion\">Descripcion:</label> <br>\n");
      out.write("                                        <textarea class=\"form-control\" id=\"descripcion\" placeholder=\"Escribe la descripcion\"></textarea><br>\n");
      out.write("\n");
      out.write("                                        <label for=\"Entradas\">Entradas:</label> <br>\n");
      out.write("\n");
      out.write("                                        <input class=\"form-control\" type=\"text\" id=\"entradas\"  placeholder=\"Entradas\"><br>\n");
      out.write("\n");
      out.write("                                        <label for=\"Fuente\">Fuente:</label> <br>\n");
      out.write("                                        <input class=\"form-control\" type=\"text\" id=\"fuente\"  placeholder=\"Fuente\"><br>\n");
      out.write("\n");
      out.write("                                        <label for=\"Restricciones\">Restricciones:</label> <br>\n");
      out.write("                                        <input class=\"form-control\" type=\"text\" id=\"Restricciones\"  placeholder=\"Restricciones\"><br>\n");
      out.write("\n");
      out.write("                                        <label for=\"Proceso\">proceso:</label> <br>\n");
      out.write("                                        <textarea class=\"form-control\" id=\"proceso\" type=\"text\" placeholder=\"Escribe el proceso\"></textarea><br>\n");
      out.write("                                        <h5>Añadir diagrama: </h5> \n");
      out.write("                                        <input class=\"inp\" type=\"file\" name=\"txtFile\" style=\"width:370px\"><br>\n");
      out.write("                                    </form>\n");
      out.write("                                </article>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"modal-footer\">\n");
      out.write("                                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cerrar</button>\n");
      out.write("                                <button type=\"button\" class=\"btn btn-success\">Guardar Cambios</button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>   \n");
      out.write("\n");
      out.write("            ");

            }
            sta.close();
            rs.close();
            cnx.close();
            }catch(Exception e){out.print(e+"");}


            
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("       \n");
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
