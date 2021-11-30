package loop.order.controller;

//import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;

import loop.order.model.OrderDataBean;
import loop.order.service.OrderDataService;


public class OrderDataController {
	@Autowired
	private OrderDataService odService;

	@GetMapping("/orderdatainsert.controller")
	public OrderDataBean processInsertAction() {
		OrderDataBean odata1 = new OrderDataBean();
		odata1.setOrderId(101);
		odata1.setUserId(100);
		odata1.setRecipient("customer");
		odata1.setShippingAddress("Mars");
		odata1.setTel("0978654321");
//		odata1.setOrderDate();
		odata1.setPayState("1");
		odata1.setOrderState("1");
		odata1.setTotal(8591);
		return odService.insert(odata1);
	}

	@GetMapping("/orderdatainsert1.controller")
	public OrderDataBean processInsertAction2(@RequestBody OrderDataBean odata) {
		return odService.insert(odata);
	}
	
	@GetMapping("/orderdataupdate.controller")
	public OrderDataBean processUpdateAction() {
		OrderDataBean odata2 = new OrderDataBean();
//		odata2.setOrderId(101);
//		odata2.setUserId(100);
		odata2.setRecipient("VIPcustomer");
		odata2.setShippingAddress("Luna");
		odata2.setTel("0987654321");
//		odata2.setOrderDate();
		odata2.setPayState("2");
		odata2.setOrderState("2");
		odata2.setTotal(85911);
		return odService.update(odata2);		
	}
	
	@GetMapping("/orderdatadelete.controller")
	public String processDelete() {
		odService.deleteById(100);
		return "Delete successful !";
	}
}
