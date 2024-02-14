<%@ page import="com.utar.assignment.model.entity.Customer" %>
<%@ page import="com.utar.assignment.model.entity.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.persistence.Query" %>
<%@ page import="javax.ejb.EJB" %>
<%@ page import="com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal" %><%--
  Created by IntelliJ IDEA.
  User: Jireh
  Date: 28/3/2023
  Time: 11:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            margin: 50px auto;
            max-width: 600px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            border-radius: 5px;
            text-align: center;
        }
        form {
            display: inline-block;
            text-align: left;
            margin: 0 auto;
            max-width: 500px;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #555;
        }
        input[type=text], input[type=number], select {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            width: 100%;
            margin-bottom: 15px;
            font-size: 16px;
        }
        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #45a049;
        }
        input[type=reset] {
            background-color: #f44336;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }
        input[type=reset]:hover {
            background-color: #e60000;
        }
    </style>
</head>
<body>
<%--Initialize variables--%>
<%
    Customer customer = (Customer) request.getAttribute("customer_detail_single");
%>

<form action="CustomerController" method="post">
    <table>
        <tr>
            <td>Customer Number</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"customerNumber\" readonly value=\"" + customer.getId()+"\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Customer Name</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"customerName\" value=\"" + customer.getCustomername()+"\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Contact Last Name</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"contactLastName\" value=\"" + customer.getContactlastname()+"\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Contact First Name</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"contactFirstName\"  value=\"" + customer.getContactfirstname()+"\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Phone</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"phone\" value=\"" + customer.getPhone()+"\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Address Line 1</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"addressLine1\" value=\"" + customer.getAddressline1()+"\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Address Line 2</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"addressLine2\" value=\"" + customer.getAddressline2()+"\"");
                %>
            </td>
        </tr>
        <tr>
            <td>City</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"city\" value=\"" + customer.getCity()+"\"");
                %>
            </td>
        </tr>
        <tr>
            <td>State</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"state\" value=\"" + customer.getState()+"\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Postal Code</td>
            <td>
                <%
                    out.println("<input type=\"text\"  name=\"postalCode\" value=\"" + customer.getPostalcode()+"\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Country</td>
            <td>
                <%
                    out.println("<input type=\"text\" required name=\"country\" value=\"" + customer.getCountry()+"\"");
                %>
            </td>
        </tr>
        <tr>
            <td>Sales Rep Employee Number</td>
            <td>
                <%
                    if(customer.getSalesrepemployeenumber() == null){
                        out.println("<input list= \"employees\"  name =\"salesEmployeeNumber\" id =\"salesemp\" style=\" width: 200px\"" +
                                " value=\"None\" required>");
                    }
                    else{
                        out.println("<input list= \"employees\"  name =\"salesEmployeeNumber\" id =\"salesemp\" style=\" width: 200px\"" +
                                " value=\"" +customer.getSalesrepemployeenumber().getId()+ "\" required>");
                    }
                    out.println("<datalist id = \"employees\">");
                    out.println("<option value=\"None\">");
                    List<Employee> employees = (List<Employee>) request.getAttribute("employee_records");

                    for (Employee t : employees) {
                        out.println("<option value =\"" + t.getId() + "\">");
                    }
                    out.println("</datalist>");

                %>
            </td>
        </tr>
        <tr>
            <td>Credit Limit</td>
            <td>
                <%
                    out.println("<input type=\"number\" min=\"0\" name=\"creditLimit\" step=\".01\" value=\"" + customer.getCreditlimit()+"\"");
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
