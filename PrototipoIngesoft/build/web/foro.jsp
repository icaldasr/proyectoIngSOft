<%-- 
    Document   : foro
    Created on : 11/05/2019, 07:48:45 PM
    Author     : icald
--%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page session="true"%>
<%@page import="java.sql.*" %>
<%@page import="modelo.Login" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        .cuadroPost {
            text-align: center;
            align-content: center;
            justify-content: center;
            border: 2px solid black;
            height: auto;
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            padding: 2%;
        }

        .question-type {
            display: flex;
        }

        .inpComment {
            box-shadow: 0;
            border: 0;
            background-color: rgba(255, 255, 255, .1);
            width: 90%;
            border: solid 2px rgba(255, 255, 255, .5);
            font-size: 20px;
            color: #fff;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            text-align: center;
            resize: none;
        }
    </style>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="estilos2.css">
        <link rel="stylesheet" href="fonts.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">
    </head>

    <body Style="background-image: url(img/back.jpg)">
        <div class="contenedor2">
            <header>
                <h1 class="title">SIGERE</h1>
                <a href="cerrarSesion.jsp">Salir</a>

            </header>
            <br>
            <%
                HttpSession sessionStatus = request.getSession();
                Login usuario = (Login) sessionStatus.getAttribute("Usuario");
                String txtUsuario = usuario.getUsuario();
                
            %>
            <h4 style="font-size: 250%;" align="center">FORO </h4><br>

            <form action="foro.jsp" method="post" align="right" style="margin-right: 50px;">
                <h1 align="right" style="font-size: 150%;"  >Mi Perfil</h1>
                <input class ="imgusuario" align="right" type=image src="Iconos/user-icon.png" ><br><br>
               
            </form>
            <br>

            <div class="cuadroPost">
                <!--<h4 style="font-size: 200%;">Opinion</h4>
                <br>-->
                <h4 style="font-size: 150%;">En esta seccion podrás publicar en el foro cualquier opinion o duda que tengas, alguien de
                    la comunidad podrá responderte después.</h4>
                <br>
                
                          <form class="" action="foro.jsp" method="post">
                          <textarea class="inpComment" name="comentarios" rows="5" cols="20">¿Qué deseas publicar?</textarea>
                          <input class="boton" type="submit" name="btnComentar" value="Publicar" >
                          </form>
            </div>

            <%
                     
                if (request.getParameter("btnComentar") != null) {
           
                    String Comentario = request.getParameter("comentarios");
                    //String usu = request.getParameter("txtUsu");

                    Connection cnx = null;
                    Statement sta = null;
                    ResultSet rs = null;
                    CallableStatement callProc = null;

                    int id = 0;

                    try {

                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        cnx = DriverManager.getConnection("jdbc:oracle:thin:@181.234.31.151:1521:XE", "Proyecto", "proyecto");

                        sta = cnx.createStatement();
                        rs = sta.executeQuery("select * from posts");

                        //out.print("resultado "+rs);
                        while (rs.next()) {
                            if (rs == null) {
                                id = 1;
                                
                            } else {
                                id = rs.getInt(1) + 1;
                            }
                        }
                       
                        //out.print("Resultado"+id+" "+ txtUsuario+" "+Comentario);
                        rs = sta.executeQuery("insert into posts values('" + id + "','" + txtUsuario + "','" + Comentario + "')");
                        sta.executeQuery("commit");
                        //out.print("resultado " + rs);

                        sta.close();
                        rs.close();
                        cnx.close();

                    } catch (Exception e) {

                        out.print(e + "  este es el error");
                        e.printStackTrace();
                    }
                }
            %>
            <h4 style="font-size: 250%;" align="center">Publicaciones de otros usuarios</h4><br>

            <%                Connection cnx = null;
                Statement sta = null;
                ResultSet rs = null;

                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx = DriverManager.getConnection("jdbc:oracle:thin:@181.234.31.151:1521:XE", "Proyecto", "proyecto");

                    sta = cnx.createStatement();
                    rs = sta.executeQuery("select * from posts");
                    int contador = 0;
                    while (rs.next()) 
                    {
            %>
            <br>
            <div class="cuadroPost">
                <h4 style="font-size: 200%;">POST    #<%= contador%> por usuario <%= rs.getString(2)%></h4>
                <br>
                <h4 style="font-size: 150%;"><%= rs.getString(3)%></h4>
                <!--<input class="boton" type="submit" name="btnResolver" value="Marcar como resuelta" width="50px">-->
            </div>       
            <%
                        contador++;
                    }
                    sta.close();
                    rs.close();
                    cnx.close();
                } catch (Exception e) {
                    out.print(e + "");
                }
            %>

        </div>
    </body>
</html>
