<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="wmelf" uri="WorldManagerTags" %>
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
                <h2>SQUARE of 2.0</h2>
                <span>${wmelf:square(2.0)}</span>
                <h2>SQUARE ROOT of 16.0</h2>
                <span>${wmelf:sqrt(16.0)}</span>
            </td>
        </tr>
    </table>

    <c:import url="footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
