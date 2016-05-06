<%-- 
    Document   : register
    Created on : 19 Oct 2013, 6:52:25 AM
    Author     : ll931217
--%>

<%@page import="java.net.Socket"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, javax.xml.ws.WebServiceRef" %>
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
        <title>Lorium | Register</title>
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
                        if (request.getParameter("error") != null) {
                    %>
                    <p style="color: red"><%= request.getParameter("error")%></p>
                    <%
                        }
                    %>
                    <form action="registration.jsp" method="POST">
                        <table>
                            <tr>
                                <td colspan="2"><i>*All fields are mandatory</i></td>
                            </tr>
                            <tr>
                                <td>Username:</td>
                                <td><input type="text" name="uname"/></td>
                            </tr>
                            <tr>
                                <td>Room Number:</td>
                                <td>
                                    <select name="roomNo">
                                        <%
                                            o.println("16#");
                                            String info = in.readLine();
                                            String [] infos = info.split("#");
                                            int rowTot = Integer.parseInt(infos[0]);
                                            for (int i = 1; i <= rowTot; i++) {
                                                out.println("<option value=\""+ infos[i] + "\">" + infos[i] + "</option>");
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>E-mail:</td>
                                <td><input type="text" name="email"/></td>
                            </tr>
                            <tr>
                                <td>Secret Question:</td>
                                <td>
                                    <select name="secret">
                                        <%
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
                                <td>Your secret answer:</td>
                                <td><input type="text" name="answer" value="Please Change Me"/></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" value="Submit"/></td>
                            </tr>
                        </table>
                    </form>
                </center>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
