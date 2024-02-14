<%@ page import="com.utar.assignment.model.entity.Payment" %>
<%@ page import="com.utar.assignment.model.entity.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="com.utar.assignment.model.entity.Product" %><%--
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
    Product product = (Product) request.getAttribute("product_detail_single");
%>

<%--POST THE UPDATE/DELETE--%>
<div class="container">
    <form action="ProductController" method="post">
        <table>
            <tr>
                <td>Product Code</td>
                <td>

                    <%
                        out.println("<input type=\"text\" name=\"productcode\" style=\"background-color: #f2f2f2\" readonly value=\""+ product.getId() +"\"");
                    %>

                </td>
            </tr>
            <tr>
                <td>Product Name</td>
                <td>
                    <%
                        out.println("<input type=\"text\" name=\"productname\" style=\"background-color: #f2f2f2\"  value=\"" + product.getProductname() +"\"");
                    %>
                </td>
            </tr>

            <tr>
                <td>Productline</td>
                <td>
                    <%
                        out.println("<input type=\"text\" name=\"productline\" readonly value=\"" + product.getProductline().getId() +"\"");
                    %>
                </td>
            </tr>
            <tr>
                <td>Product Scale</td>
                <td>
                    <%
                        out.println("<input type=\"text\" name=\"productscale\"  value=\"" + product.getProductscale() +"\"");
                    %>
                </td>
            </tr>
            <tr>
                <td>Product Vendor</td>
                <td>
                    <%
                        out.println("<input type=\"text\" name=\"productvendor\"  value=\"" + product.getProductvendor() +"\"");
                    %>
                </td>
            </tr>
            <tr>
                <td>Product Description</td>
                <td>
                    <%
                        out.println("<input type=\"text\" name=\"productdescription\" value=\"" + product.getProductdescription() +"\"");
                    %>
                </td>
            </tr>
            <tr>
                <td>Quantity In Stock</td>
                <td>
                    <%
                        out.println("<input type=\"number\" min=\"0\" name=\"quantityinstock\"  value=\"" + product.getQuantityinstock() +"\"");
                    %>
                </td>
            </tr>
            <tr>
                <td>Buy Price</td>
                <td>
                    <%
                        out.println("<input type=\"number\" min=\"0\" name=\"buyprice\" step=\".01\" value=\"" + product.getBuyprice() +"\"");
                    %>
                </td>
            </tr>
            <tr>
                <td>MSRP</td>
                <td>
                    <%
                        out.println("<input type=\"number\" min=\"0\" name=\"msrp\" step=\".01\" value=\"" + product.getMsrp() +"\"");
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
