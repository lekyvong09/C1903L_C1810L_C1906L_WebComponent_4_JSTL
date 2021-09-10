<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<html>
<head>
    <title>XML</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
  <div class="container">
    <div class="d-flex justify-content-center">
      <c:import url="header.jsp" />
    </div>
    <c:set var="xCountryData">
      <countries>
        <country>
          <id>1</id>
          <name>Japan</name>
        </country>
        <country>
          <id>2</id>
          <name>Mexico</name>
        </country>
        <country>
          <id>3</id>
          <name>Vietnam</name>
        </country>
      </countries>
    </c:set>
    <div class="row">
      <div class="col-4">
        <c:import url="navbar.jsp" />
      </div>
      <div class="col-8">
          <x:parse var="countryData" xml="${xCountryData}" />
          <table style="width: 100%">
            <tr>
              <td style="width: 30%">Id</td>
              <td style="width: 70%">Country Name</td>
            </tr>
            <x:forEach var="country" select="$countryData/countries/country">
              <tr>
                <td><x:out select="$country/id" /></td>
                <td><x:out select="$country/name" /></td>
              </tr>
            </x:forEach>
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
