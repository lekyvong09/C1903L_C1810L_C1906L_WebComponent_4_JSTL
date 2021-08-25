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
        <form id="login" method="post" action="loginUser.do">
          <table style="width: 450px;" >
            <tr>
              <td><span>Username:</span></td>
              <td><input name="uid" type="text" style="width: 250px;" value="${cookie.credentials_uid.value}"/></td>
            </tr>
            <tr>
              <td><span>Password:</span></td>
              <td><input name="pwd" type="password" style="width: 250px;" value="${cookie.credentials_pwd.value}"/></td>
            </tr>
            <tr>
              <td colspan="2" align="right">
                <input name="rememberMe" type="checkbox"> RememberMe
              </td>
            </tr>
            <tr>
              <td colspan="2" align="right">
                <input type="submit" value="Sign in" style="width: 250px;"/>
              </td>
            </tr>
          </table>

          <input type="hidden" name="dest" value="${param.dest}"/>
        </form>
      </td>
    </tr>
  </table>

  <c:import url="footer.jsp" >
    <c:param name="copyrightYear" value="${initParam.copyright}" />
    <c:param name="webLink" value="${initParam.weblink}" />
  </c:import>
</body>
</html>
