<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!----======== CSS ======== -->
    <style>
        /* Add a black background color to the top navigation */
        .topnav {
            /* background-color: #333; */
            border-bottom: 1px solid var(--border-color);
            overflow: hidden;
        }

        /* Style the links inside the navigation bar */
        .topnav span {
            float: left;
            color: var(--text-color);
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
        }

        .addform {
            color: var(--text-color);
            padding: 20px;
        }

        .addform label {
            display: block;
            padding-bottom: 20px;
        }

        .addform input {
            display: block;
        }

        .pfield {
            min-width: 300px;
            height: 40px;
            border-radius: 5px;
            margin-bottom: 20px;
            padding-left: 10px;
        }

        .pfield:focus {
            outline: none;
        }

        .status {
            min-width: 100px;
            height: 40px;
            border-radius: 5px;
            margin-bottom: 30px;
            text-align: center;
        }

        .peditbtn {
            margin-top: 10px;
            height: 40px;
            width: 80px;
            border-radius: 5px;
            outline: none;
            background-color: var(--title-icon-color);
        }

        .peditbtn:hover {
            background-color: var(--box3-color);
        }
    </style>

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Edit User</title>
</head>

<body>
<%@ include file="../include/abase.jsp" %>

<section class="dashboard">

    <div>

        <div class="topnav">
            <span>Edit User</span>
        </div>

        <div class="form-container">
            <c:forEach var="user" items="${udetail}">
                <form action="admin?page=edituser&uid=${user.id}" method="post" class="addform">
                    <label>Full Name:</label>
                    <input type="text" class="pfield" value="${user.fullName}" name="fname">

                    <label>Email:</label>
                    <input type="text" class="pfield" value="${user.email}" name="email">

                    <label>Password:</label>
                    <input type="text" class="pfield" value="${user.password}" name="password">

                    <input type="submit" value="Edit" class="peditbtn">
                </form>
            </c:forEach>
        </div>

    </div>

</section>

</body>

</html>