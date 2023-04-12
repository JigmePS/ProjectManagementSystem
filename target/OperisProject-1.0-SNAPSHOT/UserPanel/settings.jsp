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

        /* Right-aligned section inside the top navigation */
        .topnav-right {
            float: right;
        }

        .dropdown {
            float: left;
            overflow: hidden;
        }

        /* Dropdown button */
        .dropdown .dropbtn {
            font-size: 16px;
            border: none;
            outline: none;
            color: var(--text-color);
            padding: 14px 16px;
            background-color: inherit;
            min-width: 135.03px;
            font-family: inherit;
            /* Important for vertical align on mobile phones */
            margin: 0;
            /* Important for vertical align on mobile phones */
        }

        /* Add a red background color to navbar links on hover */
        .dropdown:hover .dropbtn {
            background-color: var(--box3-color);
        }

        /* Dropdown content (hidden by default) */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: var(--box3-color);
            min-width: 135.03px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        /* Links inside the dropdown */
        .dropdown-content a {
            float: none;
            color: var(--text-color);
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        /* Add a grey background color to dropdown links on hover */
        .dropdown-content a:hover {
            background-color: gray;
        }

        /* Show the dropdown menu on hover */
        .dropdown:hover .dropdown-content {
            display: block;
        }

        .pcase {
            border: 3px solid var(--border-color);
            border-radius: 10px;
            overflow: hidden;
            padding: 20px;
            color: var(--text-color);
            margin-bottom: 20px;
            max-width: 740px;
        }

        .ecase {
            overflow: hidden;
            padding: 10px;
            color: var(--text-color);
            margin-top: 10px;
            max-width: 740px;
        }

        .dcase {
            overflow: hidden;
            padding: 10px;
            color: var(--text-color);
            margin-top: 250px;
            margin-right: 20px;
            max-width: 740px;
        }

        .pcase a, .ecase a {
            text-decoration: none;
            color: var(--text-color);
        }

        .ecase a:hover {
            color: var(--border-color);
        }


        .pcase span {
            display: block;
            overflow: hidden;
            padding: 20px;
        }

        .pedit {
            float: right;
        }

        .dcase a {
            text-decoration: none;
            color: red;
        }

        .dcase a:hover {
            text-decoration: none;
            color: darkred;
        }

        .delbtn {
            float: right;
        }

        .equals {
            font-size: 13px;
            padding: 5px;
        }
    </style>

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <title>Project Settings</title>
</head>

<body>
<%@ include file="../include/ubase.jsp" %>

<section class="dashboard">

    <div class="plist">

        <div class="topnav">
            <c:forEach var="project" items="${pdetail}">
                <span>${project.pname}</span>
            </c:forEach>
            <div class="topnav-right">
                <div class="dropdown">
                    <button class="dropbtn">${option}
                        <i class="uil uil-angle-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="user?page=tasks"><i class="uil uil-chart"></i> Tasks</a>
                        <a href="user?page=setting"><i class="uil uil-setting"></i> Settings</a>
                    </div>
                </div>
            </div>
        </div>

        <div>

            <div class="ecase">
                <span class="pedit"><a href="user?page=editp">Edit<i class="uil uil-edit"></i></a></span>
            </div>

            <div class="pcase">
                <c:forEach var="project" items="${pdetail}">
                    <span>Project Name:</span>
                    <span class="equals">${project.pname}</span>
                    <span>Visibility:</span>
                    <span class="equals">${project.pstatus}</span>
                </c:forEach>
            </div>

            <div class="dcase">
                <span class="delbtn"><a href="user?page=deleteproject"><i class="fa-solid fa-x fa-xl"></i> Delete Project</a></span>
            </div>

        </div>

    </div>

</section>

</body>

</html>