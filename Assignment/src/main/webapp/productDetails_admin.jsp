<%@ page import="com.utar.assignment.model.entity.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <!--
    Kool Store Template
    http://www.templatemo.com/preview/templatemo_428_kool_store
    -->
    <meta charset="utf-8">
    <title>Kool Store - Responsive eCommerce Template</title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/normalize.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/templatemo-misc.css">
    <link rel="stylesheet" href="css/templatemo-style.css">

    <style>
        th,td{
            padding:15px;
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
        .pageref {
            text-align: center;
            font-weight: bold;
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

    </style>


    <script src="js/vendor/modernizr-2.6.2.min.js"></script>

</head>


<body>

<div style="display: flex; justify-content: space-between; align-items: center;">
    <h1>Product Catalog</h1>
    <button class="back-button" onclick="backButton()">Back</button>
</div>
<div class="content-section">
    <div class="container">


        <%
            int currentPage = (int) request.getAttribute("currentPage");
            int recordsPerPage = (int) request.getAttribute("recordsPerPage");
            int nOfPages = (int) request.getAttribute("nOfPages");
            String keyword = (String) request.getAttribute("keyword");
            String direction = (String) request.getAttribute("direction");
            String sortField = (String) request.getAttribute("sortField");
        %>

        <div class="row">
            <form class="form-inline md-form mr-auto mb-4"
                  action="PaginationServlet" method="get">
                <input class="form-control mr-sm-2" type="text" aria-label="Search" size="50"
                       name="keyword" placeholder="Find ID, Product Name or Vendor" value="${param.keyword}"/>
                <input type="hidden" name="currentPage" value="<%=currentPage%>" /> <input
                    type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>" />

                <select class="form-control" id="sortField" name="sortField">
                    <option value="id" ${param.sortField == 'id' ? 'selected' : ''}>Sort By ID </option>
                    <option value="buyprice" ${param.sortField == 'buyprice' ? 'selected' : ''}>Sort By Price</option>
                    <option value="quantityinstock" ${param.sortField == 'quantityinstock' ? 'selected' : ''}>Sort By Quantity</option>
                </select>

                <select class="form-control" id="direction" name="direction">
                    <option value="ASC" ${param.direction == 'ASC' ? 'selected' : ''}>Sort Ascending (Low to High) </option>
                    <option value="DESC" ${param.direction == 'DESC' ? 'selected' : ''}>Sort Descending (High to Low)</option>
                </select>
                <button class="btn aqua-gradient btn-rounded btn-sm my-0 btn btn-info"
                        type="submit" style="margin-left: 10px">Search</button>
                <input type="hidden" name="currentPage" value="<%=currentPage%>" /> <input
                    type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>" /> <input
                    type="hidden" name="keyword" value="<%=keyword%>" />
            </form>
        </div>


        <div class="row">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Product Line</th>
                    <th>Scale</th>
                    <th>Vendor</th>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>MSRP</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<Product> product = (List<Product>) request.getAttribute("products");
                    if (product.size() != 0) {
                        for (Product p : product) {
                            out.println("<tr>");
                            out.println("<td>" + p.getId() + "</td>");
                            out.println("<td><a href =SingleProductPagination?id="+p.getId()+">"+ p.getProductname() + "</a></td>");
                            out.println("<td>" + p.getProductline().getId() + "</td>");
                            out.println("<td>" + p.getProductscale() + "</td>");
                            out.println("<td>" + p.getProductvendor() + "</td>");
                            out.println("<td>" + p.getProductdescription() + "</td>");
                            out.println("<td>" + p.getQuantityinstock() + "</td>");
                            out.println("<td>" + "RM" + p.getBuyprice() + "</td>");
                            out.println("<td>" + "RM" + p.getMsrp() + "</td>");
                            out.println("<td><a href=\"ProductController?id=" + p.getId() + "\">EDIT</a></td>");
                            out.println("</tr>");
                        }
                    } else {
                        out.println("<tr>");
                        String status = "No records";
                        for (int i = 0; i < 8; i++) {
                            out.println("<td>" + status + "</td>");
                        }
                        out.println("</tr>");
                    }
                %>
                </tbody>
            </table>
        </div>

        <div class="row">
            <nav aria-label="Navigation for products">
                <ul class="pagination">
                    <%
                        if (currentPage != 1 && nOfPages != 0) {
                    %>

                    <%
                        out.println("<li class=\"page-item\">");
                        out.println("<a class=\"page-link\" href=\"" + "PaginationServlet?recordsPerPage=" + recordsPerPage
                                + "&currentPage=1" + "&keyword=" + keyword + "&direction=" + direction
                                + "&sortField=" + sortField + "\">First</a>");
                        out.println("</li>");
                    %>
                    <li class="page-item">
                        <%
                            out.println("<a class=\"page-link\" href=\"" + "PaginationServlet?recordsPerPage=" + recordsPerPage
                                    + "&currentPage=" + (currentPage - 1) + "&keyword=" + keyword + "&direction=" + direction
                                    + "&sortField=" + sortField+ "\">Previous</a>");
                        %>
                    </li>
                    <%
                        }
                    %>

                    <%
                        if (currentPage < nOfPages) {
                            out.println("<li class=\"page-item\">");
                            out.println("<a class=\"page-link\" href=\"" + "PaginationServlet?recordsPerPage=" + recordsPerPage
                                    + "&currentPage=" + (currentPage + 1) + "&keyword=" + keyword + "&direction=" + direction
                                    + "&sortField=" + sortField+ "\">Next</a>");
                            out.println("</li>");
                            out.println("<li class=\"page-item\">");
                            out.println("<a class=\"page-link\" href=\"" + "PaginationServlet?recordsPerPage=" + recordsPerPage
                                    + "&currentPage=" + nOfPages + "&keyword=" + keyword + "&direction="+ direction
                                    + "&sortField=" + sortField +"\">Last</a>");
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
        </div>


    </div> <!-- /.container -->
</div> <!-- /.content-section -->



<script src="js/vendor/jquery-1.10.1.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.1.min.js"><\/script>')</script>
<script src="js/jquery.easing-1.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>


<button class="open-button" onclick="openForm()">Add Product Records</button>
<div class="form-popup" id="addProductForm">
    <form action="ProductController" class="form-container" method="post">
        <h1>Product Records</h1>
        <fieldset>
            <legend>Add Products Details:</legend>
            <br>Product Code : <input type="text" name="productcode" />
            <br>Product Name : <input type="text" name="productname" />
            <br>Product line : <input type="text" name="productline" />
            <br>Product Scale: <input type="text" name="productscale" />
            <br>Product Vendor: <input type="text" name="productvendor" />
            <br>Product Description: <input type="text" name="productdescription" />
            <br>Quantity in Stock: <input type="number" step="1" name="quantityinstock" min="0" />
            <br>Buy Price: <input type="number" step=".01" name="buyprice" min="0" />
            <br>MSRP: <input type="number" step=".01" name="msrp" min="0" />
            <br><br>
        </fieldset>
        <button type="submit" class="btn">Add Record</button>
        <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
        <button type="reset" class="btn">Reset</button>
    </form>
</div>
<script>
    function openForm() {
        document.getElementById("addProductForm").style.display = "block";
    }
    function closeForm() {
        document.getElementById("addProductForm").style.display = "none";
    }
    function backButton() {
        window.location.href = "index.jsp";
    }
</script>

</body>
</html>