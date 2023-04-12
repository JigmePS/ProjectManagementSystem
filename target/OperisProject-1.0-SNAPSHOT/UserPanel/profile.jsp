<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!----======== CSS ======== -->
    <style>
        .phead span {
            color: var(--text-color);
            font-size: 25px;
            overflow: hidden;
            padding: 20px;
        }

        .chead span {
            color: var(--text-color);
            font-size: 20px;
            overflow: hidden;
            padding: 20px;
        }

        .pcase, .ccase {
            border: 3px solid var(--border-color);
            border-radius: 10px;
            overflow: hidden;
            padding: 20px;
            color: var(--text-color);
            margin-bottom: 20px;
            max-width: 740px;
        }

        .pcase a, .ccase a {
            text-decoration: none;
            color: var(--text-color);
        }

        .pcase a:hover, .ccase a:hover {
            color: var(--border-color);
        }

        .pcase span {
            display: block;
            overflow: hidden;
            padding: 20px;
        }

        .ccase span {
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

    <title>Profile Page</title>
</head>

<body>
<%@ include file="../include/ubase.jsp" %>

<section class="dashboard">

    <div>

        <div class="phead">
            <span><b>Profile</b></span>
        </div>
        <div class="pcase">
            <span>Full Name</span>
            <span class="equals">${fname}</span>
            <span>Password &nbsp;&nbsp;&nbsp; <a href="user?page=editup"><i class="uil uil-edit"></i></a></span>
            <span class="equals">********</span>
        </div>

        <div class="chead">
            <span><b>Contact</b></span>
        </div>
        <div class="ccase">
            <span>Email address</span>
            <span class="equals">${email}</span>
        </div>

    </div>
</section>

</body>

</html>