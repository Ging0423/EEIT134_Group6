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

<div class="ajaxTable">
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
					<span class="input-number-decrement"> <i class="ti-minus"></i></span>
					<input class="input-number" type="number" name="qty"
						value="${item.qty}" min="1" max="10"> <span
						class="input-number-increment"> <i class="ti-plus"></i>
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
		</tr>

		<c:set var="allTotal" value="${allTotal + total}" />
	</c:forEach>
</div>
<tr class="bottom_button">
	<td><button class="btn_1" type="button" onclick="updateCart()">更新購物車</button></td>

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
</table>
</body>
</html>
