<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:import url="header.jsp" />

    <table style="width: 100%">
        <tr>
            <td style="width:25%;height:80%;" valign="top">
                <c:import url="navbar.jsp" />
            </td>
            <td style="width:75%;height:80%;">
                <c:catch var="exMsg">
                    Result: ${22/0} <br>
                    Result2: <% int x = 32/0; %> <%=x %>
                </c:catch>
                <c:if test="${exMsg != null}">
                    <c:redirect url="errorHandler.jsp">
                        <c:param name="ex" value="${exMsg.message}"/>
                    </c:redirect>
                </c:if>
            </td>
        </tr>
    </table>

    <c:import url="footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
