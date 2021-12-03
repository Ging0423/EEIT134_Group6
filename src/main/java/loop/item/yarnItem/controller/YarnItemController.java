package loop.item.yarnItem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import loop.item.allItem.model.ItemDisplay;
import loop.item.allItem.model.ItemImgBean;
import loop.item.allItem.service.ItemImgService;
import loop.item.yarnItem.model.YarnItemBean;
import loop.item.yarnItem.service.YarnItemService;

@Controller
//@SessionAttributes({ "isLogin" })
public class YarnItemController {

	@Autowired
	private YarnItemService yarnService;
	@Autowired
	private ItemImgService itemImgService;
	
	@GetMapping("/items/yarn")
	public String selectAll(Model m) {
	List<ItemDisplay> bean = yarnService.list();
	m.addAttribute("allItem",bean);
	return "items/yarn";
	}
	
	@GetMapping("/items/yarn/{id}")
	public String selectById(@PathVariable("id") Integer itemId, Model m) {
		YarnItemBean bean = yarnService.findById(itemId);
		m.addAttribute("item", bean);
		List<ItemImgBean> itemImgs = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImgs);
		return "items/yarnItem";
	}
}