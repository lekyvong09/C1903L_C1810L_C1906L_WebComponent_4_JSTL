<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ex" uri="WEB-INF/WorldManagerTag.tld"%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
    <c:import url="header.jsp" />

    <table style="width: 100%">
        <tr>
            <td style="width:25%;height:80%;" valign="top">
                <c:import url="navbar.jsp" />
            </td>
            <td style="width:75%;height:80%;">
<%--                <h1>Welcome to the World Manager</h1>--%>
                <h1><ex:Hello/> </h1>
                <%
                    if (session.getAttribute("authorized_user") != null)
                    {
                %>
                        <h2>Welcome back ${sessionScope.authorized_user.uid}</h2>
                <%
                    }
                    else
                    {
                %>
                        <h2>Return user login</h2>
                        <a href="login.jsp">here</a>
                <%
                        // return to login.jsp
                    }
                %>

            </td>
        </tr>
    </table>

    <c:import url="footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
