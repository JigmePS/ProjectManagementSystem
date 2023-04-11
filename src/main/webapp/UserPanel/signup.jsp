<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/signup.css">

    <title>Signup</title>
</head>

<body>
<div id="RootWrapperSignUp">

    <div id="Case">

            <span id="SignUpToOperis">
                Sign up to Operis
            </span>

        <form action="user?page=signup" method="post" id="Form">

            <input type="hidden" name="page" value="SIGNUP">

            <div id="EmailAddress">
                <%
                    String e= (String) request.getAttribute("email");
                    if(e==null) {
                        e="";
                    } %>
                <input type="text" name="email" id="EnterEmail" placeholder="Enter Email" value="<%= e%>"/>
            </div>

            <div id="FullName">
                <input type="text" name="fname" id="EnterFullName" placeholder="Enter full name" />
            </div>

            <div id="Password">

                <input type="password" name="password" id="EnterPassword" placeholder="Enter Password">

                <i class="fa-solid fa-eye" id="Svg"></i>

            </div>

            <input type="submit" value="Sign up" id="InputSignup" />

        </form>

        <div id="Line1"></div>

        <span id="AlreadyHaveAnAccount">
                Already have an account?
            </span>
        <a href="user?page=login" id="LogIn">
            Log in
        </a>

    </div>

    <span id="Copyright2023Operis">
            Copyright © 2023 Operis
        </span>

</div>

</body>

</html>