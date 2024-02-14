<%@ page import="com.utar.assignment.model.entity.Payment" %>
<%@ page import="java.util.List" %>
<%@ page import="com.utar.assignment.model.entity.Customer" %>
<%@ page import="com.utar.assignment.model.entity.Employee" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: Jireh
  Date: 20/3/2023
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
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
    List<Customer> customer_count = (List<Customer>) request.getAttribute("customer_count");
    List<Customer> creditLimit = (List<Customer>) request.getAttribute("creditLimit");

%>

<div style="display: flex; justify-content: space-between; align-items: center;">
    <h1 class="cool-heading">Customer Records</h1>
    <button class="back-button" onclick="backButton()">Back</button>
</div>


<div class="payment-count">
    <div class="count-box">
        <p>Number of Customer records:</p>
        <%
            out.println(" <p class=\"count\">"+customer_count.get(0));
        %>
    </div>
    <div class="count-box">
        <p>Average Credit Limit Per Customer:</p>
        <%
            DecimalFormat df = new DecimalFormat("#.##"); // create a formatter that limits to 2 decimal places
            String formattedCreditLimit = df.format(creditLimit.get(0)); // format the creditLimit value
            out.println(" <p class=\"count\"> RM : "+ formattedCreditLimit);
        %>
    </div>
</div>

<%--Search Form--%>
<br>
<div style="display:flex; padding: 5px; justify-content: space-between">
    <form class="form-inline md-form mr-auto mb-4"
          action="CustomerDetailLogic" method="get">
        <input class="form-control mr-sm-2" type="text" aria-label="Search" size="50"
               name="keyword" placeholder="Input Customer Number or Customer Name ONLY !" />
        <input type="hidden" name="currentPage" value="<%=currentPage%>" /> <input
            type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>" />

        <select class="form-control" id="direction" name="direction">
            <option value="ASC">Sort By Lowest Customer Number</option>
            <option value="DESC">Sort By Highest Customer Number</option>
        </select>
        <button class="btn aqua-gradient btn-rounded btn-sm my-0 btn btn-info"
                type="submit" style="margin-left: 10px">Navigate</button>
        <input type="hidden" name="currentPage" value="<%=currentPage%>" /> <input
            type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>" /> <input
            type="hidden" name="keyword" value="<%=keyword%>" />
    </form>

    <form action="DownloadCustomer">
        <button class="download-btn">Download as PDF</button>
    </form>
</div>


