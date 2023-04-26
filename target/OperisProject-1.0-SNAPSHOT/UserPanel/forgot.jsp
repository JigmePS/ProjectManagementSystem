<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/forgot.css">

    <title>Forgot Password</title>
</head>

<body>

<div id="RootWrapperForgot">

    <div id="Case">

            <span id="ForgotPassword">
                Forgot Password?
            </span>
        <span id="UseYourEmailToRecoverYourPassword">
                Use your email to recover your password
            </span>

        <form action="user?page=forgotpassword" method="post" id="Form">

            <div id="Email">
                <input type="text" id="EnterEmail" name="email" placeholder="Enter Email"/>
            </div>

            <input type="submit" value="Send Email" id="InputSend"/>

        </form>

        <div id="Line1"></div>

        <span id="Remember">
                Remember?
            </span>
        <a href="user?page=logins" id="LogIn">
            Log in
        </a>

    </div>

    <span id="Copyright2023Operis">
            Copyright © 2023 Operis
        </span>

</div>

</body>

</html>