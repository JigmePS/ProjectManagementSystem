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

        .taddbtn {
            height: 40px;
            width: 80px;
            border-radius: 5px;
            outline: none;
            background-color: var(--title-icon-color);
        }
    </style>

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Add Task</title>
</head>

<body>
<%@ include file="../include/ubase.jsp" %>

<section class="dashboard">

    <div>

        <div class="topnav">
            <span>Add Task</span>
        </div>

        <div class="form-container">
            <form action="user?page=addpstask" method="post" class="addform">
                <label>Date:</label>
                <input type="date" class="dfield" name="date">

                <label>Task Name:</label>
                <input type="text" class="field" name="tname">

                <label>Member:</label>
                <input type="text" class="field" name="tmember">

                <label>Deliverable (Optional):</label>
                <input type="file" class="field" name="deliverable">

                <label>Image (Optional):</label>
                <input type="file" class="field" name="image">

                <input type="submit" value="Add" class="taddbtn">
            </form>
        </div>

    </div>

</section>

</body>

</html>