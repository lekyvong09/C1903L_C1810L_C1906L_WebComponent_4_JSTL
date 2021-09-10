<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
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
    </div>
  </div>
</div>
<c:import url="footer.jsp" >
  <c:param name="copyrightYear" value="${initParam.copyright}" />
  <c:param name="webLink" value="${initParam.weblink}" />
</c:import>
</body>
</html>
