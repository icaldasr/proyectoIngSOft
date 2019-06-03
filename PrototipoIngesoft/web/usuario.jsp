<%-- 
    Document   : usuario
    Created on : 22/04/2019, 08:20:42 PM
    Author     : germancaycedo
--%>
<%@page import="modelo.Login"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="css_/bootstrap.min.css">
        <title>PERFIL</title>
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="fonts.css">
        <link rel="stylesheet" href="fonts/style.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">

     
     
    </head>
    <body>
           <div class="contenedor">
        <header>
            <h1 class="title">SIGERE</h1>
            <a href="Main.jsp">Atrás</a>
        </header>
        <div class="login">

           
            <%
                HttpSession sessionStatus = request.getSession();
                Login usuario = (Login) sessionStatus.getAttribute("Usuario");
                String txtUsuario = usuario.getUsuario();
                
                
                
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                
                try{
                   
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@labsistemas.javerianacali.edu.co:1521:XE","MEZA","mdr20191");
                
                    sta=cnx.createStatement();
                    rs=sta.executeQuery("select * from Usuario where usuario = '"+txtUsuario+"' " );
                    // request.getRequestDispatcher("Main.jsp").forward(request, response); 
                 while(rs.next()){
                 %>
                 


      
        <article class="fondo">
          <img src="Iconos/Edit.png" alt="User">
          <h3>Editar Datos</h3>
          <form class="" action="usuario.jsp" method="post">
            <h4>Nombre: </h4> <br>
            <span class="icon-user"></span><input class="inp" type="text" name="txtNom" title="3-20 caracteres (solo letras)" pattern="[A-Za-z]{3,20}" required
                                            value=<%=rs.getString(2)%>><br>
            <h4>Correo Electronico: </h4> <br>
            <span class="icon-envelop"></span><input class="inp" type="email" name="txtCorreo" title="ejemplo@dominio.com" pattern="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" required
                                              value=<%=rs.getString(3)%>><br>
            <h4>Contraseña: </h4> <br>
            <span class="icon-key"></span><input class="inp" type="text" name="txtCont" title="5-20 caracteres (letras o numeros)" pattern="[A-Za-z0-9!?-]{5,20}" required
                                           value=<%=rs.getString(4)%>><br>
            <!--<a href="" class="he">He olvidado mi contraseña</a>-->
            <div class="text-center">
                <a href="#" class="btn btn-danger btn-md ">Guardar</a>
            </div>
          </form>
        </article>
      </div>
            
    </div>
          
            <%
                     }

            if(request.getParameter("btnGuardar")!=null){
                String nom = request.getParameter("txtNom");
                String correo = request.getParameter("txtCorreo");
                String usu = request.getParameter("txtUsu");
                String contra = request.getParameter("txtCont");
                
                
                sta=cnx.createStatement();
                rs=sta.executeQuery("update usuarios set usu='"+usu+"', nomusu='"+nom+"', corrousu='"+correo+"', contrausu='"+contra+"' where usu = '"+txtUsuario+"' ");
                sta.executeQuery("commit");
                response.sendRedirect("usuario.jsp");

}              
        }catch(Exception e){out.print(e+"");}

                 %>
        
                 
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
