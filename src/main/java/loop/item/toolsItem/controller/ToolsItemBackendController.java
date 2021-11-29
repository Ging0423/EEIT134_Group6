package loop.item.toolsItem.controller;

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
import loop.item.toolsItem.model.ToolsItemBean;
import loop.item.toolsItem.service.ToolsItemService;

@Controller
@RequestMapping("/backend")
public class ToolsItemBackendController {

	@Autowired
	private ToolsItemService toolsService;
	@Autowired
	private ItemImgService itemImgService;
	@Autowired
	private AllItemService allItemService;
	
	@GetMapping("/tools")
	public String selectAll(Model m) {
		List<ToolsItemBean> bean = toolsService.findAll();
		m.addAttribute("allItem", bean);
		return "backend/toolsform";
	}
	
	@GetMapping("/tools/create")
	public String createToolsItemPage(Model m){
		ToolsItemBean bean = new ToolsItemBean();
		m.addAttribute("toolsData", bean);
		return "backend/toolscreate";
	}
	
	@GetMapping("/tools/{id}")
	public String selectById(@PathVariable("id") Integer itemId, Model m) {
		ToolsItemBean bean = toolsService.findById(itemId);
		m.addAttribute("toolsData", bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImg);
		return "backend/tools";
	}
	
	@PostMapping("tools/createtools")
	public String createItem(@ModelAttribute("toolsData") ToolsItemBean bean, MultipartHttpServletRequest mrequest) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date current = new Date();
		bean.setAddDate(current);
		bean = toolsService.persist(bean);
		toolsService.create(bean);
		
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
		
		return "redirect:/backend/tools";
	}
	
	@PostMapping("tools/{id}")
	public String updateToolsItemPage(@PathVariable("id") Integer itemId, Model m) {
		ToolsItemBean bean = toolsService.findById(itemId);
		m.addAttribute("toolsData",bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImg);
		return "/backend/tools";
	}
	
	@PostMapping("updatetools")
	public String update(@ModelAttribute("toolsData")ToolsItemBean bean, Model m) {
		toolsService.update(bean);
		Integer id = bean.getItemId();
		return "redirect:/backend/tools/" + id;
	}
	
	@PostMapping("/deletetools")
	public String deleteById(ServletRequest request) {
		Integer itemId = Integer.parseInt(request.getParameter("itemId"));
		toolsService.deleteById(itemId);
		return "redirect:/backend/tools";
	}
}
	
	
		
	
