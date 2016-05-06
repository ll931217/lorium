<%-- 
    Document   : confirm
    Created on : Oct 17, 2013, 3:35:02 PM
    Author     : ll931217
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, javax.servlet.*, javax.servlet.http.*, javax.xml.ws.WebServiceRef, java.net.*" %>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            //Connect to the server
            try {     
                Socket clientSocket = new Socket("127.0.0.1", 16000);
                PrintWriter o = new PrintWriter(clientSocket.getOutputStream(),true);
                BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
                
                boolean auth = false;
                
                String email = "";
                String password = "";
                try {//the authentication process by calling the method in the database
                    email = request.getParameter("email");
                    password = request.getParameter("pass");
                    o.println("2#" + email + "#" + password + "#");
                    String sRes = in.readLine();
                    auth = Boolean.parseBoolean(sRes);
                } catch (Exception e) {
                    out.println("Login error " + e);
                }
                
                o.println("4#" + email + "#");
                String user_name = in.readLine();

                if (auth) {
                    //adds attributes to the session for the user after the authentication
                    o.println("6#" + email + "#");
                    String aType = in.readLine();
                    session.setAttribute("type", aType);
                    session.setAttribute("email", email);
                    session.setAttribute("creator", user_name);
                    o.println("9#" + email + "#" + aType + "#");
                    String userID = in.readLine();
                    session.setAttribute("userID", userID);
                    o.println("10#" + email + "#");
                    String pic = in.readLine();
                    session.setAttribute("pic", pic);
                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("login.jsp?error=Invalid_Login_Details");
                }
            } catch (NoRouteToHostException nrth) {
                System.out.println("Incorrect Hostname entered please try again");
            } catch(IOException e) {
                System.out.println("The server has not been started please start server");
            } catch (NullPointerException npe) {
                System.out.println("The server has not been started please start server");
            }

            
        %>
    </body>
</html>
