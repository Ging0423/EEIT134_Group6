package loop.item.allItem.controller;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import loop.item.allItem.model.ItemDisplay;
import loop.item.allItem.service.AllItemService;



@Controller
@SessionAttributes({ "isLogin" })
public class AllItemController {
	
	@Autowired
	private AllItemService allItemService;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
    @GetMapping("/backend/allitem")
	public String backendAllItem(Model m) {
		List<ItemDisplay> bean = allItemService.list();
		m.addAttribute("allItem", bean);
		return "backend/allitemform";
	}	
    
	@PostMapping("/backend/allitem")
	public String deleteById(ServletRequest request) {
		Integer itemId = Integer.parseInt(request.getParameter("itemId"));
		allItemService.deleteById(itemId);
		return "redirect:/backend/allitem";
	}
	@GetMapping("/backend/items/{id}")
	public String selectId(@PathVariable("id") Integer itemId) {
		char id = Integer.toString(itemId).charAt(0);
		if (id == '1') {
			return "redirect:/backend/yarn/"+itemId;
		} else if (id == '2') {
			return "redirect:/backend/tools/"+itemId;
		} else if (id == '3') {
			return "redirect:/backend/books/"+itemId;
		} else if (id == '4') {
			return "redirect:/backend/kits/"+itemId;
		}
		return "redirect:/backend/allitem/";
	}
}
