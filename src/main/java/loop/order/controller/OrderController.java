package loop.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import loop.order.model.OrderDataBean;
import loop.order.service.OrderDataService;
import loop.order.service.OrderItemService;
import loop.shoppingCart.model.ShoppingCartDisplay;
import loop.shoppingCart.service.ShoppingCartService;
import loop.user.model.UsersBean;
import loop.user.service.UsersService;

@Controller
@SessionAttributes({ "isLogin" })
@RequestMapping("/order")
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
	
	@PostMapping("/checkOrder")
	public String cartToOrder(Model m) {
		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
		Integer userId = bean.getUserId();
		UsersBean users = userService.findById(userId);
		List<ShoppingCartDisplay> items = shoppingCartService.list(userId);
		m.addAttribute("items", items);
		OrderDataBean orderData = new OrderDataBean();
		orderData.setTel(users.getTel());
		orderData.setRecipient(users.getUserName());
		orderData.setShippingAddress(users.getUserAddress());
		m.addAttribute("orderData", orderData);
		
		return "checkout";
	}

	
}
