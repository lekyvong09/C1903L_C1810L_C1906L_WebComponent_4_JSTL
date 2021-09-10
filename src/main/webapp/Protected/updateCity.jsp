<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update City</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
  <div class="container">
    <div class="d-flex justify-content-center">
      <c:import url="../header.jsp" />
    </div>

    <div class="row">
      <div class="col-4">
        <c:import url="../navbar.jsp" />
      </div>
      <div class="col-8">
        <form method="post" action="${initParam.hostURL}${pageContext.request.contextPath}/citycontroller.do">
          <input type="hidden" name="command" value="UPDATE" />
          <input type="hidden" name="cityId" value="${theCity.id}" />

          <table border="1">
            <tr>
              <td>Name</td>
              <td><input type="text" name="cityName" value="${theCity.name}" style="width: 100%;"></td>
            </tr>
            <tr>
              <td>Country_Code</td>
              <td><input type="text" name="cityCountryCode" value="${theCity.countryCode}" style="width: 100%;"></td>
            </tr>
            <tr>
              <td>Country</td>
              <td><input type="text" name="cityCountryName" value="${theCity.country}" style="width: 100%;"></td>
            </tr>
            <tr>
              <td>Population</td>
              <td><input type="number" name="cityPopulation" value="${theCity.population}" style="width: 100%;"></td>
            </tr>
            <tr>
              <td colspan="2" align="right">
                <input type="submit" name="updateCity" value="Update City" style="width: 100%;"/>
              </td>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </div>
  <c:import url="../footer.jsp" >
    <c:param name="copyrightYear" value="${initParam.copyright}" />
    <c:param name="webLink" value="${initParam.weblink}" />
  </c:import>
</body>
</html>
