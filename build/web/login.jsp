<%-- 
    Document   : login
    Created on : Oct 16, 2013, 10:14:07 AM
    Author     : ll931217
--%>

<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.PrintWriter"%>
<%
    Socket clientSocket;
    PrintWriter o;
    BufferedReader in;
    try {
        clientSocket = new Socket("127.0.0.1", 16000);
        o = new PrintWriter(clientSocket.getOutputStream(),true);
        in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
    } catch (Exception ex) {
        throw new Exception("<center><p style=\"color:red; font-size: 32px; text-align:center; width: 30%; padding: 20px; background-color: black\">The Server is Offline</p></center>");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%@page import="java.sql.*, java.util.*, java.text.DecimalFormat, java.net.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lorium | Log In</title>
        <link rel="shortcut icon" href="images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="css/forumStyle.css"/>
        <script src="js/jquery-1.3.js" type="text/javascript"></script>
        <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
        <script src="js/animate.js" type="text/javascript"></script>
        <script src="js/datetime.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="container">
            <jsp:include page="header.jsp"/>
            <div id="content">
                <center>
                    <% 
                        if (request.getParameter("error") != null) {
                            String error = request.getParameter("error");
                            String [] errors = error.split("_");
                            out.print("<p style=\"color: red; background-color: black; padding: 20px; width: 30%; font-size: 16px\">");
                            for (int i = 0; i < errors.length; i++) {
                                out.print(errors[i] + " ");
                            }
                            out.print("</p>");
                        }
                    %>
                    <form action="confirm.jsp" method="post" class="login">
                        <table>
                            <tr>
                                <th colspan="2">Login</th>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td><input type="text" name="email"/></td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td><input type="password" name="pass"/></td>
                            </tr>
                            <tr>
                                <td><input type="submit" value="Submit"/></td>
                                <td><a href="forgot_password.jsp" style="color: black">Forgot your password?</a></td>
                            </tr>
                        </table>
                    </form>
                </center>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
