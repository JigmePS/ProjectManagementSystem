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

        .taddbtn {
            display: inline-block;
            right: 0;
            vertical-align: middle;
            font-size: 16px;
            border: none;
            outline: none;
            color: var(--text-color);
            padding: 14px 16px;
            background-color: inherit;
            font-family: inherit;
            /* Important for vertical align on mobile phones */
            margin: 0;
            /* Important for vertical align on mobile phones */
        }

        .table-container {
            height: 79vh;
            border-bottom: 1px solid var(--border-color);
            overflow: hidden;
        }

        .task-table {
            border-bottom: 1px solid var(--border-color);
            overflow: hidden;
            width: 100%;
            color: var(--text-color);
            table-layout: fixed;
        }

        .task-table th {
            border-bottom: 2px solid var(--border-color);
            overflow: hidden;
            text-align: left;
            width: 17%;
            padding-top: 12px;
            padding-bottom: 12px;
        }

        .task-table td {
            border-bottom: 1px solid var(--border-color);
            overflow: hidden;
            padding-top: 10px;
            padding-bottom: 10px;
            width: 17%;
        }

        .action {
            text-align: center;
        }

        .task-table .acbtn {
            max-width: 30px;
            overflow: hidden;
        }

        .task-table .abtn {
            text-align: center;
            text-decoration: none;
            padding: 10px 20px;
            border: 1px solid;
            border-radius: 10px;
            background-color: var(--box3-color);
            color: var(--text-color);
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
                <a class="taddbtn" href="user?page=addt"><i class="uil uil-plus-circle"></i></a>
            </div>
        </div>

        <main>
            <div class="table-container">
                <table class="task-table">
                    <thead>
                    <tr>
                        <th>Date</th>
                        <th>Task</th>
                        <th>Member</th>
                        <th>Deliverable</th>
                        <th>Images</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="paginated-list" data-current-page="1" aria-live="polite">
                    <c:forEach var="task" items="${tlist}">
                        <tr>
                            <td>${task.tdate}</td>
                            <td>${task.tname}</td>
                            <td>${task.taskMember}</td>
                            <td>
<%--                                <a class="acbtn" href="user?page=download&filePath=${task.deliverable}">--%>
                                    ${task.deliverable}
<%--                                </a>--%>
                            </td>
                            <td>
<%--                                <a class="acbtn" href="user?page=download&filePath=${task.imge}">--%>
                                    ${task.imge}
<%--                                </a>--%>
                            </td>
                            <td class="action"><a class="abtn" href="user?page=editt&tid=${task.tid}">
                                <i class="uil uil-edit-alt"></i>Edit</a></td>
                        </tr>
                    </c:forEach>
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