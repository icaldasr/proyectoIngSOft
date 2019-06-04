
<%-- 
    Document   : mainProyecto
    Created on : 3/05/2019, 11:24:45 PM
    Author     : Alejandro_Meza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Login"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page session="true"%>
<%@page import="java.sql.*" %>
<%@page import="modelo.Login" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="css_/bootstrap.min.css">   
        <title>Main_Proyect</title>
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="stylesheet" href="estilos2.css">
        <link rel="stylesheet" href="css/fonts.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">
        
     
    </head>
    <body Style = "background-color:#85C1E9  ">
        <div class="container" style="background-color:#85C1E9">       
            <br> 
            <header>
                <nav class="navbar navbar-default">  
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-1">
                                <span class="sr-only">Menu</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a href="Main.jsp" class="navbar-brand">SIGERE</a>
                        </div>
                        <div class="collapse navbar-collapse" id="navbar-1">
                            <ul class="nav navbar-nav">
                                <li><a href="Main.jsp">Inicio</a></li>
                                <li><a href="#">Contactanos</a></li>
                                <li><a href="#">Acerca de</a></li>
                                <li><a href="#">Ayuda</a></li>
                            </ul>
                        </div>    
                    </div>
                </nav>
            </header>
        </div>
        <form action="mainProyecto.jsp">
            <input class="boton_personalizado2" type="submit" name="btnFinalizar" value="Finalizar Proyecto">
        </form>
        <br>        
        <br>
        
        <div class="container-fluid" style="background-color:#D6EAF8">
            <div class="row">
                <div class="col-md-2">
                    <ul class="nav nav-pills nav-stacked">
                        <li role="presentation">
                            <a href="#ventanaEdi" class="btn btn-info btn-block" data-toggle="modal">
                                Edición general
                            </a>
                            <div class="modal fade" id="ventanaEdi">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                        <!--Header ventana -->
                                            <button style="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h3 class="modal-title">Introducción SRS
                                            </h3>
                                        </div>
                                        <!--body ventana -->
                                        <form action="mainProyecto.jsp">
                                            <div class="modal-body">
                                                <article class="fondo">

                                                       <label for="Proposito">Propósito:</label> <br>
                                                       <textarea class="form-control" name="Proposito" placeholder="Escribe el proposito del proyecto"></textarea><br>
                                                       <label for="vision">Visión:</label> <br>
                                                       <textarea class="form-control" name="vision" placeholder="Escribe la visión del proyecto"></textarea><br>
                                                       <label for="mision">Misión:</label> <br>
                                                       <textarea class="form-control" name="mision" placeholder="Escribe la misión del proyecto"></textarea><br>
                                                       <label for="alcance">Alcance:</label> <br>
                                                       <textarea class="form-control" name="alcance" placeholder="Escribe el alcance del proyecto"></textarea><br>
                                                       <label for="definiciones">Definiciones - siglas - abreviaciones:</label> <br>
                                                       <textarea class="form-control" name="definiciones" placeholder="Definiciones - siglas - abreviaciones"></textarea><br>
                                                       
                                                </article>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                <input class="btn btn-success" type="submit" name="btnGeneral" value="Guardar">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                               
                        </li>
                        <li role="presentation">
                            <a href="#ventana1" class="btn btn-warning btn-block" data-toggle="modal">Agregar requisito</a>
                            <div class="modal fade" id="ventana1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                        <!--Header ventana -->
                                            <button style="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h3 class="modal-title">Nuevo Requisito
                                               <!--<span class="icon-documents"></span>-->
                                            </h3>
                                        </div>
                                        <form action="mainProyecto.jsp">
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
                                                        <textarea class="form-control" id="proceso" name="proce" placeholder="Escribe el proceso"></textarea><br>

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
                        </li>
                        <li role="presentation">
                            <a href="#ventana2" class="btn btn-danger  btn-block"  data-toggle="modal">Asignar requisito</a>
                            <div class="modal fade" id="ventana2">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                        <!--Header ventana -->
                                            <button style="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h3 class="modal-title">Asignar Requisito
                                               <!--<span class="icon-documents"></span>-->
                                            </h3>
                                        </div>
                                        <!--body ventana -->
                                        <div class="modal-body">
                                            <article>
                                                 <!--<img src="iconos/requisito.png" alt="User">-->

                                                <form>
                                                    <label for="nombreRequi">Nombre del requisito: </label> <br>
                                                    <select class="form-control" name="" id="opcionesNombreRequi">
                                                        <option value="">Editar proyectos</option>
                                                        <option value="">Crear calendario</option>
                                                        <option value="">Tener estados</option>
                                                    </select><br> 

                                                    <label for="nombreCola">Nombre del colaborador: </label> <br>
                                                    <select class="form-control" name="" id="opcionesNombreCola">
                                                        <option value="">Ago98</option>
                                                        <option value="">AlejandroMB</option>
                                                        <option value="">GermanCay</option>
                                                        <option value="">IsaCaldas</option>
                                                    </select><br> 
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
                        </li>
                        <li role="presentation">
                            <a href="#ventana3" class="btn btn-success btn-block"  data-toggle="modal">Añadir archivos</a>
                            <div class="modal fade" id="ventana3">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                        <!--Header ventana -->
                                            <button style="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h3 class="modal-title">Añadir archivos
                                               <!--<span class="icon-documents"></span>-->
                                            </h3>
                                        </div>
                                        <!--body ventana -->
                                        <div class="modal-body">
                                            <article class="fondo">
                                                 <!--<img src="iconos/requisito.png" alt="User">-->

                                                <form>
                                                    <label for="tipoDiagrama">Tipo de diagrama: </label> <br>
                                                    <select class="form-control" name="" id="tipoDiagrama">
                                                        <option value="">Contexto</option>
                                                        <option value="">Casos de uso</option>
                                                        <option value="">Paquetes</option>
                                                        <option value="">Actividad</option>
                                                        <option value="">Otros</option>
                                                    </select><br> 

                                                    <label for="archivo">Archivo:</label>
                                                    <input type="file" id="archivo">
                                                    <br>
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
                        </li>
                    </ul>
                </div>
                <%   HttpSession sessionStatus = request.getSession();
                    Login usuario = (Login) sessionStatus.getAttribute("Usuario");
                    String txtUsuario = usuario.getUsuario();

                    if(request.getParameter("btnEditarPro")!=null){
                           application.setAttribute("Project",request.getParameter("btnEditarPro"));
                    }
                    
                    String nameP = (String)application.getAttribute("Project");
                    //out.print(nameP);
                    Connection cnx=null;
                    Statement sta=null;
                    ResultSet rs=null;
                    String desc;
                    try{
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        cnx=DriverManager.getConnection("jdbc:oracle:thin:@labsistemas.javerianacali.edu.co:1521:XE","MEZA","mdr20191");
                        sta=cnx.createStatement();
                        rs=sta.executeQuery("select idproyecto, descripcion from proyecto where nombreProye = '"+nameP+"' ");
                        if(rs.next()){
                            desc = rs.getString(1);
                        }
                        //out.print(rs.getString(1));
                        
                    }catch(Exception error){
                        out.print("Error en la descripcion global del proyecto: " + error);
                    }
                    
                %>
                
   
                <div class="col-md-4" align="center">
                    <a href="#" title="Ver diagramas"> <input class ="imgusuario3" type=image src="Iconos/diagram.png" ></a>
                </div>
            </div>               
        </div>
        <form name="ServletPDF" action="/PrototipoIngesoft/ServletPDF" method="Post">
            <input class="form-control"  type="submit" value="Visualizar PDF" name="btnVer" placeholder="titulo"><br>
            <input type="hidden" name="nombreProyecto" value="<%=rs.getInt(1)%>" ></a>
        </form>
        <br>
        <br>
        <br>
        <br>
        
        <%  
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
            
            String propo = request.getParameter("Proposito");
            String visio = request.getParameter("vision");
            String misio = request.getParameter("mision");
            String alcan = request.getParameter("alcance");
            String def = request.getParameter("definiciones");
            int idUsu = 0; 
            int idPro = 0;
            int idRe = 0;    
            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
                cnx=DriverManager.getConnection("jdbc:oracle:thin:@labsistemas.javerianacali.edu.co:1521:XE","MEZA","mdr20191");

                sta=cnx.createStatement();
                
                if("Guardar".equals(request.getParameter("btnAgre"))){
                    rs=sta.executeQuery("select idUsuario from usuario where usuario = '"+txtUsuario+"' " );
                    
                    if(rs.next()){
                       idUsu = rs.getInt(1);
                       //out.print(idUsu);
                    }

                    rs=sta.executeQuery("select idProyecto from proyecto where nombreProye = '"+nameP+"' " );
                    
                    if(rs.next()){
                       idPro = rs.getInt(1);
                       
                    }
                    out.print(idPro);
                    rs=sta.executeQuery("insert into requisito(nombreRe,definicion,estado,autor,idUsuario,idProyecto) values('"+title+"','"+definici+"','"+estado+"','"+txtUsuario+"','"+idUsu+"','"+idPro+"' )");

                    rs=sta.executeQuery("select idRequisito from requisito where idProyecto = '"+idPro+"' and nombreRe = '"+title+"' ");
                    
                    if(rs.next()){
                       idRe = rs.getInt(1);

                    }

                    rs=sta.executeQuery("insert into detalleRequisito(prioridad,tipoRe,descripcion,entradas,restricciones,fuente,proceso,version,idRequisito) values('"+grado+"','"+type+"','"+des+"','"+entry+"','"+constraint+"','"+src+"','"+process+"','"+1.0+"','"+idRe+"' )");
                    sta.executeQuery("commit");
                    //response.sendRedirect("Main.jsp");

                }   
                else if("Guardar".equals(request.getParameter("btnGeneral"))){
                    rs=sta.executeQuery("select idProyecto from proyecto where nombreProye = '"+nameP+"' " );
                    
                    if(rs.next()){
                       idPro = rs.getInt(1);
                    }
                
                    rs=sta.executeQuery("insert into introduccion(proposito,vision,mision,alcance,definiciones,version,idProyecto) values('"+propo+"','"+visio+"','"+misio+"','"+alcan+"','"+def+"','"+1+"','"+idPro+"' )");
                    sta.executeQuery("commit");
                }
                else if("Finalizar Proyecto".equals(request.getParameter("btnFinalizar"))){
                    
                    rs=sta.executeQuery("select idProyecto from proyecto where nombreProye = '"+nameP+"' " );
                    
                    if(rs.next()){
                       idPro = rs.getInt(1);
                    }
                    //out.print(idPro);
                    rs=sta.executeQuery("update proyecto set estado = 'finalizado' where idProyecto = '"+idPro+"'");
                    sta.executeQuery("commit");
                }
                
                
        %>
                
                <div class="container">  
                    <table class="table table-bordered table-hover" style="color:#000;background-color:#fff">
                        <thead>
                            <tr class="bg-primary" style="font-family:Tahoma;width: 100px">
                                <th style="width: 100px">Codigo</th>
                                <th style="width: 100px">Prioridad</th>
                                <!--<th scope="col">Ult. Actualización</th>-->
                                <th style="width: 100px">Versión</th>
                                <th style="width: 100px">Fuente</th>
                                <th style="width: 100px">Proceso</th>
                                <th style="width: 100px">Autor</th>
                                <th style="width: 100px">Estado</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <%
                rs=sta.executeQuery("select idProyecto from proyecto where nombreProye = '"+nameP+"' " );
                
                if(rs.next()){
                    idPro = rs.getInt(1);
                }
                rs = sta.executeQuery("select * from requisito inner join detallerequisito on requisito.idrequisito = detallerequisito.idrequisito where idProyecto = '"+idPro+"' " );
                while(rs.next()){%>
                <div class="container" > 
                    <table class="table table-bordered table-hover" style="color:#000;background-color:#fff">                     
                        <tbody style="font-family:Tahoma" >
                            <tr style="width: 100px">
                                <th style="width: 100px"><%=rs.getString(1)%></th>
                                <th style="width: 100px"><%=rs.getString(9)%></th>
                                <!--<th></th>-->
                                <th style="width: 100px"><%=rs.getString(16)%></th>
                                <th style="width: 100px"><%=rs.getString(14)%></th>
                                <th style="width: 100px"><%=rs.getString(15)%></th>
                                <th style="width: 100px"><%=rs.getString(5)%></th>
                                <th style="width: 100px"><%=rs.getString(4)%></th>
                            </tr>
                    </table>
                </div>
                <%}
                
            }catch(Exception e){out.print(e+"  este es el error");}
            
              

            %>
            
        
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
   </body>
</html>
