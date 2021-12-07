package loop.ecpay.controller;

import java.net.http.HttpRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import loop.ecpay.model.OrderBean;
import loop.ecpay.model.OrderItemBean;
import loop.ecpay.service.PayementService;
import loop.order.model.OrderDataBean;
import loop.order.service.OrderDataService;

@Controller
public class EcpayController {
	
	@Autowired
	private PayementService paymentService;
	@Autowired
	private OrderDataService orderDataService;
	
	@PostMapping("/order/goECPay")
	@ResponseBody
	public String connectToEcPayment(@RequestBody HashMap<String, String>  orderId,Model m, HttpServletResponse response) {
		
		OrderDataBean order = orderDataService.findById(Integer.parseInt(orderId.get("orderId")));
		
//		String memberId = order.getRecipient();   						// 取出會員代號
//		double totalAmount = order.getTotal();  	// 計算訂單總金額 
//		String shippingAddress = order.getShippingAddress();  // 出貨地址
//		String bNO = request.getParameter("BNO");					// 發票的統一編號  
//		String bNO = "25741010";					// 發票的統一編號  
//		String invoiceTitle = request.getParameter("InvoiceTitle");	// 發票的抬頭
//		String invoiceTitle = "";	// 發票的抬頭
//		Date today = new Date();   									// 新增訂單的時間
		// 新建訂單物件。OrderBean:封裝一筆訂單資料的容器，包含訂單主檔與訂單明細檔的資料。目前只存放訂單主檔的資料。
		//Integer odno = (int)System.currentTimeMillis();
//		OrderBean orderBean = new OrderBean(odno, memberId, totalAmount, shippingAddress, 
//				bNO, invoiceTitle, today, null, null);
		
		// 取出存放在購物車內的商品，放入Map型態的變數cart，準備將其內的商品一個一個轉換為OrderItemBean，
		
		// 執行到此，購物車內所有購買的商品已經全部轉換為為OrderItemBean物件，並放在Items內
		
		return paymentService.prepareECPayData(order, response);		
	}
	
	@PostMapping("/ecpaycheck")
	@ResponseBody
	public String checkPay(ServletRequest request) {
		System.out.println("get ecpay response");
		String code = request.getParameter("RtnCode");
		System.out.println(code);
		System.out.println(request.getParameter("RtnMsg"));
		String hashString = request.getParameter("CheckMacValue");
		System.out.println(hashString);
		Hashtable<String, String> dict = new Hashtable<String, String>();
		dict.put("MerchantID", "2000132");
		dict.put("CheckMacValue", hashString);
		boolean	result = paymentService.compareCheckMacValue(dict);
		if(code.equals("1")) {
			System.out.println("check success");
			Integer orderId = Integer.parseInt(request.getParameter("MerchantTradeNo").substring(7));
			OrderDataBean orderData = orderDataService.findById(orderId);
			orderData.setPayState("付款成功");
			orderData.setOrderState("已付款");
			orderDataService.update(orderData);
			return "1|OK";
		}
		else {
			System.out.println("failed");
			return "fail";
		}
			
	}
}
