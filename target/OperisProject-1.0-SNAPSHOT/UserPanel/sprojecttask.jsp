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

        .taddbtn {
            text-decoration: none;
            float: right;
            right: 0;
            vertical-align: middle;
            font-size: 16px;
            border: 1px solid var(--text-color);
            border-radius: 10px;
            outline: none;
            color: var(--text-color);
            padding: 10px 16px;
            background-color: inherit;
            font-family: inherit;
            /* Important for vertical align on mobile phones */
            margin: 0;
            /* Important for vertical align on mobile phones */
        }

        .taddbtn:hover {
            background-color: var(--box3-color);
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
        }

        .task-table a {
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
            <span>${pname}</span>
            <div class="topnav-right">
            </div>
            <a class="taddbtn" href="user?page=addpst"><i class="uil uil-plus-circle">Add Task</i></a>
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
                    <th>Images(Optional)</th>
                </tr>
                </thead>
                <tbody id="paginated-list" data-current-page="1" aria-live="polite">
                <c:forEach var="task" items="${stlist}">
                    <tr>
                        <td>${task.tdate}</td>
                        <td>${task.tname}</td>
                        <td>${task.taskMember}</td>
                        <td>${task.deliverable}</td>
                        <td>${task.imge}</td>
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