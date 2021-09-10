<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="urlwithparameters.jsp" var="urlWithParams">
    <c:param name="uid" value="aptech" />
    <c:param name="pwd" value="1234567890" />
</c:url>

<ul class="nav flex-column">
    <li class="nav-item">
        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/index.jsp">Home</a><br>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/login.jsp">Login</a><br>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/Protected/listCities.jsp">List Cities</a><br>
    </li>
    <c:if test="${sessionScope.authorized_user.authLevel eq 2}">
        <li class="nav-item">
            <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/Protected/addCity.jsp">Add City</a><br>
        </li>
    </c:if>
    <li class="nav-item">
        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/Protected/listCountries.jsp">List Countries</a><br>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/uploader.jsp">Upload file</a><br>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/i18n-messages.jsp">Test i18n</a><br>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/invalidatesessionandremovecookies.do">Clear All User Data</a><br>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/signout.do">Sign out</a><br>
    </li>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/${urlWithParams}"> URL with params</a><br>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/errorHandlingInTags.jsp">Error Tags</a><br>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/errorHandlingInTags2.jsp">Error Tags 2</a><br>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/formatting.jsp">Formatting</a><br>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/function.jsp">Function</a><br>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/xml.jsp">XML</a><br>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/sql.jsp">SQL</a><br>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link" href="${initParam.hostURL}${pageContext.request.contextPath}/UseCustomFunctions.jsp">EL Custom function</a><br>--%>
<%--    </li>--%>
</ul>


