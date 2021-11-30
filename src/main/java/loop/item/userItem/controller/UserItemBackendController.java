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
	private UserItemService userService;
	@Autowired
	private ItemImgService itemImgService;
	@Autowired
	private AllItemService allItemService;
	
	@GetMapping("/user")
	public String selectAll(Model m) {
		List<UserItemBean> bean = userService.findAll();
		m.addAttribute("allItem", bean);
		return "backend/userform";
	}
	
	@GetMapping("/user/create")
	public String createUserItemPage(Model m){
		UserItemBean bean = new UserItemBean();
		m.addAttribute("userData", bean);
		return "backend/usercreate";
	}
	
	@GetMapping("/user/{id}")
	public String selectById(@PathVariable("id") Integer itemId, Model m) {
		UserItemBean bean = userService.findById(itemId);
		m.addAttribute("userData", bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImg);
		return "backend/user";
	}
	
	@PostMapping("user/createuser")
	public String createItem(@ModelAttribute("userData") UserItemBean bean, MultipartHttpServletRequest mrequest) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date current = new Date();
		String Date = sdFormat.format(current);
		bean.setAddDate(Date);
		bean = userService.persist(bean);
		userService.create(bean);
		
		Integer itemId = bean.getItemId();
		AllItemBean allItem = allItemService.findById(itemId);
		
		List<MultipartFile> files = mrequest.getFiles("img");
		for (int i = 0; i < files.size()-1; i++) {
			String imageFile = itemImgService.getRandomString();
			String fileName = files.get(i).getOriginalFilename();
			String extension = "";
			int index = fileName.lastIndexOf(".");
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
				files.get(i).transferTo(savePathFile);
				imgBean.setImg(imageFile + "." +extension);
				imgBean.setAllItem(allItem);
				itemImgService.save(imgBean);		
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/backend/user";
	}
	
	@PostMapping("user/{id}")
	public String updateUserItemPage(@PathVariable("id") Integer itemId, Model m) {
		UserItemBean bean = userService.findById(itemId);
		m.addAttribute("userData",bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImg);
		return "/backend/user";
	}
	
	@PostMapping("updateuser")
	public String update(@ModelAttribute("userData")UserItemBean bean, Model m) {
		userService.update(bean);
		Integer id = bean.getItemId();
		return "redirect:/backend/user/" + id;
	}
	
	@PostMapping("/deleteuser")
	public String deleteById(ServletRequest request) {
		Integer itemId = Integer.parseInt(request.getParameter("itemId"));
		userService.deleteById(itemId);
		return "redirect:/backend/user";
	}
}
	
	
		
	
