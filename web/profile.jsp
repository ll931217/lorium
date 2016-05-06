<%-- 
    Document   : profile
    Created on : 19 Oct 2013, 12:20:52 PM
    Author     : ll931217
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, javax.xml.ws.WebServiceRef, java.net.*" %>
<%@page errorPage="error.jsp" %>
<%
    //connects to the service
    Socket clientSocket = new Socket("127.0.0.1", 16000);
    PrintWriter o = new PrintWriter(clientSocket.getOutputStream(),true);
    BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
    //assigning values to the variables
    String email = session.getAttribute("email").toString();
    
    o.println("4#" + email);//Get Username
    String username = in.readLine();
    
    o.println("7#" + email);//Get the user secret questions
    String question = in.readLine();
    
    o.println("8#" + email);//Get the secret answer
    String answer = in.readLine();
    
    o.println("5#" + email);//the number of messages the user sent
    int posts = Integer.parseInt(in.readLine());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lorium | Profile: <%= username%></title>
        <link rel="shortcut icon" href="images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="css/forumStyle.css"/>
        <script src="js/jquery-1.3.js" type="text/javascript"></script>
        <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
        <script src="js/animate.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="container">
            <jsp:include page="header.jsp"/>
            <%
                //o.println("20#" + "SELECT * FROM message#");
                //checks if the user is logged in
                if (request.getParameter("status") != null) {
                    String status = request.getParameter("status");
                    String [] message = status.split("_");
                    for (int i = 0; i < message.length; i++) {
                        status = status + message[i] + " ";
                    }
                }
                //checks to see if the user is logged in before he/she can view their profile
                if (session.getAttribute("email") == null) {
                    out.println("Sorry please login, page will redirect in 5 seconds:<br/>");
                    for (int i = 0; i < 5; i++) {
                        out.print(i + ", ");
                        try {
                            Thread.sleep(5000);
                            if (i == 4) {
                                response.sendRedirect("login.jsp?error=Log_In_First");
                            }
                        } catch (InterruptedException ex) {
                            System.err.println("loginCheck error " + ex);
                        }
                    }
                } else {
            %>
            <div id="content">
                <%
                    //gets the messages sent to this page and displays it
                    if (request.getParameter("status") != null) {
                %>
                    <p><%
                            String status = request.getParameter("status");
                            String stats[] = status.split("_");
                            for (int i = 0; i < stats.length; i++) {
                                out.print(stats[i] + " ");
                            }
                    %></p>
                <%
                    }
                    //System.out.println("After the checking status part.");
                %>
                <div id="highlight">
                    <h1><%= username%></h1>
                    <table style="margin: 0 20px; width: 100%">
                        <tr>
                            <!--<td>Profile Picture:</td>-->
                            <td colspan="2" style="text-align: right; padding-right: 3%"><a href="edit_profile.jsp" style="color:#FF9300">Edit Profile</a></td>
                        </tr>
                        <!--<tr>
                            <td colspan="2"><img src="ppic/<%= session.getAttribute("pic")%>" height="260" width="260" alt="Profile Picture"/></td>
                        </tr>-->
                        <tr>
                            <td>Email:</td>
                            <td style="padding: 0 25px"><%= email %></td>
                        </tr>
                        <tr>
                            <td>Account Type:</td>
                            <td style="padding: 0 25px">
                                <% if (session.getAttribute("type").equals("A")) { %>
                                    Administrator
                                <%} else {%>
                                    Tenant
                                <%}%>
                            </td>
                        </tr>
                        <tr>
                            <td>Posts: </td>
                            <td style="padding: 0 25px"><%= posts %></td>
                        </tr>
                        <tr>
                            <td>Security Question:</td>
                            <td style="padding: 0 25px"><%=question%></td>
                        </tr>
                        <tr>
                            <td>Security Answer:</td>
                            <td style="padding: 0 25px"><%= answer%></td>
                        </tr>
                        <% 
                            if (session.getAttribute("type").equals("T")) {
                                o.println("24#SELECT * FROM room, user WHERE user.email_address = '" + session.getAttribute("email") + "' AND room.user_ID = user.user_ID");
                                String fee = in.readLine();
                                String fees[] = fee.split("#");
                        %>
                        <tr style="color:#01A9DB">
                            <td>Minutes are out this month:</td>
                            <td style="padding: 0 25px"><%= fees[0] %> minutes</td>
                        </tr>
                        <tr style="color:#01A9DB">
                            <td>Utility fee this month:</td>
                            <td style="padding: 0 25px">R<%= fees[1] %></td>
                        </tr>
                        <tr style="color:#01A9DB">
                            <td>Total fee this month:</td>
                            <td style="padding: 0 25px">R<%= fees[2] %></td>
                        </tr>
                        <% } else if (session.getAttribute("type").equals("A")) {%>
                        <tr>
                            <td><a href="enter_fee.jsp" style="color:#FF9300">Enter Fee</a></td>
                            <td><a href="enter_rates.jsp" style="color:#FF9300; padding: 0 25px">Change rates</a></td>
                        </tr>
                        <tr>
                            <td colspan="2"><a href="delete.jsp" style="color:#FF9300">Delete a user</a></td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>
            <%
                }
            %>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
