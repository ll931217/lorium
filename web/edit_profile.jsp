<%-- 
    Document   : edit_profile
    Created on : 20 Oct 2013, 10:10:27 AM
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
    Socket clientSocket = null;
    PrintWriter o = null;
    BufferedReader in = null;
    try {
        //connect to server
        clientSocket = new Socket("127.0.0.1", 16000);
        o = new PrintWriter(clientSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
    } catch (Exception e) {
        throw new Exception(e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lorium | Update Profile</title>
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
                //checks if the user is logged in
                if (request.getParameter("status") != null) {
                    String status = request.getParameter("status");
                    String[] message = status.split("_");
                    for (int i = 0; i < message.length; i++) {
                        status = status + message[i] + " ";
                    }
                }
            %>
            <div id="highlight" style="margin: 40px 5px 20px">
                <h1 style="color:white">Enter the value you want to change</h1>
                <form action="update_profile.jsp" method="GET" enctype="multipart/form-data" style="color:white; background-color: #486C82">
                    <center>
                        <table>
                            <tr>
                                <td><fieldset style="border-color: #2C1515; border-style: solid"><legend>Change your username</legend>
                                        Username:<br/><input type="text" name="username"/>
                                    </fieldset></td>
                            </tr>
                            <!--<tr>
                                <td><fieldset style="border-color: #2C1515; border-style: solid"><legend>Change your profile picture</legend>
                                        Profile Picture:<br/><input type="file" name="ppic" accept="image/*"/>
                                    </fieldset></td>
                            </tr>-->
                            <tr>
                                <td><fieldset style="border-color: #2C1515; border-style: solid"><legend>Change your password</legend>
                                        New Password:<br/><input type="password" name="npassword"/><br/><br/>
                                        Old password:<br/><input type="password" name="opassword1"/><br/><br/>
                                        Confirm old password:<br/><input type="password" name="opassword2"/>
                                    </fieldset></td>
                            </tr>
                            <tr>
                                <td><fieldset style="border-color: #2C1515; border-style: solid"><legend>Change your security question</legend>
                                        Secret Question:<br/>
                                        <select name="secret" id="secret">
                                            <%
                                                //connects to the database to get the secret questions that is in there
                                                o.println("17#");
                                                String fo = in.readLine();
                                                String[] fos = fo.split("#");
                                                int tot = Integer.parseInt(fos[0]);
                                                for (int i = 1; i < tot; i++) {
                                                    out.println("<option value=\"" + i + "\">" + fos[i] + "</option>");
                                                }
                                            %>
                                        </select><br/><br/>
                                        Your secret answer:<br/><input type="text" name="sAns"/>
                                    </fieldset></td>
                            </tr>
                            <tr>
                                <td><fieldset style="border-color: #2C1515; border-style: solid">
                                        <input type="submit" name="update" value="Update"/>
                                    </fieldset></td>
                            </tr>
                        </table>
                    </center>
                </form>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
