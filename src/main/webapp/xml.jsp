<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<html>
<head>
    <title>XML</title>
</head>
<body>
  <c:import url="header.jsp" />
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
  <table style="width: 100%">
    <tr>
      <td style="width:25%;height:80%;" valign="top">
        <c:import url="navbar.jsp" />
      </td>
      <td style="width:75%;height:80%;">
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
      </td>
    </tr>
  </table>

  <c:import url="footer.jsp" >
    <c:param name="copyrightYear" value="${initParam.copyright}" />
    <c:param name="webLink" value="${initParam.weblink}" />
  </c:import>
</body>
</html>
