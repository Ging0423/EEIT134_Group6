<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="zxx">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>loop</title>
    <link rel="icon" href="<c:url value='/img/favicon.png'/>">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
    <!-- animate CSS -->
    <link rel="stylesheet" href="<c:url value='/css/animate.css'/>">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="<c:url value='/css/owl.carousel.min.css'/>">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="<c:url value='/css/all.css'/>">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="<c:url value='/css/flaticon.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/themify-icons.css'/>">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="<c:url value='/css/magnific-popup.css'/>">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="<c:url value='/css/slick.css'/>">
    <!-- style CSS -->
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>

<body>
    
    <jsp:include page="/fragment/header.jsp" />

    <!-- banner part start-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-5">
                    <div class="banner_text">
                        <div class="banner_text_iner">
                            <h1>圈在一起!</h1> 
                            <h2>鉤針、棒針DIY材料</h2>
                            <h2>優質紗線商店</h2>
                            <a href="<c:url value='/items/yarn'/>" class="btn_1">shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="banner_img">
            <img src="img/banner.png" alt="#" class="img-fluid">
            <img src="img/banner_pattern.png " alt="#" class="pattern_img img-fluid">
        </div>
    </section>
    <!-- banner part end-->

    <!-- product list start-->
    <section class="single_product_list">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="single_product_iner">
                        <div class="row align-items-center justify-content-between">
                            <div class="col-lg-6 col-sm-6">
                                <div class="single_product_img">
                                    <img src="img/single_product_1.png" class="img-fluid" alt="#">
                                    <img src="img/product_overlay.png" alt="#" class="product_overlay img-fluid">
                                </div>
                            </div>
                            <div class="col-lg-5 col-sm-6">
                                <div class="single_product_content">
<!--                                     <h5>Started from $10</h5> -->
<!--                                     <h2> <a href="single-product.html">Printed memory foam brief modern throw pillow case</a> </h2> -->
                                    <h2> <a href="<c:url value='/items/tools'/>">鉤針、棒針工具</a> </h2>
                                    <a href="<c:url value='/items/tools'/>" class="btn_3">Explore Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="single_product_iner">
                        <div class="row align-items-center justify-content-between">
                            <div class="col-lg-6 col-sm-6">
                                <div class="single_product_img">
                                    <img src="img/single_product_2.png" class="img-fluid" alt="#">
                                    <img src="img/product_overlay.png" alt="#" class="product_overlay img-fluid">
                                </div>
                            </div>
                            <div class="col-lg-5 col-sm-6">
                                <div class="single_product_content">
<!--                                     <h5>Started from $10</h5> -->
<!--                                     <h2> <a href="single-product.html">Printed memory foam brief modern throw pillow case</a> </h2> -->
                                    <h2> <a href="single-product.html">鉤針、棒針書籍</a> </h2>
                                    <a href="<c:url value='/items/books'/>" class="btn_3">Explore Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="single_product_iner">
                        <div class="row align-items-center justify-content-between">
                            <div class="col-lg-6 col-sm-6">
                                <div class="single_product_img">
                                    <img src="img/single_product_3.png" class="img-fluid" alt="#">
                                    <img src="img/product_overlay.png" alt="#" class="product_overlay img-fluid">
                                </div>
                            </div>
                            <div class="col-lg-5 col-sm-6">
                                <div class="single_product_content">
<!--                                     <h5>Started from $10</h5> -->
<!--                                     <h2> <a href="single-product.html">Printed memory foam brief modern throw pillow case</a></h2> -->
                                    <h2> <a href="single-product.html">DIY材料包</a></h2> 
                                    <a href="<c:url value='/items/kits'/>" class="btn_3">Explore Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- product list end-->


