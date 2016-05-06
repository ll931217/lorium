<%-- 
    Document   : registration
    Created on : 19 Oct 2013, 7:27:14 AM
    Author     : ll931217
--%>

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
        <title></title>
    </head>
    <body>
        <%
            //initialising the variables
            String user_name = "";
            String room_ID = "";
            String user_email = "";
            String user_password = "";
            //String user_confirm = "";
            String user_question = "";
            //String user_question_ID = "";
            String user_answer = "";
            boolean isEmail;

            try {
                //gets the parameters from the register page
                user_name = request.getParameter("uname");
                room_ID = request.getParameter("roomNo");
                user_email = request.getParameter("email");
                user_question = request.getParameter("secret");
                user_answer = request.getParameter("answer");

                //Randomly generates a password with 8 characters
                RandomString rs = new RandomString(8);
                user_password = rs.nextString();

                //Validates the email with regex
                isEmail = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$").matcher("user_email").matches();

                //checks if the email is valid
                if (!isEmail) {
                    o.println("18#" + user_email + "#");
                    boolean isUser = Boolean.getBoolean(in.readLine());
                    System.out.println(isUser);
                    if (isUser) {
                        response.sendRedirect("register.jsp?error=email_already_exists");
                    } else {
                        System.out.println(user_question);
                        o.println("22#SELECT question FROM secret WHERE secret_ID = " + user_question);
                        String sQues = in.readLine();
                        final String username = "loriumtechenterprises";
                        final String password = "ll931217";
                        String title = "Here is your login details";
                        String message = "<p>Hello " + user_name + "</p>"
                                + "<p>Email: " + user_email + "</p>"
                                + "<p>Password: " + user_password + "</p>"
                                + "<i>The password is randomly generated, if you can't remember it, it is recommended that you change the password by logging in with this current password and change it in your profile</i>"
                                + "<p>Secret Question: " + sQues + "</p>"
                                + "<p>Secret Answer: " + user_answer + "</p>"
                                + "<i>Please change your Secret question and answer</i>";
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

                        props.put("mail.smtps.quitwait", "false");

                        Session ses = Session.getInstance(props, new javax.mail.Authenticator() {
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication("loriumtechenterprises@gmail.com", "ll931217");// Specify the Username and the PassWord
                            }
                        });

                        // -- Create a new message --
                        final MimeMessage msg = new MimeMessage(ses);

                        msg.setFrom(new InternetAddress("loriumtechenterprises@gmail.com"));
                        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user_email, false));

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
                        o.println("20#INSERT INTO user(email_address, password, security_q_no, security_q_ans, username, user_type, pic_location) VALUES ('" + user_email + "', '" + user_password + "', " + user_question + ", '" + user_answer + "', '" + user_name + "', 'T', 'default.jpg')");
                        o.println("9#" + user_email + "#T");
                        String userID = in.readLine();
                        System.out.println("registration.jsp userID: " + userID);
                        o.println("20#UPDATE room SET user_ID = " + userID + " WHERE room_ID = " + room_ID);
                        response.sendRedirect("index.jsp?status=User_Registered");
                    }
                } else {
                    response.sendRedirect("register.jsp?error=Invalid_Email");
                }
            } catch (java.rmi.RemoteException ex) {
                out.println(ex);
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
