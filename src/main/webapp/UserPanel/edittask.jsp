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

        .topnav-right {
            float: right;
            margin-top: 10px;
        }

        .tdelbtn {
            vertical-align: middle;
            text-decoration: none;
            padding: 5px;
            border-radius: 5px;
            background-color: red;
            color: black;
        }

        .tdelbtn:hover {
            background-color: darkred;
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

        .dfield {
            min-width: 150px;
            height: 40px;
            border-radius: 5px;
            margin-bottom: 20px;
            padding-left: 10px;
        }

        .field {
            min-width: 300px;
            height: 40px;
            border-radius: 5px;
            margin-bottom: 20px;
            padding-left: 10px;
        }

        .field:focus {
            outline: none;
        }

        .teditbtn {
            height: 40px;
            width: 80px;
            border-radius: 5px;
            outline: none;
            background-color: var(--title-icon-color);
        }

        .teditbtn:hover {
            background-color: var(--box3-color);
        }
    </style>

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Edit Task</title>
</head>

<body>
<%@ include file="../include/ubase.jsp" %>

<section class="dashboard">

    <div>

        <div class="topnav">
            <span>Edit Task</span>
            <div class="topnav-right">
                <c:forEach var="task" items="${tlist}">
                    <a class="tdelbtn" href="user?page=deletetask&tid=${task.tid}"><i class="uil uil-x"></i>Delete Task</a>
                </c:forEach>
            </div>
        </div>

        <div class="form-container">
            <form action="user?page=edittask" method="post" class="addform">
                <c:forEach var="task" items="${tlist}">
                    <label>Date:</label>
                    <input type="date" class="dfield" name="date" value="${task.tdate}">

                    <label>Task Name:</label>
                    <input type="text" class="field" name="tname" value="${task.tname}">

                    <label>Member:</label>
                    <input type="text" class="field" name="tmember" value="${task.taskMember}">

                    <label>Deliverable (Optional):</label>
                    <input type="file" class="field" name="deliverable" value="${task.deliverable}">

                    <label>Image (Optional):</label>
                    <input type="file" class="field" name="image" value="${task.imge}">
                </c:forEach>

                <input type="submit" value="Edit" class="teditbtn">
            </form>

        </div>

    </div>

</section>

</body>

</html>