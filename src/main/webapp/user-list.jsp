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
    <c:if test="${sessionScope.listUser == null}">
        <c:redirect url="${initParam.hostURL}${pageContext.request.contextPath}/user/list" />
    </c:if>
    <div class="container mt-5">
        <div class="d-flex justify-content-center">
            <c:import url="header.jsp" />
        </div>
        <div class="row mt-5">
            <div class="col-4">
                <c:import url="navbar.jsp" />
            </div>
            <div class="col-8">
                <a class="btn btn-primary"
                   href="${initParam.hostURL}${pageContext.request.contextPath}/user/new"
                   role="button">Add User</a>
                <div class="container">
                    <table class="table mt-2">
                        <thead class="thead-dark">
                            <tr>
                                <th>id</th>
                                <th>uid</th>
                                <th>password</th>
                                <th>authLevel</th>
                                <th>email</th>
                                <th>countryCode</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.listUser}" var="user">
                                <c:url var="updateLink" value="${initParam.hostURL}${pageContext.request.contextPath}/user/edit">
                                    <c:param name="id" value="${user.id}" />
                                </c:url>
                                <c:url var="deleteLink" value="${initParam.hostURL}${pageContext.request.contextPath}/user/delete">
                                    <c:param name="id" value="${user.id}" />
                                </c:url>
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.uid}</td>
                                    <td>${user.password}</td>
                                    <td>${user.authLevel}</td>
                                    <td>${user.email}</td>
                                    <td>${user.countryCode}</td>
                                    <td>
                                        <a href="${updateLink}">Update</a>
                                         |
                                        <a href="${deleteLink}"
                                            onclick="if (!confirm('Please confirm to delete!')) return false;">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <c:import url="footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
