<%@ page import="com.utar.assignment.model.entity.Office" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.persistence.Query" %>
<%@ page import="javax.ejb.EJB" %>
<%@ page import="com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Office Update</title>
</head>
<body>
<%--Initialize variables--%>
<%
    Office office = (Office) request.getAttribute("office_detail_single");
%>

<form action="OfficeController" method="post">
    <table>
        <tr>
            <td>Office Code</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"officeCode\" readonly value=" + office.getId());
                %>
            </td>
        </tr>
        <tr>
            <td>City</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"city\" value=" + office.getCity());
                %>
            </td>
        </tr>
        <tr>
            <td>Phone</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"phone\" value=" + office.getPhone());
                %>
            </td>
        </tr>
        <tr>
            <td>Address Line 1</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"addressLine1\" value=" + office.getAddressline1());
                %>
            </td>
        </tr>
        <tr>
            <td>Address Line 2</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"addressLine2\" value=" + office.getAddressline2());
                %>
            </td>
        </tr>
        <tr>
            <td>State</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"state\" value=" + office.getState());
                %>
            </td>
        </tr>
        <tr>
            <td>Country</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"country\" value=" + office.getCountry());
                %>
            </td>
        </tr>
        <tr>
            <td>Postal Code</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"postalCode\" value=" + office.getPostalcode());
                %>
            </td>
        </tr>
        <tr>
            <td>Territory</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"territory\" value=" + office.getTerritory());
                %>
            </td>
        </tr>
    </table>

    <%--    Specify Update or Delete--%>
    <input type="submit" name="UPDATE" value="UPDATE" />
    <input type="submit" name="DELETE" value="DELETE" />
</form>
</body>
</html>
