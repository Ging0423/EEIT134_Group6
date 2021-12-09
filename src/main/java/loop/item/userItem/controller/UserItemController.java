package loop.item.userItem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import loop.item.allItem.model.ItemDisplay;
import loop.item.allItem.model.ItemImgBean;
import loop.item.allItem.service.ItemImgService;
import loop.item.userItem.model.UserItemBean;
import loop.item.userItem.service.UserItemService;

@Controller
@RequestMapping("/items")
@SessionAttributes(names= {"totalPages", "totalEvements"})
public class UserItemController {
	
	@Autowired
	private UserItemService userItemService;
	@Autowired
	private ItemImgService itemImgService;
//	@Autowired
//	private AllItemService allItemService;
	
	@GetMapping("/useritems")
	public String selectAll(Model m) {
		List<ItemDisplay> bean = userItemService.list();
		m.addAttribute("allItem", bean);
		return "items/useritems";
	}
	
	@GetMapping("/useritems/{id}")
	public String selectById(@PathVariable("id") Integer itemId, Model m) {
		UserItemBean bean = userItemService.findById(itemId);
		m.addAttribute("item", bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImg);
		return "items/useritem";
	}	
	
}
