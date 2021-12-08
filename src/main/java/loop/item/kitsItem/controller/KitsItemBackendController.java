package loop.item.kitsItem.controller;

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
import loop.item.kitsItem.model.KitsItemBean;
import loop.item.kitsItem.service.KitsItemService;

@Controller
@RequestMapping("/backend")
public class KitsItemBackendController {
	
	@Autowired
	private KitsItemService kitsService;
	@Autowired
	private ItemImgService itemImgService;
	@Autowired
	private AllItemService allItemService;
	
	@GetMapping("/kits")
	public String selectAll(Model m) {
	    List<KitsItemBean> bean = kitsService.findAll();
	    m.addAttribute("allItem", bean);
	    return "backend/kitsform";
	    }
	
	@GetMapping("/kits/create")
	public String createKitsItempage(Model m) {
		KitsItemBean bean = new KitsItemBean();
		m.addAttribute("kitsData", bean);
		return "backend/kitscreate";
	}
	
	@GetMapping("/kits/{id}")
	public String selectById(@PathVariable("id") Integer itemId, Model m) {
		KitsItemBean bean = kitsService.findById(itemId);
		m.addAttribute("kitsData", bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImg);
		return "backend/kits";
	}
	
	@PostMapping("kits/createkits")
	public String createItem(@ModelAttribute("kitsData") KitsItemBean bean, MultipartHttpServletRequest mrequest) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date current = new Date();
		String Date = sdFormat.format(current);
		bean.setAddDate(Date);
		bean = kitsService.persist(bean);
		kitsService.create(bean);
		
		Integer itemId = bean.getItemId();
		AllItemBean allItem = allItemService.findById(itemId);
		
		List<MultipartFile> files = mrequest.getFiles("img");
//		for (int i = 0; i < files.size()-1; i++) {		
		for(MultipartFile i : files) {	
			String imageFile = itemImgService.getRandomString(8);
			String fileName = i.getOriginalFilename();
//			String fileName = files.get(i).getOriginalFilename();
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
//				files.get(i).transferTo(savePathFile);
				i.transferTo(savePathFile);
				imgBean.setImg(imageFile + "." +extension);
				imgBean.setAllItem(allItem);
				itemImgService.save(imgBean);		
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/backend/kits";
	}
	
	@PostMapping("kits/{id}")
	public String updateKitsItemPage(@PathVariable ("id") Integer itemId, Model m) {
		KitsItemBean bean = kitsService.findById(itemId);
		m.addAttribute("kitsData",bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImg);
		return "backend/kits";
	}
	
	@PostMapping("updatekits")
	public String update(@ModelAttribute("kitsData")KitsItemBean bean, Model m) {
			kitsService.update(bean);
		Integer id = bean.getItemId();
		return "redirect:/backend/kits/" + id;
	}
	
	@PostMapping("/deletekits")
	public String deleteById(ServletRequest request) {
		Integer itemId = Integer.parseInt(request.getParameter("itemId"));
		kitsService.deleteById(itemId);
		return "redirect:/backend/kits";		
	}
}
