<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
<!-- 
Kool Store Template
http://www.templatemo.com/preview/templatemo_428_kool_store
-->
    <meta charset="utf-8">
    <title>Carmazon - Responsive eCommerce Template</title>

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
    .circle-image {
        display: inline-block;
        vertical-align: middle;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        overflow: hidden;
        margin-right: 10px;
    }

    .circle-image img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .welcome {
        display: inline-block;
        vertical-align: middle;
        font-family: Arial, sans-serif;
        font-size: 16px;
        line-height: 1.5;
        text-align: justify;
        color: #333;
        padding: 30px;
        text-decoration: none;
    }

    .welcome:hover {
        text-decoration: underline;
        color: blue;
    }
    .logout-form {
        display: inline-block;
    }

    .logout-form input[type="submit"] {
        background-color: #919dab;
        color: #fff;
        border: none;
        margin: 10px;
        padding: 10px 20px;
        border-radius: 10px;
        font-size: 16px;
        cursor: pointer;
        transition: all 0.2s ease-in-out;
    }

    .logout-form input[type="submit"]:hover {
        background-color: #0069d9;
    }
</style>
</head>
<body>
    <!--[if lt IE 7]>
    <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
    <![endif]-->

    
    <header class="site-header">
        <div class="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <div class="top-header-left">
                            <div class = "circle-image">
                                <img src="images/profile.jpg">
                            </div>
                            <%
                                out.println("<a href= \"ProfileController\" class= \"welcome\">Welcome "+ session.getAttribute("username") +"</a>");
                               //out.println("<p style=\"font-family: Arial, sans-serif; font-size: 16px; line-height: 1.5; text-align: justify; color: #333; margin-bottom: 20px;\">Welcome " + session.getAttribute("username") +"</p>");
                            %>
                        </div> <!-- /.top-header-left -->
                    </div> <!-- /.col-md-6 -->
                    <div class="col-md-6 col-sm-6">
                        <div class="social-icons">
                            <ul>
                                <li><form class="logout-form" action="LoginController" method="get">
                                    <input type="submit" value="Log Out">
                                </form></li>

                            </ul>
                            <div class="clearfix"></div>
                        </div> <!-- /.social-icons -->
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

    <div class="content-section">
        <div class="container">
            <div class="row">

                <! -- Product 1 -->
                <div class="col-md-3 col-sm-6">
                    <div class="product-item">
                        <div class="product-thumb">
                            <a href="ProductLineController?id=1">
                                <img src="images/productsline/product1.jpg"  alt="">
                            </a>
                        </div> <!-- /.product-thum -->
                        <div class="product-content">
                            <h5><a href="ProductLineController?id=1">Classic Cars</a></h5>
                        </div> <!-- /.product-content -->
                    </div> <!-- /.product-item -->
                </div> <!-- /.col-md-3 -->

                <! -- Product 2 -->
                <div class="col-md-3 col-sm-6">
                    <div class="product-item">
                        <div class="product-thumb">
                            <a href="ProductLineController?id=2">
                                <img src="images/productsline/product2.jpg"  alt="">
                            </a>
                        </div> <!-- /.product-thum -->
                        <div class="product-content">
                            <h5><a href="ProductLineController?id=2">Motorcycles</a></h5>
                        </div> <!-- /.product-content -->
                    </div> <!-- /.product-item -->
                </div> <!-- /.col-md-3 -->

                <! -- Product 3 -->
                <div class="col-md-3 col-sm-6">
                    <div class="product-item">
                        <div class="product-thumb">
                            <a href="ProductLineController?id=3">
                                <img src="images/productsline/product3.jpg"  alt="">
                            </a>
                        </div> <!-- /.product-thum -->
                        <div class="product-content">
                            <h5><a href="ProductLineController?id=3">Planes</a></h5>
                        </div> <!-- /.product-content -->
                    </div> <!-- /.product-item -->
                </div> <!-- /.col-md-3 -->

                <! -- Product 4 -->
                <div class="col-md-3 col-sm-6">
                    <div class="product-item">
                        <div class="product-thumb">
                            <a href="ProductLineController?id=4">
                                <img src="images/productsline/product4.jpg"  alt="">
                            </a>
                        </div> <!-- /.product-thum -->
                        <div class="product-content">
                            <h5><a href="ProductLineController?id=4">Ships</a></h5>
                        </div> <!-- /.product-content -->
                    </div> <!-- /.product-item -->
                </div> <!-- /.col-md-3 -->

            </div> <!-- /.row -->

            <div class="row">

                <! -- Product 5 -->
                <div class="col-md-3 col-sm-6">
                    <div class="product-item">
                        <div class="product-thumb">
                            <a href="ProductLineController?id=5">
                                <img src="images/productsline/product5.jpg"  alt="">
                            </a>
                        </div> <!-- /.product-thum -->
                        <div class="product-content">
                            <h5><a href="ProductLineController?id=5">Trains</a></h5>
                        </div> <!-- /.product-content -->
                    </div> <!-- /.product-item -->
                </div> <!-- /.col-md-3 -->

                <! -- Product 6 -->
                <div class="col-md-3 col-sm-6">
                    <div class="product-item">
                        <div class="product-thumb">
                            <a href="ProductLineController?id=6">
                                <img src="images/productsline/product6.jpg"  alt="">
                            </a>
                        </div> <!-- /.product-thum -->
                        <div class="product-content">
                            <h5><a href="ProductLineController?id=6">Truck & Buses</a></h5>
                        </div> <!-- /.product-content -->
                    </div> <!-- /.product-item -->
                </div> <!-- /.col-md-3 -->

                <! -- Product 7 -->
                <div class="col-md-3 col-sm-6">
                    <div class="product-item">
                        <div class="product-thumb">
                            <a href="ProductLineController?id=7">
                                <img src="images/productsline/product7.jpg"  alt="">
                            </a>
                        </div> <!-- /.product-thum -->
                        <div class="product-content">
                            <h5><a href="ProductLineController?id=7">Vintage Cars</a></h5>
                        </div> <!-- /.product-content -->
                    </div> <!-- /.product-item -->
                </div> <!-- /.col-md-3 -->

                <! -- All products -->
                <div class="col-md-3 col-sm-6">
                    <div class="product-item">
                        <div class="product-thumb">
                            <a href="PaginationServlet?currentPage=1&recordsPerPage=30&keyword=&direction=&sortField=">
                                <img src="images/productsline/allproduct.jpg"  alt="">
                            </a>
                        </div> <!-- /.product-thum -->
                        <div class="product-content">
                            <h5><a href="PaginationServlet?currentPage=1&recordsPerPage=30&keyword=&direction=&sortField=">All products</a></h5>
                        </div> <!-- /.product-content -->
                    </div> <!-- /.product-item -->
                </div> <!-- /.col-md-3 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.content-section -->


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
                            Kool Store is free responsive eCommerce template provided by templatemo website. You can use this layout for any website.
                            <br><br>Tempore cum mollitia eveniet laboriosam corporis voluptas earum voluptate. Lorem ipsum dolor sit amet.
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
                        <span>Copyright &copy; 2084 <a href="#">Company Name</a> | Design: <a href="http://www.templatemo.com">templatemo</a></span>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium, expedita soluta mollitia accusamus ut architecto maiores cum fugiat. Pariatur ipsum officiis fuga deleniti alias quia nostrum veritatis enim doloremque eligendi?</p>
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