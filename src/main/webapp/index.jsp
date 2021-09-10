<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ex" uri="WorldManagerTags"%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-center">
            <c:import url="header.jsp" />
        </div>
        <div class="row">
            <div class="col-4">
                <c:import url="navbar.jsp" />
            </div>
            <div class="col-8">
                <%
                    if (session.getAttribute("authorized_user") != null)
                    {
                %>
                        <div class="align-self-center">
                            <h2>Welcome back ${sessionScope.authorized_user.uid}</h2>
                        </div>
                <%
                    }
                    else
                    {
                %>
                        <div class="align-self-center">
                            Return user login <a href="login.jsp">here</a>
                        </div>
                <%
                        // return to login.jsp
                    }
                %>
            </div>
        </div>
    </div>
    <c:import url="footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
