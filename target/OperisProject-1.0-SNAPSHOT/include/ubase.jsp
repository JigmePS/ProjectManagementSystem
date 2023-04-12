<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!----======== CSS ======== -->
    <style>
        /* ===== Google Font Import - Poppins ===== */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        :root {
            /* ===== Colors ===== */
            --primary-color: #0E4BF1;
            --panel-color: #FFF;
            --text-color: #000;
            --black-light-color: #707070;
            --border-color: #e6e5e5;
            --toggle-color: #DDD;
            --box1-color: #4DA3FF;
            --box2-color: #FFE6AC;
            --box3-color: #E7D1FC;
            --title-icon-color: #fff;
            --page-number-color: #fff;
            /* ====== Transition ====== */
            --tran-05: all 0.5s ease;
            --tran-03: all 0.3s ease;
            --tran-03: all 0.2s ease;
        }

        body {
            min-height: 100vh;
            background-color: var(--primary-color);
        }

        body.dark {
            --primary-color: #3A3B3C;
            --panel-color: #242526;
            --text-color: #CCC;
            --black-light-color: #CCC;
            --border-color: #4D4C4C;
            --toggle-color: #FFF;
            --box1-color: #3A3B3C;
            --box2-color: #3A3B3C;
            --box3-color: #3A3B3C;
            --title-icon-color: #CCC;
            --page-number-color: #000;
        }

        /* === Custom Scroll Bar CSS === */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        ::-webkit-scrollbar-thumb {
            background: var(--primary-color);
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #0b3cc1;
        }

        body.dark::-webkit-scrollbar-thumb:hover,
        body.dark .activity-data::-webkit-scrollbar-thumb:hover {
            background: #3A3B3C;
        }

        #sidenav {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px;
            padding: 10px 14px;
            background-color: var(--panel-color);
            border-right: 1px solid var(--border-color);
            transition: var(--tran-05);
        }

        #sidenav .close {
            width: 73px;
        }

        #sidenav .logo-name {
            display: flex;
            align-items: center;
        }

        #sidenav .logo-image {
            display: flex;
            justify-content: center;
            min-width: 45px;
        }

        #sidenav .logo-image img {
            width: 100%;
            object-fit: cover;
            border-radius: 50%;
        }

        #sidenav .logo-name .logo_name {
            font-size: 22px;
            font-weight: 600;
            color: var(--text-color);
            margin-left: 14px;
            transition: var(--tran-05);
        }

        #sidenav .close .logo_name {
            opacity: 0;
            pointer-events: none;
        }

        #sidenav .menu-items {
            margin-top: 40px;
            height: calc(100% - 90px);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .menu-items li {
            list-style: none;
        }

        .menu-items li a {
            display: flex;
            align-items: center;
            height: 50px;
            text-decoration: none;
            position: relative;
        }

        .nav-links li a:hover:before {
            content: "";
            position: absolute;
            left: -7px;
            height: 5px;
            width: 5px;
            border-radius: 50%;
            background-color: var(--primary-color);
        }

        body.dark li a:hover:before {
            background-color: var(--text-color);
        }

        .menu-items li a i {
            font-size: 24px;
            min-width: 45px;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--black-light-color);
        }

        .menu-items li a .link-name {
            font-size: 18px;
            font-weight: 400;
            color: var(--black-light-color);
            transition: var(--tran-05);
        }

        #sidenav .close li a .link-name {
            opacity: 0;
            pointer-events: none;
        }

        .nav-links li a:hover i,
        .nav-links li a:hover .link-name {
            color: var(--primary-color);
        }

        body.dark .nav-links li a:hover i,
        body.dark .nav-links li a:hover .link-name {
            color: var(--text-color);
        }

        .menu-items .logout-mode {
            padding-top: 10px;
            border-top: 1px solid var(--border-color);
        }

        .menu-items .mode {
            display: flex;
            align-items: center;
            white-space: nowrap;
        }

        .menu-items .mode-toggle {
            position: absolute;
            right: 14px;
            height: 50px;
            min-width: 45px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }

        .mode-toggle .switch {
            position: relative;
            display: inline-block;
            height: 22px;
            width: 40px;
            border-radius: 25px;
            background-color: var(--toggle-color);
        }

        .switch:before {
            content: "";
            position: absolute;
            left: 5px;
            top: 50%;
            transform: translateY(-50%);
            height: 15px;
            width: 15px;
            background-color: var(--panel-color);
            border-radius: 50%;
            transition: var(--tran-03);
        }

        body.dark .switch:before {
            left: 20px;
        }

        .dashboard {
            position: relative;
            left: 250px;
            background-color: var(--panel-color);
            min-height: 100vh;
            width: calc(100% - 250px);
            padding: 10px 14px;
            transition: var(--tran-05);
        }

        #sidenav .close ~ .dashboard {
            left: 73px;
            width: calc(100% - 73px);
        }

        .dashboard .top {
            position: fixed;
            top: 0;
            left: 250px;
            display: flex;
            width: calc(100% - 250px);
            justify-content: space-between;
            align-items: center;
            padding: 10px 14px;
            background-color: var(--panel-color);
            transition: var(--tran-05);
            z-index: 10;
        }

        #sidenav.close ~ .dashboard .top {
            left: 73px;
            width: calc(100% - 73px);
        }

        .dashboard .top .sidebar-toggle {
            font-size: 26px;
            color: var(--text-color);
            cursor: pointer;
        }

        .dashboard .top .search-box {
            position: relative;
            height: 45px;
            max-width: 600px;
            width: 100%;
            margin: 0 30px;
        }

        .top .search-box input {
            position: absolute;
            border: 1px solid var(--border-color);
            background-color: var(--panel-color);
            padding: 0 25px 0 50px;
            border-radius: 5px;
            height: 100%;
            width: 100%;
            color: var(--text-color);
            font-size: 15px;
            font-weight: 400;
            outline: none;
        }

        .top .search-box i {
            position: absolute;
            left: 1px;
            font-size: 22px;
            z-index: 10;
            top: 50%;
            transform: translateY(-50%);
            color: var(--black-light-color);
        }

        .top img {
            width: 40px;
            border-radius: 50%;
        }

        .dashboard .dash-content {
            padding-top: 50px;
        }

        .dash-content .title {
            display: flex;
            align-items: center;
            margin: 60px 0 30px 0;
        }

        .dash-content .title i {
            position: relative;
            height: 35px;
            width: 35px;
            background-color: var(--primary-color);
            border-radius: 6px;
            color: var(--title-icon-color);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
        }

        .dash-content .title .text {
            font-size: 24px;
            font-weight: 500;
            color: var(--text-color);
            margin-left: 10px;
        }

        .dash-content .boxes {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .dash-content .boxes .box {
            display: flex;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: calc(100% / 3 - 15px);
            padding: 15px 20px;
            background-color: var(--box1-color);
            transition: var(--tran-05);
        }

        .boxes .box i {
            font-size: 35px;
            color: var(--text-color);
        }

        .boxes .box .text {
            white-space: nowrap;
            font-size: 18px;
            font-weight: 500;
            color: var(--text-color);
        }

        .boxes .box .number {
            font-size: 40px;
            font-weight: 500;
            color: var(--text-color);
        }

        .boxes .box.box2 {
            background-color: var(--box2-color);
        }

        .boxes .box.box3 {
            background-color: var(--box3-color);
        }

        .dash-content .activity .activity-data {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .activity .activity-data {
            display: flex;
        }

        .activity-data .data {
            display: flex;
            flex-direction: column;
            margin: 0 15px;
        }

        .activity-data .data-title {
            font-size: 20px;
            font-weight: 500;
            color: var(--text-color);
        }

        .activity-data .data .data-list {
            font-size: 18px;
            font-weight: 400;
            margin-top: 20px;
            white-space: nowrap;
            color: var(--text-color);
        }

        @media (max-width: 1000px) {
            #sidenav {
                width: 73px;
            }

            #sidenav.close {
                width: 250px;
            }

            #sidenav .logo_name {
                opacity: 0;
                pointer-events: none;
            }

            #sidenav .close .logo_name {
                opacity: 1;
                pointer-events: auto;
            }

            #sidenav li a .link-name {
                opacity: 0;
                pointer-events: none;
            }

            #sidenav .close li a .link-name {
                opacity: 1;
                pointer-events: auto;
            }

            #sidenav ~ .dashboard {
                left: 73px;
                width: calc(100% - 73px);
            }

            #sidenav .close ~ .dashboard {
                left: 250px;
                width: calc(100% - 250px);
            }

            #sidenav ~ .dashboard .top {
                left: 73px;
                width: calc(100% - 73px);
            }

            #sidenav .close ~ .dashboard .top {
                left: 250px;
                width: calc(100% - 250px);
            }

            .activity .activity-data {
                overflow-X: scroll;
            }
        }

        @media (max-width: 780px) {
            .dash-content .boxes .box {
                width: calc(100% / 2 - 15px);
                margin-top: 15px;
            }
        }

        @media (max-width: 560px) {
            .dash-content .boxes .box {
                width: 100%;
            }
        }

        @media (max-width: 500px) {
            .dashboard .top .sidebar-toggle {
                display: none;
            }
        }

        .images {
            max-width: 30px;
            height: auto;
        }
    </style>

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>User Dashboard Panel</title>
</head>

