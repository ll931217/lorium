<%-- 
    Document   : topicPage
    Created on : Oct 17, 2013, 2:16:10 PM
    Author     : ll931217
--%>

<%@page import="java.net.*, java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<%  
    //connect to server
    Socket clientSocket = new Socket("127.0.0.1", 16000);
    PrintWriter o = new PrintWriter(clientSocket.getOutputStream(),true);
    BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
    int id = Integer.parseInt(request.getParameter("message_ID"));
    //get the topic with the method from the server
    o.println("13#" + id + "#");
    String t = in.readLine();
    String[] message = t.split("#");
    String title = message[0];
    String description = message[1];
    description = description.replace("<div>", "");
    description = description.replace("</div>", "");
    String sender = message[2];
    
    int c_id = 0;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Display the title with the topic name -->
        <title>Lorium | <%= title %></title>
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
                    <h1><%= title%><span style="font-size: 16px; margin-top: 20px">Sent by: <%= sender %></span></h1>
                    <p>
                        <%= description %>
                        <span class="comment"><a href="compose_message.jsp">Reply</a></span>
                        <%
                            session.setAttribute("sender", sender);
                        %>
                    </p>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
