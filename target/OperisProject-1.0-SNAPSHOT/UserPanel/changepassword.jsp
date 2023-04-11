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

        .neditbtn {
            margin-top: 30px;
            height: 40px;
            width: 80px;
            border-radius: 5px;
            outline: none;
            background-color: var(--title-icon-color);
        }
    </style>

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Change Password</title>
</head>

<body>
<%@ include file="../include/ubase.jsp" %>

<section class="dashboard">

    <div>

        <div class="topnav">
            <span>Change Password</span>
        </div>

        <div class="form-container">
            <form class="addform">
                <label>Old Password: (Enter password to verify yourself)</label>
                <input type="text" class="pfield" name="tpassword">

                <label>New Password:</label>
                <input type="text" class="pfield" name="npassword">

                <input type="submit" value="Edit" class="neditbtn">
            </form>
        </div>

    </div>

</section>

</body>

</html>