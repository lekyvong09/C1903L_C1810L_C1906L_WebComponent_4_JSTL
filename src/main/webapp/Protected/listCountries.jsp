<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-center">
        <c:import url="../header.jsp" />
    </div>
    <c:choose>
<%--        <c:when test="${sessionScope.authorized_user == null}">--%>
<%--            <c:redirect url="../login.jsp?dest=listCountries" />--%>
<%--        </c:when>--%>
<%--        <c:when test="${sessionScope.authorized_user.authLevel < 1}">--%>
<%--            <c:redirect url="../login.jsp?dest=listCountries" />--%>
<%--        </c:when>--%>
<%--        <c:when test="${sessionScope.authorized_user.uid == null}">--%>
<%--            <c:redirect url="../login.jsp?dest=listCountries" />--%>
<%--        </c:when>--%>
        <c:when test="${sessionScope.countryData == null}" >
            <c:redirect url="${initParam.hostURL}${pageContext.request.contextPath}/getcountrydata.do" />
        </c:when>
        <c:otherwise>
            <h1><c:out value="Welcome back ${sessionScope.authorized_user.uid}"/></h1>
        </c:otherwise>
    </c:choose>
    <div class="row">
        <div class="col-4">
            <c:import url="../navbar.jsp" />
        </div>
        <div class="col-8">
            <table border="1">
                <tr>
                    <td>Seq</td>
                    <td>Code</td>
                    <td>Name</td>
                    <td>Population</td>
                    <td>Density</td>
                </tr>
                <c:forEach var="countryData" items="${sessionScope.countryData}" varStatus="iterationCount">
                    <tr>
                        <td>${iterationCount.count}</td>
                        <td>${countryData.code}</td>
                        <td>${countryData.name}</td>
                        <td>${countryData.population}</td>
                        <td>${countryData.density}</td>
                    </tr>
                </c:forEach>
            </table>

            <c:forEach var="temp" items="${sessionScope.countryData}">
                <c:if test="${temp.code == 'MEX'}">
                    <c:set var="updateCountry" value="${temp}" />

                    <c:set target="${updateCountry}" property="name" value="Mễ Tây Cơ" />
                    <h3>New value of MEX is ${updateCountry.name}</h3>

                    <c:remove var="updateCountry" />
                </c:if>
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
