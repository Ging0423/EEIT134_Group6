package loop.item.booksItem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import loop.item.booksItem.model.BooksItemBean;
import loop.item.booksItem.service.BooksItemService;

@Controller
public class BooksItemController {
	
	@Autowired
	private BooksItemService booksService;
	
	@GetMapping("/items/books")
	public String selectAll(Model m) {
		List<BooksItemBean> bean = booksService.findAll();
		m.addAttribute("allItem", bean);
		return "items/books";
	}
	
	@GetMapping("/items/books/{id}")
	public String selectById(@PathVariable("id") int itemId, Model m) {
		BooksItemBean bean = booksService.findById(itemId);
		m.addAttribute("item", bean);
		return "items/booksitem";
	}
}
