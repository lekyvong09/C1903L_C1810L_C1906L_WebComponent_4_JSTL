<%--
  Created by IntelliJ IDEA.
  User: ray
  Date: 9/22/21
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Manage</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-center">
            <c:if test="${sessionScope.theUser == null}">
                Add New User
                <c:url var="actionLink" value="${initParam.hostURL}${pageContext.request.contextPath}/user/insert" />
            </c:if>
            <c:if test="${sessionScope.theUser != null}">
                Edit New User
                <c:url var="actionLink" value="${initParam.hostURL}${pageContext.request.contextPath}/user/update" />
            </c:if>
        </div>
        <div class="row mt-5">
            <div class="col-4">
                <c:import url="navbar.jsp" />
            </div>
            <div class="col-8">
                <a class="my-5" href="${initParam.hostURL}${pageContext.request.contextPath}/user/list">Back to List User</a>
                <div class="container my-5">
                    <form method="post" action="${actionLink}">
                        <c:if test="${sessionScope.theUser != null}">
                            <input type="hidden" name="id" value="<c:out value='${theUser.id}' />" />
                        </c:if>

                        <div class="form-group row">
                            <label for="uid" class="col-2 col-form-label">Uid: </label>
                            <div class="col-4">
                                <input class="form-control" type="text" id="uid" name="uid" value="${theUser.uid}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-2 col-form-label">password: </label>
                            <div class="col-4">
                                <input class="form-control" type="password" id="password" name="password" value="${theUser.password}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="authLevel" class="col-2 col-form-label">authLevel: </label>
                            <div class="col-4">
                                <input class="form-control" type="text" id="authLevel" name="authLevel" value="${theUser.authLevel}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-2 col-form-label">email: </label>
                            <div class="col-4">
                                <input class="form-control" type="text" id="email" name="email" value="${theUser.email}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="countryCode" class="col-2 col-form-label">countryCode: </label>
                            <div class="col-4">
                                <input class="form-control" type="text" id="countryCode" name="countryCode" value="${theUser.countryCode}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="offset-2 col-10">
                                <input class="btn btn-primary" type="submit" value="Submit">
                            </div>
                        </div>
                    </form>
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
