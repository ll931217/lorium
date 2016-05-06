<%-- 
    Document   : update_profile
    Created on : 20 Oct 2013, 9:44:23 AM
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            Socket clientSocket = null;
            PrintWriter o = null;
            BufferedReader in = null;
            try {
                //connect to server
                clientSocket = new Socket("127.0.0.1", 16000);
                o = new PrintWriter(clientSocket.getOutputStream(), true);
                in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));

                //gets the parameters from the edit_profile jsp page
                String user_email = session.getAttribute("email").toString();
                String sub = request.getParameter("update");

                String npassword = request.getParameter("npassword");
                String password1 = request.getParameter("opassword1");
                String password2 = request.getParameter("opassword2");
                String uname = request.getParameter("username");
                String sec = request.getParameter("secret");
                String ans = request.getParameter("sAns");
                String ppic = request.getParameter("ppic");

                String saveFile = new String();
                String contentType = request.getContentType();

                if ("Update".equals(sub)) {
                    System.out.println("Updating user details");
                    final String eusername = "loriumtechenterprises";
                    final String password = "ll931217";
                    String title = "Your profile details have been updated";
                    String message = "";
                    String ccEmail = "";

                    //checks if the user wants to change their password
                    if (!npassword.equals("")) {
                        if (password1.equals(password2)) {
                            o.println("20#" + "UPDATE user SET password = '" + npassword + "' WHERE email_address = '" + user_email + "'#");
                            message = message + "<p>Password: " + npassword + "</p>";
                        } else {
                            response.sendRedirect("edit_profile.jsp?status=The_passwords_are_not_the_same");
                        }
                    }

                    //checks if the user wants to change their username
                    if (!uname.equals("")) {
                        o.println("21#" + "SELECT * FROM username = '" + uname + "'#");
                        boolean used = Boolean.getBoolean(in.readLine());
                        if (used) {
                            response.sendRedirect("edit_profile.jsp?status=Username_exists_please_try_again");
                        } else {
                            o.println("20#UPDATE user SET username = '" + uname + "' WHERE email_address = '" + user_email + "'#");
                            o.println("20#UPDATE message SET sender = '" + uname + "' WHERE email = '" + user_email + "'#");
                            message = message + "<p>Username: " + uname + "</p>";
                        }
                    }

                    if (!ans.equals("")) {
                        o.println("22#SELECT question FROM secret WHERE secret_ID = " + sec + "#");
                        String sQues = in.readLine();
                        o.println("20#UPDATE user SET security_q_no = " + sec + ", security_q_ans = '" + ans + "' WHERE email_address = '" + user_email + "'#");
                        message = message + "<p>Secret Question: " + sQues + "</p><p>Secret Answer: " + ans + "</p>";
                    }

                    //checks if the user wants to change their profile pic
                    System.out.println("contentType: " + contentType);
                    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                //if (!ppic.equals("")) {
                        //if (contentType.indexOf("multipart/form-data") >= 0) {
                        System.out.println("CHANGING THE PROFILE PIC!");
                        DataInputStream inp = new DataInputStream(request.getInputStream());
                        String oldPic = session.getAttribute("pic").toString();

                        File oldPicFile = new File(request.getRealPath("/") + "ppic\\" + oldPic);
                        oldPicFile.delete();

                        int formDataLength = request.getContentLength();
                        byte dataBytes[] = new byte[formDataLength];
                        int byteRead = 0;
                        int totalBytesRead = 0;

                        while (totalBytesRead < formDataLength) {
                            byteRead = inp.read(dataBytes, totalBytesRead, formDataLength);
                            totalBytesRead += byteRead;
                        }

                        String file = new String(dataBytes);
                        saveFile = file.substring(file.indexOf("filename=\"") + 10);
                        saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                        saveFile = saveFile.substring(saveFile.indexOf("\\") + 1, saveFile.indexOf("\""));

                        int lastIndex = contentType.lastIndexOf("=");

                        String boundary = contentType.substring(lastIndex + 1, contentType.length());

                        int pos;

                        pos = file.indexOf("filename=\"");
                        pos = file.indexOf("\n", pos) + 1;
                        pos = file.indexOf("\n", pos) + 1;
                        pos = file.indexOf("\n", pos) + 1;

                        int boundaryLocation = file.indexOf(boundary, pos) - 1;

                        int startPos = ((file.substring(0, pos)).getBytes()).length;
                        int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

                        if (!saveFile.equals("")) {
                            o.println("20#" + "UPDATE user SET pic_location = '" + saveFile + "' WHERE email_address = '" + user_email + "'");
                        } else {
                            saveFile = session.getAttribute("pic").toString();
                        }

                        session.setAttribute("pic", saveFile);
                        //saveFile = "C:/Users/user/Documents/NetBeansProjects/LoriumClient/web/ppic/" + saveFile;
                        saveFile = request.getRealPath("/") + saveFile;

                        File ff = new File(saveFile);

                        try {
                            FileOutputStream fileOut = new FileOutputStream(ff);
                            fileOut.write(dataBytes, startPos, (endPos - startPos));
                            fileOut.flush();
                            fileOut.close();

                            File ff2 = new File(saveFile.replace("build/", ""));
                            if (ff != ff2) {
                                FileUtils.copyFile(ff, ff2);
                            }

                            message = message + "<p>Profile picture updated</p>";
                        } catch (Exception e) {
                            throw new Exception(e);
                        }
                    }

                    if (!message.equals("")) {
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
                                return new PasswordAuthentication("loriumtechenterprises@gmail.com", "ll931217");// Specify the Username and the Password
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

                        t.connect("smtp.gmail.com", eusername, password);
                        t.sendMessage(msg, msg.getAllRecipients());
                        t.close();
                        response.sendRedirect("profile.jsp?status=Profile_Updated");
                    } else {
                        response.sendRedirect("edit_profile.jsp");
                    }
                }
            } catch (Exception e) {
                System.out.println("update profile error: " + e);
            }
        %>
    </body>
</html>
