<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update City</title>
</head>
<body>
  <c:import url="../header.jsp" />

  <table style="width: 100%">
    <tr>
      <td style="width:25%;height:80%;" valign="top">
        <c:import url="../navbar.jsp" />
      </td>
      <td style="width:75%;height:80%;">
        <form method="post" action="${initParam.hostURL}${pageContext.request.contextPath}/citycontroller.do">

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
      </td>
    </tr>
  </table>

  <c:import url="../footer.jsp" >
    <c:param name="copyrightYear" value="${initParam.copyright}" />
    <c:param name="webLink" value="${initParam.weblink}" />
  </c:import>
</body>
</html>
