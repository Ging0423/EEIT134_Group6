package loop.item.yarnItem.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.PostMapping;


import loop.item.yarnItem.model.YarnItemBean;
import loop.item.yarnItem.service.YarnItemService;

@Controller
@SessionAttributes({ "isLogin" })
public class YarnItemController {

	@Autowired
	private YarnItemService yarnService;
	
	@GetMapping("/items/yarn")
	public String selectAll(Model m) {
	List <YarnItemBean> bean = yarnService.findAll();
	m.addAttribute("allItem",bean);
	return "items/yarn";
	}
	
	@GetMapping("/items/yarn/create")
	public String createYarnItemPage(Model m) {
		YarnItemBean bean = new YarnItemBean();
		m.addAttribute("yarnData", bean);
		return "/items/yarncreate";				
	}
	
	@Autowired
	private YarnItemBean bean;
	
	@GetMapping("/items/yarn/{id}")
	public String selectById(@PathVariable("id") int itemId, Model m) {
		bean = yarnService.findById(itemId);
		m.addAttribute("item", bean);
		return "items/yarnitem";
	}
	
	@PostMapping("/items/yarn/createyarn")
	public String createItem(@ModelAttribute("yarnData") YarnItemBean bean) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date currect = new Date();
		String Date = sdFormat.format(currect);
		bean.setAddDate(Date);
		yarnService.create(bean);
		return "redirect:/items/yarn";
	}
	
	@PostMapping("/items/modifyyarn/{id}")
	public String update(Model m, 
			YarnItemBean yarnItemBean) {
//			BindingResult bindingResult) {
//		ProductValidator productValidator = new ProductValidator();
//		productValidator.validate(productBean, bindingResult);
		
//		if (bindingResult.hasErrors()) {
//			System.out.println(bindingResult.getAllErrors());
//			return "/items/editBooks";
//		}
//		
		yarnService.update(bean);
		return "items/yarn";
		
	}
}
