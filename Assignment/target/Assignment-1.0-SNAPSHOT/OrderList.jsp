<%@ page import="com.utar.assignment.model.entity.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.utar.assignment.model.entity.Customer" %><%--
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
    int currentPage = (int) request.getAttribute("currentPage");
    int recordsPerPage = (int) request.getAttribute("recordsPerPage");
    int nOfPages = (int) request.getAttribute("nOfPages");
    String keyword = (String) request.getAttribute("keyword");
    String direction = (String) request.getAttribute("direction");
    int row = (int) request.getAttribute("row");

%>

<div style="display: flex; justify-content: space-between; align-items: center;">
    <h1 class="cool-heading">Order Records</h1>
    <button class="back-button" onclick="backButton()">Back</button>
</div>



<%--Search Form--%>
<br>
<div style="display:flex; padding: 5px; justify-content: space-between">
    <form class="form-inline md-form mr-auto mb-6" action="OrderLogic" method="get">
        <input class="form-control mr-sm-2" type="text" aria-label="Search" name="keyword" value = "<%=keyword%>"/>
        <select class="form-control" id="direction" name="direction">
            <option value="<%=direction%>">Sorting By : </option>
            <option value="ASC">ascending by order number</option>
            <option value="DESC">descending by order number</option>
        </select>
        <button class="btn aqua-gradient btn-rounded btn-sm my-0 btn btn-info" type="submit">Search</button>
        <input type="hidden" name="currentPage" value="<%=currentPage%>" />
        <input type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>" />
        <input type="hidden" name="direction" value="<%=direction%>" />
    </form>
</div>


<div class="row col-md-6">
    <table class="table table-striped table-bordered table-sm">
        <tr>
            <th>Order Number</th>
            <th>Order Date</th>
            <th>Require Date</th>
            <th>Shipped Date</th>
            <th>Status</th>
            <th>Comments</th>
            <th>Customer Number</th>
            <th>Update/Delete</th>
            <th>View Details</th>
        </tr>
        <%
            List<Order> record = (List<Order>) request.getAttribute("record");
            if (record.size() != 0) {
                for (Order o : record) {
                    out.println("<tr>");

                    out.println("<td>" + o.getId()+ "</td>");
                    out.println("<td>" + o.getOrderdate() + "</td>");
                    out.println("<td>" + o.getRequireddate()+ "</td>");
                    out.println("<td>" + o.getShippeddate() + "</td>");
                    out.println("<td>" + o.getStatus()+ "</td>");
                    out.println("<td>" + o.getComments() + "</td>");
                    out.println("<td>" + o.getCustomernumber() + "</td>");
                    out.println("<td><a href=\"OrderController?id=" + o.getId() + "\">Edit</a></td>");
                    out.println("<td><a href=\"OrderDetailLogic?id=" + o.getId()+ "&keyword=&direction=ASC"+"\">View Details</a></td>");
                    out.println("</tr>");
                }
            }
            else {
                out.println("<tr>");
                String status = "No records";
                for (int i = 0; i < 8; i++) {
                    out.println("<td>" + status + "</td>");
                }
                out.println("</tr>");
            }
        %>
    </table>
</div>

<nav aria-label="Navigation for staffs">
    <ul class="pagination">
        <% if (currentPage != 1 && nOfPages != 0) { %>
        <li class="page-item">
            <% out.println("<a class=\"page-link\" href=\"" + "OrderLogic?recordsPerPage=" + recordsPerPage
                    + "&currentPage=1"+ "&keyword=" + keyword + "&direction=" + direction + "\">First</a>"); %>
        </li>
        <li class="page-item">
            <% out.println("<a class=\"page-link\" href=\"" + "OrderLogic?recordsPerPage=" + recordsPerPage
                    + "&currentPage=" + (currentPage - 1) + "&keyword=" + keyword + "&direction=" + direction + "\">Previous</a>"); %>
        </li>
        <% } %>
        <% if (currentPage < nOfPages) { %>
        <li class="page-item">
            <% out.println("<a class=\"page-link\" href=\"" + "OrderLogic?recordsPerPage=" + recordsPerPage
                    + "&currentPage=" + (currentPage + 1)  + "&keyword=" + keyword + "&direction=" + direction + "\">Next</a>"); %>
        </li>
        <li class="page-item">
            <% out.println("<a class=\"page-link\" href=\"" + "OrderLogic?recordsPerPage=" + recordsPerPage
                    + "&currentPage=" + nOfPages + "&keyword=" + keyword + "&direction=" + direction + "\">Last</a>"); %>
        </li>
        <% } %>
    </ul>
</nav>
<%
    if (nOfPages != 0) {
        out.println("<p class=\"pageref\">");
        out.println(currentPage + " of " + nOfPages);
        out.println("</p>");
    }
%>

<button class="open-button" onclick="openForm()">Add Order Record</button>
<div class="form-popup" id="myForm">
    <form onsubmit="return validateForm()" name = "addOrderForm" action="OrderController" class="form-container" method="post">
        <legend>Add Order :</legend>
        <div class="form-group">
            <%
                List<Order> orders = (List<Order>) request.getAttribute("allOrderRecord");
                int largestNumber = 0;
                for (Order o : orders) {
                    if (o.getId() > largestNumber) {
                        largestNumber = o.getId();
                    }
                }
                int nextNumber = largestNumber + 1;
            %>
            <label for="orderNumber">Order Number : </label>
            <input type="text" name="orderNumber" readonly class="form-control-plaintext" id="orderNumber" value="<%= nextNumber %>">
        </div>

        <div class="form-group">
            <label id="orderDate" for="orderDate">Order Date : </label>
            <input type="text" name="orderDate" id="orderDateInput" />
            <%--                    <label id = "orderDate" for="orderDate">Order Date : </label>
                                <input type="date" name="orderDate" />--%>
        </div>

        <div class="form-group">
            <label id = "requireDate" for="requireDate">Require Date : </label>
            <input type="date" name="requireDate" />
        </div>

        <div class="form-group">
            <label id = "shippedDate" for="shippedDate">Shipped Date : </label>
            <input type="date" name="shippedDate" />
        </div>

        <div class="form-group">
            <label for="status">Status :</label>
            <select name="status" id="status">
                <option value="In Process">In Process</option>
                <option value="Shipped">Shipped</option>
            </select>
        </div>

        <div class="form-group">
            <label id="comments" for="comments">Comments : </label>
            <textarea name="comments" rows="4" cols="50"></textarea>
        </div>

        <div class="form-group">
            <label for="customerNumber">Customer Number : </label>
            <select name="customerNumber" id="customerNumber" style="width: 200px">
                out.println("<option value="" selected> Pls select a customer</option>");
                <% List<Customer> customers = (List<Customer>) request.getAttribute("customer_records");
                    for (Customer customer : customers) {
                        out.println("<option value=\"" + customer.getId() + "\">" + customer.getId() + "</option>");
                    }
                %>
            </select>
        </div>

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
        var orderDate = document.forms["addOrderForm"]["orderDate"].value;
        var shippedDate = document.forms["addOrderForm"]["shippedDate"].value;

        if (orderDate && shippedDate && orderDate > shippedDate) {
            alert("Order date cannot be later than shipped date");
            return false;
        }
        return true;
    }
</script>
</div>



</body>
</html>
