<%-- 
    Document   : cerrarSesion
    Created on : 23/04/2019, 11:43:32 PM
    Author     : germancaycedo
--%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="fonts/style.css">
        <title>Cerrando...</title>
    </head>
    <body>
        
        <%
            HttpSession sessionOut = request.getSession();
            sessionOut.invalidate();
            response.sendRedirect("index.jsp");
 


            %>
        
        
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script> 
    </body>
</html>
