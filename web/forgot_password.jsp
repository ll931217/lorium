<%-- 
    Document   : forgot_password
    Created on : 19 Oct 2013, 8:06:12 AM
    Author     : ll931217
--%>

<%@page import="java.net.Socket"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, javax.xml.ws.WebServiceRef" %>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lorium | Forgot Password</title>
        <link rel="shortcut icon" href="images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="css/forumStyle.css"/>
        <script src="js/jquery-1.3.js" type="text/javascript"></script>
        <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
        <script src="js/animate.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="container">
            <jsp:include page="header.jsp"/>
            <div id="content">
                <center>
                    <%
                        //gets the error messages that is sent here
                        if (request.getParameter("error") != null) {
                    %>
                    <p style="color: red"><%= request.getParameter("error")%></p>
                    <%
                        }
                    %>
                    <div id="highlight">
                        <h1>Identity Test</h1>
                        <form action="new_password.jsp" method="POST">
                            <table>
                                <tr>
                                    <td>Email:</td>
                                    <td><input type="text" name="email"/></td>
                                </tr>
                                <tr>
                                    <td>Secret question:</td>
                                    <td>
                                        <select name="secret">
                                            <%
                                                //connects to the server
                                                Socket clientSocket = new Socket("127.0.0.1", 16000);
                                                PrintWriter o = new PrintWriter(clientSocket.getOutputStream(),true);
                                                BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
                                                //connects to the database to get the secret questions that is in there
                                                o.println("17#");
                                                String fo = in.readLine();
                                                String [] fos = fo.split("#");
                                                int tot = Integer.parseInt(fos[0]);
                                                for (int i = 1; i < tot; i++) {
                                                    out.println("<option value=\""+ i + "\">" + fos[i] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Answer:</td>
                                    <td><input type="text" name="answer"/></td>
                                </tr>
                                <tr>
                                    <td><input type="submit" name="Submit"/></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </center>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
