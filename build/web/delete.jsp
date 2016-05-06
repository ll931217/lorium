<%-- 
    Document   : enter_fee
    Created on : Aug 19, 2015, 11:09:03 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
    <head>
        <title>Lorium | Delete a user</title>
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
                    <h1>Which user to delete?</h1>
                        <form method="post" name="myForm" action="deleteConfirm.jsp">
                            <fieldset>
                                <center>
                                    <table>
                                        <tr>
                                            <td>Username:</td>
                                            <td><input type="text" name="username"/></td>
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
