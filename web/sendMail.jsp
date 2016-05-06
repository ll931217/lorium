<%-- 
    Document   : sendMail
    Created on : Aug 25, 2015, 10:47:44 AM
    Author     : user
--%>


<%@page import="com.sun.mail.smtp.SMTPTransport"%>
<%@page import="java.security.Security"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%@page import="java.io.*, java.util.*, javax.servlet.*, javax.mail.*, javax.mail.internet.*, javax.activation.*, javax.servlet.http.*, javax.xml.ws.WebServiceRef" %>
<%@page import="com.sun.mail.smtp.SMTPTransport, java.security.Security, java.util.Date, java.util.Properties, javax.mail.Message, javax.mail.MessagingException, javax.mail.PasswordAuthentication, javax.mail.Session, javax.mail.internet.AddressException, javax.mail.internet.InternetAddress, javax.mail.internet.MimeMessage" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            final String username = "loriumtechenterprises";
            final String password = "ll931217";
            String senderEmail = request.getParameter("email");
            String title = "Comment by: " + request.getParameter("name");
            String message = "<p>Name: " + request.getParameter("name")
                    + "<p>Email: " + senderEmail
                    + "<p>Gender: " + request.getParameter("gender") + "</p>"
                    + "<p>Rating: " + request.getParameter("rate").trim() + "</p>"
                    + "<p>Comment: " + request.getParameter("comment") + "</p>";
            String ccEmail = "";
            Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
            // Get a Properties object
            Properties props = System.getProperties();
            props.setProperty("mail.smtps.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
            props.setProperty("mail.smtp.socketFactory.fallback", "false");
            props.setProperty("mail.smtp.port", "465");
            props.setProperty("mail.smtp.socketFactory.port", "465");
            props.setProperty("mail.smtps.auth", "true");

            /*
             If set to false, the QUIT command is sent and the connection is immediately closed. If set 
             to true (the default), causes the transport to wait for the response to the QUIT command.
             */
            props.put("mail.smtps.quitwait", "false");

            Session ses = Session.getInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("loriumtechenterprises@gmail.com", "ll931217");// Specify the Username and the PassWord
                }
            });

            // -- Create a new message --
            final MimeMessage msg = new MimeMessage(ses);

            msg.setFrom(new InternetAddress(senderEmail));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse("loriumtechenterprises@gmail.com", false));

            if (ccEmail.length() > 0) {
                msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(ccEmail, false));
            }

            msg.setSubject(title);
            msg.setContent(message, "text/html");
            msg.setSentDate(new Date());

            SMTPTransport t = (SMTPTransport) ses.getTransport("smtps");

            t.connect("smtp.gmail.com", username, password);
            t.sendMessage(msg, msg.getAllRecipients());
            t.close();
            response.sendRedirect("index.jsp?status=Email_Sent");
        %>
    </body>
</html>
