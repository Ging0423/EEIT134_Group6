package loop.item.userItem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import loop.item.allItem.model.ItemImgBean;
import loop.item.allItem.service.ItemImgService;
import loop.item.userItem.model.UserItemBean;
import loop.item.userItem.service.UserItemService;

@Controller
public class UserItemController {

	@Autowired
	private UserItemService userService;
	@Autowired
	private ItemImgService itemImgService;
	
	@GetMapping("/10")
	public String index(Model model) {
		return "single-userproduct";
	
		//return "";//copy yarn
	}
	
	@GetMapping("/items/user")
	public String selectAll(Model m) {
		List<UserItemBean> bean = userService.findAll();
		m.addAttribute("allItem", bean);
		return "items/user";
	}
	
	@GetMapping("/items/user/{id}")
	public String selectById(@PathVariable("id") Integer itemId, Model m) {
		UserItemBean bean = userService.findById(itemId);
		m.addAttribute("item", bean);
		List<ItemImgBean> itemImgs = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImgs);
		return "items/useritem";
	}
	
}
