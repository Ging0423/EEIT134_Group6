package loop.item.booksItem.controller;

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

import loop.item.booksItem.model.BooksItemBean;
import loop.item.booksItem.service.BooksItemService;
import loop.item.booksItem.validator.BooksItemValidator;

@Controller
public class BooksItemController {
	
	BooksItemService booksItemService;
	
	@Autowired
	public BooksItemController(BooksItemService booksItemService) {
		this.booksItemService = booksItemService;
	}
	
	@GetMapping("/1")
	public String index(Model model) {
		return "";
	}
	
	@GetMapping("/2")
	public String sendEmptyForm(Model model) {
		BooksItemBean booksItemBean = new BooksItemBean();
		model.addAttribute("BookItemBean", booksItemBean);
		return "";				
	}
	@PostMapping("/3")
	public String save(Model model,
			BooksItemBean booksItemBean,
			BindingResult bindingResult) {
		BooksItemValidator booksItemValidator = new BooksItemValidator();
		BooksItemValidator.validate(booksItemBean, bindingResult);
		
		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors());
			return "";
		}
		
		booksItemService.save(booksItemBean);
		return "redirect:/";
		}
	@GetMapping("/items/books")
	public String findAll(Model model) {
		List<BooksItemBean> beans = booksItemService.findAll();
		model.addAttribute(beans);
		return "books";	    
	}
	
	@GetMapping("/items/books/{id}")
	public String findById(Model model,
			@PathVariable Integer itemId
			) {
		BooksItemBean booksItemBean = booksItemService.findById(itemId);
		model.addAttribute(booksItemBean);
		return "booksItem";		
	}
	
	@PostMapping("/4")
	public String update(Model model,
			BooksItemBean booksItemBean,
			BindingResult bindingResult) {
		BooksItemValidator booksItemValidator = new BooksItemValidator();
		BooksItemValidator.validate(booksItemBean, bindingResult);
		
		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors());
			return "";			
		}
		
		booksItemService.update(booksItemBean);
		return "redirect:/";
	}
	
	@DeleteMapping(value="/5/{id}")
	public String deleteBooksItemData(@PathVariable Integer itemId) {
		booksItemService.deleteBooksItemByPrimaryKey(itemId);
		return "redirect:/";
		
	}
	
	@RequestMapping("/6")
	public String home() {
		return "";
	}
	
}
