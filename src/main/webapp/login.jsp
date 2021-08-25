<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
  <c:import url="header.jsp" />

  <table style="width: 100%">
    <tr>
      <td style="width:25%;height:80%;" valign="top">
        <c:import url="navbar.jsp" />
      </td>
      <td style="width:75%;height:80%;">
        <h1>Coming soon</h1>

      </td>
    </tr>
  </table>

  <c:import url="footer.jsp" >
    <c:param name="copyrightYear" value="${initParam.copyright}" />
    <c:param name="webLink" value="${initParam.weblink}" />
  </c:import>
</body>
</html>
