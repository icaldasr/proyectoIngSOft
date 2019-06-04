<%-- 
    Document   : foroInicio
    Created on : 3/06/2019, 10:39:31 PM
    Author     : icald
--%>
<%@page import="modelo.Login"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Cargar Foro del Proyecto</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="css_/bootstrap.min.css">
        <link rel="stylesheet" href="fonts/style.css">
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="estilos2.css">
        <link rel="stylesheet" href="fonts.css">
        <link rel="stylesheet" href="fonts/style.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">

     
    </head>
    
    <% if(request.getParameter("btnModificar")!=null){
                   application.setAttribute("nombreP",request.getParameter("btnModificar"));
            }
    String nombreProyecto = (String)application.getAttribute("nombreP");
    

    //out.print(prue);
    %>
    
    
    <%
        HttpSession sessionStatus = request.getSession();
        Login usuario = (Login) sessionStatus.getAttribute("Usuario");
        String txtUsuario = usuario.getUsuario();

    %>
    <body Style = "background-image: url(img/back.jpg)">
      

        
    <div class="contenedor">

      <header>
        <h1 class="title">SIGERE</h1>
        <a href="Main.jsp">Atrás</a>
      </header>
      <div class="login">
        <article class="fondo">
          <img src="Iconos/New.png" alt="User">
          <h3>Cargar foro del Proyecto</h3><br><br><br>
          <form class="" action="foro.jsp" method="post">

            <div class="box">
                <div style="margin-right: 200px">
                    <select name="ProyectoSelect">
                    <option>Seleccionar Proyecto </option>
                    <%
                    Connection cnx=null;
                    Statement sta=null;
                    ResultSet rs=null;
                    

                    try{
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@labsistemas.javerianacali.edu.co:1521:XE","MEZA","mdr20191");

                        sta=cnx.createStatement();
                        rs=sta.executeQuery("select proyecto.nombreproye from proyecto inner join usuxproye on (proyecto.idproyecto = usuxproye.idproyecto) inner join usuario on(usuario.idusuario=usuxproye.idusuario) where usuario.usuario='"+txtUsuario+"'");

                    while(rs.next()){
                        %>

                        <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%> </option>  

                    <%
                    String proyectoSeleccionado = request.getParameter("ProyectoSelect");
                    }
                    

                    sta.close();
                   
                    rs.close();
                    cnx.close();
                    }catch(Exception e){out.print(e+"");}
                    

                    %>

                    </select>
                </div>
            </div>
            <br><br>
            
            <div class="text-center">
                <input class ="btn btn-danger btn-lg" type=submit name="btnCargar" value="Cargar"  >>
            </div>
  
          </form>
        </article>
      </div>

    </div>
        
        
       
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
    </body>
</html>
