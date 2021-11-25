package loop.item.toolsItem.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import loop.item.toolsItem.model.ToolsItemBean;
import loop.item.toolsItem.service.ToolsItemService;

@Controller
public class ToolsItemController {

	@Autowired
	private ToolsItemService toolsService;
	
	@GetMapping("/items/tools")
	public String selectAll(Model m) {
		List<ToolsItemBean> bean = toolsService.findAll();
		m.addAttribute("allItem", bean);
		return "items/tools";
	}
	
	@GetMapping("/items/tools/create")
	public String createToolsItemPage(Model m){
		ToolsItemBean bean = new ToolsItemBean();
		m.addAttribute("toolsData", bean);
		return "/items/toolscreate";
	}
	
	@Autowired
	private ToolsItemBean bean;
	
	@GetMapping("/items/tools/{id}")
	public String selectById(@PathVariable("id") int itemId, Model m) {
		bean = toolsService.findById(itemId);
		m.addAttribute("item", bean);
		return "items/toolsitem";
	}
	
	@PostMapping("/items/tools/createtools")
	public String createItem(@ModelAttribute("toolsData") ToolsItemBean bean) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date current = new Date();
		String Date = sdFormat.format(current);
		bean.setAddDate(Date);
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