<div class="row col-md-6">
    <table class="table table-striped table-bordered table-sm">
        <tr>
            <th>Customer Number</th>
            <th>Customer Name</th>
            <th>Contact Last Name</th>
            <th>Contact First Name</th>
            <th>Phone</th>
            <th>Address Line 1</th>
            <th>Address Line 2</th>
            <th>City</th>
            <th>State</th>
            <th>Postal Code</th>
            <th>Country</th>
            <th>Sales Employee Number</th>
            <th>Credit Limit</th>
        </tr>
        <%
            List<Customer> customer = (List<Customer>) request.getAttribute("customer_records");
            if (customer.size() != 0) {
                for (Customer t : customer) {
                    out.println("<tr>");

                    out.println("<td>" + t.getId() + "</td>");
                    out.println("<td>" + t.getCustomername() + "</td>");
                    out.println("<td>" + t.getContactlastname() + "</td>");
                    out.println("<td>" + t.getContactfirstname() + "</td>");
                    out.println("<td>" + t.getPhone() + "</td>");
                    out.println("<td>" + t.getAddressline1() + "</td>");
                    out.println("<td>" + t.getAddressline2() + "</td>");
                    out.println("<td>" + t.getCity() + "</td>");
                    out.println("<td>" + t.getState() + "</td>");
                    out.println("<td>" + t.getPostalcode() + "</td>");
                    out.println("<td>" + t.getCountry()+ "</td>");

                    /*Temporary Workaround , Please FIX IN THE FUTURE - Cannot print Null Value */

                    if(t.getSalesrepemployeenumber() == null){
                        out.println("<td>None</td>");
                    }
                    else{
                        out.println("<td>" + t.getSalesrepemployeenumber().getId() + "</td>");
                    }
                    //out.println("<td>" + t.getSalesrepemployeenumber() + "</td>");
                    out.println("<td>" + t.getCreditlimit() + "</td>");
                    out.println("<td><a href=\"CustomerController?id=" + t.getId() + "\">Edit</a></td>");
                    out.println("</tr>");
                }
            }
            else{
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

<nav aria-label="Navigation for Customer">
    <ul class="pagination">
        <%
            if (currentPage != 1 && nOfPages != 0) {
        %>
        <%
            out.println("<li class=\"page-item\">");
            out.println("<a class=\"page-link\" href=\"" + "CustomerDetailLogic?recordsPerPage=" + recordsPerPage
                    + "&currentPage=1"+ "&keyword=" + keyword + "&direction=" + direction + "\">First</a>");
            out.println("</li>");
        %>
        <li class="page-item">
            <%
                out.println("<a class=\"page-link\" href=\"" + "CustomerDetailLogic?recordsPerPage=" + recordsPerPage
                        + "&currentPage=" + (currentPage - 1) + "&keyword=" + keyword + "&direction=" + direction + "\">Previous</a>");
            %>
        </li>
        <%
            }
        %>
        <%
        %>
        <%
            if (currentPage < nOfPages) {
                out.println("<li class=\"page-item\">");
                out.println("<a class=\"page-link\" href=\"" + "CustomerDetailLogic?recordsPerPage=" + recordsPerPage
                        + "&currentPage=" + (currentPage + 1)  + "&keyword=" + keyword + "&direction=" + direction + "\">Next</a>");
                out.println("</li>");
                out.println("<li class=\"page-item\">");
                out.println("<a class=\"page-link\" href=\"" + "CustomerDetailLogic?recordsPerPage=" + recordsPerPage
                        + "&currentPage=" + nOfPages + "&keyword=" + keyword + "&direction=" + direction + "\">Last</a>");
                out.println("</li>");
            }
        %>
    </ul>
</nav>
<%
    if (nOfPages != 0) {
        out.println("<p class=\"pageref\">");
        out.println(currentPage + " of " + nOfPages);
        out.println("</p>");
    }
%>
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>

<button class="open-button" onclick="openForm()">Add Customer Record</button>
<div class="form-popup" id="myForm">
    <form action="CustomerController" class="form-container" method="post">
        <h1>Add Customer</h1>
        <fieldset>
            <br>Customer Number:<input type="text" name="customerNumber" required />
            <br>Customer Name: <input type="text" name="customerName" required />
            <br>Contact Last Name: <input type="text" name="contactLastName" required />
            <br>Contact First Name:<input type="text" name="contactFirstName" required />
            <br>Phone: <input type="text" name="phone" required/>
            <br>Address Line 1: <input type="text" name="addressLine1" required/>
            <br>Address Line 2:<input type="text" name="addressLine2"/>
            <br>City: <input type="text" name="city" required/>
            <br>State: <input type="text" name="state"/>
            <br>Postal Code:<input type="text" name="postalCode"/>
            <br>Country: <input type="text" name="country" required/>

            <br>
            <%
                out.println("<label for=\"salesemp\">Sales Employee Number</label>");
                out.println("<input list= \"employees\"  name =\"salesEmployeeNumber\" id =\"salesemp\" style=\" width: 200px\" required>");
                out.println("<datalist id = \"employees\">");
                List<Employee> employee = (List<Employee>) request.getAttribute("employee_records");
                out.println("<option value=\"None\">");
                for (Employee t : employee) {
                    out.println("<option value =\"" + t.getId() + "\">");
                }
                out.println("</datalist>");
            %>
            <br>Credit Limit: <input type="number" step=".01" name="creditLimit" min="0" />
        </fieldset>
        <button type="submit" class="btn btn-success">Add Record</button>
        <button type="reset" class="btn btn-danger">Reset</button>
        <button type="button" class="btn btn-secondary" onclick="closeForm()">Close</button>
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
</script>
</div>
</body>
</html>
