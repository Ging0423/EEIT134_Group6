package loop.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import loop.user.model.UsersBean;
import loop.user.service.UsersService;

@Controller
@RequestMapping("/backend")
public class UserBackendController {
	
	@Autowired
	private UsersService userService;
	
//	@Autowired
//	private OrderItemService orderItemService;
//	
//	@Autowired
//	private AllItemService allItemService;
	
	@GetMapping("/admin")
	public String UserList(Model m) {
		List<UsersBean> list1 = userService.findAll();
		m.addAttribute("allUsers", list1);
		long count = userService.count();
		m.addAttribute("count", count);
		System.out.println("查詢成功");
		return "backend/backend_admin";
	}
	
	
	
	@GetMapping("/admin/{id}") //28
	public String userStatus(@PathVariable("id") Integer userId, Model m) {
		UsersBean user = userService.findById(userId);
		m.addAttribute("user", user);
		return "backend/userdata";
	}
	
	@PostMapping("/admin/delete")
	public String delete(Model m, HttpServletRequest request, HttpServletResponse response) {
		
		try {
			if(request.getParameterValues("array") != null) {
				System.out.println("刪除成功");
				//多個刪除的參數傳過來是string陣列
				String[] id = request.getParameterValues("array");
				//但是資料都在id[0]中，所以要分割字串轉成另一個array
				String array[] = (id[0].split(","));
					userService.delete(array);				
				return "redirect:/backend/admin";
			}
			else {
				System.out.println("2");
				return "redirect:/backend/admin";
			}
		} catch (Exception e) {
			return "redirect:/backend/admin";
		}
	
	}
	
//	@PostMapping("/order/{id}/updateState")
//	public String updateOrderStatus(@PathVariable("id") Integer orderId, @RequestParam("state") String state, Model m) {
//		OrderDataBean bean = orderDataService.findById(orderId);
//		bean.setOrderState(state);
//		orderDataService.update(bean);
//		return "redirect:/backend/order/"+orderId;
//	}
//	
//	@PostMapping("/order/searchState")
//	@ResponseBody
//	public List<OrderDataBean> selectState(@RequestBody String state) {
//		if(state.equals("全部")) {
//			return orderDataService.findAll();
//		}
//		else
//			return orderDataService.findState(state);
//	}
}
