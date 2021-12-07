package loop.order.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import loop.item.allItem.model.ItemDisplay;
import loop.item.allItem.service.AllItemService;
import loop.order.model.OrderDataBean;
import loop.order.model.OrderItemBean;
import loop.order.service.OrderDataService;
import loop.order.service.OrderItemService;
import loop.shoppingCart.model.ShoppingCartBean;
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
	private AllItemService allItemService;
	
	@Autowired
	public OrderController(UsersService userService, OrderDataService orderDataService,
			OrderItemService orderItemService, ShoppingCartService shoppingCartService,
			AllItemService allItemService) {
		super();
		this.userService = userService;
		this.orderDataService = orderDataService;
		this.orderItemService = orderItemService;
		this.shoppingCartService = shoppingCartService;
		this.allItemService =  allItemService;
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
	@GetMapping("/myorder")
	public String myOrder(Model m) {
		UsersBean user =  (UsersBean) m.getAttribute("isLogin");
		List<OrderDataBean> orders = orderDataService.findByUserId(user.getUserId());
		m.addAttribute("allOrder", orders);
		return "myorder";
	}
	@PostMapping("/checkout")
	public String checkout(@ModelAttribute("orderData") OrderDataBean orderData, Model m) {
		UsersBean user =  (UsersBean) m.getAttribute("isLogin");
		orderData.setOrderDate(new Date());
		orderData.setOrderState("未付款");
		orderData.setPayState("未付款");
		orderData = orderDataService.save(orderData, user.getUserId());
		List<ShoppingCartBean> list = shoppingCartService.findAllCartBeans(user.getUserId());
		for(ShoppingCartBean i:list) {
			OrderItemBean bean = new OrderItemBean();
			bean.setItemId(i.getItemId());
			bean.setAllItem(i.getAllItem());
			bean.setOrderId(orderData.getOrderId());
			bean.setOrderData(orderData);
			bean.setQty(i.getQty());
			orderItemService.save(bean);			
		}	
		shoppingCartService.deleteByUserId(user.getUserId());
		return "redirect:/order/myorder";
	}
	@GetMapping("/{id}")
	public String orderDetail(@PathVariable("id") Integer orderId, Model m) {
		OrderDataBean order = orderDataService.findById(orderId);
		UsersBean userBean = (UsersBean)m.getAttribute("isLogin");
		if(order.getUserId() == userBean.getUserId()) {
			m.addAttribute("order", order);
			List<OrderItemBean> orderItems = orderItemService.findByOrderId(orderId);
			List<ItemDisplay> items = new ArrayList<ItemDisplay>();
			for(OrderItemBean i : orderItems) {
				items.add(new ItemDisplay(i.getItemId(), allItemService.getItemName(i.getItemId())
											,allItemService.getItemPrice(i.getItemId()), i.getQty()));
			}
			m.addAttribute("orderItems", items);
			return "orderdetail";
		}
		else {
			return "redirect:/order/myorder";
		}
		
	}
	
}
