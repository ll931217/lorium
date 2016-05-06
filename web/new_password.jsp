<%-- 
    Document   : new_password
    Created on : 19 Oct 2013, 8:29:42 AM
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
        <title>Lorium | New Password</title>
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
                        //assigning values to the variables
                        String email = request.getParameter("email");
                        o.println("21#SELECT * FROM user WHERE email_address = '" + email + "'#");
                        boolean exists = Boolean.parseBoolean(in.readLine());
                        String username = "";
                        //checks if the email exists
                        if (exists) {
                            o.println("22#SELECT * FROM user, secret WHERE user.email_address = '" + email + "' AND secret_q_no = secret_ID");
                            String question = in.readLine();
                            String asked = request.getParameter("secret").trim();
                            //checks if the passwords match
                            if (question.equals(asked)) {
                                o.println("23#SELECT * FROM user, secret WHERE user.email_address = '" + email + "'");
                                String ans = in.readLine();
                                String answered = request.getParameter("answer");
                                //checks to see if the answers matched
                                if (ans.equals(answered)) {
                                    response.sendRedirect("new_password.jsp");
                                    username = email;
                                }
                            }
                        } else {
                            response.sendRedirect("forgot_password.jsp?error=Invalid_email_question_or_answer");
                        }
                    %>
                    <h1>Please fill in the form</h1>
                    <form action="change_password.jsp" method="POST">
                        <input type="hidden" name="email" value="<%= email%>" />
                        <table>
                            <tr>
                                <td>New Password:</td>
                                <td><input type="password" name="password"/></td>
                            </tr>
                            <tr>
                                <td>Confirm Password:</td>
                                <td><input type="password" name="password1"/></td>
                            </tr>
                            <tr>
                                <td><input type="submit" value="Submit"/></td>
                            </tr>
                        </table>
                    </form>
                </center>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
