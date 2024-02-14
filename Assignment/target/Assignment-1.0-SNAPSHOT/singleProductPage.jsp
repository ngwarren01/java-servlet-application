<%@ page import="com.utar.assignment.model.entity.Product" %>
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
    <link rel="stylesheet" href="css/styles.css.css.css">


    <script src="js/vendor/modernizr-2.6.2.min.js"></script>

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


    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-5 gx-lg-5 align-items-center">

            <%
                Product p = (Product) request.getAttribute("product");
            %>


            <div class="col-md-6"><img style="width: 100%; height: auto;" class="card-img-top mb-4 mb-md-0"
                                       src="images/productsline/product1.jpg" alt="..."/></div>
            <div class="col-md-6">
                <h1 class="display-5 fw-bolder"><% out.println(p.getProductname()); %></h1>
                <div class="small mb-1">Product Code:  <% out.println(" "+p.getId()); %> </div>
                <p><% out.println(p.getProductline().getId()); %></p>
                <div class=>
                    <div class="fs-5 mb-5">
                        <del class="text-muted">RM<% out.println(p.getMsrp()); %></del>
                        <h3 class="text-danger font-weight-bold ml-2">RM<% out.println(p.getBuyprice()); %></h3>
                    </div>
                    <p class="lead"><% out.println(p.getProductdescription()); %></p>
                    <h4 class="display-2 fw-bolder">Quantity in Stock: <% out.println(" "+ p.getQuantityinstock()); %> </h4>
                    <br>

                    <div class="d-flex">
                        <button class="btn btn-outline-dark flex-shrink-0" type="button">
                            <a href="#" onclick="submitForm()">
                                <i class="bi-cart-fill me-1">Add to cart</i>
                            </a>
                            <form id="myForm" action="CartServlet" method="post">
                                <input type="hidden" name="productId" value=<%out.print("\""+p.getId()+"\"");%>  ">
                            </form>

                            <script>
                                function submitForm() {
                                    document.getElementById("myForm").submit();
                                }
                            </script>
                        </button>
                    </div>

                    <br><br>
                </div>
            </div>
        </div>
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
                            <br><br>Tempore cum mollitia eveniet laboriosam corporis voluptas earum voluptate. Lorem
                            ipsum
                            dolor sit amet.
                            <br><br>Credit goes to <a rel="nofollow" href="http://unsplash.com">Unsplash</a> for all
                            images.
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
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium, expedita soluta
                            mollitia
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