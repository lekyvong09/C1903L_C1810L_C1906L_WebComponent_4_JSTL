<%@ page contentType="text/html;charset=UTF-8" language="java"
    import="com.ray.jstl.dbmodels.*
            , com.ray.jstl.helpers.*
            , com.ray.jstl.models.WebUser
            , java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Cities</title>
</head>
<body>
    <c:import url="header.jsp" />

    <%!
        String uid = "";
        String pwd = "";
        DBManager dbm;
        WebUser wu;
    %>
    <%
        if (session.getAttribute("authorized_user") == null)
        {
    %>
            <c:redirect url="login.jsp?dest=listCities" />
    <%
        }
        else
        {
            wu = (WebUser) session.getAttribute("authorized_user");
            Integer authLevel = wu.getAuthLevel();
            if (authLevel < 1)
            {
    %>
            <c:redirect url="login.jsp?dest=listCities" />
    <%
            }
            if (wu.getUid() != null && !wu.getUid().equals(""))
                uid = wu.getUid();

            if (wu.getPwd() != null && !wu.getPwd().equals(""))
                pwd = wu.getPwd();
        }
    %>
    <%
        if (uid != null && !uid.equals(""))
        {
    %>
            <h1><c:out value="Welcome back " /><%=uid %></h1>
            <h1><c:out value="Welcome back ${sessionScope.authorized_user.uid}" /></h1>
    <%
        }
    %>

    <table style="width: 100%">
        <tr>
            <td style="width:25%;height:80%;" valign="top">
                <c:import url="navbar.jsp" />
            </td>
            <td style="width:75%;height:80%;">
                <%
                    StringBuilder sb = new StringBuilder("<html><body>");

                    DBManager dbm = (DBManager)application.getAttribute("WorldDBManager");

                    try {
                    if (!dbm.isConnected())
                    {
                    if (!dbm.openConnection())
                    sb.append("Could not connect to Database");
                    }

                    sb.append("<table border=1>"
                        + "<tr><td>Id</td><td>NAME</td><td>COUNTRY_CODE</td><td>COUNTRY</td><td>Population</td></tr>");
                        String query = "select * from city order by population DESC";

                        ResultSet rs = dbm.ExecuteResultSet(query);

                        while (rs.next())
                        {
                        int id = rs.getInt("ID");
                        String name = rs.getString("NAME");
                        String countryCode = rs.getString("CountryCode");
                        String country = rs.getString("Country");
                        int pop = rs.getInt("Population");

                        sb.append("<tr><td>" + id + "</td>"
                            + "<td>" + name + "</td>"
                            + "<td>" + countryCode + "</td>"
                            + "<td>" + country + "</td>"
                            + "<td>" + pop + "</td></tr>");
                        }
                        sb.append("</table>");
                    }
                    catch (Exception ex)
                    {
                    sb.append("<h1>Error:" + ex.getMessage() + "</h1>");
                    }
                    sb.append("</body></html>");

                    out.println(sb.toString());
                %>
            </td>
        </tr>
    </table>

    <c:import url="footer.jsp" >
        <c:param name="copyrightYear" value="${initParam.copyright}" />
        <c:param name="webLink" value="${initParam.weblink}" />
    </c:import>
</body>
</html>
