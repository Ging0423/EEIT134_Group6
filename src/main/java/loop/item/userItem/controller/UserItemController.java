package loop.item.userItem.controller;

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

import loop.item.userItem.model.UserItemBean;
import loop.item.userItem.service.UserItemService;

@Controller
public class UserItemController {
	
	@Autowired
	private UserItemService usersService;
	
	@GetMapping("/10")
	public String index(Model model) {
		return "single-userproduct";
	}
	
	@GetMapping("/items/users")
	public String selectAll(Model m) {
	    List<UserItemBean> bean = usersService.findAll();
	    m.addAttribute("allItem", bean);
	    return "/items/users";
	    }
	
	@GetMapping("/items/users/create")
	public String createUserItempage(Model m) {
		UserItemBean bean = new UserItemBean();
		m.addAttribute("usersData", bean);
		return "/items/userscreate";
	}
	
	@Autowired
	private UserItemBean bean;
	
	@GetMapping("/items/users/{id}")
	public String selectById(@PathVariable("id") int itemId, Model m) {
		bean = usersService.findById(itemId);
		m.addAttribute("item", bean);
		return "items/usersitem";
	}
	
	@PostMapping("/items/users/createusers")
	public String createItem(@ModelAttribute("usersData") UserItemBean bean) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date current = new Date();
		String Date = sdFormat.format(current);
	//	bean.setAddDate(Date);
	//	usersService.create(bean);
		return "redirect:/items/users";
	}
	
	@PostMapping("/items/modifyusers/{id}")
	public String update(Model m, 
			UserItemBean kisItemBean) {
//			BindingResult bindingResult) {
//		ProductValidator productValidator = new ProductValidator();
//		productValidator.validate(productBean, bindingResult);
		
//		if (bindingResult.hasErrors()) {
//			System.out.println(bindingResult.getAllErrors());
//			return "/items/editBooks";
//		}
//		
		usersService.update(bean);
		return "items/users";
		
	}
}
