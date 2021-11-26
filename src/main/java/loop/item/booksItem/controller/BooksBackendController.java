package loop.item.booksItem.controller;


import java.io.File;
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import loop.item.allItem.model.AllItemBean;
import loop.item.allItem.model.ItemImgBean;
import loop.item.allItem.service.AllItemService;
import loop.item.allItem.service.ItemImgService;
import loop.item.booksItem.model.BooksItemBean;
import loop.item.booksItem.service.BooksItemService;

@Controller
@RequestMapping("/backend")
public class BooksBackendController {
	
	@Autowired
	private BooksItemService booksService;
	
	@GetMapping("/books")
	public String selectAll(Model m) {
		List<BooksItemBean> bean = booksService.findAll();
		m.addAttribute("allItem", bean);
		return "backend/booksform";
	}
	
	@GetMapping("/books/create")
	public String CreateBooksItemPage(Model m) {
		BooksItemBean bean = new BooksItemBean();
		m.addAttribute("booksData", bean);
		return "backend/bookscreate";
	}
	
	@GetMapping("/{id}")
	public String selectById(@PathVariable("id") int itemId, Model m) {
		BooksItemBean bean = booksService.findById(itemId);
		m.addAttribute("booksData", bean);
		return "backend/books";
	}
	
	@PostMapping("books/createbooks")
	public String createItem(@ModelAttribute("booksData") BooksItemBean bean) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date current = new Date();
		String Date = sdFormat.format(current);
		bean.setAddDate(Date);
		booksService.create(bean);
		return "redirect:/backend/books";
	}
	
	@GetMapping("/books/{id}")
	public String updateBooksItemPage(@PathVariable ("id") Integer itemId, Model m) {
		BooksItemBean bean = booksService.findById(itemId);
		m.addAttribute("booksData",bean);
		return "/backend/books";
	}
	
	@PostMapping("updatebooks")
//	public String update(@ModelAttribute("booksData")BooksItemBean bean, BindingResult result, ModelMap m) {
	public String update(@ModelAttribute("booksData")BooksItemBean bean, Model m) {
		booksService.update(bean);
//		if(result.hasErrors()) {
//			return "booksError";
//		}
		Integer id = bean.getItemId();
		return "redirect:/backend/books/" + id;		
	}
//	
	@PostMapping("/delete")
	public String deleteById(ServletRequest request) {	
		Integer itemId = Integer.parseInt(request.getParameter("itemId"));
		booksService.deleteById(itemId);
		return "redirect:/backend/books";
	}
}
