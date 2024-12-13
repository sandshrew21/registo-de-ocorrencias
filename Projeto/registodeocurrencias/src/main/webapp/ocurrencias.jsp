<%-- 
    Document   : ocurrencias.jsp
    Created on : 06/12/2024, 12:08:15
    Author     : tpaulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Descrição</title>
    </head>
    <body>
        <h1>Descrição recebida:</h1>
        <p><%= request.getAttribute("descricao") %></p>
    </body>
</html>
