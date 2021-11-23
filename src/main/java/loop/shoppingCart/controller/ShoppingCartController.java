package loop.shoppingCart.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import loop.item.allItem.service.AllItemService;
import loop.shoppingCart.model.ShoppingCartDisplay;
import loop.shoppingCart.service.ShoppingCartService;

@Controller
@SessionAttributes({ "isLogin" })
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
	
	@PostMapping("updateCart1")
	public String updateCart1(HttpServletRequest request, Model m) {
		String[] idList = request.getParameterValues("itemId");
		Integer userId = 1;
		String[] qtyList = request.getParameterValues("qty");
		for(int i = 0; i < idList.length; i++) {
			shoppingCartService.update(Integer.parseInt(idList[i]), userId, Integer.parseInt(qtyList[i]));
		}
		List<ShoppingCartDisplay> items = shoppingCartService.list(1);
		m.addAttribute("items", items);
		return "redirect:/cart";
	}
	
	@PostMapping("/updateCart")
	@ResponseBody
	public List<ShoppingCartDisplay> updateCart(@RequestBody List<HashMap<String, String>> array) throws JSONException {
		Integer userId = 1;
		for(HashMap<String, String> i : array) {
			shoppingCartService.update(Integer.parseInt(i.get("itemId")), userId, Integer.parseInt(i.get("qty")));
		}
		List<ShoppingCartDisplay> items = shoppingCartService.list(1);
		return items;
	}
	@PostMapping("/deleteCart")
	@ResponseBody
	public List<ShoppingCartDisplay> deleteCart(@RequestBody HashMap<String, String> map){
		Integer itemId = Integer.parseInt(map.get("itemId"));
		Integer userId = 1;
		shoppingCartService.deleteByItemIdAndUserId(itemId, userId);
		List<ShoppingCartDisplay> items = shoppingCartService.list(1);
		return items;
	}
}
