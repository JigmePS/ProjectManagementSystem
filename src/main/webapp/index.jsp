<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css">

    <title>Home</title>
</head>

<body>

<div id="RootWrapperHome">

    <div id="Header">

        <a href="">
            <img src="https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/5c7284b7-ee9d-4130-a871-5f7b478885f0"
                 alt="image of Logo" id="Logo">
        </a>

        <a href="login.jsp">
            <div id="Div">
                    <span id="LogIn">
                        Log in
                    </span>
            </div>
        </a>

    </div>

    <span id="ManageAllYourProjectTasksAndFilesInOnePlace">
            Manage all your project tasks, and files, in one place
        </span>
    <span id="WorkOnYourProjectFromAnywhere">
            Work on your project from anywhere.
        </span>

    <form action="user?page=newUsers" method="post" id="Form">

        <div id="EmailInput">
            <input type="text" name="email" placeholder="Email" id="Email" />
        </div>

        <input type="submit" value="Sign up - its free!" id="SignUpButton" />

    </form>

    <span id="Copyright2023Operis">
            Copyright © 2023 Operis
        </span>



</div>

</body>

</html>