<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">

    <title>Login</title>
</head>

<body>

<div id="RootWrapperLogin">

    <div id="Case">

            <span id="LogInToOperis">
                Log in to Operis
            </span>

        <form action="user" id="Form">

            <input type="hidden" name="page" value="LOGIN">

            <div id="Email">
                <input type="text" name="email" id="EnterEmail" placeholder="Enter Email" />
            </div>

            <div id="Password">

                <input type="password" name="password" id="EnterPassword" placeholder="Enter Password">

                <i class="fa-solid fa-eye" id="Svg"></i>

            </div>

            <input type="submit" value="Log in" id="InputLogin" />

        </form>

        <script src="assets/js/script.js"></script>

        <div id="Line1"></div>

        <a href="user?page=forgot" id="ForgotPassword">
            Forgot password?
        </a>

        <span id="divide">.</span>

        <a href="user?page=newUsers" id="SignUpForAnAccount">
            Sign up for an account
        </a>

    </div>

    <span id="Copyright2023Operis">
            Copyright © 2023 Operis
        </span>

</div>

</body>

</html>