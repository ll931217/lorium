<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.net.Socket"%>
<%@page import="java.util.*"%>
<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->

<%
    Socket clientSocket;
    PrintWriter o;
    BufferedReader in;
    try {
        clientSocket = new Socket("127.0.0.1", 16000);
        o = new PrintWriter(clientSocket.getOutputStream(),true);
        in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
    } catch (Exception ex) {
        throw new Exception("<center><p style=\"color:red; font-size: 32px; text-align:center; width: 30%; padding: 20px; background-color: black\">The Server is Offline</p></center>");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Lorium</title>
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
            <% session.setAttribute("sender", null); %>
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
                    <h1>Noticeboard</h1>
                    <p>
                        <a href="highlight1.jsp">The site is still under maintenance</a><br/>
                        <a href="tnc.jsp">Terms and Conditions</a><br/>
                        <%
                           try {
                                o.println("12#");
                                String serverRes = in.readLine();

                                String[] sRes = serverRes.split("#");
                                int rowTot = Integer.parseInt(sRes[2]);

                                for (int i = 0; i <= rowTot + rowTot - 1; i++) {
                                    out.println("<a href=\"notice.jsp?notice_ID=" + sRes[i] + "\">" + sRes[i+1] + "</a><br/>");
                                    for (int j = 2; j < sRes.length - 2; j++) {
                                        //Deletes the rowTot value and move the array up to remove the null values that it makes
                                        sRes[j] = sRes[j+1];
                                        sRes[j+1] = sRes[j+2];
                                    }
                                    i++;
                                }
                            } catch (java.rmi.RemoteException ex) {
                                throw new Exception("remote error " + ex);
                            } catch (Exception ex) {
                                throw new Exception("<p style=\"color:red; font-size: 32px; text-align:center; width: 30%; padding: 20px; background-color: black\">The Server is Offline</p>");
                            }
                        %>
                    </p>
                </div>
                <%
                if (session.getAttribute("email") != null) {
                %>
                <div id="general">
                    <h1>Your Messages</h1>
                    <p>
                        <span style="margin-top: -20px"><a href="compose_message.jsp">Compose Message</a></span>
                        <%
                           try {
                                String userID = session.getAttribute("userID").toString();
                                o.println("1#" + userID + "#");
                                String serverRes = in.readLine();
                                //System.out.println("serverRes: " + serverRes);

                                String[] sRes = serverRes.split("#");
                                int rowTot = Integer.parseInt(sRes[0]);
                                int i = 1;

                                while (i <= (rowTot * 3)) {
                                    out.println("<a href=\"messagePage.jsp?message_ID=" + sRes[i] + "\">" + sRes[i+1] + "</a><span style=\"font-size: 12px\">(From: " + sRes[i+2] + ")</span><br/>");
                                    //System.out.println("<a href=\"messagePage.jsp?message_ID=" + sRes[i] + "\">" + sRes[i+1] + "</a><span style=\"font-size: 12px\">(From: " + sRes[i+2] + ")</span><br/>");
                                    i+=3;
                                }
                            } catch (java.rmi.RemoteException ex) {
                                throw new Exception("remote error " + ex);
                            } catch (Exception ex) {
                                throw new Exception("Message error " + ex);
                            }
                        %>
                    </p>
                </div>
                <%
                }
                %>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
