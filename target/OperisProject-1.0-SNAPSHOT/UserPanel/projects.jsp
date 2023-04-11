<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Your Projects</title>
</head>

<body>
<%@ include file="../include/ubase.jsp"%>

<section class="dashboard">
  <div class="top">


    <div class="search-box">
      <h1>Your Projects</h1>

    </div>

    <ul>
      <c:forEach var="project" items="${yourplist}">
        <a><li>${project.pname}</li></a>
      </c:forEach>
    </ul>

  </div>

</section>

</body>

</html>