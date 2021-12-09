<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="zxx">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>pillloMart</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
    
   <style>
   .copyright_text {margin:auto}
   </style>
</head>

<body>
    <!--::header part start::-->
    	    <jsp:include page="/fragment/header.jsp" />
    <!-- Header part end-->

    <!-- breadcrumb part start-->
    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2>About</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->
    
    <!-- product list part start-->
    <section class="about_us padding_top">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="about_us_content">
                        <h5>Our Mission</h5>
                        <h3>Donec imperdiet congue orci consequat mattis. Donec rutrum porttitor sollicitudin. Pellentesque id dolor tempor sapien feugiat ultrices nec sed neque.</h3>
                        <div class="about_us_video">
                            <img src="img/about_us_video.png" alt="#" class="img-fluid">
                            <a class="about_video_icon popup-youtube" href="https://www.youtube.com/watch?v=DWHB6nTyKDI"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- product list part end-->

<!--     feature part here -->
<!--     <section class="feature_part section_padding"> -->
<!--         <div class="container"> -->
<!--             <div class="row justify-content-between"> -->
<!--                 <div class="col-lg-6"> -->
<!--                     <div class="feature_part_tittle"> -->
<!--                         <h3>Credibly innovate granular -->
<!--                         internal or organic sources -->
<!--                         whereas standards.</h3> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-5"> -->
<!--                     <div class="feature_part_content"> -->
<!--                         <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources. Credibly innovate granular internal or “organic” sources whereas high standards in web-readiness.</p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="row justify-content-center"> -->
<!--                 <div class="col-lg-3 col-sm-6"> -->
<!--                     <div class="single_feature_part"> -->
<!--                         <img src="img/icon/feature_icon_1.svg" alt="#"> -->
<!--                         <h4>Credit Card Support</h4> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-3 col-sm-6"> -->
<!--                     <div class="single_feature_part"> -->
<!--                         <img src="img/icon/feature_icon_2.svg" alt="#"> -->
<!--                         <h4>Online Order</h4> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-3 col-sm-6"> -->
<!--                     <div class="single_feature_part"> -->
<!--                         <img src="img/icon/feature_icon_3.svg" alt="#"> -->
<!--                         <h4>Free Delivery</h4> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-3 col-sm-6"> -->
<!--                     <div class="single_feature_part"> -->
<!--                         <img src="img/icon/feature_icon_4.svg" alt="#"> -->
<!--                         <h4>Product with Gift</h4> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
<!--     feature part end -->
    
<!--     client review part here -->
<!--     <section class="client_review"> -->
<!--         <div class="container"> -->
<!--             <div class="row justify-content-center"> -->
<!--                 <div class="col-lg-8"> -->
<!--                     <div class="client_review_slider owl-carousel"> -->
<!--                         <div class="single_client_review"> -->
<!--                             <div class="client_img"> -->
<!--                                 <img src="img/client.png" alt="#"> -->
<!--                             </div> -->
<!--                             <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p> -->
<!--                             <h5>- Micky Mouse</h5> -->
<!--                         </div> -->
<!--                         <div class="single_client_review"> -->
<!--                             <div class="client_img"> -->
<!--                                 <img src="img/client_1.png" alt="#"> -->
<!--                             </div> -->
<!--                             <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p> -->
<!--                             <h5>- Micky Mouse</h5> -->
<!--                         </div> -->
<!--                         <div class="single_client_review"> -->
<!--                             <div class="client_img"> -->
<!--                                 <img src="img/client_2.png" alt="#"> -->
<!--                             </div> -->
<!--                             <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p> -->
<!--                             <h5>- Micky Mouse</h5> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
<!--     client review part end -->

<!--     subscribe part here -->
<!--     <section class="subscribe_part section_padding"> -->
<!--         <div class="container"> -->
<!--             <div class="row justify-content-center"> -->
<!--                 <div class="col-lg-8"> -->
<!--                     <div class="subscribe_part_content"> -->
<!--                         <h2>Get promotions & updates!</h2> -->
<!--                         <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources credibly innovate granular internal .</p> -->
<!--                         <div class="subscribe_form"> -->
<!--                             <input type="email" placeholder="Enter your mail"> -->
<!--                             <a href="#" class="btn_1">Subscribe</a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
<!--     subscribe part end -->

<!--     ::footer_part start:: -->
<!--     <footer class="footer_part"> -->
<!--             <div class="footer_iner"> -->
<!--                 <div class="container"> -->
<!--                     <div class="row justify-content-between align-items-center"> -->
<!--                         <div class="col-lg-8"> -->
<!--                             <div class="footer_menu"> -->
<!--                                 <div class="footer_logo"> -->
<!--                                     <a href="index.html"><img src="img/logo.png" alt="#"></a> -->
<!--                                 </div> -->
<!--                                 <div class="footer_menu_item"> -->
<!--                                     <a href="index.html">Home</a> -->
<!--                                     <a href="about.html">About</a> -->
<!--                                     <a href="product_list.html">Products</a> -->
<!--                                     <a href="#">Pages</a> -->
<!--                                     <a href="blog.html">Blog</a> -->
<!--                                     <a href="contact.html">Contact</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4"> -->
<!--                             <div class="social_icon"> -->
<!--                                 <a href="#"><i class="fab fa-facebook-f"></i></a> -->
<!--                                 <a href="#"><i class="fab fa-instagram"></i></a> -->
<!--                                 <a href="#"><i class="fab fa-google-plus-g"></i></a> -->
<!--                                 <a href="#"><i class="fab fa-linkedin-in"></i></a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
            
            <div class="copyright_part">
                <div class="container">
                    <div class="row ">
                        <div class="col-lg-12">
                            <div align="center" class="copyright_text">
                                <P><br><br><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></P>
                                <div class="copyright_link">
<!--                                     <a href="#">Turms & Conditions</a> -->
<!--                                     <a href="#">FAQ</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </footer>
    <!--::footer_part end::-->

    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="js/mixitup.min.js"></script>
    <!-- particles js -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="js/slick.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
</body>

</html>