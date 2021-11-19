package loop.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import loop.order.model.OrderDataBean;
import loop.order.service.OrderDataService;
import loop.order.service.OrderItemService;
import loop.shoppingCart.model.ShoppingCartDisplay;
import loop.shoppingCart.service.ShoppingCartService;
import loop.user.model.UsersBean;
import loop.user.service.UsersService;

@Controller
public class OrderController {
	
	
	private UsersService userService;
	private OrderDataService orderDataService;
	private OrderItemService orderItemService;
	private ShoppingCartService shoppingCartService;
	
	@Autowired
	public OrderController(UsersService userService, OrderDataService orderDataService,
			OrderItemService orderItemService, ShoppingCartService shoppingCartService) {
		super();
		this.userService = userService;
		this.orderDataService = orderDataService;
		this.orderItemService = orderItemService;
		this.shoppingCartService = shoppingCartService;
	}

	@GetMapping("/checkout")
	public String checkOrder(Model m) {
		return "checkout";
	}
	
	@PostMapping("checkOrder")
	public String cartToOrder(Model m) {
		UsersBean users = userService.findById(1);
		List<ShoppingCartDisplay> items = shoppingCartService.list(1);
		m.addAttribute("items", items);
		OrderDataBean orderData = new OrderDataBean();
		orderData.setTel(users.getTel());
		orderData.setRecipient(users.getUserName());
		orderData.setShippingAddress(users.getUserAddress());
		m.addAttribute("orderData", orderData);
		
		return "checkout";
	}

	
}
