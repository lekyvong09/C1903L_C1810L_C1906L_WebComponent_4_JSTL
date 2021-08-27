<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="index.jsp">Home</a><br>
<a href="login.jsp">Login</a><br>
<a href="listCities.jsp">List Cities</a><br>
<a href="listCountries.jsp">List Countries</a><br>
<a href="invalidatesessionandremovecookies.do">Clear All User Data</a><br>
<a href="signout.do">Sign out</a><br>
<%--<a href="urlwithparameters.jsp?uid=aptech&pwd=123456789">URL with params</a>--%>
<c:url value="urlwithparameters.jsp" var="urlWithParams">
    <c:param name="uid" value="aptech" />
    <c:param name="pwd" value="1234567890" />
</c:url>
<a href="${urlWithParams}"> URL with params</a><br>

