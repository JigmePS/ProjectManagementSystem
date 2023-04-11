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
            margin-top: 20px;
            margin-bottom: 20px;
            max-width: 740px;
        }

        .pcase a {
            text-decoration: none;
            color: var(--text-color);
        }

        .pcase a:hover {
            color: var(--border-color);
        }

        .pcase span {
            display: block;
            overflow: hidden;
            padding: 20px;
        }

        .equals {
            font-size: 13px;
            padding: 5px;
        }
    </style>

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Project Settings</title>
</head>

<body>
<%@ include file="../include/ubase.jsp" %>

<section class="dashboard">

    <div class="plist">

        <div class="topnav">

            <span>Project Name</span>
            <div class="topnav-right">
                <div class="dropdown">
                    <button class="dropbtn">Option
                        <i class="uil uil-angle-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="#"><i class="uil uil-chart"></i> Tasks</a>
                        <a href="#"><i class="uil uil-user"></i> Members</a>
                        <a href="#"><i class="uil uil-setting"></i> Settings</a>
                    </div>
                </div>
            </div>
        </div>

        <div>

            <div class="pcase">
                <span>Project Name  <a href="#"><i class="uil uil-edit"></i></a></span>
                <span class="equals">Name</span>
                <span>Visibility  <a href="#"><i class="uil uil-edit"></i></a></span>
                <span class="equals">public</span>
            </div>

        </div>

    </div>

</section>

</body>

</html>