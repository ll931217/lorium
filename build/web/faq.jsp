<%-- 
    Document   : faq
    Created on : 20 Oct 2013, 11:15:55 AM
    Author     : ll931217
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lorium | Frequently Asked Questions</title>
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
                    <h1>Frequently Asked Questions</h1>
                    <p>
                        <b>Q. How to get started?</b><br/>
                        A. When you loaded this website, it should of taken you to the homepage. That is where you get started, under the title "Lorium" there should be a navigation bar, use that to get around the main pages of the website
                    </p>
                    <p>
                        <b>Q. How do I send messages?</b><br/>
                        A. In the home page, which you can go there by pressing the home button on the navigation bar. Under the header "Messages", there should be a link on the right hand side called "Compose Message", select that to get started
                    </p>
                    <p>
                        <b>Q. What is "Noticeboard" used for?</b><br/>
                        A. The "Noticeboard" section is for me to inform you, the users, of what is happening on the website, like maintenance, or updates.
                    </p>
                    <p>
                        <b>Q. How do I register?</b><br/>
                        A. Only the administrators of this facility can register new tenants into the system.
                    </p>
                    <p>
                        <b>Q. How do I reply to a message?</b><br/>
                        A. On every message, there should be a reply link, press that and follow the onscreen instructions.
                    </p>
                    <p>
                        <b>Q. How do I check my current profile details?</b><br/>
                        A. Once you log into the site, a bar at the top left-hand corner of the screen will have a message that says "Welcome " and your username that you registered with. If you want to check your current profile information, just click on your username.
                    </p>
                    <p>
                        <b>Q. How do I change my current profile details?</b><br/>
                        A. Go into your profile and there will be a link that says "Edit Profile", select that and it will take you to the page where you can fill in new username and password. Once you filled them in, you have to confirm it with your old password.
                    </p>
                    <p>
                        <b>Q. How is our fees calculated?</b><br/>
                        A. We use this formula: Your fee = (litres used * water tariff) + (kwh used * electricity tariff) + (minutes out * rate if out) + (minutes in * rates if in);
                    </p>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
