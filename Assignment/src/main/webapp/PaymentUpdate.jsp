<%@ page import="com.utar.assignment.model.entity.Payment" %>
<%@ page import="com.utar.assignment.model.entity.Customer" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Jireh
  Date: 25/3/2023
  Time: 1:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
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
    Payment payment = (Payment) request.getAttribute("payment_detail_single");

%>

<%--POST THE UPDATE/DELETE--%>
<div class="container">
<form action="PaymentController" method="post">
    <%
        String store = (String) request.getAttribute("currentCustomerNumber");
        request.setAttribute("currentCustomerNumber1", store);
    %>

    <table>
        <tr>
            <td>Customer Number</td>
            <td>

                <%
                    out.println("<input type=\"text\" name=\"customerNumber\" style=\"background-color: #f2f2f2\" readonly value=" + payment.getId().getCustomernumber());
                %>

                <%--<%
                    out.println("<select name =\"customerNumber\" id =\"cusNum\" style=\" width: 200px\">");
                    List<Customer> customer = (List<Customer>) request.getAttribute("customer_records");

                    for (Customer t : customer) {
                        out.println("<option value =" + t.getId() + ">" + t.getId() + "</option>");
                    }
                    out.println("</select>");

                %>--%>
            </td>
        </tr>
        <tr>
            <td>Check Number</td>
            <td>
                    <%
                        out.println("<input type=\"text\" name=\"checkNumber\" style=\"background-color: #f2f2f2\" readonly value=" + payment.getId().getChecknumber());
                    %>
            </td>
        </tr>
        <tr>

        </tr>
        <%--<%
            out.println("<input type=\"hidden\" name=\"currentCustomerNumber\" value=" + store);
        %>--%>
        <tr>
            <td>Payment Date</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"paymentDate\" value=" + payment.getPaymentdate());
                %>
            </td>
        </tr>
        <tr>
            <td>Amount</td>
            <td>
                <%
                    out.println("<input type=\"number\" min=\"0\" name=\"amount\" step=\".01\" value=" + payment.getAmount());
                %>
            </td>
        </tr>
    </table>

<%--    Specify Update or Delete--%>
    <input type="submit" name="UPDATE" value="UPDATE" />
    <input type="submit" name="DELETE" value="DELETE" />
</form>
</div>
</body>
</html>
