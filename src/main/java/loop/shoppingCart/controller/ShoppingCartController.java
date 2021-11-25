package loop.shoppingCart.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import loop.item.allItem.service.AllItemService;
import loop.shoppingCart.model.ShoppingCartDisplay;
import loop.shoppingCart.service.ShoppingCartService;
import loop.user.model.UsersBean;

@Controller
@SessionAttributes({ "isLogin" })
@RequestMapping("/cart")
public class ShoppingCartController {

	@Autowired
	ShoppingCartService shoppingCartService;

	@Autowired
	AllItemService allItemService;

	@PostMapping("/addToCart")
	public String addToCart(HttpServletRequest request, Model m) {
		Integer itemId = Integer.parseInt(request.getParameter("itemId"));
		Integer qty = Integer.parseInt(request.getParameter("qty"));
		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
		Integer userId = bean.getUserId();
		if (shoppingCartService.isExist(itemId, userId)) {
			shoppingCartService.updateQty(itemId, userId, qty);
		} else {
			shoppingCartService.save(itemId, userId, qty);
		}
		return "redirect:/cart/display";
	}

	@GetMapping("/display")
	public String cartDisplay(Model m) {
		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
		Integer userId = bean.getUserId();
		List<ShoppingCartDisplay> items = shoppingCartService.list(userId);
		m.addAttribute("items", items);
		return "/cart";
	}
	
	@PostMapping("updateCart1")
	public String updateCart1(HttpServletRequest request, Model m) {
		String[] idList = request.getParameterValues("itemId");
		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
		Integer userId = bean.getUserId();
		String[] qtyList = request.getParameterValues("qty");
		for(int i = 0; i < idList.length; i++) {
			shoppingCartService.update(Integer.parseInt(idList[i]), userId, Integer.parseInt(qtyList[i]));
		}
		return "redirect:/cart/display";
	}
	
	@PostMapping("/updateCart")
	@ResponseBody
	public List<ShoppingCartDisplay> updateCart(@RequestBody List<HashMap<String, String>> array, Model m) throws JSONException {
		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
		Integer userId = bean.getUserId();
		for(HashMap<String, String> i : array) {
			shoppingCartService.update(Integer.parseInt(i.get("itemId")), userId, Integer.parseInt(i.get("qty")));
		}
		List<ShoppingCartDisplay> items = shoppingCartService.list(1);
		return items;
	}
	@PostMapping("/deleteCart")
	@ResponseBody
	public List<ShoppingCartDisplay> deleteCart(@RequestBody HashMap<String, String> map, Model m){
		Integer itemId = Integer.parseInt(map.get("itemId"));
		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
		Integer userId = bean.getUserId();
		shoppingCartService.deleteByItemIdAndUserId(itemId, userId);
		List<ShoppingCartDisplay> items = shoppingCartService.list(userId);
		return items;
	}
}
