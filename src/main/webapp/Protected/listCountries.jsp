<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:import url="../header.jsp" />
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
    <table style="width: 100%">
        <tr>
            <td style="width:25%;height:80%;" valign="top">
                <c:import url="../navbar.jsp" />
            </td>
            <td style="width:75%;height:80%;">
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

            </td>
        </tr>
    </table>

    <c:import url="../footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
