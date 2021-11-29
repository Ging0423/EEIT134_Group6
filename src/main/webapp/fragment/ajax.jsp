<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zxx">
<header>
</header>
<body>
<table>
<c:set var="allTotal" value="0" />

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
													<div class="d-flex">'
														<img src='<c:url value="/items/img/${item.img}"/>' alt="" /> <input
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
													<span class="input-number-decrement" onclick="minus(${item.itemId});"> <i
														class="ti-minus"></i></span> <input id="input-number${item.itemId}"
														type="number" name="qty" value="${item.qty}" min="1"
														max="99"> <span class="input-number-increment" onclick="add(${item.itemId});">
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
										</h5> <input type="hidden" name="total" value="total" />
									</td>
								</tr>
							</tbody>
						</table>
						</div>
</body>
</html>
