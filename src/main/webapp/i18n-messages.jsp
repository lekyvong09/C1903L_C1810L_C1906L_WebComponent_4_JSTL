<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="theLocale" value="${not empty param.theLocale ? param.theLocale : pageContext.request.locale}" scope="session" />

<fmt:setLocale value="${theLocale}" />
<fmt:setBundle basename="com.ray.jstl.i18n.resources.mylabels" />

<html>
<head>
    <title>Title</title>
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
            <a href="${initParam.hostURL}${pageContext.request.contextPath}/i18n-messages.jsp?theLocale=vi_VN">Vietnamese VN</a>
            <a href="${initParam.hostURL}${pageContext.request.contextPath}/i18n-messages.jsp?theLocale=en_US">English US</a>
            <hr>
            <fmt:message key="label.greeting"></fmt:message><br>
            <fmt:message key="label.firstname"></fmt:message><br>
            <fmt:message key="label.Last"></fmt:message><br>
            <fmt:message key="label.welcome"></fmt:message><br>
            <hr>
            Selected local ${theLocale}
        </div>
    </div>
</div>
<c:import url="footer.jsp" >
    <c:param name="copyrightYear" value="${initParam.copyright}" />
    <c:param name="webLink" value="${initParam.weblink}" />
</c:import>
</body>
</html>
