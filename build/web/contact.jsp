<%-- 
    Document   : contact
    Created on : 20 Oct 2013, 7:58:48 AM
    Author     : ll931217
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, javax.xml.ws.WebServiceRef" %>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lorium | Contact me</title>
        <link rel="shortcut icon" href="images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="css/forumStyle.css"/>
        <script src="js/jquery-1.3.js" type="text/javascript"></script>
        <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
        <script src="js/animate.js" type="text/javascript"></script>
        <script src="js/validate.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="container">
            <jsp:include page="header.jsp"/>
            <div id="content">
                <form method="post" name="myForm" action="sendMail.jsp" onSubmit="return validateForm();">
                    <fieldset><legend>Contact me</legend>
                        <center>
                            <table>
                                <tr>
                                    <td style="font-size:10px" colspan="2"><i>Note: all * are required</i></td>
                                </tr>
                                <tr>
                                    <td style="font-size: 10px" colspan="2">This contact me form will allow you to contact Lorium Technology Enterprise</td>
                                </tr>
                                <tr>
                                    <td>Name:<i>*</i></td>
                                    <td><input type="text" tabindex="1" name="name" value="Your Full-name" onClick="this.value = ''" onBlur="formDefault(this);"/></td>
                                </tr>
                                <tr>
                                    <td>Email:<i>*</i></td>
                                    <td><input type="text" name="email" tabindex="2"/></td>
                                </tr>
                                <tr>
                                    <td>Gender:</td>
                                    <td><input type="radio" name="gender" value="Male" tabindex="3"/>Male<input type="radio" name="gender" value="Female"/>Female</td>
                                </tr>
                                <tr>
                                    <td>Rating of the site:</td>
                                    <td><select name="rate">
                                            <option>Excellent</option>
                                            <option>Very good</option>
                                            <option>Good</option>
                                            <option>Bad</option>
                                            <option>Poor</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Comment:</td>
                                    <td><textarea name="comment" onClick="this.value = ''">Comment about the site or if you need help</textarea></td>
                                </tr>
                                <tr>
                                    <td><input type="submit" value="Submit" tabindex="10"/></td>
                                    <td><input type="reset" value="Reset" tabindex="11"/></td>
                                </tr>
                            </table>
                        </center>
                    </fieldset>
                    <script type="text/javascript">window.onunload = deleteCookie();</script>
                </form>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
