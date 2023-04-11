<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!----======== CSS ======== -->
    <style>
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

        .sbar {
            width: 100%;
            height: 50px;
            position: relative;
            padding-top: 5px;
            padding-bottom: 5px;
            border-bottom: 1px solid var(--border-color);
            overflow: hidden;
        }

        .sicon {
            width: 25px;
            height: 25px;
            object-fit: cover;
            position: absolute;
            left: 10px;
            top: 10px;
            border: none;
            outline: none;
            background-color: transparent;
            color: var(--text-color);
        }

        .sfield {
            background-color: var(--panel-color);
            color: var(--text-color);
            font-size: 16px;
            font-family: "Segoe UI", sans-serif;
            font-weight: 400;
            line-height: 20px;
            text-align: left;
            min-height: 18px;
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            border: solid 1px var(--text-color);
            border-radius: 20px;
            padding-left: 40px;
        }

        .table-container {
            height: 72vh;
            border-bottom: 1px solid var(--border-color);
            overflow: hidden;
        }

        .task-table {
            padding-top: 5px;
            border-bottom: 1px solid var(--border-color);
            overflow: hidden;
            width: 100%;
            color: var(--text-color);
        }

        .task-table td {
            border-bottom: 1px solid var(--border-color);
            overflow: hidden;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .task-table .sname {
            width: 90%;
        }

        .task-table .joinreq {
            width: 10%;
            text-align: right;
            padding-right: 20px;
        }

        .task-table .joinreq a {
            background-color: var(--black-light-color);
            color: var(--page-number-color);
            text-decoration: none;
            border: transparent;
            border-radius: 5px;
            padding: 10px 20px;
        }

        .task-table .joinreq a:hover {
            border: 1px solid var(--text-color);
            border-radius: 5px;
            background-color: var(--border-color);
        }

        .hidden {
            display: none;
        }

        .pagination-container {
            width: calc(100% - 2rem);
            display: flex;
            align-items: center;
            /* position: absolute; */
            bottom: 0;
            padding: 1rem 0;
            justify-content: center;
        }

        .pagination-number,
        .pagination-button {
            font-size: 1.1rem;
            background-color: transparent;
            border: none;
            margin: 0.25rem 0.25rem;
            cursor: pointer;
            height: 2.5rem;
            width: 2.5rem;
            border-radius: .2rem;
            color: var(--text-color);
        }

        .pagination-number:hover,
        .pagination-button:not(.disabled):hover {
            background: var(--border-color);
        }

        .pagination-number.active {
            color: var(--page-number-color);
            background: var(--black-light-color);
        }
    </style>

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>User Dashboard Panel</title>
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
            <form>
                <div class="sbar">
                    <input type="text" class="sfield" placeholder="Search" />
                    <button type="submit" class="sicon">
                        <i class="uil uil-search"></i>
                    </button>
                </div>
            </form>
        </div>

        <main>
            <div class="table-container">
                <table class="task-table">
                    <tbody id="paginated-list" data-current-page="1" aria-live="polite">
                    <tr>
                        <td class="sname">224234</td>
                        <td class="joinreq"><a href="">Join</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <nav class="pagination-container">
                <button class="pagination-button" id="prev-button" aria-label="Previous page" title="Previous page">
                    &lt;
                </button>

                <div id="pagination-numbers">

                </div>

                <button class="pagination-button" id="next-button" aria-label="Next page" title="Next page">
                    &gt;
                </button>
            </nav>
        </main>

    </div>

</section>

<script>
    const paginationNumbers = document.getElementById("pagination-numbers");
    const paginatedList = document.getElementById("paginated-list");
    const listItems = paginatedList.querySelectorAll("tr");
    const nextButton = document.getElementById("next-button");
    const prevButton = document.getElementById("prev-button");

    const paginationLimit = 11
    // <---yo number le page ma list item ko limit rakhne
    const pageCount = Math.ceil(listItems.length / paginationLimit);
    let currentPage = 1;

    const disableButton = (button) => {
        button.classList.add("disabled");
        button.setAttribute("disabled", true);
    };

    const enableButton = (button) => {
        button.classList.remove("disabled");
        button.removeAttribute("disabled");
    };

    const handlePageButtonsStatus = () => {
        if (currentPage === 1) {
            disableButton(prevButton);
        } else {
            enableButton(prevButton);
        }

        if (pageCount === currentPage) {
            disableButton(nextButton);
        } else {
            enableButton(nextButton);
        }
    };

    const handleActivePageNumber = () => {
        document.querySelectorAll(".pagination-number").forEach((button) => {
            button.classList.remove("active");
            const pageIndex = Number(button.getAttribute("page-index"));
            if (pageIndex == currentPage) {
                button.classList.add("active");
            }
        });
    };

    const appendPageNumber = (index) => {
        const pageNumber = document.createElement("button");
        pageNumber.className = "pagination-number";
        pageNumber.innerHTML = index;
        pageNumber.setAttribute("page-index", index);
        pageNumber.setAttribute("aria-label", "Page " + index);

        paginationNumbers.appendChild(pageNumber);
    };

    const getPaginationNumbers = () => {
        for (let i = 1; i <= pageCount; i++) {
            appendPageNumber(i);
        }
    };

    const setCurrentPage = (pageNum) => {
        currentPage = pageNum;

        handleActivePageNumber();
        handlePageButtonsStatus();

        const prevRange = (pageNum - 1) * paginationLimit;
        const currRange = pageNum * paginationLimit;

        listItems.forEach((item, index) => {
            item.classList.add("hidden");
            if (index >= prevRange && index < currRange) {
                item.classList.remove("hidden");
            }
        });
    };

    window.addEventListener("load", () => {
        getPaginationNumbers();
        setCurrentPage(1);

        prevButton.addEventListener("click", () => {
            setCurrentPage(currentPage - 1);
        });

        nextButton.addEventListener("click", () => {
            setCurrentPage(currentPage + 1);
        });

        document.querySelectorAll(".pagination-number").forEach((button) => {
            const pageIndex = Number(button.getAttribute("page-index"));

            if (pageIndex) {
                button.addEventListener("click", () => {
                    setCurrentPage(pageIndex);
                });
            }
        });
    });
</script>

</body>

</html>