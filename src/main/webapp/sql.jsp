<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <title>SQL</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-center">
        <c:import url="header.jsp" />
    </div>
    <sql:setDataSource var="worlddata" driver="com.mysql.cj.jdbc.Driver"
                       url="${initParam.dbURL}"
                       user="${initParam.dbuserid}"
                       password="${initParam.dbuserpwd}"/>
    <sql:query
            dataSource="${worlddata }"
            sql="select * from country" var="countryData"/>
    <div class="row">
        <div class="col-4">
            <c:import url="navbar.jsp" />
        </div>
        <div class="col-8">
            <table style="width:100%;">
                <tr>
                    <td>Code</td>
                    <td>Name</td>
                    <td>Population</td>
                    <td>Density</td>
                </tr>
                <c:forEach var="dataRow" items="${countryData.rows}" >
                    <tr>
                        <td>${dataRow.Code}</td>
                        <td>${dataRow.Name}</td>
                        <td>${dataRow.Population}</td>
                        <td>${dataRow.Density}</td>
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
