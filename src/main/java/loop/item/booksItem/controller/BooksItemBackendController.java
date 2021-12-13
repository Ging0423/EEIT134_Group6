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
public class BooksItemBackendController {
	
	@Autowired
	private BooksItemService booksService;
	@Autowired
	private ItemImgService itemImgService;
	@Autowired
	private AllItemService allItemService;
	
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
	
	@GetMapping("/books/{id}")
	public String selectById(@PathVariable("id") Integer itemId, Model m) {
		BooksItemBean bean = booksService.findById(itemId);
		m.addAttribute("booksData", bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImg);
		return "backend/books";
	}
	
	@PostMapping("books/createbooks")
	public String createItem(@ModelAttribute("booksData") BooksItemBean bean, MultipartHttpServletRequest mrequest) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date current = new Date();
		String Date = sdFormat.format(current);
		bean.setAddDate(Date);
		bean = booksService.persist(bean);
		booksService.create(bean);
		
		Integer itemId = bean.getItemId();
		AllItemBean allItem = allItemService.findById(itemId);
		
		List<MultipartFile> files = mrequest.getFiles("img");
		for(MultipartFile i : files) {			
			String imageFile = itemImgService.getRandomString(8);
			String fileName = i.getOriginalFilename();
			String extension = "";
			int index = fileName.lastIndexOf('.');
			if (index > 0) {
			    extension = fileName.substring(index+1);
			}
			String realPath = mrequest.getServletContext().getRealPath(".");
			String saveDirPath = realPath + "\\items\\img\\";
			File saveDirPathFile = new File(saveDirPath);
			saveDirPathFile.mkdirs();
			String savePath = saveDirPath + imageFile + "." + extension;
			File savePathFile = new File(savePath);
			ItemImgBean imgBean = new ItemImgBean();
			try {
				i.transferTo(savePathFile);
				imgBean.setImg(imageFile + "." +extension);
				imgBean.setItemId(itemId);
				imgBean.setAllItem(allItem);
				itemImgService.save(imgBean);		
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/backend/books";
	}
	
	@PostMapping("books/{id}")
	public String updateBooksItemPage(@PathVariable ("id") Integer itemId, Model m) {
		BooksItemBean bean = booksService.findById(itemId);
		m.addAttribute("booksData",bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImg);
		return "/backend/books";
	}
	
	@PostMapping("updatebooks")
//	public String update(@ModelAttribute("booksData")BooksItemBean bean, BindingResult result, ModelMap m) {
	public String update(@ModelAttribute("booksData")BooksItemBean bean, Model m, MultipartHttpServletRequest mrequest) {		
		booksService.update(bean);
		List<MultipartFile> files = mrequest.getFiles("img");
		List<ItemImgBean> imgs = itemImgService.findByItemId(bean.getItemId());
		int j = 0;
		for (MultipartFile i : files) {
			if (!i.isEmpty()) {
				ItemImgBean imgBean = imgs.get(j);
				j++;
				String imageFile = itemImgService.getRandomString(8);
				String fileName = i.getOriginalFilename();
				String extension = "";
				int index = fileName.lastIndexOf('.');
				if (index > 0) {
					extension = fileName.substring(index + 1);
				}
				String realPath = mrequest.getServletContext().getRealPath(".");
				String saveDirPath = realPath + "\\items\\img\\";
				File saveDirPathFile = new File(saveDirPath);
				saveDirPathFile.mkdirs();
				String savePath = saveDirPath + imageFile + "." + extension;
				File savePathFile = new File(savePath);
				try {
					i.transferTo(savePathFile);
					imgBean.setImg(imageFile + "." + extension);
					itemImgService.save(imgBean);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}

			} else {
				j++;
			}
		}
		Integer id = bean.getItemId();
		return "redirect:/backend/books/" + id;		
	}

	@PostMapping("/deletebooks")
	public String deleteById(ServletRequest request) {	
		Integer itemId = Integer.parseInt(request.getParameter("itemId"));
//		itemImgService.deleteByItemId(itemId);
		booksService.deleteById(itemId);	
		return "redirect:/backend/books";
	}
}
