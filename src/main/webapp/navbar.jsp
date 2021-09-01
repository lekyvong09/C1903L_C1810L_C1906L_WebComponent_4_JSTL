<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/index.jsp">Home</a><br>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/login.jsp">Login</a><br>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/Protected/listCities.jsp">List Cities</a><br>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/Protected/addCity.jsp">Add City</a><br>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/listCountries.jsp">List Countries</a><br>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/invalidatesessionandremovecookies.do">Clear All User Data</a><br>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/signout.do">Sign out</a><br>
<%--<a href="urlwithparameters.jsp?uid=aptech&pwd=123456789">URL with params</a>--%>
<c:url value="urlwithparameters.jsp" var="urlWithParams">
    <c:param name="uid" value="aptech" />
    <c:param name="pwd" value="1234567890" />
</c:url>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/${urlWithParams}"> URL with params</a><br>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/errorHandlingInTags.jsp">Error Tags</a><br>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/errorHandlingInTags2.jsp">Error Tags 2</a><br>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/formatting.jsp">Formatting</a><br>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/function.jsp">Function</a><br>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/xml.jsp">XML</a><br>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/sql.jsp">SQL</a><br>
<a href="${initParam.hostURL}${pageContext.request.contextPath}/UseCustomFunctions.jsp">EL Custom function</a><br>


