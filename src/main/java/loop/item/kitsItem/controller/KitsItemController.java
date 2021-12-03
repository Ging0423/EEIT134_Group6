package loop.item.kitsItem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import loop.item.allItem.model.ItemDisplay;
import loop.item.allItem.model.ItemImgBean;
import loop.item.allItem.service.ItemImgService;
import loop.item.kitsItem.model.KitsItemBean;
import loop.item.kitsItem.service.KitsItemService;

@Controller
public class KitsItemController {
	
	@Autowired
	private KitsItemService kitsService;
	@Autowired
	private ItemImgService itemImgService;
	
	@GetMapping("/items/kits")
	public String selectAll(Model m) {
		List<ItemDisplay> bean = kitsService.list();
	    m.addAttribute("allItem", bean);
	    return "items/kits";
	}
	
	@GetMapping("/items/kits/{id}")
	public String selectById(@PathVariable("id") Integer itemId, Model m) {
		KitsItemBean bean = kitsService.findById(itemId);
		m.addAttribute("item", bean);
		List<ItemImgBean> itemImgs = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImgs);
		return "items/kitsitem";
	}
}
