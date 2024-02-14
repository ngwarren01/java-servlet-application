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


    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
<style>
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
</head>


<body>
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to
    improve your experience.</p>
<![endif]-->

<header class="site-header">
    <div class="top-header">
        <div class="container">
            <div class="row">
                <
                <div class="col-md-6 col-sm-6">

                </div> <!-- /.col-md-6 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.top-header -->
    <div class="main-header">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-8">
                    <div class="logo">
                        <h1><a href="#">Carmazon Store</a></h1>
                    </div> <!-- /.logo -->
                </div> <!-- /.col-md-4 -->
                <div class="col-md-8 col-sm-6 col-xs-4">

                </div> <!-- /.col-md-8 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.main-header -->
    <div class="main-nav">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-7">
                </div> <!-- /.col-md-6 -->
                <div class="col-md-6 col-sm-5">

                </div> <!-- /.col-md-6 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.main-nav -->
</header> <!-- /.site-header -->

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


<footer class="site-footer">
    <div class="our-partner">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="customNavigation">
                        <a class="btn prev"><i class="fa fa-angle-left"></i></a>
                        <a class="btn next"><i class="fa fa-angle-right"></i></a>
                    </div>
                    <div id="owl-demo" class="owl-carousel">
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
                        </div>
                    </div> <!-- /#owl-demo -->
                </div> <!-- /.col-md-12 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.our-partner -->
    <div class="main-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="footer-widget">
                        <h3 class="widget-title">About Us</h3>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi, debitis recusandae.
                        <ul class="follow-us">
                            <li><a href="#"><i class="fa fa-facebook"></i>Facebook</a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i>Twitter</a></li>
                        </ul> <!-- /.follow-us -->
                    </div> <!-- /.footer-widget -->
                </div> <!-- /.col-md-3 -->
                <div class="col-md-3">
                    <div class="footer-widget">
                        <h3 class="widget-title">Why Choose Us?</h3>
                        Kool Store is free responsive eCommerce template provided by templatemo website. You can use
                        this layout for any website.
                        <br><br>Tempore cum mollitia eveniet laboriosam corporis voluptas earum voluptate. Lorem ipsum
                        dolor sit amet.
                        <br><br>Credit goes to <a rel="nofollow" href="http://unsplash.com">Unsplash</a> for all images.
                    </div> <!-- /.footer-widget -->
                </div> <!-- /.col-md-3 -->
                <div class="col-md-2">
                    <div class="footer-widget">
                        <h3 class="widget-title">Useful Links</h3>
                        <ul>
                            <li><a href="#">Our Shop</a></li>
                            <li><a href="#">Partners</a></li>
                            <li><a href="#">Gift Cards</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Help</a></li>
                        </ul>
                    </div> <!-- /.footer-widget -->
                </div> <!-- /.col-md-2 -->
                <div class="col-md-4">
                    <div class="footer-widget">
                        <h3 class="widget-title">Our Newsletter</h3>
                        <div class="newsletter">
                            <form action="#" method="get">
                                <p>Sign up for our regular updates to know when new products are released.</p>
                                <input type="text" title="Email" name="email" placeholder="Your Email Here">
                                <input type="submit" class="s-button" value="Submit" name="Submit">
                            </form>
                        </div> <!-- /.newsletter -->
                    </div> <!-- /.footer-widget -->
                </div> <!-- /.col-md-4 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.main-footer -->
    <div class="bottom-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <span>Copyright &copy; 2084 <a href="#">Company Name</a> | Design: <a
                            href="http://www.templatemo.com">templatemo</a></span>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium, expedita soluta mollitia
                        accusamus ut architecto maiores cum fugiat. Pariatur ipsum officiis fuga deleniti alias quia
                        nostrum veritatis enim doloremque eligendi?</p>
                </div> <!-- /.col-md-12 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.bottom-footer -->
</footer> <!-- /.site-footer -->


<script src="js/vendor/jquery-1.10.1.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.1.min.js"><\/script>')</script>
<script src="js/jquery.easing-1.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>
<script>
    function backButton() {
        window.location.href = "index.jsp";
    }
</script>


</body>
</html>