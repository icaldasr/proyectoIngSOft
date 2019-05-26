<%-- 
    Document   : ProyectosCompletados
    Created on : 7/05/2019, 11:36:48 PM
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
            <a href="Main.jsp">Atras</a>

        </header>
            <%
                HttpSession sessionStatus = request.getSession();
                Login usuario = (Login) sessionStatus.getAttribute("Usuario");
                String txtUsuario = usuario.getUsuario();

            %>
            <br>
                <h4 style="font-size: 350% " align="center" >Proyectos Completados </h4><br>
            <br>
            <br>
            <br>
            <div class="text-center">
                
                <%
                    Connection cnx=null;
                    Statement sta=null;
                    ResultSet rs=null;

                    try{
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        cnx=DriverManager.getConnection("jdbc:oracle:thin:@186.115.183.198:1521:XE","Proyecto","proyecto");

                        sta=cnx.createStatement();
                        rs=sta.executeQuery("select * from usuxproy where usu = '"+txtUsuario+"' and completado = 1 ");

                    while(rs.next()){
                        %>


                    <div action="" class="contproy">

                        <%=rs.getString(3)%> -- Estado: <%=rs.getString(5)%> <br><br>

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
                        <a href="AgregarUsuProy.jsp" title="AgregarColaborador"> <input class ="imgusuario2" name =<%=rs.getString(3)%> value=<%=rs.getString(3)%> type=image src="Iconos/New.png" ></a><br><br>
                    </div>    

                
            </div>
                     
                <%
                }
                sta.close();
                rs.close();
                cnx.close();
                }catch(Exception e){out.print(e+"");}
             
                
                %>
        
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
