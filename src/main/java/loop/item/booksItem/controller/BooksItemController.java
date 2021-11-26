package loop.item.booksItem.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import loop.item.booksItem.model.BooksItemBean;
<<<<<<< Updated upstream
import loop.item.booksItem.service.BooksItemService;
=======
import loop.item.booksItem.model.BooksItemService;
import loop.item.booksItem.validator.BooksItemValidator;
>>>>>>> Stashed changes

@Controller
public class BooksItemController {
	
	@Autowired
<<<<<<< Updated upstream
	private BooksItemService booksService;
	
=======
	public BooksItemController(BooksItemService booksItemService) {
		this.booksItemService = booksItemService;
	}
	
	@GetMapping("/")
	public String index(Model model) {
		return "";
	}
	
	@GetMapping("/")
	public String sendEmptyFrom(Model model) {
		BooksItemBean booksItemBean = new BooksItemBean();
		model.addAttribute("BookItemBean", booksItemBean);
		return "";				
	}
	@PostMapping("/")
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
>>>>>>> Stashed changes
	@GetMapping("/items/books")
	public String selectAll(Model m) {
		List<BooksItemBean> bean = booksService.findAll();
		m.addAttribute("allItem", bean);
		return "items/books";
	}
	
	@GetMapping("/items/books/{id}")
<<<<<<< Updated upstream
	public String selectById(@PathVariable("id") int itemId, Model m) {
		BooksItemBean bean = booksService.findById(itemId);
		m.addAttribute("item", bean);
		return "items/booksitem";
	}
=======
	public String findById(Model model,
			@PathVariable Integer itemId
			) {
		Optional<BooksItemBean> booksItemBean = booksItemService.findById(itemId);
		//BooksItemBean booksItemBean = booksItemService.findById(itemId);
		model.addAttribute(booksItemBean);
		return "booksItem";		
	}
	
	@PostMapping("/")
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
	
	@DeleteMapping(value="//{id}")
	public String deleteBooksItemData(@PathVariable Integer itemId) {
		booksItemService.deleteById(itemId);
		return "redirect:/";
		
	}
	
	@RequestMapping("/")
	public String home() {
		return "";
	}
	
>>>>>>> Stashed changes
}
