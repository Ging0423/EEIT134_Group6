package loop.item.userItem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import loop.item.userItem.model.UserItemBean;
import loop.item.userItem.service.UserItemService;
import loop.item.userItem.validator.UserItemValidator;

@Controller
public class UserItemController {
	
	UserItemService userItemService;
	
	@Autowired
	public UserItemController(UserItemService userItemService) {
		this.userItemService = userItemService;
	}
	
	@GetMapping("/10")
	public String index(Model model) {
		return "single-userproduct";
	}
	
	@GetMapping("/20")
	public String sendEmptyForm(Model model) {
		UserItemBean userItemBean = new UserItemBean();
		model.addAttribute("UserItemBean", userItemBean);
		return "";				
	}
	@PostMapping("/30")
	public String save(Model model,
			UserItemBean userItemBean,
			BindingResult bindingResult) {
		UserItemValidator userItemValidator = new UserItemValidator();
		UserItemValidator.validate(userItemBean, bindingResult);
		
		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors());
			return "";
		}
		
		userItemService.save(userItemBean);
		return "redirect:/";
		}
	@GetMapping("/users/items")
	public String findAll(Model model) {
		List<UserItemBean> beans = userItemService.findAll();
		model.addAttribute(beans);
		return "items";	    
	}
	
	@GetMapping("/users/items/{id}")
	public String findById(Model model,
			@PathVariable Integer itemId
			) {
		UserItemBean userItemBean = userItemService.findById(itemId);
		model.addAttribute(userItemBean);
		return "userItem";		
	}
	
	@PostMapping("/40")
	public String update(Model model,
			UserItemBean userItemBean,
			BindingResult bindingResult) {
		UserItemValidator userItemValidator = new UserItemValidator();
		UserItemValidator.validate(userItemBean, bindingResult);
		
		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors());
			return "";			
		}
		
		userItemService.update(userItemBean);
		return "redirect:/";
	}
	
	@DeleteMapping(value="/50/{id}")
	public String deleteuserItemData(@PathVariable Integer itemId) {
		userItemService.deleteUserItemByPrimaryKey(itemId);
		return "redirect:/";
		
	}
	
	@RequestMapping("/60")
	public String home() {
		return "";
	}
	
}
