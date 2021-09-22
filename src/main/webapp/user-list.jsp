<%--
  Created by IntelliJ IDEA.
  User: ray
  Date: 9/22/21
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User List</title>
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

                <table border="1">
                    <tr>
                        <td>id</td>
                        <td>uid</td>
                        <td>password</td>
                        <td>authLevel</td>
                        <td>email</td>
                        <td>countryCode</td>
                    </tr>
                    <c:forEach items="${sessionScope.listUser}" var="user">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.uid}</td>
                            <td>${user.password}</td>
                            <td>${user.authLevel}</td>
                            <td>${user.email}</td>
                            <td>${user.countryCode}</td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
        </div>
    </div>
    <c:import url="footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
