<%-- 
    Document   : crearProyecto
    Created on : 24/04/2019, 02:57:37 PM
    Author     : germancaycedo
--%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page session="true"%>
<%@page import="java.sql.*" %>
<%@page import="modelo.Login" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Proyecto</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="css_/bootstrap.min.css">
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="estilos2.css">
        <link rel="stylesheet" href="fonts.css">
        <link rel="stylesheet" href="fonts/style.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">
    </head>
    <body>

        
    <div class="contenedor">

      <header>
        <h1 class="title">SIGERE</h1>
        <a href="Main.jsp">Atras</a>
      </header>
      <div class="login">
        <article class="fondo">
          <img src="Iconos/proy.png" alt="User">
          <h3>Crear Proyecto</h3>
          <form class="" action="" method="post">
            <h4>Nombre: </h4> <br>
            <span class="icon-user"></span><input class="inp" type="text" name="txtNombre"
                                            title="2-25 caracteres (letras o numeros)" pattern="[A-Za-z0-9!?-]{2,25}" required/><br>
            <h4>Descripcion: </h4> <br>
            <textarea class="form-control" id="descripcionProject" placeholder="Escribe la descripcion"
                      title="2-50 caracteres (letras o numeros)" pattern="[A-Za-z0-9!?-]{2,50}" required/></textarea><br>
            <h2>Archivo: </h2> 
            <input class="inp" type="file" name="txtFile" style="width:370px"><br>
            <div class="text-center">
                <input class="btn btn-success btn-lg" type="submit" name="btnCrear" value="Crear">
            </div>
        </form>
        </article>
      </div>

    </div>
         
        <%
            if(request.getParameter("btnCrear")!=null){
                String nom = request.getParameter("txtNombre");
                String descri = request.getParameter("txtDescri");
                //String usu = request.getParameter("txtUsu");
                
                HttpSession sessionStatus = request.getSession();
                Login usuario = (Login) sessionStatus.getAttribute("Usuario");
                String txtUsuario = usuario.getUsuario();
                
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                CallableStatement callProc=null;
                
                int id=0;
                int id2=0;
                
                try{
                   
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@labsistemas.javerianacali.edu.co:1521:XE","MEZA","mdr20191");
                
                    sta=cnx.createStatement();
                    rs=sta.executeQuery("select * from proyectos" );
                    //out.print("resultado "+rs);
                    while(rs.next()){
                        
                        if(rs == null){
                            id = 1;
                        }
                        else{
                            id = rs.getInt(1) + 1;
                        }
                    }
                    
                    rs=sta.executeQuery("select * from usuxproy" );
                    //out.print("resultado "+rs);
                    while(rs.next()){
                        
                        if(rs == null){
                            id2 = 1;
                        }
                        else{
                            id2 = rs.getInt(1) + 1;
                        }
                    }
                    
                    java.util.Date dNow = new Date();
                    SimpleDateFormat ft = new SimpleDateFormat ("MM/dd/yyyy");
                    String fecha = ft.format(dNow);
                    
                    rs=sta.executeQuery("insert into proyectos values('"+id+"','"+nom+"','"+descri+"','"+txtUsuario+"','"+fecha+"')" );
                    rs=sta.executeQuery("insert into usuxproy values('"+id2+"','"+txtUsuario+"','"+nom+"')" );
                    sta.executeQuery("commit");
                    out.print("resultado "+rs);
                    
                    
                    sta.close();
                    rs.close();
                    cnx.close();
                                  
                }catch(Exception e){out.print(e+"  este es el error");}
 
            }
           
            %>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
