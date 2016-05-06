<%-- 
    Document   : enter_fee
    Created on : Aug 19, 2015, 11:09:03 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
    <head>
        <title>Lorium | Enter Fee</title>
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
                %>
                <div id="highlight">
                    <h1>Enter the rate/rates you want to change</h1>
                        <form method="post" name="myForm" action="send.jsp" onSubmit="return validateForm();">
                            <input type="hidden" name="process" value="rate"/>
                            <fieldset>
                                <center>
                                    <table>
                                        <tr>
                                            <td>In Rates:</td>
                                            <td><input type="text" name="in"/></td>
                                        </tr>
                                        <tr>
                                            <td>Out Rates:</td>
                                            <td><input type="text" name="out"/></td>
                                        </tr>
                                        <tr>
                                            <td>Water tariff:</td>
                                            <td><input type="text" name="water"/></td>
                                        </tr>
                                        <tr>
                                            <td>Electricity tariff:</td>
                                            <td><input type="text" name="electricity"/></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="submit" name="submit" value="Submit"/></td>
                                        </tr>
                                    </table>
                                </center>
                            </fieldset>
                        <script type="text/javascript">window.onunload = deleteCookie();</script>
                    </form>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
