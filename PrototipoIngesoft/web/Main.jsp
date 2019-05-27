<%-- 
    Document   : Main
    Created on : 21/04/2019, 09:57:29 PM
    Author     : germancaycedo
--%>
<%@page import="modelo.Login"%>
<%@page session="true"%>
<%@page import="java.sql.*" %>
<%@page import="modelo.Login" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="css_/bootstrap.min.css">
        <title>Inicio</title>
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="estilos2.css">
        <link rel="stylesheet" href="fonts.css">
        <link rel="stylesheet" href="fonts/style.css">
        

    </head>
    <body Style = "background-image: url(img/back.jpg)">
        <header>
            <h1 class="title">SIGERE</h1>
            <a href="cerrarSesion.jsp">Cerrar Sesión</a>

        </header>
        <%
            HttpSession sessionStatus = request.getSession();
            Login usuario = (Login) sessionStatus.getAttribute("Usuario");
            String txtUsuario = usuario.getUsuario();

        %>
        <h1 class="Bienvenido">BIENVENIDO <%=txtUsuario%> </h1><br>

        <form class="form1" action="usuario.jsp" method="post">
            <h1 class="labelMiPerfil">Mi Perfil</h1>
            <input class ="imgusuario" type=image src="Iconos/user-icon.png" title="Ir al Perfil"><br>

        </form>
        <div class="divBotones">
             
            <table>
                   <button class="boton_personalizado icon-briefcase" onclick="location.href='crearProyecto.jsp'"> Crear Proyecto</button><br>
                   <br>
                   <!--<button type="button" onclick="" style='width:150px; height:75px'>Mis Proyectos</button><br>-->
                   <button class="boton_personalizado icon-check" onclick="location.href='ProyectosCompletados.jsp'">Mis proyectos</button><br>
                   <br>
                   <button class="boton_personalizado icon-tools" onclick="location.href='Herramientas.jsp'">Herramientas</button><br>
                   <br>
                   <button class="boton_personalizado icon-chat" onclick="location.href='foro.jsp'">Foro</button><br>
                   <!--<button type="button" onclick="" style='width:150px; height:75px'>Grupos de Trabajo</button><br>-->
            </table>
        </div>
        <div class="screenMain">
        <!--%
            public void setNombreProyecto(String nombre){
                application.setAttribute("prueba",nombre);
                
            out.print("prueba");
            }
        %-->
        <%
            Connection cnx=null;
            Statement sta=null;
            ResultSet rs=null;

            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
                cnx=DriverManager.getConnection("jdbc:oracle:thin:@186.115.183.198:1521:XE","Proyecto","proyecto");

                sta=cnx.createStatement();
                rs=sta.executeQuery("select * from usuxproy where usu = '"+txtUsuario+"'");
               

            while(rs.next()){


                %>


            <div action="usuario.jsp" class="contproy">

                <%=rs.getString(3)%> <br> Estado: <%=rs.getString(5)%>
                
                <!--%String nomProyecto = rs.getString(3);%>
                
                <!--String prue = (String)application.getAttribute("nomProyecto");%>-->

                
                <!--%String prueba2 = (String)getNombreProyecto();%>-->   
                
                <!--%application.setAttribute("prueba",rs.getString(3));
                
                String prue = (String)application.getAttribute("prueba");%-->
                
                <%String pruebaa = rs.getString(3);%>
                
                <br>
                <a href="mainProyecto.jsp" title="ModificarProyecto" onclick="setNombreProyecto(pruebaa)"> <input class ="imgusuario2" type=image src="Iconos/project2.png"  ></a> <!-- llamar función acá-->

                <a href="AgregarUsuProy.jsp" title="AgregarColaborador"> <input class ="imgusuario2" name =<%=rs.getString(3)%> value=<%=rs.getString(3)%> type=image src="Iconos/New.png" ></a>
                <a href="#ventana1" data-toggle="modal" title="AgregarRequisito"> <input class ="imgusuario2" type=image src="Iconos/requisito.png" ></a>
                <div class="modal fade" id="ventana1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                            <!--Header ventana -->
                                <button tyle="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3 class="modal-title">Nuevo Requisito
                                   <!--<span class="icon-documents"></span>-->
                                </h3>
                            </div>
                            <!--body ventana -->
                            <div class="modal-body">
                                <article class="fondo">
                                     <!--<img src="iconos/requisito.png" alt="User">-->

                                    <form class="" action="" method="">
                                        <label for="titulo">Titulo requisito: </label> <br>
                                        <input class="form-control" type="text" id="titulo" placeholder="titulo"><br>

                                        <label for="grado">Grado de necesidad: </label> <br>

                                        <select class="form-control" name="" id="opcionesGrado">
                                            <option value="">1</option>
                                            <option value="">2</option>
                                            <option value="">3</option>
                                            <option value="">4</option>
                                            <option value="">5</option>
                                            <option value="">6</option>
                                            <option value="">7</option>
                                            <option value="">8</option>
                                            <option value="">9</option>
                                            <option value="">10</option>
                                        </select> <br>

                                        <label for="tipo">Tipo de requisito: </label> <br>
                                        <select class="form-control" name="" id="opcionesTipo">
                                            <option value="">Funcional</option>
                                            <option value="">No Funcional</option>
                                            <option value="">Restriccion</option>
                                        </select><br> 

                                        <label for="Descripcion">Descripcion:</label> <br>
                                        <textarea class="form-control" id="descripcion" placeholder="Escribe la descripcion"></textarea><br>

                                        <label for="Entradas">Entradas:</label> <br>

                                        <input class="form-control" type="text" id="entradas"  placeholder="Entradas"><br>

                                        <label for="Fuente">Fuente:</label> <br>
                                        <input class="form-control" type="text" id="fuente"  placeholder="Fuente"><br>

                                        <label for="Restricciones">Restricciones:</label> <br>
                                        <input class="form-control" type="text" id="Restricciones"  placeholder="Restricciones"><br>

                                        <label for="Proceso">proceso:</label> <br>
                                        <textarea class="form-control" id="proceso" type="text" placeholder="Escribe el proceso"></textarea><br>
                                        <h5>Añadir diagrama: </h5> 
                                        <input class="inp" type="file" name="txtFile" style="width:370px"><br>
                                    </form>
                                </article>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <button type="button" class="btn btn-success">Guardar Cambios</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>   

            <%
            }
            sta.close();
            rs.close();
            cnx.close();
            }catch(Exception e){out.print(e+"");}


            %>

        </div>
       
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
