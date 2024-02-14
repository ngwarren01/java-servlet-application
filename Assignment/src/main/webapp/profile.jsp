<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="com.utar.assignment.model.entity.*" %><%--
  Created by IntelliJ IDEA.
  User: Jireh
  Date: 17/4/2023
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/normalize.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/templatemo-misc.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <script src="js/vendor/modernizr-2.6.2.min.js"></script>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        header {
            background-color: #ddd;
            padding: 20px;
        }

        .profile-header {
            display: flex;
            align-items: center;
        }

        .profile-image {
            width: 100px;
            height: 100px;
            margin-right: 20px;
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
        }


        .transaction-history h2,
        .order-details h2 {
            margin-bottom: 20px;
        }

        .transaction-history ul,
        .order-details table {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .order-details table {
            border-collapse: collapse;
            width: 100%;
        }

        .order-details th,
        .order-details td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .order-details th {
            background-color: #f2f2f2;
        }
        table {
            width: 100%;
            max-width: 100%;
            margin-bottom: 1rem;
            background-color: #fff;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 0.75rem;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
            text-align: center;
        }

        thead th {
            vertical-align: bottom;
            border-bottom: 2px solid #dee2e6;
        }

        tbody+tbody {
            border-top: 2px solid #dee2e6;
        }
        tbody tr:hover {
            background-color: #f2f2f2;
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
        h2 {
            color: #333;
            text-decoration: none;
            text-align: center;

        }

        h2:hover {
            color: lightblue;
            text-decoration: underline;
        }
        .pop-up-container {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            border: 1px solid black;
            padding: 10px;
            display: none;
        }


    </style>
</head>
<body>

<%
    String username = (String) session.getAttribute("username");
    Customer customer_record = (Customer) session.getAttribute("customer_record");
    List<Payment> payment_record = (List<Payment>) session.getAttribute("payment_record");
    List<Order> order_record = (List<Order>) session.getAttribute("order_record");
    List<Orderdetail> order_detail = (List<Orderdetail>) session.getAttribute("order_detail"); // all records of orderdetail from the specific customer
    int numberofOrderDetail = (int) session.getAttribute("numberofOrderDetail");  //
    String view = request.getParameter("view");
    if (view == null) {
        view = "0";
    }
    int specific_orderDetail = Integer.parseInt(view);
    List<Product> product_records = (List<Product>) session.getAttribute("product_records");
%>

<div class="main-header">-
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-8"  style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
                <h1 style="font-family:Open Sans, Arial, sans-serif; font-weight: 700;"><a href="#">Kool Store</a></h1>
                <button class="back-button" onclick="backButton()">Back</button>

            </div> <!-- /.col-md-4 -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main-header -->


<header>
    <div class="profile-header">
        <div class="profile-image">
            <img src="images/team-1.jpg" alt="Profile Picture">

        </div>
        <div class="profile-info">
            <%
                out.println("<h1>"+username+"</h1>");
                out.println("<p>Location : "+customer_record.getCity()+" , " + customer_record.getCountry() + "</p>");
            %>
            <form action="EditProfile.jsp">
                <input type="submit" value="Edit Profile">
            </form>
        </div>
    </div>
</header>

<div style="position: relative">
    <h2 id="order_history">Order History</h2>
    <div id="table_div1" style="display: none;">
        <table class="table table-striped table-bordered table-sm">
            <tr>
                <th>Order Number</th>
                <th>Order Date</th>
                <th>Required Date</th>
                <th>Status</th>
            </tr>
            <% if (order_record.size() != 0) {
                for (Order t : order_record) {
                    out.println("<tr>");
                    out.println("<td>" + t.getId() + "</td>");
                    out.println("<td>" + t.getOrderdate() + "</td>");
                    out.println("<td>" + t.getRequireddate() + "</td>");
                    out.println("<td>" + t.getStatus() + "</td>");
                    //out.println("<td><button class=\"order-btn\" data-order-id=\""+t.getId()+"\">View</button></td>");
                    out.println("<td><a href=\"?view=" + t.getId() + "\">View</a></td>");
                    out.println("</tr>");
                }
            } else {
                out.println("<tr>");
                String status = "No records";
                for (int i = 0; i < 4; i++) {
                    out.println("<td>" + status + "</td>");
                }
                out.println("</tr>");
            }
            %>
        </table>
    </div>
</div>

<div style="position: relative">
    <h2 id="payment_history" class="history-header">Payment History</h2>
    <div id="table_div2" style="display: none;">
        <table class="table table-striped table-bordered table-sm">
            <tr>
                <th>Check Number</th>
                <th>Payment Date</th>
                <th>Amount</th>
            </tr>
            <% if (payment_record.size() != 0) {
                for (Payment t : payment_record) {
                    out.println("<tr>");
                    out.println("<td>" + t.getId().getChecknumber() + "</td>");
                    out.println("<td>" + t.getPaymentdate() + "</td>");
                    out.println("<td>" + t.getAmount() + "</td>");
                    out.println("</tr>");
                }
            } else {
                out.println("<tr>");
                String status = "No records";
                for (int i = 0; i < 3; i++) {
                    out.println("<td>" + status + "</td>");
                }
                out.println("</tr>");
            } %>
        </table>
    </div>
</div>

<%--<div id="order-details" class="pop-up-container">
    <h3 id="order_detail" class="history-header">Order Detail</h3>
    <div id="table_div3">
        <table class="table table-striped table-bordered table-sm">
            <tr>
                <th>Product</th>
                <th>Quantity Ordered</th>
                <th>Price Per Quantity</th>
                <th>Total Price</th>
            </tr>
            <tbody id="orderDetailsTableBody"></tbody>
        </table>
    </div>
</div>--%>
<hr>

<%
    if(specific_orderDetail == 0){

    }
    else{
    out.println(" <div class=\"form-popup\" id=\"myForm\">");
    out.println(" <h2 id=\"order_detail\" class=\"history-header\">Order Detail</h2>");
    out.println(" <div id=\"table_div3\">");
    out.println(" <table class=\"table table-striped table-bordered table-sm\">");
    out.println("  <tr>");
    out.println("  <th>Product</th>");
    out.println("  <th>Quantity Ordered</th>");
    out.println("  <th>Price Per Quantity</th>");
    out.println("  <th>Total Price</th>");
    out.println("   </tr>");
    if (order_detail.size() != 0) {
    for (Orderdetail t : order_detail) {
        if(specific_orderDetail == t.getId().getOrdernumber()){
            int priceeach = t.getPriceeach().setScale(0, RoundingMode.HALF_UP).intValue();
            int total = t.getQuantityordered() * priceeach;
            for(Product p : product_records){
                if(p.getId().equals(t.getId().getProductcode())){
                    out.println("<tr>");
                    out.println("<td>" + p.getProductname() + "</td>");
                }
            }
            //out.println("<tr>");
            //out.println("<td>" + t.getId().getOrdernumber() + "</td>");
            out.println("<td>" + t.getQuantityordered() + "</td>");
            out.println("<td>" + t.getPriceeach() + "</td>");
            out.println("<td>" + total+ "</td>");
            out.println("</tr>");
        }
        else{
        }
    }
    } else {
        out.println("<tr>");
        String status = "No records";
        for (int i = 0; i < 3; i++) {
            out.println("<td>" + status + "</td>");
        }
        out.println("</tr>");
        out.println(" </table>");
        out.println("</div>");
        out.println(" </div>");
    }
    } %>



<script>
    const orderHistory = document.querySelector('#order_history');
    const tableDiv = document.querySelector('#table_div1');

    orderHistory.addEventListener('click', function() {
        if (tableDiv.style.display === 'none') {
            tableDiv.style.display = 'block';
        } else {
            tableDiv.style.display = 'none';
        }
    });
</script>


<script>
    var paymentHistory = document.getElementById("payment_history");
    var paymentTable = document.getElementById("table_div2");

    paymentHistory.addEventListener("click", function() {
    if (paymentTable.style.display === "none") {
    paymentTable.style.display = "block";
    } else {
    paymentTable.style.display = "none";
    }
    });

    function backButton() {
        window.location.href = "index.jsp";
    }
</script>

<%--<script>
    var orderDetail = document.getElementById("order_detail");
    var orderDetailTable = document.getElementById("table_div3");

    orderDetail.addEventListener("click", function() {
        if (orderDetailTable.style.display === "none") {
            orderDetailTable.style.display = "block";
        } else {
            orderDetailTable.style.display = "none";
        }
    });
</script>--%>


<%--<script>
    function backButton() {
        window.location.href = "index.jsp";
    }

    var orderBtns = document.querySelectorAll(".order-btn");
    var orderDetails = document.querySelector(".pop-up-container");
    var orderIdSpan = orderDetails.querySelector(".order-id");

    orderBtns.forEach(function(orderBtn) {
        orderBtn.addEventListener("click", function() {
            var orderId = orderBtn.dataset.orderId;
            $.ajax({
                url: '/AjaxForOrderDetails',
                type: "GET",
                dataType: "json",
                success: function(order_detail) {
                    // Loop through the order_detail list and add rows to the table
                    console.log(order_detail);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " " + errorThrown);
                }
            });



            if (orderDetails.style.display === "none") {
                orderDetails.style.display = "block";
            } else {
                orderDetails.style.display = "none";
            }
        });
    });



</script>--%>

</body>
</html>
