<%@ page contentType="text/html;charset=UTF-8" language="java"
    import="com.ray.jstl.dbmodels.*
            , com.ray.jstl.helpers.*
            , com.ray.jstl.models.WebUser
            , java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>List Cities</title>
</head>
<body>
    <c:import url="../header.jsp" />

    <c:choose>
        <c:when test="${sessionScope.cityData == null}" >
            <c:redirect url="${initParam.hostURL}${pageContext.request.contextPath}/getcitydata.do" />
        </c:when>
        <c:otherwise>
            <h1><c:out value="Welcome back ${sessionScope.authorized_user.uid}" /></h1>
        </c:otherwise>
    </c:choose>

    <table style="width: 100%">
        <tr>
            <td style="width:25%;height:80%;" valign="top">
                <c:import url="../navbar.jsp" />
            </td>
            <td style="width:75%;height:80%;">
                <table border="1">
                    <tr>
                        <td>Seq</td>
                        <td>Name</td>
                        <td>CountryCode</td>
                        <td>Country</td>
                        <td>Population</td>
                    </tr>
                    <c:forEach var="tempCity" items="${sessionScope.cityData}" varStatus="iterationCount">

                        <tr>
                            <td>${iterationCount.count}</td>
                            <td>${tempCity.name}</td>
                            <td>${tempCity.countryCode}</td>
                            <td>${tempCity.country}</td>
                            <td>${tempCity.population}</td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>

    <c:import url="../footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
