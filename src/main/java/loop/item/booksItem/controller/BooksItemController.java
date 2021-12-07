package loop.item.booksItem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import loop.item.allItem.model.ItemDisplay;
import loop.item.allItem.model.ItemImgBean;
import loop.item.allItem.service.ItemImgService;
import loop.item.booksItem.model.BooksItemBean;
import loop.item.booksItem.service.BooksItemService;

@Controller
@RequestMapping("/items")
@SessionAttributes(names= {"totalPages", "totalEvements"})
public class BooksItemController {
	
	@Autowired
	private BooksItemService booksService;
	@Autowired
	private ItemImgService itemImgService;
//	@Autowired
//	private AllItemService allItemService;
	
	@GetMapping("/books")
	public String selectAll(Model m) {
		List<ItemDisplay> bean = booksService.list();
		m.addAttribute("allItem", bean);
		return "items/books";
	}
	
	@GetMapping("/books/{id}")
	public String selectById(@PathVariable("id") Integer itemId, Model m) {
		BooksItemBean bean = booksService.findById(itemId);
		m.addAttribute("item", bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImg);
		return "items/booksitem";
	}	
	
}
