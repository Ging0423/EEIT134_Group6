package loop.item.userItem.controller;

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
import loop.item.userItem.model.UserItemBean;
import loop.item.userItem.service.UserItemService;

@Controller
@RequestMapping("/backend")
public class UserItemBackendController {
	
	@Autowired
	private UserItemService userItemService;
	@Autowired
	private ItemImgService itemImgService;
	@Autowired
	private AllItemService allItemService;
	
	@GetMapping("/useritem")
	public String selectAll(Model m) {
		List<UserItemBean> bean = userItemService.findAll();
		m.addAttribute("allItem", bean);
		return "backend/useritemform";
	}
	
	@GetMapping("/useritem/create")
	public String CreateUserItemPage(Model m) {
		UserItemBean bean = new UserItemBean();
		m.addAttribute("useritemData", bean);
		return "backend/useritemcreate";
	}
	
	@GetMapping("/useritem/{id}")
	public String selectById(@PathVariable("id") Integer itemId, Model m) {
		UserItemBean bean = userItemService.findById(itemId);
		m.addAttribute("useritemData", bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImg);
		return "backend/useritem";
	}
	
	@PostMapping("useritem/createitem")
	public String createItem(@ModelAttribute("userData") UserItemBean bean, MultipartHttpServletRequest mrequest) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date current = new Date();
		String Date = sdFormat.format(current);
		bean.setAddDate(Date);
		bean = userItemService.persist(bean);
		userItemService.create(bean);
		
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
				imgBean.setAllItem(allItem);
				itemImgService.save(imgBean);		
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/backend/useritem";
	}
	
	@PostMapping("useritem/{id}")
	public String userItemPage(@PathVariable ("id") Integer itemId, Model m) {
		UserItemBean bean = userItemService.findById(itemId);
		m.addAttribute("useritemData",bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImg);
		return "/backend/useritem";
	}
	
	@PostMapping("updateuseritem")
//	public String update(@ModelAttribute("useritemData")UserItemBean bean, BindingResult result, ModelMap m) {
	public String update(@ModelAttribute("useritemData")UserItemBean bean, Model m) {
		userItemService.update(bean);
//		if(result.hasErrors()) {
//			return "useritemError";
//		}
		Integer id = bean.getItemId();
		return "redirect:/backend/useritem/" + id;		
	}

	@PostMapping("/deleteuseritem")
	public String deleteById(ServletRequest request) {	
		Integer itemId = Integer.parseInt(request.getParameter("itemId"));
//		itemImgService.deleteByItemId(itemId);
		userItemService.deleteById(itemId);		
		return "redirect:/backend/useritem";
	}
}
