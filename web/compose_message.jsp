<%-- 
    Document   : post_topic
    Created on : 18 Oct 2013, 10:58:24 PM
    Author     : ll931217
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lorium | Compose Message</title>
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
                    <div id="highlight">
                        <h1>Compose a Message</h1>
                        <center>
                            <form action="send.jsp" method="POST">
                                <input type="hidden" name="process" value="message"/>
                                <input type="hidden" name="from" value="<%= session.getAttribute("email")%>" />
                                <%
                                    if (session.getAttribute("sender") != null) {
                                        out.println("<input type=\"hidden\" name=\"to\" value=\"" + session.getAttribute("sender") + "\" />");
                                    }
                                %>
                                <table>
                                    <tr>
                                        <td>From:</td>
                                        <td><%= session.getAttribute("creator") %></td>
                                    </tr>
                                    <tr>
                                        <td>To:</td>
                                        <td>
                                            <%
                                                if (session.getAttribute("sender") != null) {
                                                    out.println(session.getAttribute("sender"));
                                                } else {
                                                    out.println("<input type=\"text\" name=\"to\" />");
                                                }
                                            %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Message title:</td>
                                        <td><input type="text" name="title"/></td>
                                    </tr>
                                    <tr>
                                        <td>Message:</td>
                                        <td><textarea name="area" rows="10" cols="50"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td><input type="submit" value="Send!"/></td>
                                    </tr>
                                </table>
                            </form>
                        </center>
                    </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
