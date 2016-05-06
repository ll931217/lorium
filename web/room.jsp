<%-- 
    Document   : room
    Created on : 19 Oct 2015, 7:58:48 AM
    Author     : ll931217
--%>

<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="com.sun.mail.smtp.SMTPTransport"%>
<%@page import="java.security.Security"%>
<%@page import="java.net.Socket"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="random.RandomString" %>
<%@page import="java.io.*, java.util.*, javax.servlet.*, javax.mail.*, javax.mail.internet.*, javax.activation.*, javax.servlet.http.*, javax.xml.ws.WebServiceRef" %>
<%@page import="com.sun.mail.smtp.SMTPTransport, java.security.Security, java.util.Date, java.util.Properties, javax.mail.Message, javax.mail.MessagingException, javax.mail.PasswordAuthentication, javax.mail.Session, javax.mail.internet.AddressException, javax.mail.internet.InternetAddress, javax.mail.internet.MimeMessage" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%
    //connect to server
    Socket clientSocket = new Socket("127.0.0.1", 16000);
    PrintWriter o = new PrintWriter(clientSocket.getOutputStream(), true);
    BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lorium | Room Details</title>
        <link rel="shortcut icon" href="images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="css/forumStyle.css"/>
        <script src="js/jquery-1.3.js" type="text/javascript"></script>
        <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
        <script src="js/animate.js" type="text/javascript"></script>
        <script src="js/validate.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="container">
            <jsp:include page="header.jsp"/>
            <div id="general" style="padding: 20px 50px 40px 50px; margin: 50px 50px 20px">
                <h1 style="color: white">Room details for tenants</h1>
                <table style="border-width: 2px; border-style: solid; border-color: white; color: white; font-size: 20px; font-style: normal; font-family: Arial; width: 100%; overflow: hidden">
                    <tr style="border-width: 2px; border-style: solid; border-color: white; color: #FF9300; font-weight: bold">
                        <th style="border-width: 2px; border-style: solid; border-color: white">Room ID</th>
                        <th style="border-width: 2px; border-style: solid; border-color: white">Tenant Username</th>
                        <th style="border-width: 2px; border-style: solid; border-color: white">Water used(l)</th>
                        <th style="border-width: 2px; border-style: solid; border-color: white">Electricity used(kw)</th>
                        <th style="border-width: 2px; border-style: solid; border-color: white">Time Out(min)</th>
                        <th style="border-width: 2px; border-style: solid; border-color: white">Availability</th>
                    </tr>
                    <%
                        try {
                            o.println("26#");
                            String id = in.readLine();
                            System.out.println("id: " + id);
                            String ids[] = id.split("#");
                            LinkedList ll = new LinkedList();
                            for (String i:ids) {
                                ll.add(i);
                            }
                            int size = ll.size()/6;
                            for (int x = 0; x < size; x++) {
                                out.println("<tr style=\"border-width: 2px; border-style: solid; border-color: white\">");
                                for (int y = 0; y < 6; y++) {
                                    out.println("<td style=\"border-width: 2px; border-style: solid; border-color: white; text-align: center\">" + ll.remove() + "</td>");
                                }
                                out.println("</tr>");
                            }
                        } catch (Exception e) {
                            System.out.println("Exception: " + e);
                        }
                    %>
                </table>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
