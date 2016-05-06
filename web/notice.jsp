<%-- 
    Document   : notice
    Created on : Aug 18, 2015, 10:53:32 AM
    Author     : user
--%>

<%@page import="java.net.*, java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%  
    //connect to server
    Socket clientSocket = new Socket("127.0.0.1", 16000);
    PrintWriter o = new PrintWriter(clientSocket.getOutputStream(),true);
    BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
    int id = Integer.parseInt(request.getParameter("notice_ID"));
    //get the topic with the method from the server
    o.println("11#" + id + "#");
    String t = in.readLine();
    String[] notice = t.split("#");
    String title = notice[0];
    String description = "";
    description = description + notice[1];
    description = description.replace("<div>", "");
    description = description.replace("</div>", "");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lorium | <%= title%></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                <div id="highlight">
                    <%
                    out.println("<h1>" + title + "</h1>");
                    System.out.println("title: " + title);
                    out.println("<p>" + description + "</p>");
                    System.out.println("<p>" + description + "</p>");
                    /**out.println(description);
                    System.out.println("message[1]: " + description);
                    out.println("</p>");*/
                    %>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
