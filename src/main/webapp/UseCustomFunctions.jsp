<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="wmelf" uri="WorldManagerTags" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-center">
            <c:import url="header.jsp" />
        </div>
        <div class="row">
            <div class="col-4">
                <c:import url="navbar.jsp" />
            </div>
            <div class="col-8">
                <h2>SQUARE of 2.0</h2>
                <span>${wmelf:square(2.0)}</span>
                <h2>SQUARE ROOT of 16.0</h2>
                <span>${wmelf:sqrt(16.0)}</span>
            </div>
        </div>
    </div>
    <c:import url="footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
