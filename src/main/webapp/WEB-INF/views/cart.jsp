<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>loop</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/all.css">
<!-- icon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/themify-icons.css">
<!-- magnific popup CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	 
 <jsp:include page="/fragment/header.jsp" />


	<!-- breadcrumb part start-->
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>購物車</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb part end-->

	<!--================Cart Area =================-->
	<section class="cart_area section_padding">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<form action='<c:url value="/order/checkOrder"/>' method="POST">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">商品</th>
									<th scope="col">售價</th>
									<th scope="col">數量</th>
									<th scope="col">總額</th>
									<th scope="col"></th>
								</tr>
							</thead>

							<tbody>

								<c:set var="allTotal" value="0" />
								
								
									<c:forEach var="item" items='${items}'>
										<tr>
											<td>
												<div class="media">
													<div class="d-flex">
														<img src="img/arrivel/arrivel_1.png" alt="" /> <input
															type="hidden" name="itemId" value="${item.itemId}">
													</div>
													<div class="media-body">
														<p>${item.itemName}</p>
													</div>
												</div>
											</td>
											<td>
												<h5>$${item.price}</h5>
											</td>
											<td>
												<div class="product_count">
													<!-- <input type="text" value="1" min="0" max="10" title="Quantity:"
                      class="input-text qty input-number" />
                    <button
                      class="increase input-number-increment items-count" type="button">
                      <i class="ti-angle-up"></i>
                    </button>
                    <button
                      class="reduced input-number-decrement items-count" type="button">
                      <i class="ti-angle-down"></i>
                    </button> -->
													<span class="input-number-decrement"> <i
														class="ti-minus"></i></span> <input class="input-number"
														type="number" name="qty" value="${item.qty}" min="1"
														max="10"> <span class="input-number-increment">
														<i class="ti-plus"></i>
													</span>
												</div>
											</td>
											<td>
												<h5>
													<c:set var="total" value="${item.qty*item.price}" />
													<c:out value="${total}" />
												</h5>
											</td>
											<td>
												<button type="button" onclick="deleteById('${item.itemId}')">刪除</button>
											</td>
											<c:set var="allTotal" value="${allTotal + total}" />
										</tr>
										
									</c:forEach>
								
								<tr class="bottom_button">
									<td><button class="btn_1" type="button"
											onclick="updateCart()">更新購物車</button></td>

									<td></td>
									<td></td>
									<td>
										<div class="cupon_text float-right">
											<a class="btn_1" href="#">Close Coupon</a>
										</div>
									</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td>
										<h5>總金額</h5>
									</td>

									<td>

										<h5>
											<c:out value="${allTotal}" />
										</h5> <input type="hidden" name="total" value="${allTotal}" />
									</td>
								</tr>

								<!-- <tr class="shipping_area">
								<td></td>
								<td></td>
								<td>
									<h5>Shipping</h5>
								</td>
								<td>
									<div class="shipping_box">
										<ul class="list">
											<li>Flat Rate: $5.00 <input type="radio"
												aria-label="Radio button for following text input">
											</li>
											<li>Free Shipping <input type="radio"
												aria-label="Radio button for following text input">
											</li>
											<li>Flat Rate: $10.00 <input type="radio"
												aria-label="Radio button for following text input">
											</li>
											<li class="active">Local Delivery: $2.00 <input
												type="radio"
												aria-label="Radio button for following text input">
											</li>
										</ul>
										<h6>
											Calculate Shipping <i class="fa fa-caret-down"
												aria-hidden="true"></i>
										</h6>
										<select class="shipping_select">
											<option value="1">Bangladesh</option>
											<option value="2">India</option>
											<option value="4">Pakistan</option>
										</select> <select class="shipping_select section_bg">
											<option value="1">Select a State</option>
											<option value="2">Select a State</option>
											<option value="4">Select a State</option>
										</select> <input class="post_code" type="text"
											placeholder="Postcode/Zipcode" /> <a class="btn_1" href="#">Update
											Details</a>
									</div>
								</td>
							</tr> -->
							</tbody>
						</table>
						<div class="checkout_btn_inner float-right">
							<a class="btn_1" type="button" href="#">繼續購物</a>
							<button class="btn_1 checkout_btn_1" type="submit">結帳去</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!--================End Cart Area =================-->
	<!--::footer_part start::-->
	 <jsp:include page="/fragment/footer.jsp" />

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
	<script type="text/javascript">
		function deleteById(id) {
			let obj = new Object();
			obj.itemId = id;
			let json = JSON.stringify(obj, null, 4);
			deleteAjax(json);
		}
		function deleteAjax(id) {
			$
					.ajax({
						type : 'post',
						url : '/cart/deleteCart',
						data : id,
						dataType : 'JSON',
						contentType : 'application/json;charset=utf-8',
						success : function(data) {

							console.log('success:' + data);
							var json = JSON.stringify(data, null, 4);
							

							$('#ajaxTable').empty("");

							if (data == null) {
								console.log("data == null");
							} else {
								/* window.location.href = "<c:url value='/cart'/>"; */
								console.log('json:' + json);
								var table = $('#ajaxTable');
								var allTotal = 0;
								$
										.each(
												data,
												function(i, n) {
													let total = n.price + n.qty;
													allTotal += total;
													var tr = 
															'<td>'
															+ '<div class="media">'
															+ '<div class="d-flex">'
															+ '<img src="img/arrivel/arrivel_1.png" alt="" />'
															+ '<input type="hidden" name="itemId" value="'
															+n.itemId+
															'">'
															+ '</div>'
															+ '<div class="media-body">'
															+ '<p>'
															+ n.itemName
															+ '</p>'
															+ '</div>'
															+ '</div>'
															+ '</td>'
															+ '<td>'
															+ '<h5>$'
															+ n.price
															+ '</h5>'
															+ '</td>'
															+ '<td>'
															+ '<td>'
															+ +'<button type="button" onclick="delete('
															+ n.itemId
															+ ')">刪除</button"\>'
															+ '</td>'
															+ +'<div class="product_count">'
															+ '<span class="input-number-decrement"> <i class="ti-minus"></i></span>'
															+ '<input class="input-number" type="number" name="qty" value="'+n.qty+'" min="1" max="10">'
															+ '<span class="input-number-increment"> <i class="ti-plus"></i></span>'
															+ '</div></td><td>'
															+ '<h5>'
															+ total
															+ '</h5>'
															+ '</td>';

													table.append(tr);
												});
										
							}
						}
					});
		}
		function updateCart() {
			var itemId = document.getElementsByName("itemId");
			var itemQty = document.getElementsByName("qty");

			var array = [];
			for (let i = 0, id, qty; id = itemId[i], qty = itemQty[i]; i++) {
				let json = new Object();
				json.itemId = id.value;
				json.qty = qty.value;
				array.push(json);
			}
			var arrayJson = JSON.stringify(array);
			update(arrayJson);
		}
		function update(array) {
			$
					.ajax({
						type : 'post',
						url : '/cart/updateCart',
						data : array,
						dataType : 'JSON',
						contentType : 'application/json;charset=utf-8',
						success : function(data) {

							console.log('success:' + data);
							var json = JSON.stringify(data, null, 4);
							console.log('json:' + json);

							$('#ajaxTable').empty("");

							if (data == null) {

							} else {
								var table = $('#ajaxTable');
								var allTotal = 0;
								$
										.each(
												data,
												function(i, n) {
													let total = n.price + n.qty;
													allTotal += total;
													var tr = 
															'<td>'
															+ '<div class="media">'
															+ '<div class="d-flex">'
															+ '<img src="img/arrivel/arrivel_1.png" alt="" />'
															+ '<input type="hidden" name="itemId" value="'
															+n.itemId+
															'">'
															+ '</div>'
															+ '<div class="media-body">'
															+ '<p>'
															+ n.itemName
															+ '</p>'
															+ '</div>'
															+ '</div>'
															+ '</td>'
															+ '<td>'
															+ '<h5>$'
															+ n.price
															+ '</h5>'
															+ '</td>'
															+ '<td>'
															+ '<td>'
															+ +'<button type="button" onclick="delete('
															+ n.itemId
															+ ')">刪除</button"\>'
															+ '</td>'
															+ +'<div class="product_count">'
															+ '<span class="input-number-decrement"> <i class="ti-minus"></i></span>'
															+ '<input class="input-number" type="number" name="qty" value="'+n.qty+'" min="1" max="10">'
															+ '<span class="input-number-increment"> <i class="ti-plus"></i></span>'
															+ '</div></td><td>'
															+ '<h5>'
															+ total
															+ '</h5>'
															+ '</td>';

													table.append(tr);
												});
							}
						}
					});
		}
	</script>
</body>

</html>