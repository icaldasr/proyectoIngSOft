<%-- 
    Document   : Herramientas
    Created on : 7/05/2019, 11:27:11 PM
    Author     : germancaycedo
--%>
<%@page session="true"%>
<%@page import="java.sql.*" %>
<%@page import="modelo.Login" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="css_/bootstrap.min.css">
<!DOCTYPE html>
<html>
<style>
    .botonesHerramientas {
        width: 100%;
        height: 10px;
        top: 300px;
    }

    .parrafo2 {
        width: 60%;
        margin-left: auto;
        margin-right: auto;
        margin-top: 10px;
        margin-bottom: 10px;
        font-size: 200%;
        border: 2px solid black;
        text-align: justify;
        border-radius: 25px;
        padding: 10px;
    }
</style>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Herramientas</title>
    <link rel="stylesheet" href="estilos.css">
    <link rel="stylesheet" href="estilos2.css">
    <link rel="stylesheet" href="fonts.css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">

</head>

<body Style="background-image: url(img/back.jpg)">
    <div class="contenedor2">
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

        <h4 style="font-size: 280%;" align="center">HERRAMIENTAS </h4><br>
        <!--
        <form action="" method="post" align="right" style="margin-right: 50px;">
            <input class="imgusuario" type=image src="Iconos/user-icon.png"><br>
            <%=txtUsuario%>
        </form>
        -->
        <br>
        <table align="left" cellspacing="0">
            <tr>
                <td>
                    <div class="parrafo2">
                        <div align="center">
                            <p style="text-align:justify;">La herramienta 'draw.io' le permitirá crear diagramas en línea sin
                                necesidad de instalar aplicaciones en su ordenador</p>

                            <br>
                            <img width="280" height="180" src="img/drawio.png" class="attachment-full size-full" alt=""
                                 sizes="(max-width: 1004px) 100vw, 1004px"><br>
                            <br>
                            <div class="botonesHerramientas">
                                <div align="center">
                                    <button type="button" class="btn btn-success btn-large" onclick="location.href='https://www.draw.io/'"
                                        >Ir a draw.io</button>
                                </div>
                            </div>
                            <br>
                            <br>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="parrafo2">
                        <div align="center">
                            <p style="text-align:justify;">Con la ayuda de Google Translate, usted podrá hacer
                                traducciones para sus documentos más rápidamente</p>
                            <br>
                            <img width="180" height="180" src="img/translate.png" class="attachment-full size-full" alt=""
                                sizes="(max-width: 1004px) 100vw, 1004px"><br>
                            <br>
                            <div class="botonesHerramientas">
                                <div align="center">
                                    <button type="button" class="btn btn-success btn-large" onclick="location.href='https://translate.google.com/'"
                                        >Ir a Google Translate</button>
                                    <br>
                                </div>
                            </div>
                            <br>
                            <br>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="parrafo2">
                        <div align="center">
                            <p style="text-align:justify;">Lucidchart es una herramienta de diagramación basada en la
                                web, que permite a los usuarios colaborar y trabajar juntos en tiempo real, podras
                                construir todo tipo de diagrama con tan solo la conexion a internet</p>
                            <br>
                            <img width="360" height="180" src="img/lucidchart.png" class="attachment-full size-full"
                                alt="" sizes="(max-width: 1004px) 100vw, 1004px"><br>
                            <br>
                            <div class="botonesHerramientas">
                                <div align="center">
                                    <button type="button" class="btn btn-success btn-large" onclick="location.href='https://www.lucidchart.com/pages/es'"
                                        >Ir a Lucidchart</button>
                                    <br>
                                </div>
                            </div>
                            <br>
                            <br>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="parrafo2">
                        <div align="center">
                            <p style="text-align:justify;">Visual Paradigm es una herramienta de
                                Ingeniería de Software Asistida por Computación. Ayuda desde la planificación, pasando por el
                                análisis y el diseño, hasta la generación del código fuente de los programas y la
                                documentación</p>
                            <br>
                            <img width="370" height="180" src="img/visual.png" class="attachment-full size-full"
                                alt="" sizes="(max-width: 1004px) 100vw, 1004px"><br>
                            <br>
                            <div class="botonesHerramientas">
                                <div align="center">
                                    <button type="button" class="btn btn-success btn-large" onclick="location.href='https://www.visual-paradigm.com/download/'"
                                        >Descargar Visual Paragim</button>
                                    <br>
                                </div>
                            </div>
                            <br>
                            <br>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>
