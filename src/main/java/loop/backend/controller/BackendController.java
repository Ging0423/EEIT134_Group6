package loop.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import loop.item.allItem.service.AllItemService;
import loop.order.model.OrderDataBean;
import loop.order.service.OrderDataService;

@Controller
@RequestMapping("/backend")
@SessionAttributes({"totalPages", "totalElements","isLogin"})
public class BackendController {
	
	@Autowired
	private AllItemService allItemService;

	@Autowired
	private OrderDataService orderDataService;
	
	@GetMapping
	public String backendIndex(Model m) {
		Integer isSend = orderDataService.countOrderState("已出貨").size();
		m.addAttribute("isSend", isSend);
		Long totalOrder = orderDataService.count();
		m.addAttribute("totalOrder", totalOrder);
		long notSend = totalOrder - isSend;
		m.addAttribute("notSend", notSend);
		
		return "backend/backend_index";
	}
	
//	@GetMapping("/admin")
//	public String about(Model m) {
////		UsersBean bean = new UsersBean();
////		m.addAttribute("usersData", bean);
//		return "backend/backend_admin";
//	}
	@PostMapping("/page/{pageNo}")
	@ResponseBody
	public List<OrderDataBean> processQueryByPage(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize, Sort.by(Sort.Direction.DESC, "orderId"));
		Page<OrderDataBean> page = orderDataService.findAllDsc(pageable);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}

	
}