<!--     trending item start -->
<%--     <section class="trending_items"> --%>
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <div class="section_tittle text-center"> -->
<!--                         <h2>Trending Items</h2> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-4 col-sm-6"> -->
<!--                     <div class="single_product_item"> -->
<!--                         <div class="single_product_item_thumb"> -->
<!--                             <img src="img/tranding_item/tranding_item_1.png" alt="#" class="img-fluid"> -->
<!--                         </div> -->
<!--                         <h3> <a href="single-product.html">Cervical pillow for airplane -->
<!--                         car office nap pillow</a> </h3> -->
<!--                         <p>From $5</p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-4 col-sm-6"> -->
<!--                     <div class="single_product_item"> -->
<!--                         <img src="img/tranding_item/tranding_item_2.png" alt="#" class="img-fluid"> -->
<!--                         <h3> <a href="single-product.html">Foam filling cotton slow rebound pillows</a> </h3> -->
<!--                         <p>From $5</p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-4 col-sm-6"> -->
<!--                     <div class="single_product_item"> -->
<!--                         <img src="img/tranding_item/tranding_item_3.png" alt="#" class="img-fluid"> -->
<!--                         <h3> <a href="single-product.html">Memory foam filling cotton Slow rebound pillows</a> </h3> -->
<!--                         <p>From $5</p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-4 col-sm-6"> -->
<!--                     <div class="single_product_item"> -->
<!--                         <img src="img/tranding_item/tranding_item_4.png" alt="#" class="img-fluid"> -->
<!--                         <h3> <a href="single-product.html">Cervical pillow for airplane -->
<!--                         car office nap pillow</a> </h3> -->
<!--                         <p>From $5</p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-4 col-sm-6"> -->
<!--                     <div class="single_product_item"> -->
<!--                         <img src="img/tranding_item/tranding_item_5.png" alt="#" class="img-fluid"> -->
<!--                         <h3> <a href="single-product.html">Foam filling cotton slow rebound pillows</a> </h3> -->
<!--                         <p>From $5</p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-4 col-sm-6"> -->
<!--                     <div class="single_product_item"> -->
<!--                         <img src="img/tranding_item/tranding_item_6.png" alt="#" class="img-fluid"> -->
<!--                         <h3> <a href="single-product.html">Memory foam filling cotton Slow rebound pillows</a> </h3> -->
<!--                         <p>From $5</p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<%--     </section> --%>
<!--     trending item end -->

<!--     client review part here -->
<%--     <section class="client_review"> --%>
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
<%--     </section> --%>
<!--     client review part end -->


<!--     feature part here -->
<%--     <section class="feature_part section_padding"> --%>
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
<%--     </section> --%>
<!--     feature part end -->

<!--     subscribe part here -->
<%--     <section class="subscribe_part section_padding"> --%>
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
<%--     </section> --%>
<!--     subscribe part end -->

    <!--::footer_part start::-->
    <jsp:include page="/fragment/footer.jsp" />
    <!--::footer_part end::-->

  <!-- jquery plugins here-->
    <script src="<c:url value='/js/jquery-1.12.1.min.js'/>"></script>
    <!-- popper js -->
    <script src="<c:url value='/js/popper.min.js'/>"></script>
    <!-- bootstrap js -->
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <!-- magnific popup js -->
    <script src="<c:url value='/js/jquery.magnific-popup.js'/>"></script>
    <!-- carousel js -->
    <script src="<c:url value='/js/owl.carousel.min.js'/>"></script>
    <script src="<c:url value='/js/jquery.nice-select.min.js'/>"></script>
    <!-- slick js -->
    <script src="<c:url value='/js/slick.min.js'/>"></script>
    <script src="<c:url value='/js/jquery.counterup.min.js'/>"></script>
    <script src="<c:url value='/js/waypoints.min.js'/>"></script>
    <script src="<c:url value='/js/contact.js'/>"></script>
    <script src="<c:url value='/js/jquery.ajaxchimp.min.js'/>"></script>
    <script src="<c:url value='/js/jquery.form.js'/>"></script>
    <script src="<c:url value='/js/jquery.validate.min.js'/>"></script>
    <script src="<c:url value='/js/mail-script.js'/>"></script>
    <!-- custom js -->
    <script src="<c:url value='/js/custom.js'/>"></script>
</body>

</html>