<%-- 
    Document   : mainProyecto
    Created on : 3/05/2019, 11:24:45 PM
    Author     : Alejandro_Meza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Login"%>
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
        <link rel="stylesheet" href="css/fonts.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">
     
    <!--%
        public String getNombreProyecto(){
        String prue = (String)application.getAttribute("prueba");%>
        return prue;
        }
    %>-->
    
    <%String prue = (String)application.getAttribute("prueba");%>
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
                            <a href="#" class="navbar-brand">SIGERE</a>
                        </div>
                        <div class="collapse navbar-collapse" id="navbar-1">
                            <ul class="nav navbar-nav">
                                <li><a href="#">Inicio</a></li>
                                <li><a href="#">Contactanos</a></li>
                                <li><a href="#">Acerca de</a></li>
                                <li><a href="#">Ayuda</a></li>
                            </ul>
                        </div>    
                    </div>
                </nav>
            </header>
        </div>    
        <br>
        <br>
        
        
        <%
        
            HttpSession sessionStatus = request.getSession();
            Login usuario = (Login) sessionStatus.getAttribute("Usuario");
            String txtUsuario = usuario.getUsuario();

        %> 
        
        <%
            Connection cnx=null;
            Statement sta=null;
            ResultSet rs=null;

            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
                cnx=DriverManager.getConnection("jdbc:oracle:thin:@186.115.183.198:1521:XE","Proyecto","proyecto");

                sta=cnx.createStatement();
                rs=sta.executeQuery("select * from usuxproy where usu = '"+txtUsuario+"'");

            }catch (Exception e) {

                        out.print("Este es el error:" + e);
                        e.printStackTrace();
                    }
                
        %>
        
        <div class="container-fluid" style="background-color:#D6EAF8">
            <div class="row">
                <div class="col-md-2">
                    <ul class="nav nav-pills nav-stacked">
                        <li role="presentation">
                            <a href="#ventanaEdi" class="btn btn-info btn-large btn-block" data-toggle="modal">
                                Edición general
                            </a>
                            <div class="modal fade" id="ventanaEdi">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                        <!--Header ventana -->
                                            <button tyle="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h3 class="modal-title">Introducción SRS
                                            </h3>
                                        </div>
                                        <!--body ventana -->
                                        <div class="modal-body">
                                            <article class="fondo">
                                                <form class="" action="" method="">
                                                   <label for="Proposito">Propósito:</label> <br>
                                                   <textarea class="form-control" id="Proposito" placeholder="Escribe el proposito del proyecto"></textarea><br>
                                                   <label for="vision">Visión:</label> <br>
                                                   <textarea class="form-control" id="vision" placeholder="Escribe la visión del proyecto"></textarea><br>
                                                   <label for="mision">Misión:</label> <br>
                                                   <textarea class="form-control" id="mision" placeholder="Escribe la misión del proyecto"></textarea><br>
                                                   <label for="alcance">Alcance:</label> <br>
                                                   <textarea class="form-control" id="alcance" placeholder="Escribe el alcance del proyecto"></textarea><br>
                                                   <label for="definiciones">Definiciones - siglas - abreviaciones:</label> <br>
                                                   <textarea class="form-control" id="definiciones" placeholder="Definiciones - siglas - abreviaciones"></textarea><br>
                                                   <label for="descripcion">Descripción global:</label> <br>
                                                   <textarea class="form-control" id="descripcion" placeholder="Escribe la descripción global del proyecto"></textarea><br>
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
                            <a href="#ventana1" class="btn btn-warning btn-large btn-block" data-toggle="modal">Agregar requisito</a>
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

                                                    <label for="grado">Grado de prioridad: </label> <br>

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
                                                    <textarea class="form-control" id="proceso" type="text" placeholder="Escribe el proceso"></textarea>
                                                    
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
                        </li>
                        <li role="presentation">
                            <a href="#ventana2" class="btn btn-danger btn-large btn-block"  data-toggle="modal">Asignar requisito</a>
                            <div class="modal fade" id="ventana2">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                        <!--Header ventana -->
                                            <button tyle="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h3 class="modal-title">Asignar Requisito
                                               <!--<span class="icon-documents"></span>-->
                                            </h3>
                                        </div>
                                        <!--body ventana -->
                                        <div class="modal-body">
                                            <article class="fondo">
                                                 <!--<img src="iconos/requisito.png" alt="User">-->

                                                <form class="" action="" method="">
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
                            <a href="#ventana3" class="btn btn-success btn-large btn-block"  data-toggle="modal">Añadir archivos</a>
                            <div class="modal fade" id="ventana3">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                        <!--Header ventana -->
                                            <button tyle="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h3 class="modal-title">Añadir archivos
                                               <!--<span class="icon-documents"></span>-->
                                            </h3>
                                        </div>
                                        <!--body ventana -->
                                        <div class="modal-body">
                                            <article class="fondo">
                                                 <!--<img src="iconos/requisito.png" alt="User">-->

                                                <form class="" action="" method="">
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
                
                <!--  <script>
                    function setNombreProyecto(){
                
                        String nomProyecto = rs.getString(3);
                        session.setAttribute("prueba",rs.getString(3));%>


                   }
                </script>-->
                

                <div class="col-md-6" align="justify">
                    <!--%String prue = (String)session.getAttribute("prueba");%>-->
                    <h2 style="font-family:Tahoma">Descripción global del proyecto</h2>
                    <p style="font-family:Tahoma"> En el presente documento se encontrará la información acerca de las características
                        del producto de software, interfaces de usuario, interfaces del sistema, descripción
                        de los requerimientos funcionales ...      </p>
                    <p style="font-family:Tahoma"> Proyecto: <%=prue%> </p>
                    
                    

                </div>    
                <div class="col-md-4" align="center">
                    <a href="#" title="Ver diagramas"> <input class ="imgusuario3" type=image src="Iconos/diagram.png" ></a>
                </div>
            </div>               
        </div>
        
        <br>
        <br>
        <br>
        <br>
        <!--

        -->

     
            
        <div class="container-fluid">  
            <table class="table table-bordered table-hover" style="color:#000;background-color:#fff">
                <thead>
                    <tr class="bg-primary" style="font-family:Tahoma">
                        <th scope="col">Codigo</th>
                        <th scope="col">Prioridad</th>
                        <th scope="col">Ult. Actualización</th>
                        <th scope="col">Versión</th>
                        <th scope="col">Fuente</th>
                        <th scope="col">Proceso</th>
                        <th scope="col">Autor</th>
                        <th scope="col">Estado</th>
                    </tr>
                </thead>
                <!--Ejemplo estaticos -->
                <tbody style="font-family:Tahoma" >
                    <tr>
                        <th>RF_01</th>
                        <th>8</th>
                        <th>05/05/2019</th>
                        <th>1.2</th>
                        <th>Gestion</th>
                        <th>Registrar requisitos</th>
                        <th>Alejandro Meza</th>
                        <th>En desarrollo</th>
                    </tr>
                    <tr>
                        <th>RF_02</th>
                        <th>6</th>
                        <th>05/05/2019</th>
                        <th>1.0</th>
                        <th>Cuentas</th>
                        <th>Registrar usuarios</th>
                        <th>Isabella Caldas</th>
                        <th>En desarrollo</th>
                    </tr>
                </tbody>
            </table>
        </div>        
        
        <!--   }
            sta.close();
            rs.close();
            cnx.close();
            }catch(Exception e){out.print(e+"");}


        %>
        -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
   </body>
</html>
