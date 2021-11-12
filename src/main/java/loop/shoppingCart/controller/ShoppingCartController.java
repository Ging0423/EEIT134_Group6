package loop.shoppingCart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
		Integer itemId = Integer.parseInt(request.getParameter("itemId"));
		Integer qty = Integer.parseInt(request.getParameter("qty"));
		Integer userId = 1;
		if (shoppingCartService.isExist(itemId, userId)) {
			shoppingCartService.updateQty(itemId, userId, qty);
		} else {
			shoppingCartService.save(itemId, userId, qty);
		}
		List<ShoppingCartDisplay> items = shoppingCartService.list(1);
		m.addAttribute("items", items);
		return "redirect:/cart";
	}

	@GetMapping("/cart")
	public String cartDisplay(Model m) {
		List<ShoppingCartDisplay> items = shoppingCartService.list(1);
		m.addAttribute("items", items);
		return "/cart";
	}
	
	@PostMapping("updateCart")
	public String updateCart(HttpServletRequest request, Model m) {
		String[] idList = request.getParameterValues("itemId");
		Integer userId = 1;
		String[] qtyList = request.getParameterValues("qty");
		for(int i = 0; i < idList.length; i++) {
			shoppingCartService.updateQty(Integer.parseInt(idList[i]), userId, Integer.parseInt(qtyList[i]));
		}
		List<ShoppingCartDisplay> items = shoppingCartService.list(1);
		m.addAttribute("items", items);
		return "redirect:/cart";
	}
}
