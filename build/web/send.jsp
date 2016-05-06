<%-- 
    Document   : send
    Created on : Aug 21, 2015, 2:25:48 PM
    Author     : user
--%>
<%@page import="java.net.Socket"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, javax.servlet.*, javax.servlet.http.*, javax.xml.ws.WebServiceRef" %>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%
    //connect to server
    Socket clientSocket = new Socket("127.0.0.1", 16000);
    PrintWriter o = new PrintWriter(clientSocket.getOutputStream(),true);
    BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            //gets the name of the processes from the other games
            String process = request.getParameter("process");
            if (process != null) {
                if (process.equals("message")) {
                    String from = request.getParameter("from");
                    System.out.println("send.jsp from: " + from);
                    String to = request.getParameter("to");
                    System.out.println("send.jsp to: " + to);
                    String name = request.getParameter("title");
                    System.out.println("send.jsp title: " + name);
                    String area = request.getParameter("area");
                    System.out.println("send.jsp area: " + area);
                    o.println("14#" + from + "#" + to + "#" + name + "#" + area + "#");
                    response.sendRedirect("index.jsp?status=Message_Sent");
                } else if (process.equals("fee")) {
                    String rid = request.getParameter("roomID");
                    String water = request.getParameter("water");
                    String power = request.getParameter("power");
                    String ou = request.getParameter("out");
                    o.println("15#" + rid + "#" + water + "#" + power + "#" + ou + "#");
                    response.sendRedirect("index.jsp?status=Database_Updated");
                } else if (process.equals("rate")) {
                    String inRate = request.getParameter("in");
                    String outRate = request.getParameter("out");
                    String water = request.getParameter("water");
                    String elec = request.getParameter("electricity");
                    final String regExp = "[0-9]+([,.][0-9]{1,2})?";
                    if (inRate.matches(regExp)) {
                        if (inRate != null) {
                            o.println("20#UPDATE rates SET in_rate = " + inRate);
                        }
                    } else if (outRate.matches(regExp)) {
                        if (outRate != null) {
                            o.println("20#UPDATE rates SET out_rate = " + outRate);
                        }
                    } else if (water.matches(regExp)) {
                        if (water != null) {
                            o.println("20#UPDATE rates SET water = " + water);
                        }
                    } else if (elec.matches(regExp)) {
                        if (elec != null) {
                            o.println("20#UPDATE rates SET electricity = " + elec);
                        }
                    } else {
                        response.sendRedirect("enter_rates.jsp?status=The_Data_Input_is_Wrong");
                    }
                    response.sendRedirect("index.jsp?status=Database_Updated");
                } else if (process.equals("delete")) {
                    String username = request.getParameter("username");
                    
                    o.println("25#" + username);
                    String email = in.readLine();
                    o.println("9#" + email + "#T");
                    String userID = in.readLine();
                    o.println("20#UPDATE room SET user_ID = 0, kilolitres = 0, kilowatts = 0, minutes_out = 0, room_available = true WHERE user_ID = " + userID);
                    o.println("10#" + email + "#");
                    String picLoc = in.readLine();
                    File ppic = new File("ppic/" + picLoc);
                    ppic.delete();
                    o.println("20#DELETE * FROM message WHERE message.sender = '" + username + "'");
                    o.println("20#DELETE * FROM user WHERE user.username = '" + username + "'");
                    
                    response.sendRedirect("profile.jsp?status=User_Deleted");
                }
            }
        %>
    </body>
</html>
