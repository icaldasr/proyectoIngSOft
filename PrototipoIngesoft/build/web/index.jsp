<%-- 
    Document   : index
    Created on : 18/04/2019, 10:55:51 PM
    Author     : germancaycedo
--%>
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
        <title>SIGERE</title>
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="fonts.css">
        <link rel="stylesheet" href="fonts/style.css">
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="stylesheet" href="css/fonts.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">

     
    </head>
    <body Style = "background-image: url(img/back.jpg)">
    <div class="contenedor">
      <header>
        <h1 class="title">SIGERE</h1>
        <a href="nuevo.jsp">Registrate</a>
      </header>
      <div class="login">
        <article class="fondo">
          <img src="Iconos/user-icon.png" alt="User">
          <h3>Inicio de Sesión</h3><br>
          <form class="" action="index.jsp" method="post">
            <h4>Usuario: </h4> <br>
            <span class="icon-user"></span><input class="inp" type="text" name="txtUsuario" 
                                                  title="2-25 caracteres (letras o numeros)" pattern="[A-Za-z0-9!?-]{2,25}" required/>
                                           
            <br>
            <h4>Contraseña: </h4> <br>
            <span class="icon-key"></span><input class="inp" type="password" name="txtContra"
                                           title="5-20 caracteres (letras o numeros)" pattern="[A-Za-z0-9!?-]{5,20}" required/><br>
            <li role="presentation">   
                <a href="#ventanaContra" class="btn btn-link text-danger" style="font-size: 20px" data-toggle="modal">He olvidado mi contraseña</a><br><br>
                <div class="modal fade" id="ventanaContra">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                            <!--Header ventana -->
                                <button tyle="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3 class="modal-title" style="color: #000">Nueva contraseña
                                   <!--<span class="icon-documents"></span>-->
                                </h3>
                            </div>
                            <!--body ventana -->
                            <div class="modal-body">
                                <article class="fondo">
                                    <!--<label for="correo" >Correo:</label>--> <br>
                                    <input class="form-control" type="text" id="correo"  placeholder="Ingrese su correo electronico"><br>
                                    <!--<label for="nuevaContra" >Nueva Contraseña:</label>--> <br>
                                    <input class="form-control" type="text" id="nuevaContra"  placeholder="Ingrese la nueva contraseña"><br>
                                </article>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <button type="button" class="btn btn-success">Enviar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
                                
                                
            <div class="text-center">
                <input class="btn btn-danger btn-lg" type="submit" name="btnIniciar" value="Iniciar Sesión">
            </div>
          </form>
        </article>
      </div>

    </div>
        
        
        <%
            
            if(request.getParameter("btnIniciar")!=null){
                String txtUsuario = request.getParameter("txtUsuario");
                String contra = request.getParameter("txtContra");
                
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                
                try{
                   
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@labsistemas.javerianacali.edu.co:1521:XE","MEZA","mdr20191");
                
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
                    
                }catch(Exception e){%>
                    <script type="text/javascript">
                        alert('Error en la conexión');
                    </script><%
                ;}
                
                
            }

            %>
            
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
