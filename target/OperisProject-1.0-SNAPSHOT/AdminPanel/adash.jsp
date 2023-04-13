<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        .top {
            color: var(--text-color);
        }

        .number {
            font-size: xx-large;
        }
    </style>
    
    <title>Admin Dashboard</title>
</head>

<body>
<%@ include file="../include/abase.jsp" %>

<section class="dashboard">

    <div class="top">
        <div class="search-box">
            <h1>Admin Panel</h1>
        </div>
    </div>

    <div class="dash-content">
        <div class="overview">
            <div class="title">
                <i class="uil uil-compress-point"></i>
                <span class="text">Features</span>
            </div>

            <div class="boxes">
                <div class="box box1">
                    <i class="uil uil-user"></i>
                    <span class="number">User Management</span>
                </div>
                <div class="box box2">
                    <i class="uil uil-chart"></i>
                    <span class="number">Project Management</span>
                </div>
                <div class="box box3">
                    <i class="uil uil-book"></i>
                    <span class="number">Task Management</span>
                </div>

            </div>
        </div>
    </div>

</section>
</body>

</html>