<%@ page import="com.utar.assignment.model.entity.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.persistence.Query" %>
<%@ page import="javax.ejb.EJB" %>
<%@ page import="com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Update</title>
</head>
<body>
<%--Initialize variables--%>
<%
    Employee employee = (Employee) request.getAttribute("employee_detail_single");
%>

<form action="EmployeeController" method="post">
    <table>
        <tr>
            <td>Employee Number</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"employeeNumber\" readonly value=\"" + employee.getId() + "\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"lastName\" value=\"" + employee.getLastname() + "\"");
                %>
            </td>
        </tr>
        <tr>
            <td>First Name</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"firstName\" value=\"" + employee.getFirstname() + "\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Extension</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"extension\" value=\"" + employee.getExtension() + "\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"email\" value=\"" + employee.getEmail() + "\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Office Code</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"officeCode\" readonly value=\"" + employee.getOfficecode().getId() + "\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Reports To</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"reportsTo\" value=\"" + employee.getReportsto() + "\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Job Title</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"jobTitle\" value=\"" + employee.getJobtitle() + "\"");
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
