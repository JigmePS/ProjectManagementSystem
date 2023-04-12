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

    <title>Edit Project</title>
</head>

<body>
<%@ include file="../include/ubase.jsp" %>

<section class="dashboard">

    <div>

        <div class="topnav">
            <span>Edit Project</span>
        </div>

        <div class="form-container">
            <form action="user?page=editproject" method="post" class="addform">
                <c:forEach var="project" items="${pdetail}">
                    <label>Project Name:</label>
                    <input type="text" class="pfield" name="pname" value="${project.pname}">

                    <label>Visibility:</label>
                    <select class="status" name="status" placeholder="Select">
                        <option value="" disabled selected>Select</option>
                        <option value="public">public</option>
                        <option value="private">private</option>
                    </select>
                </c:forEach>
                <input type="submit" value="Edit" class="peditbtn">

            </form>
        </div>


    </div>

</section>

</body>

</html>