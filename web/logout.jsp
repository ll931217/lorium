<%-- 
    Document   : logout
    Created on : 2013/10/18, 11:08:46
    Author     : administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //terminates the session and redirects the user to the homepage
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
