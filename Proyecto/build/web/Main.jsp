<%-- 
    Document   : Main
    Created on : 21/04/2019, 09:57:29 PM
    Author     : germancaycedo
--%>
<%@page import="modelo.Login"%>
<%@page session="true"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
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

                    <!--input class ="imgusuario2" type=submit name="btnModificar" value="<=rs.getString(2)%>" src="Iconos/project2.png"-->                     
                   <button class="boton_personalizado icon-chat" method="Post" onclick="location.href='foroInicio.jsp'" name="btnUsuario" value=<%=txtUsuario%> >Foro</button><br>
                   <!--<button type="button" onclick="" style='width:150px; height:75px'>Grupos de Trabajo</button><br>-->
            </table>
        </div>
        <div class="screenMain">
        <%
            
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                
                String title = request.getParameter("titulo");
                String definici = request.getParameter("defini");
                String grado = request.getParameter("priori");
                String type = request.getParameter("tipo");
                String des = request.getParameter("descrip");
                String entry = request.getParameter("entra");
                String src = request.getParameter("fuen");
                String constraint = request.getParameter("Restri");
                String process = request.getParameter("proce");
                String estado = "creado";
                
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@labsistemas.javerianacali.edu.co:1521:XE","MEZA","mdr20191");

                    sta=cnx.createStatement();
                    rs=sta.executeQuery("select * from proyecto inner join usuXProye on (proyecto.idProyecto = usuXProye.idProyecto) inner join usuario on(usuXProye.idUsuario = usuario.idUsuario) where usuario.usuario = '"+txtUsuario+"' and proyecto.estado <> 'finalizado'");

                    while(rs.next()){
                    %>

            <div class="contproy">

                <%=rs.getString(2)%> -- Estado: <%=rs.getString(4)%> <br>
                <br>
                <form class="" action="mainProyecto.jsp" method="Post" title="EditarProyecto">
                    <input class ="imgusuario2" type=submit name="btnEditarPro" value="<%=rs.getString(2)%>" src="Iconos/project2.png" >
                </form>
                <form class="" action="AgregarUsuProy.jsp" method="Post" title="agregarColaborador">
                    <input class ="imgusuario2" type=submit name="btnModificar" value="<%=rs.getString(2)%>" src="Iconos/project2.png">      
                </form>
                <!--<a href="AgregarUsuProy.jsp" title="AgregarColaborador"> <input class ="imgusuario2" name = =rs.getString(3) value=rs.getString(3) type=image src="Iconos/New.png" ></a>-->
                <!--<a href="#ventana1" data-toggle="modal" title="AgregarRequisito"> <input class ="imgusuario2" type=image src="Iconos/requisito.png" ></a>-->
                <a  href="#ventana1" data-toggle="modal" title="AgregarRequisito">
                <input class ="imgusuario2" type=submit name="btnAgregar" value="<%=rs.getString(2)%>" src="Iconos/project2.png"></a> <!-- llamar función acá-->       
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
                            <form action="Main.jsp">
                                <!--body ventana -->
                                <div class="modal-body">
                                    <article class="fondo">
                                         <!--<img src="iconos/requisito.png" alt="User">-->


                                            <label>Titulo requisito: </label> <br>
                                            <input class="form-control" type="text" name="titulo" placeholder="titulo"><br>

                                            <label>Definicion:</label> <br>
                                            <textarea class="form-control" name="defini" placeholder="Definicion en lenguaje natural"></textarea><br>


                                            <label>Prioridad: </label> <br>

                                            <select class="form-control" name="priori">
                                                <option >1</option>
                                                <option >2</option>
                                                <option >3</option>
                                                <option >4</option>
                                                <option >5</option>
                                                <option>6</option>
                                                <option >7</option>
                                                <option >8</option>
                                                <option >9</option>
                                                <option >10</option>
                                            </select> <br>

                                            <label for="tipo">Tipo de requisito: </label> <br>
                                            <select class="form-control" name="tipo">
                                                <option >Funcional</option>
                                                <option >No Funcional</option>
                                                <option >Restriccion</option>
                                            </select><br> 

                                            <label for="Descripcion">Descripcion:</label> <br>
                                            <textarea class="form-control" name="descrip" id="descripcion" placeholder="Escribe la descripcion"></textarea><br>

                                            <label for="Entradas">Entradas:</label> <br>

                                            <input class="form-control" type="text" id="entradas" name="entra"  placeholder="Entradas"><br>

                                            <label for="Fuente">Fuente:</label> <br>
                                            <input class="form-control" type="text" id="fuente" name="fuen"  placeholder="Fuente"><br>

                                            <label for="Restricciones">Restricciones:</label> <br>
                                            <input class="form-control" type="text" id="Restricciones" name="Restri"  placeholder="Restricciones"><br>

                                            <label for="Proceso">proceso:</label> <br>
                                            <textarea class="form-control" id="proceso" type="text" name="proce" placeholder="Escribe el proceso"></textarea><br>

                                            <h5>Añadir diagrama: </h5> 
                                            <input class="inp" type="file" name="txtFile" style="width:370px"><br>

                                    </article>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    <input class="btn btn-success" type="submit" name="btnAgre" value="Guardar">

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
            </div>   

            <%          
                       
                            
                        String nombreProyecto = rs.getString(2);
            
                        if("Guardar".equals(request.getParameter("btnAgre"))){
                          
                            //out.print(nombreProyecto);

                            
                            rs=sta.executeQuery("select idUsuario from usuario where usuario = '"+txtUsuario+"' " );
                            int idUsu = 0;
                            if(rs.next()){
                               idUsu = rs.getInt(1);
                               //out.print(idUsu);
                            }
                            
                            rs=sta.executeQuery("select idProyecto from proyecto where nombreProye = '"+nombreProyecto+"' " );
                            int idPro = 0;
                            if(rs.next()){
                               idPro = rs.getInt(1);
                               //out.print(idPro);
                            }
                            
                            rs=sta.executeQuery("insert into requisito(nombreRe,definicion,estado,autor,idUsuario,idProyecto) values('"+title+"','"+definici+"','"+estado+"','"+txtUsuario+"','"+idUsu+"','"+idPro+"' )");
                            
                            rs=sta.executeQuery("select idRequisito from requisito where idProyecto = '"+idPro+"' and nombreRe = '"+title+"' ");
                            int idRe = 0;
                            if(rs.next()){
                               idRe = rs.getInt(1);
                               
                            }
                            
                            rs=sta.executeQuery("insert into detalleRequisito(prioridad,tipoRe,descripcion,entradas,restricciones,fuente,proceso,version,idRequisito) values('"+grado+"','"+type+"','"+des+"','"+entry+"','"+constraint+"','"+src+"','"+process+"','"+1.0+"','"+idRe+"' )");
                            sta.executeQuery("commit");
                            //response.sendRedirect("Main.jsp");
                                  
                        }   
                    
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
