package loop.shoppingCart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import loop.item.allItem.service.AllItemService;
import loop.shoppingCart.model.ShoppingCartBean;
import loop.shoppingCart.service.ShoppingCartService;

@Controller
public class ShoppingCartController {

	@Autowired
	ShoppingCartService service;
	
	@Autowired
	AllItemService aservice;
	
	@PostMapping("myCart")
	public String addToCart(HttpServletRequest request) {
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		int userId = 1;
		//service.addToCart(itemId, userId, qty);
		return "cart";
	}
	
	@RequestMapping("/cart")
	public String cartDisplay(Model m) {
		List<ShoppingCartBean> list  = service.selectById(1);
		String[] array = new String[4]; 
		List<ShoppingCartBean> itemName = new ArrayList<String>();
		for(ShoppingCartBean i:list) {
			itemName.add(aservice.getItemName(i.getItemId()));
		}
		m.addAttribute("itemName", itemName);
		m.addAttribute("item", list);
		return "/cart";
	}
}