<body>
<nav id="sidenav">
    <div class="logo-name">
        <div class="images">
            <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="image of Logo">
        </div>

        <span class="logo_name">OPERIS</span>
    </div>

    <div class="menu-items">
        <ul class="nav-links">
            <li><a href="user?page=home">
                <i class="uil uil-estate"></i>
                <span class="link-name">Home</span>
            </a></li>
            <li><a href="user?page=listyourprojects">
                <i class="uil uil-files-landscapes"></i>
                <span class="link-name">Your Projects</span>
            </a></li>
            <li><a href="user?page=searchbox">
                <i class="uil uil-search"></i>
                <span class="link-name">Search</span>
            </a></li>


        </ul>

        <ul class="logout-mode">
            <li><a href="user?page=profile">
                <i class="uil uil-user-circle"></i>
                <span class="link-name">${fname}</span>
            </a></li>
            <li class="mode">
                <a href="#">
                    <i class="uil uil-moon"></i>
                    <span class="link-name">Dark Mode</span>
                </a>

                <div class="mode-toggle">
                    <span class="switch"></span>
                </div>
            </li>
            <li><a href="user?page=logout">
                <i class="uil uil-signout"></i>
                <span class="link-name">Logout</span>
            </a></li>

        </ul>
    </div>
</nav>

<script>
    const body = document.querySelector("body"),
        modeToggle = body.querySelector(".mode-toggle");
    sidebar = body.querySelector("#sidenav");
    sidebarToggle = body.querySelector(".sidebar-toggle");
    let getMode = localStorage.getItem("mode");
    if (getMode && getMode === "dark") {
        body.classList.toggle("dark");
    }
    let getStatus = localStorage.getItem("status");
    if (getStatus && getStatus === "close") {
        sidebar.classList.toggle("close");
    }
    modeToggle.addEventListener("click", () => {
        body.classList.toggle("dark");
        if (body.classList.contains("dark")) {
            localStorage.setItem("mode", "dark");
        } else {
            localStorage.setItem("mode", "light");
        }
    });
    sidebarToggle.addEventListener("click", () => {
        sidebar.classList.toggle("close");
        if (sidebar.classList.contains("close")) {
            localStorage.setItem("status", "close");
        } else {
            localStorage.setItem("status", "open");
        }
    })
</script>

</body>

</html>