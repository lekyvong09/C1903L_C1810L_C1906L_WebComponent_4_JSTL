<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:import url="header.jsp" />

    <table style="width: 100%">
        <tr>
            <td style="width:25%;height:80%;" valign="top">
                <c:import url="navbar.jsp" />
            </td>
            <td style="width:75%;height:80%;">
                <c:set var="testDate" value="<%=java.time.LocalDateTime.now()%>" />
                <fmt:parseDate value="${testDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"  var="parsedDate"/>
                <c:set var="testNumber" value="2.99" />
                <table style="width: 100%">
                    <tr>
                        <td style="width: 30%">Tag</td>
                        <td style="width: 70%">Example</td>
                    </tr>
                    <tr>
                        <td>formatNumber - currency</td>
                        <td><fmt:formatNumber type="currency" value="${testNumber}"/> </td>
                    </tr>
                    <tr>
                        <td>formatNumber - pattern</td>
                        <td><fmt:formatNumber type="number" pattern="####.##E0" value="${testNumber}"/> </td>
                    </tr>
                    <tr>
                        <td>formatNumber - percent</td>
                        <td><fmt:formatNumber type="percent" value="${testNumber}"/></td>
                    </tr>
                    <tr>
                        <td>formatDate - pattern</td>
                        <td><fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/> </td>
                    </tr>
                    <tr>
                        <td>formatDate - date long & time short</td>
                        <td><fmt:formatDate value="${parsedDate}" type="both" dateStyle="long" timeStyle="short"/> </td>
                    </tr>
                    <tr>
                        <td>formatDate - date medium & time long</td>
                        <td><fmt:formatDate value="${parsedDate}" type="both" dateStyle="medium" timeStyle="long"/> </td>
                    </tr>
                    <tr>
                        <td>formatDate - short date only</td>
                        <td><fmt:formatDate value="${parsedDate}" type="date" dateStyle="short"/> </td>
                    </tr>
                    <tr>
                        <td>formatDate - medium time only</td>
                        <td><fmt:formatDate value="${parsedDate}" type="time" dateStyle="medium"/> </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <c:import url="footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
