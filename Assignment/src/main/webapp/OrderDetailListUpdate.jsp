<%@ page import="com.utar.assignment.model.entity.Customer" %>
<%@ page import="com.utar.assignment.model.entity.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.persistence.Query" %>
<%@ page import="javax.ejb.EJB" %>
<%@ page import="com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal" %>
<%@ page import="com.utar.assignment.model.entity.Order" %>
<%@ page import="com.utar.assignment.model.entity.Orderdetail" %><%--
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
    Orderdetail orderdetail = (Orderdetail) request.getAttribute("product_code");
%>

<form action="OrderDetailController" method="post" style="color: black">

    <table>
        <tr>
            <td style="padding-right: 2px">Order Number : </td>
            <td>
                <%
                    out.println(orderdetail.getId().getOrdernumber());
                    out.println("<input type=\"hidden\" name=\"orderNumber\" readonly value=" + orderdetail.getId().getOrdernumber());
                %>
            </td>
        </tr>

        <tr>
            <td style="padding-right: 2px">Product Code : </td>
            <td>
                <%
                    out.println(orderdetail.getId().getProductcode());
                    out.println("<input type=\"hidden\" name=\"productCode\" readonly value=" + orderdetail.getId().getProductcode());

                %>
            </td>

        </tr>

        <tr>
            <td style="padding-right: 2px">Quantity Ordered : </td>
            <td>
                <%
                    out.println("<input type=\"number\" id=\"quantityOrdered\" name=\"quantityOrdered\" value=\"" + orderdetail.getQuantityordered() + "\" min=\"1\" max=\"999\">");
                %>
            </td>
        </tr>

        <tr>
            <td style="padding-right: 2px">Price Each : </td>
            <td>
                <%
                    out.println(orderdetail.getPriceeach());
                    out.println("<input type=\"hidden\" name=\"priceEach\" readonly value=" + orderdetail.getPriceeach());
                %>
            </td>
        </tr>

        <tr>
            <td style="padding-right: 2px">OrderLine Number : </td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"orderLineNumber\" style = \" width: 50%; margin: 10px; border: 1px solid black;background: #ffffff;\" value=" + orderdetail.getOrderlinenumber());
                %>
            </td>
        </tr>

    </table>

    <br>
    <input type="submit" name="UPDATE" class="btn btn-primary" value="UPDATE" />
    <input type="submit" name="DELETE" class="btn btn-danger" value="DELETE" />
    <input type="submit" name="CANCEL" class="btn btn-success" value="CANCEL" />
</form>
</body>
</html>
