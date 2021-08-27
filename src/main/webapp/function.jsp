<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:import url="header.jsp" />

    <table style="width: 100%">
        <tr>
            <td style="width:25%;height:80%;" valign="top">
                <c:import url="navbar.jsp" />
            </td>
            <td style="width:75%;height:80%;">
                <c:set var="testString" value="we are studying JSTL"/>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 30%">Function</td>
                        <td style="width: 70%">Examples</td>
                    </tr>
                    <tr>
                        <td>contains</td>
                        <td>
                            <c:if test="${fn:contains(testString, 'JSTL')}">
                                <h3>Sentence ${testString} contains 'JSTL' is true</h3>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>contains ignore case</td>
                        <td>
                            <c:if test="${fn:containsIgnoreCase(testString, 'STUDY')}">
                                <h3>Sentence ${testString} containsIgnoreCase 'study' is true</h3>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>indexOf</td>
                        <td>
                            <h3>indexOf 'J' in the sentence '${testString}' is ${fn:indexOf(testString, 'J')}</h3>
                        </td>
                    </tr>
                    <tr>
                        <td>length</td>
                        <td>
                            <h3>length of '${testString}' is ${fn:length(testString)}</h3>
                        </td>
                    </tr>
                    <tr>
                        <td>substring</td>
                        <td>
                            <h3>substring of '${testString}' from 4 to 12 is ${fn:substring(testString, 4, 12)}</h3>
                        </td>
                    </tr>
                    <tr>
                        <td>toLowerCase</td>
                        <td>
                            <h3>lower ${fn:toLowerCase(testString)}</h3>
                        </td>
                    </tr>
                    <tr>
                        <td>toUpperCase</td>
                        <td>
                            <h3>upper ${fn:toUpperCase(testString)}</h3>
                        </td>
                    </tr>
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
