<%@page import="javax.swing.*, java.io.*, java.sql.*, java.net.*, java.util.*" %>
<%
    Socket clientSocket = new Socket("127.0.0.1", 16000);
    PrintWriter o = new PrintWriter(clientSocket.getOutputStream(),true);
    BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
    //checks if the user is logged in
    String username = "";
    if (session.getAttribute("email") != null) {
        try {
            //if the user is logged in, it will get the username
            String email_add = session.getAttribute("email").toString();
            o.println("4#" + email_add + "#");
            username = in.readLine();
        } catch (Exception ex) {
            throw new Exception("some error " + ex);
        }
%>
<!-- The username is then printed out here -->
<div class="welcome"><p>Welcome <a href="profile.jsp"><%= username%></a></p></div>
<%
    }
%>
<div id="header">
    <h1 style="font-size: 32px">Lorium</h1>
</div>
<div id="nav">
    <nav id="navigate">
        <div id="main-navs">
            <ul>
                <li class="home"><p><a href="index.jsp">Home</a></p><p class="subtext">To HOME!</p></li>
                <li class="faq"><p><a href="faq.jsp">FAQ</a></p><p class="subtext">Frequently Asked Questions</p></li>
                <% if ((session.getAttribute("email") != null) && (session.getAttribute("type").equals("A"))) { %>
                    <li class="room"><p><a href="room.jsp">Room</a></p><p class="subtext">Check room details</p></li>
                    <li class="register"><p><a href="register.jsp">Register</a></p><p class="subtext">To comment!</p></li>
                <% }%>
                <li class="contact"><p><a href="contact.jsp">Contact Us</a></p><p class="subtext">Sends a message to the Admins</p></li>
            </ul>
        </div>
        <div id="login">
             <% 
                if ((session.getAttribute("email") != null) && (session.getAttribute("type").equals("T"))) { 
                    o.println("27#");
                    String rate = in.readLine();
                    String [] rates = rate.split("#");
                    out.println("<span style=\"border-style:solid; border-width: 2px; padding: 5px\"> In Rate: R"+ rates[0] + "/min || Out Rates: R" + rates[1] + "/min || Water Tariff: R" + rates[2] + "/min || Electricity Tariff: R" + rates[3] + "/min </span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
                }
             %>
            <%
                if (session.getAttribute("email") == null) {
            %>
            <a href="login.jsp">Login</a>
            <%  } else {
            %>
            <a href="logout.jsp">Logout</a>
            <%  }
            %>
        </div>
    </nav>
</div>
