<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add City</title>
</head>
<body>
    <body>
    <c:import url="header.jsp" />
    <c:choose>
        <c:when test="${sessionScope.countryCodes == null}" >
            <c:redirect url="${initParam.hostURL}${pageContext.request.contextPath}/getcountrycodes.do" />
        </c:when>
        <c:otherwise>
            <h1><c:out value="Welcome back ${sessionScope.authorized_user.uid}" /></h1>
        </c:otherwise>
    </c:choose>

    <table style="width: 100%">
        <tr>
            <td style="width:25%;height:80%;" valign="top">
                <c:import url="navbar.jsp" />
            </td>
            <td style="width:75%;height:80%;">
                <form method="post" action="${initParam.hostURL}${pageContext.request.contextPath}/addnewcity.do">

                    <table border="1">
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="cityName" style="width: 100%;"></td>
                        </tr>
                        <td>
                            <td>Country_Code</td>
                            <td>
                                <select name="cityCountryCode" style="width: 100%;" >
                                    <option selected>--Choose country code--</option>
                                    <c:forEach items="${sessionScope.countryCodes}" var="cCode">
                                        <option>${cCode}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </td>
                        <tr>
                            <td>Country</td>
                            <td><input type="text" name="cityCountryName" style="width: 100%;"></td>
                        </tr>
                        <tr>
                            <td>Population</td>
                            <td><input type="number" name="cityPopulation" style="width: 100%;"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <input type="submit" name="addCity" value="Add City" style="width: 100%;"/>
                            </td>
                        </tr>
                    </table>

                </form>
            </td>
        </tr>
    </table>

    <c:import url="footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
    </body>
</body>
</html>
