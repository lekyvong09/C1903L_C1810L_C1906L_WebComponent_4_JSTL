<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
    <c:import url="header.jsp" />

    <div class="container">
        <div class="d-flex justify-content-center">
            <c:import url="header.jsp" />
        </div>
        <div class="row">
            <div class="col-4">
                <c:catch var="exMsg">
                    Result: ${22/0} <br>
                    Result2: <% int x = 32/0; %> <%=x %>
                </c:catch>
                <c:if test="${exMsg != null}">
                    <c:redirect url="errorHandler.jsp">
                        <c:param name="ex" value="${exMsg.message}"/>
                    </c:redirect>
                </c:if>
            </div>
            <div class="col-8">
                <h1>Session and Cookies has been cleared</h1>
            </div>
        </div>
    </div>
    <c:import url="footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
