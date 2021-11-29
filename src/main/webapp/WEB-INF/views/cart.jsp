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
						<div id="ajaxTable">
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
														' <img src='<c:url value="/items/img/${item.img}"/>'
															alt="" /> <input type="hidden" name="itemId"
															value="${item.itemId}">
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
													<span class="input-number-decrement"
														onclick="minus(${item.itemId});"> <i
														class="ti-minus"></i></span> <input
														id="input-number${item.itemId}" type="number" name="qty"
														value="${item.qty}" min="1" max="99"> <span
														class="input-number-increment"
														onclick="add(${item.itemId});"> <i class="ti-plus"></i>
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
								</tbody>
							</table>
						</div>
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
						url : 'deleteCart',
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
								
								console.log('json:' + json);
								var table = $('#ajaxTable');
								var allTotal = 0;
								$
										.each(
												data,
												function(i, n) {
													let total = n.price + n.qty;
													allTotal += total;
													var tr = '<table class="table">'
														+'<thead>'
														+'<tr>'
														+'<th scope="col">商品</th><th scope="col">售價</th><th scope="col">數量</th><th scope="col">總額</th><th scope="col"></th>'
														+'</tr>'
														+'</thead>'	
														+'<tbody>'							
														+'<tr>'
														+'<td>'
														+ '<div class="media">'
														+ '<div class="d-flex">'
														+ '<img src="/items/img/'
														+n.img
														+'" alt="" />'
														+ '<input type="hidden" name="itemId" value="'
														+n.itemId
														+'">'
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
														+ '<span class="input-number-decrement"onclick="minus('
														+n.itemId
														+');"><i class="ti-minus"></i></span>'
														+'<input id="input-number${item.itemId}" type="number" name="qty" value="'
														+n.qty
														+'" min="1" max="99">'
														+'<span class="input-number-increment" onclick="add('
														+ n.itemId
														+'});"> <i class="ti-plus"></i></span>'
														+ '</div></td><td>'
														+ '<h5>'
														+ total
														+ '</h5>' + '</td>';
														+'<td>'
														+'<button type="button" onclick="deleteById('
														+ n.itemId
														+')">刪除</button>'
														+'</td>'						
														+'</tr>'
														+'<tr class="bottom_button">'
														+'<td><button class="btn_1" type="button"'
														+'onclick="updateCart()">更新購物車</button></td>'
														+'<td></td><td></td><td><div class="cupon_text float-right"><a class="btn_1" href="#">Close Coupon</a>'
														+'</div></td></tr><tr><td></td><td></td><td><h5>總金額</h5>'
														+'</td><td><h5></h5> <input type="hidden" name="total" value="'
														+ allTotal
														+'" />'
														+'</td></tr></tbody></table>';
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
						url : 'updateCart',
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
													var tr = '<table class="table">'
															+'<thead>'
															+'<tr>'
															+'<th scope="col">商品</th><th scope="col">售價</th><th scope="col">數量</th><th scope="col">總額</th><th scope="col"></th>'
															+'</tr>'
															+'</thead>'	
															+'<tbody>'							
															+'<tr>'
															+'<td>'
															+ '<div class="media">'
															+ '<div class="d-flex">'
															+ '<img src="/items/img/'
															+n.img
															+'" alt="" />'
															+ '<input type="hidden" name="itemId" value="'
															+n.itemId
															+'">'
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
															+'<button type="button" onclick="delete('
															+ n.itemId
															+ ')">刪除</button"\>'
															+ '</td>'
															+ '<div class="product_count">'
															+ '<span class="input-number-decrement" onclick="minus('
															+ n.itemId
															+');"><i class="ti-minus"></i></span>'
															+'<input id="input-number${item.itemId}" type="number" name="qty" value="'
															+n.qty
															+'" min="1" max="99">'
															+'<span class="input-number-increment" onclick="add('
															+n.itemId
															+');"> <i class="ti-plus"></i></span>'
															+ '</div></td><td>'
															+ '<h5>'
															+ total
															+ '</h5>' + '</td>';
															+'<td>'
															+'<button type="button" onclick="deleteById('
															+n.itemId
															+')">刪除</button>'
															+'</td>'						
															+'</tr>'
															+'<tr class="bottom_button">'
															+'<td><button class="btn_1" type="button"'
															+'onclick="updateCart()">更新購物車</button></td>'
															+'<td></td><td></td><td><div class="cupon_text float-right"><a class="btn_1" href="#">Close Coupon</a>'
															+'</div></td></tr><tr><td></td><td></td><td><h5>總金額</h5>'
															+'</td><td><h5></h5> <input type="hidden" name="total" value="'
															+allTotal
															+'" />'
															+'</td></tr></tbody></table>';
													table.append(tr);
												});
							}
						}
					});
		}
		function add(id) {
			 var value = parseInt(document.getElementById("input-number"+id).value, 10);
			    value = isNaN(value) ? 0 : value;
			    value++;
			    document.getElementById("input-number"+id).value = value;
		}
		function minus(id) {
			var value = parseInt(document.getElementById("input-number"+id).value, 10);
		    value = isNaN(value) ? 0 : value;
		    value--;
		    document.getElementById("input-number"+id).value = value;
		}
	</script>
</body>

</html>