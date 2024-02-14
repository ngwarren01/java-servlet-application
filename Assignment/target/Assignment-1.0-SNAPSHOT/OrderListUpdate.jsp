<%@ page import="com.utar.assignment.model.entity.Customer" %>
<%@ page import="com.utar.assignment.model.entity.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.persistence.Query" %>
<%@ page import="javax.ejb.EJB" %>
<%@ page import="com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal" %>
<%@ page import="com.utar.assignment.model.entity.Order" %><%--
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
    Order order = (Order) request.getAttribute("order");
%>

<form action="OrderController" method="post" style="color: black">
    <table>
        <tr>
            <td>Order Number : </td>
            <td>
                <b>
                    <%
                        out.println(order.getId());
                        out.println("<input type=\"hidden\" name=\"orderNumber\" readonly value=" + order.getId());
                    %>
                </b>

            </td>
        </tr>

        <tr>
            <td>Order Date : </td>
            <td>
                <b>
                    <%
                        out.println(order.getOrderdate());
                        out.println("<input type=\"hidden\" name=\"orderDate\" readonly value=" + order.getOrderdate());

                    %>
                </b>

            </td>

        </tr>

        <tr>
            <td>Require Date : </td>
            <td>
                <%
                    out.println("<input type=\"date\" name=\"requireDate\" value=" + order.getRequireddate());
                %>
            </td>
        </tr>

        <tr>
            <td>Shipped Date : </td>
            <td>
                <%
                    out.println("<input type=\"date\" name=\"shippedDate\" value=" + order.getShippeddate());
                %>
            </td>
        </tr>

        <tr>
            <td>Status : </td>
            <td>
                <%
                    out.println("<select name =\"status\" id =\"status\" style=\" width: 200px\">");
                    out.println("<option value=\"Shipped\"" + (order.getStatus().equals("Shipped") ? " selected" : "") + ">Shipped</option>");
                    out.println("<option value=\"In Process\"" + (order.getStatus().equals("In Process") ? " selected" : "") + ">In Process</option>");
                    out.println("</select>");

                %>
            </td>
        </tr>

        <tr>
            <td>Comments : </td>
            <td>
                <%
                    out.println("<textarea name=\"comments\" cols=\"50\" rows=\"10\">" + order.getComments() + "</textarea>");

                %>
            </td>
        </tr>

        <tr>
            <td style="padding-right: 2px">Customer Number : </td>
            <td>

                <%
                    out.println("<select name=\"customerNumber\" id=\"customerNumber\" style=\"width: 200px\">");
                    List<Customer> customers = (List<Customer>) request.getAttribute("customer_records");
                    for (Customer customer : customers) {
                        if (customer.getId().equals(order.getCustomernumber())) {
                            out.println("<option value=\"" + customer.getId() + "\" selected>" + customer.getId() + "</option>");
                        }else{
                            out.println("<option value=\"" + customer.getId() + "\">" + customer.getId() + "</option>");
                        }

                    }
                    out.println("</select>");
                %>
            </td>
        </tr>

    </table>

    <%--    Specify Update or Delete--%>
    <br>
    <input type="submit" name="UPDATE" class="btn btn-primary" value="UPDATE" />
    <input type="submit" name="DELETE" class="btn btn-danger" value="DELETE" />

</form>
</body>
</html>
