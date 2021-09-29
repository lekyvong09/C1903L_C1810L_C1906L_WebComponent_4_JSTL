<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add City</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
    <body>
    <div class="container">
        <div class="d-flex justify-content-center">
            <c:import url="../header.jsp" />
        </div>
        <c:choose>
            <c:when test="${sessionScope.countryCodes == null}" >
                <c:redirect url="${initParam.hostURL}${pageContext.request.contextPath}/countrycontroller.do" />
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
                ${sessionScope.validationError}
<%--                <form method="post" action="${initParam.hostURL}${pageContext.request.contextPath}/citycontroller.do">--%>
<%--                    <input type="hidden" name="command" value="ADD" />--%>
<%--                    <table border="1">--%>
<%--                        <tr>--%>
<%--                            <td>Name</td>--%>
<%--                            <td><input type="text" name="cityName" style="width: 100%;"></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Country_Code</td>--%>
<%--                            <td>--%>
<%--                                <select name="cityCountryCode" style="width: 100%;" >--%>
<%--                                    <option selected>--Choose country code--</option>--%>
<%--                                    <c:forEach items="${sessionScope.countryCodes}" var="cCode">--%>
<%--                                        <option>${cCode}</option>--%>
<%--                                    </c:forEach>--%>
<%--                                </select>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Country</td>--%>
<%--                            <td><input type="text" name="cityCountryName" style="width: 100%;"></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Population</td>--%>
<%--                            <td><input type="number" name="cityPopulation" style="width: 100%;"></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td colspan="2" align="right">--%>
<%--                                <input type="submit" name="addCity" value="Add City" style="width: 100%;"/>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                    </table>--%>

<%--                </form>--%>

                    <form action="citycontroller.do" method="post">
                        <input type="hidden" name="command" value="ADD" />

                        <div class="form-row mb-3">
                            <div class="col-6">
                                <label for="cityName">Name</label>
                                <c:choose>
                                    <c:when test="${requestScope.validationCityName != null && isDirty}">
                                        <input class="form-control is-invalid" type="text" id="cityName" name="cityName"
                                               value="${tempCity.name}" aria-describedby="validationCityName" required/>
                                        <div id="validationCityName" class="invalid-feedback">
                                                ${requestScope.validationCityName}
                                        </div>
                                    </c:when>
                                    <c:when test="${requestScope.validationCityName == null && isDirty}">
                                        <input class="form-control is-valid" type="text" id="cityName"
                                               name="cityName" value="${tempCity.name}" required/>
                                    </c:when>
                                    <c:otherwise>
                                        <input class="form-control is-valid" type="text" id="cityName"
                                               name="cityName" required/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <div class="col-6">
                                <label for="cityCountryCode">Country_Code</label>
                                <select class="custom-select is-valid" id="cityCountryCode"
                                        name="cityCountryCode" required>
                                    <option selected disabled value="">--Choose country code --</option>
                                    <c:forEach var="cCode" items="${sessionScope.countryCodes }">
                                        <option>${cCode}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <div class="col-6">
                                <label for="cityCountryName">Country</label>
                                <c:choose>
                                    <c:when test="${requestScope.validationCountryName != null && isDirty}">
                                        <input class="form-control is-invalid" type="text" id="cityCountryName" name="cityCountryName"
                                               value="${tempCity.country}" aria-describedby="validationCountryName" required/>
                                        <div id="validationCountryName" class="invalid-feedback">
                                                ${requestScope.validationCountryName}
                                        </div>
                                    </c:when>
                                    <c:when test="${requestScope.validationCountryName == null && isDirty}">
                                        <input class="form-control is-valid" type="text" id="cityCountryName"
                                               name="cityCountryName" value="${tempCity.country}" required/>
                                    </c:when>
                                    <c:otherwise>
                                        <input class="form-control is-valid" type="text" id="cityCountryName"
                                               name="cityCountryName" required/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <div class="col-6">
                                <label for="cityPopulation">Population</label>
                                <c:choose>
                                    <c:when test="${requestScope.validationPopulation != null && isDirty}">
                                        <input class="form-control is-invalid" type="text" id="cityPopulation" name="cityPopulation"
                                               value="${tempCity.population}" aria-describedby="validationPopulation" required/>
                                        <div id="validationPopulation" class="invalid-feedback">
                                                ${requestScope.validationPopulation}
                                        </div>
                                    </c:when>
                                    <c:when test="${requestScope.validationPopulation == null && isDirty}">
                                        <input class="form-control is-valid" type="text" id="cityPopulation"
                                               name="cityPopulation" value="${tempCity.population}" required/>
                                    </c:when>
                                    <c:otherwise>
                                        <input class="form-control is-valid" type="text" id="cityPopulation"
                                               name="cityPopulation" required/>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                        <div class="form-row">
                            <input class="btn btn-primary" type="submit" value="Submit">
                        </div>
                    </form>
            </div>
        </div>
    </div>
    <c:import url="../footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
    </body>
</body>
</html>
