<%@ page contentType="text/html;charset=UTF-8" language="java"
    import="com.ray.jstl.dbmodels.*
            , com.ray.jstl.helpers.*
            , com.ray.jstl.models.WebUser
            , java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>List Cities</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-center">
            <c:import url="../header.jsp" />
        </div>

        <c:choose>
            <c:when test="${sessionScope.cityData == null}" >
                <c:redirect url="${initParam.hostURL}${pageContext.request.contextPath}/Protected/citycontroller.do" />
            </c:when>
            <c:otherwise>
                <h1><c:out value="Welcome back ${sessionScope.authorized_user.uid}" /></h1>
            </c:otherwise>
        </c:choose>

        <div class="row">
            <div class="col-4">
                <c:import url="../navbar.jsp" />
            </div>
            <div class="col-8">
                <table border="1">
                    <tr>
                        <td>Id</td>
                        <td>Name</td>
                        <td>CountryCode</td>
                        <td>Country</td>
                        <td>Population</td>
                        <td>Image</td>
                        <td>Action</td>
                    </tr>
                    <c:forEach var="tempCity" items="${sessionScope.cityData}" varStatus="iterationCount">
                        <c:url var="updateLink" value="${initParam.hostURL}${pageContext.request.contextPath}/Protected/citycontroller.do">
                            <c:param name="command" value="LOAD" />
                            <c:param name="cityId" value="${tempCity.id}" />
                        </c:url>
                        <c:url var="deleteLink" value="${initParam.hostURL}${pageContext.request.contextPath}/Protected/citycontroller.do">
                            <c:param name="command" value="DELETE" />
                            <c:param name="cityId" value="${tempCity.id}" />
                        </c:url>
                        <tr>
                            <td>${tempCity.id}</td>
                            <td>${tempCity.name}</td>
                            <td>${tempCity.countryCode}</td>
                            <td>${tempCity.country}</td>
                            <td>${tempCity.population}</td>
<%--                            <td>${tempCity.imageUrl}</td>--%>
                            <td><img src="${initParam.hostURL}${pageContext.request.contextPath}/FileDisplayServlet/${tempCity.imageUrl}"></td>
                            <td>
                                <a href="${updateLink}">Update</a>
                                 |
                                <a href="${deleteLink}"
                                   onclick="if(!confirm('Are you sure you want to delete this city?')) return false;"
                                >Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                Page
                <c:forEach var="i" begin="1" end="${totalPage}">
                    <a href="${initParam.hostURL}${pageContext.request.contextPath}/Protected/citycontroller.do?pageNumber=${i}">
                        <c:out value="${i}" />
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>
    <c:import url="../footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
