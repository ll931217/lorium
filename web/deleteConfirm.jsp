<%-- 
    Document   : enter_fee
    Created on : Aug 19, 2015, 11:09:03 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
    <head>
        <title>Lorium | Are you sure?</title>
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
            <div id="content">
                <div id="highlight">
                    <%
                        String username = request.getParameter("username");
                    %>
                    <h1>Are you sure you want to delete <%= username %>?</h1>
                    <table style="alignment-adjust: middle">
                        <tr>
                            <td>
                                <form method="post" name="myForm" action="send.jsp">
                                    <input type="hidden" name="process" value="delete"/>
                                    <input type="hidden" name="username" value="<%= username %>"/>
                                    <input type="submit" value="Yes"/>
                                </form>
                            </td>
                            <td>
                                <form method="post" name="myForm" action="profile.jsp">
                                    <input type="submit" value="No"/>
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
