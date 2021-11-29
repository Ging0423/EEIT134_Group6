package loop.item.toolsItem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import loop.item.allItem.model.ItemImgBean;
import loop.item.allItem.service.ItemImgService;
import loop.item.toolsItem.model.ToolsItemBean;
import loop.item.toolsItem.service.ToolsItemService;

@Controller
public class ToolsItemController {

	@Autowired
	private ToolsItemService toolsService;
	@Autowired
	private ItemImgService itemImgService;
	
	@GetMapping("/items/tools")
	public String selectAll(Model m) {
		List<ToolsItemBean> bean = toolsService.findAll();
		m.addAttribute("allItem", bean);
		return "items/tools";
	}
	
	@GetMapping("/items/tools/{id}")
	public String selectById(@PathVariable("id") Integer itemId, Model m) {
		ToolsItemBean bean = toolsService.findById(itemId);
		m.addAttribute("item", bean);
		List<ItemImgBean> itemImgs = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImgs);
		return "items/toolsitem";
	}
	
	@PostMapping("/items/tools/createtools")
	public String createItem(@ModelAttribute("toolsData") ToolsItemBean bean) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		bean.setAddDate(new Date());
		toolsService.create(bean);
		return "redirect:/items/tools";
	}
	
//	@PostMapping("/tools/deletetools")
//	public String deleteById(Model m) {
//		
//	}
//	public List<ToolsItemBean> deleteById(@RequestBody HashMap<String, String> map) {
//		Integer id = Integer.parseInt(map.get("itemId"));
//		toolsService.deleteById(id);
//		return toolsService.findAll();
//	}
	
	@PostMapping("/items/modifytools/{id}")
	public String update(Model m, 
			ToolsItemBean toolsItemBean) {
//			BindingResult bindingResult) {
//		ProductValidator productValidator = new ProductValidator();
//		productValidator.validate(productBean, bindingResult);
		
//		if (bindingResult.hasErrors()) {
//			System.out.println(bindingResult.getAllErrors());
//			return "/items/editBooks";
//		}
//		
		toolsService.update(bean);
		return "items/tools";
		
	}
}
