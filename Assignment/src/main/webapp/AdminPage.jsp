<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Page</title>

</head>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, Helvetica, sans-serif;
    }
    nav {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 80px;
        background-color: #2a80b9;
    }
    nav a {
        color: white;
        text-decoration: none;
        font-size: 20px;
        margin: 0 20px;
        transition: color 0.3s ease-in-out;
        cursor: pointer;
    }
    nav a:hover {
        color: #ffd700;
    }

    button {
        padding: 10px 20px;
        font-size: 1.2rem;
        background-color: #4CAF50;
        color: white;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #3E8E41;
    }
    form{
        padding: 15px;
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
    div{
        padding: 15px;
    }
</style>
<body>


<div style="display: flex; justify-content: space-between; align-items: center;">
    <h1>Admin Panel</h1>
    <button class="back-button" onclick="backButton()">Log Out</button>
</div><br/>

<nav class="navbar">
    <form action="PaginationServlet">
        <input type ="hidden" name = "recordsPerPage" value="30">
        <input type ="hidden" name = "currentPage" value="1">
        <input type ="hidden" name = "keyword" value="">
        <input type ="hidden" name = "direction" value ="">
        <input type ="hidden" name = "sortField" value ="">
        <button type="submit" class="btn btn-primary">Products</button>
    </form>

    <form action="OrderLogic">
        <input type ="hidden" name = "recordsPerPage" value="20">
        <input type ="hidden" name = "currentPage" value="1">
        <input type ="hidden" name = "keyword" value="">
        <input type ="hidden" name = "direction" value ="ASC">
        <button type="submit" class="btn btn-primary">Orders</button>
    </form>

    <form action="EmployeeDetailLogic", method="get">
        <input type ="hidden" name = "recordsPerPage" value="20">
        <input type ="hidden" name = "currentPage" value="1">
        <input type ="hidden" name = "keyword" value="">
        <input type ="hidden" name = "direction" value ="ASC">
        <button type="submit" class="btn btn-primary">Employee Details</button>
    </form>

    <form action="OfficeDetailLogic" method="get">
        <input type ="hidden" name = "recordsPerPage" value="20">
        <input type ="hidden" name = "currentPage" value="1">
        <input type ="hidden" name = "keyword" value="">
        <input type ="hidden" name = "direction" value ="ASC">
        <button type="submit" class="btn btn-primary">Office Details</button>
    </form>

    <form action="PaymentDetailLogic">
        <input type ="hidden" name = "recordsPerPage" value="20">
        <input type ="hidden" name = "currentPage" value="1">
        <input type ="hidden" name = "keyword" value="">
        <input type ="hidden" name = "direction" value ="ASC">
        <button type="submit" class="btn btn-primary">Payment Details</button>
    </form>

    <form action="CustomerDetailLogic", method="get">
        <input type ="hidden" name = "recordsPerPage" value="20">
        <input type ="hidden" name = "currentPage" value="1">
        <input type ="hidden" name = "keyword" value="">
        <input type ="hidden" name = "direction" value ="ASC">
        <button type="submit" class="btn btn-primary">Customer Details</button>
    </form>
</nav>
<script>
    function backButton(){
        window.location.href = "Login.jsp";
    }
</script>
</body>
</html>
