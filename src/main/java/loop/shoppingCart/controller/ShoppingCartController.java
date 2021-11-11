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
import loop.shoppingCart.model.ShoppingCartDisplay;
import loop.shoppingCart.service.ShoppingCartService;

@Controller
public class ShoppingCartController {

	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	AllItemService allItemService;
	
	@PostMapping("/cart")
	public String addToCart(HttpServletRequest request, Model m) {
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		int userId = 1;
		shoppingCartService.addToCart(itemId, userId, qty);
		List<ShoppingCartBean> list  = shoppingCartService.selectById(1);
		List<ShoppingCartDisplay> items = new ArrayList<ShoppingCartDisplay>();
		for(ShoppingCartBean i:list) {
			items.add(new ShoppingCartDisplay(i.getItemId(),
					allItemService.getItemName(i.getItemId()),
					"test",
					allItemService.getItemPrice(i.getItemId()),
					i.getQty()));
		}
		m.addAttribute("items", items);
		return "cart";
	}
	
	@RequestMapping("/cart")
	public String cartDisplay(Model m) {
		List<ShoppingCartBean> list  = shoppingCartService.selectById(1);
		List<ShoppingCartDisplay> items = new ArrayList<ShoppingCartDisplay>();
		for(ShoppingCartBean i:list) {
			items.add(new ShoppingCartDisplay(i.getItemId(),
					allItemService.getItemName(i.getItemId()),
					"test",
					allItemService.getItemPrice(i.getItemId()),
					i.getQty()));
		}
		m.addAttribute("items", items);
		return "cart";
	}
}