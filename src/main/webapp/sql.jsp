<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <title>SQL</title>
</head>
<body>
    <c:import url="header.jsp" />
    <sql:setDataSource var="worlddata" driver="com.mysql.cj.jdbc.Driver"
                       url="${initParam.dbURL}"
                       user="${initParam.dbuserid}"
                       password="${initParam.dbuserpwd}"/>
    <sql:query
            dataSource="${worlddata }"
            sql="select * from country" var="countryData"/>
    <table style="width:100%;">
        <tr>
            <td style="width:25%;height:80%;" valign="top" >
                <c:import url="navbar.jsp" />
            </td>
            <td style="width:75%;height:80%;">
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
            </td>
        </tr>
    </table>

    <c:import url="footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
