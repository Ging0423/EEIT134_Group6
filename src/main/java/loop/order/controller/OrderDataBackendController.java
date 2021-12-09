package loop.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import loop.item.allItem.model.ItemDisplay;
import loop.item.allItem.service.AllItemService;
import loop.order.model.OrderDataBean;
import loop.order.model.OrderItemBean;
import loop.order.service.OrderDataService;
import loop.order.service.OrderItemService;

@Controller
@RequestMapping("/backend")
public class OrderDataBackendController {
	
	@Autowired
	private OrderDataService orderDataService;
	
	@Autowired
	private OrderItemService orderItemService;
	
	@Autowired
	private AllItemService allItemService;
	
	@GetMapping("order")
	public String OrderDataList(Model m) {
		List<OrderDataBean> list = orderDataService.findAll();
		m.addAttribute("allOrders", list);
		return "backend/orderdata";
	}
	
	@GetMapping("/order/{id}")
	public String orderStatus(@PathVariable("id") Integer orderId, Model m) {
		OrderDataBean order = orderDataService.findById(orderId);
		m.addAttribute("order", order);
		List<OrderItemBean> orderItems = orderItemService.findByOrderId(orderId);
		List<ItemDisplay> items = new ArrayList<ItemDisplay>();
		for(OrderItemBean i : orderItems) {
			items.add(new ItemDisplay(i.getItemId(), allItemService.getItemName(i.getItemId())
										,allItemService.getItemPrice(i.getItemId()), i.getQty()));
		}
		m.addAttribute("orderItems", items);
		return "backend/order";
	}
	
	@PostMapping("/order/{id}/updateState")
	public String updateOrderStatus(@PathVariable("id") Integer orderId, @RequestParam("state") String state, Model m) {
		OrderDataBean bean = orderDataService.findById(orderId);
		bean.setOrderState(state);
		orderDataService.update(bean);
		return "redirect:/backend/order/"+orderId;
	}
	
	@PostMapping("/order/searchState")
	@ResponseBody
	public List<OrderDataBean> selectState(@RequestBody String state) {
		if(state.equals("全部")) {
			return orderDataService.findAll();
		}
		else
			return orderDataService.findState(state);
	}
}
