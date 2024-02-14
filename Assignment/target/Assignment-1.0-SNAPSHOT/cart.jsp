<%@ page import="com.utar.assignment.model.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.text.DecimalFormat" %>
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
                <div class="col-md-6 col-sm-6">
                </div> <!-- /.col-md-6 -->
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
                        <h1><a href="#">Carmazon</a></h1>
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
    <h1>Shopping Cart</h1>
    <a href="PaginationServlet?currentPage=1&recordsPerPage=30&keyword=&direction=&sortField=">Back</a>
</div>

<div class="content-section">
    <div class="container">

        <div class="row">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Index</th>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Product Line</th>
                    <th>Vendor</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Remove Item</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<Product> product = (List<Product>) session.getAttribute("cart");
                    if (product.size() != 0) {
                        for (Product p : product) {
                            out.println("<tr>");
                            out.println("<td>" + (product.indexOf(p) + 1) + "</td>");
                            out.println("<td>" + p.getId() + "</td>");
                            out.println("<td>" + p.getProductname() + "</a></td>");
                            out.println("<td>" + p.getProductline().getId() + "</td>");
                            out.println("<td>" + p.getProductvendor() + "</td>");
                            out.println("<td>" + p.getQuantityinstock() + "</td>");
                            out.println("<td>" + "RM" + p.getBuyprice() + "</td>");
                            out.println("<td><a href =CartServlet?action=remove&productId=" + p.getId() + ">" + "Remove" + "</a></td>");
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

        <br><br>

        <div class="row">
            <div class="col-md-8"></div>

            <div class="col-md-4">

                <h3 style="text-align: right;">
                    <%
                        double totalPrice = 0.0;
                        for (Product p: product){
                            totalPrice += p.getBuyprice().doubleValue();

                        }

                    %>

                    <%
                        if (product.size() != 0) {
                            DecimalFormat df = new DecimalFormat("#.##");
                            String formattedTotalPrice = df.format(totalPrice);
                            out.print("Total Amount: RM" + formattedTotalPrice + "");
                            session.setAttribute("totalPrice", totalPrice);
                        }
                    %>
                </h3>
                <%
                    if (product.size() != 0) {
                        out.println("<form method=\"get\", action=\"Checkout\">");
                        out.println("<button href=\"Checkout\" class=\"btn btn-primary\" style=\"float: right;\">Checkout</button>");
                        out.println("</form>");
                    }
                %>

            </div>

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


</body>
</html>