<%@ page contentType="text/html;charset=UTF-8" language="java"
    isErrorPage="true"
    %>
<html>
<head>
    <title>Error Handler</title>
</head>
<body>
    <jsp:include page="/header.jsp" />
    <table style="width: 100%">
        <tr>
            <td style="width:25%;height:80%;" valign="top">
                <jsp:include page="navbar.jsp" />
            </td>
            <td style="width:75%;height:80%;">
                <h1>An Error has occurred!</h1>
                ${pageContext.exception.message}

            </td>
        </tr>
    </table>

    <jsp:include page="footer.jsp" />
</body>
</html>
