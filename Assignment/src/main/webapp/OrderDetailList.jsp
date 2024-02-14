<%@ page import="com.utar.assignment.model.entity.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.utar.assignment.model.entity.Customer" %>
<%@ page import="com.utar.assignment.model.entity.Product" %>
<%@ page import="com.utar.assignment.model.entity.Orderdetail" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %><%--
  Created by IntelliJ IDEA.
  User: Jireh
  Date: 23/4/2023
  Time: 3:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Customer Details</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #fff;
            color: #333;
            text-align: left;
            box-shadow: 0 2px 5px rgba(0,0,0,0.3);
        }
        table th {
            background-color: #2a80b9;
            color: #fff;
            font-weight: bold;
            padding: 10px;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 1px;
            border: 1px solid #ddd;
        }
        table td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        table tr:hover {
            background-color: #ddd;
        }
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        * {
            box-sizing: border-box;
        }
        /* Button used to open the contact form - fixed at the bottom of the page */
        .open-button {
            background-color: #555;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            opacity: 0.8;
            position: fixed;
            bottom: 23px;
            right: 28px;
            width: 280px;
        }
        /* The popup form - hidden by default */
        .form-popup {
            overflow-x: hidden;
            overflow-y: auto;
            height: 400px;
            display: none;
            position: fixed;
            top: 60%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }
        /* Add styles to the form container */
        .form-container {
            max-width: 500px;
            padding: 10px;
            background-color: white;
        }
        /* Full-width input fields */
        .form-container input[type=text], .form-container input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
        }
        /* When the inputs get focus, do something */
        .form-container input[type=text]:focus, .form-container input[type=password]:focus
        {
            background-color: #ddd;
            outline: none;
        }
        /* Set a style for the submit button */
        .form-container .btn {
            background-color: #4CAF50;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-bottom: 10px;
            opacity: 0.8;
        }
        /* Add a red background color to the cancel button */
        .form-container .cancel {
            background-color: red;
        }
        /* Add some hover effects to buttons */
        .form-container .btn:hover, .open-button:hover {
            opacity: 1;
        }
        .form-popup {
            display: none;
            position: fixed;
            bottom: 0;
            right: 15px;
            border: 3px solid #f1f1f1;
            z-index: 9;
            background-color: white;
            max-width: 500px;
            padding: 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 100%;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 10px;
            width: 100%;
        }

        .input-group label {
            font-size: 14px;
            margin-bottom: 5px;
        }

        .input-group select,
        .input-group input[type="text"],
        .input-group input[type="number"] {
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            width: 100%;
        }

        .btn-group {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            width: 100%;
        }

        .btn-group button {
            margin-left: 5px;
        }
        .payment-count {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 10px;
            text-align: center;
            margin: 0 auto;
            background-color: #2a80b9;
        }

        .payment-count p {
            margin: 0;
        }

        .payment-count .count {
            font-size: 24px;
            font-weight: bold;
        }
        .cool-heading {
            font-family: "Times New Roman", Times, serif;
            font-size: 36px;
            font-weight: bold;
            text-decoration: underline;
            text-align: center;
            color: #333;
            padding: 20px;
        }
        .payment-count {
            display: flex;
            justify-content: space-between;
            background-color: #2a80b9;
            padding: 20px;
        }

        .count-box {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
            width: 45%;
        }

        .count-box p {
            margin: 0;
            font-weight: bold;
            font-size: 16px;
            color: #555;
        }

        .download-btn {
            background-color: #4CAF50; /* Green background */
            border: none; /* Remove borders */
            color: white; /* White text */
            padding: 10px 20px; /* Some padding */
            text-align: center; /* Center text */
            text-decoration: none; /* Remove underline */
            display: inline-block; /* Make it inline */
            font-size: 16px; /* Font size */
            border-radius: 8px; /* Rounded corners */
            transition: background-color 0.3s ease; /* Add transition effect */
            cursor: pointer; /* Add cursor on hover */
        }

        .download-btn:hover {
            background-color: #3e8e41; /* Darker green on hover */
        }

        .download-btn:active {
            background-color: #1e6925; /* Even darker on click */
            box-shadow: 0 5px #666; /* Add shadow on click */
            transform: translateY(4px); /* Move down on click */
        }
        .back-button {
            background-color: #868282;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 20px;
        }
        .pageref {
            text-align: center;
            font-weight: bold;
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>
<body>
<%
    String keyword = (String) request.getAttribute("keyword");
    String direction = (String) request.getAttribute("direction");
    String id = (String) request.getAttribute("id");
    List<Product> product = (List<Product>) request.getAttribute("product_list");
    List<Orderdetail> order_detail_list = (List<Orderdetail>) request.getAttribute("order_detail_single");

%>

<div style="display: flex; justify-content: space-between; align-items: center;">
    <h1 class="cool-heading">Order Records</h1>
    <button class="back-button" onclick="backButton()">Back</button>
    <input type ="hidden" name = "recordsPerPage" value="20">
    <input type ="hidden" name = "currentPage" value="1">
    <input type="hidden" name="keyword" value=""/>
    <input type="hidden" name="direction" value="ASC"/>
</div>



<%--Search Form--%>
<br>
<div style="display:flex; padding: 5px; justify-content: space-between">
    <form class="form-inline md-form mr-auto mb-6" action="OrderDetailLogic" method="get">
    <input class="form-control mr-sm-2" type="text" aria-label="Search" name="keyword" value = "<%=keyword%>" placeholder="keyword:"/>
    <select class="form-control" id="direction" name="direction">
        <option value="<%=direction%>">Sorting By : </option>
        <option value="ASC">ascending by product code</option>
        <option value="DESC">descending by product code</option>
    </select>
    <button class="btn aqua-gradient btn-rounded btn-sm my-0 btn btn-info" type="submit">Search</button>
    <input type="hidden" name="id" value="<%=id%>" />
    </form>
</div>


<div class="row col-md-6">
    <table class="table table-striped table-bordered table-sm">
        <tr>
            <th>Order Number</th>
            <th>Product Code</th>
            <th>Quantity Ordered</th>
            <th>Price Each</th>
            <th>OrderLine Number</th>
            <th>Update / Delete</th>

        </tr>
        <%
            List<Orderdetail> order_detail_record = (List<Orderdetail>) request.getAttribute("order_detail_single");
            if (order_detail_record.size() != 0) {
                int currentOrderNumber = 0;
                for (Orderdetail od : order_detail_record) {
                    if (!od.getId().getOrdernumber().equals(currentOrderNumber)) {
                        // Display the order number in the first column only when it changes
                        out.println("<tr>");
                        out.println("<td rowspan=\"" + order_detail_record.size() + "\" style=\"text-align: center ; vertical-align: middle ; font-weight: bold\">"  + od.getId().getOrdernumber() + "</td>");
                        currentOrderNumber = od.getId().getOrdernumber();
                    } else {
                        // Leave the first column blank for subsequent rows with the same order number
                        out.println("<tr>");
                    }

                    // Display the other columns as before
                    out.println("<td>" + od.getId().getProductcode() + "</td>");
                    out.println("<td>" + od.getQuantityordered()+ "</td>");
                    out.println("<td>" + od.getPriceeach() + "</td>");
                    out.println("<td>" + od.getOrderlinenumber()+ "</td>");
                    out.println("<td><a href=\"OrderDetailController?productCode=" + od.getId().getProductcode() + "&id=" + od.getId().getOrdernumber()+ "\">Edit</a></td>");
                    out.println("</tr>");
                }
            }
            else {
                out.println("<tr>");
                String status = "No records";
                for (int i = 0; i < 7; i++) {
                    out.println("<td>" + status + "</td>");
                }
                out.println("</tr>");
            }
        %>
    </table>
</div>



<button class="open-button"  onclick="openForm()">Add Product</button>

<div class="form-popup" id="myForm">
    <form name = "addOrderDetailForm" onsubmit="return validateForm()" action="OrderDetailController" class="form-container" method="post">
        <fieldset>
            <legend>Add Order Detail:</legend>
            <br>Order Number: <%=id%>
            <input type="hidden" name="orderNumber" id="orderNumber" value="<%=id%>" readonly>
            <br>Product Code:
            <select name="productCode" id="productCode" style="width: 200px">
                out.println("<option value="" selected> Pls select a product code</option>");
                <%

                    if(order_detail_list !=null && !order_detail_list.isEmpty() ){
                        Set<String> productCodesInOrder = new HashSet<>();

                        for (Orderdetail od : order_detail_list){
                            productCodesInOrder.add(od.getId().getProductcode());
                        }

                        for(Product p : product){

                            if(!productCodesInOrder.contains(p.getId())){
                                out.println("<option value=\"" + p.getId() + "\">" + p.getId() + "</option>");
                            }
                        }
                    }
                    else{
                        for(Product p : product){

                            out.println("<option value=\"" + p.getId() + "\">" + p.getId() + "</option>");
                        }
                    }

                %>
            </select>
            <br>Quantity Ordered: <input type="number" id="quantityOrdered" name="quantityOrdered" value="1"  min="1" max="999">
            <br>Order Line Number: <input type="text" name="orderLineNumber">
        </fieldset>
        <button type="submit" class="btn">Add Record</button>
        <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
        <button type="reset" class="btn">Reset</button>
    </form>
</div>
<script>
    function openForm() {
        document.getElementById("myForm").style.display = "block";
    }
    function closeForm() {
        document.getElementById("myForm").style.display = "none";
    }
    function backButton() {
        window.location.href = "AdminPage.jsp";
    }
    function validateForm() {
        var priceEach = document.forms["addOrderDetailForm"]["priceEach"].value;
        var orderLineNumber = document.forms["addOrderDetailForm"]["orderLineNumber"].value;

        if (isNaN(priceEach) || priceEach <= 0) {
            alert("Price Each must be a positive number");
            return false;
        }

        if (isNaN(orderLineNumber) || orderLineNumber <= 0 || !Number.isInteger(Number(orderLineNumber))) {
            alert("Order Line Number must be a positive integer");
            return false;
        }

        return true;
    }
</script>
</div>



</body>
</html>
