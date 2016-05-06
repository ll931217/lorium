<%-- 
    Document   : change_password
    Created on : 19 Oct 2013, 10:56:22 AM
    Author     : ll931217
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, javax.xml.ws.WebServiceRef, java.net.*" %>
<%@page errorPage="error.jsp" %>
<%
    //connect to server
    Socket clientSocket = new Socket("127.0.0.1", 16000);
    PrintWriter o = new PrintWriter(clientSocket.getOutputStream(),true);
    BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            //gets all the parameters from the forgot_password page
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String password1 = request.getParameter("password1");
            System.out.println("email in change_password: " + email);

            try {
                //checks if the passwords match each other
                if (password.equals(password1)) {
                    //calls the updateDB method on the service and updates the database
                    o.println("20#UPDATE user SET password = '" + password + "' WHERE email_address = '" + email + "'#");
                    //after the update, it redirects you back to homepage
                    response.sendRedirect("index.jsp?status=Password_Changed");
                } else {
                    //if the password doesn't match, it will redirect you back to the forgot_password page with an error message
                    response.sendRedirect("forgot_password.jsp?error=wrong_answer");
                }
            } catch (java.rmi.RemoteException e) {
                System.err.println(e);
            } catch (Exception e) {
                System.err.println(e);
            }
        %>
    </body>
</html>
