package loop.item.yarnItem.controller;

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
import loop.item.yarnItem.model.YarnItemBean;
import loop.item.yarnItem.service.YarnItemService;

@Controller
@RequestMapping("/backend")
public class YarnItemBackendController {
	
	@Autowired
	private YarnItemService yarnService;
	@Autowired
	private ItemImgService itemImgService;
	@Autowired
	private AllItemService allItemService;
	
	@GetMapping("/yarn")
	public String selectAll(Model m) {
		List<YarnItemBean> bean = yarnService.findAll();
		m.addAttribute("allItem", bean);
		return "backend/yarnform";
	}
	
	@GetMapping("/yarn/create")
	public String CreateYarnItemPage(Model m) {
		YarnItemBean bean = new YarnItemBean();
		m.addAttribute("yarnData", bean);
        return "backend/yarncreate";
	}
	
	@GetMapping("/yarn/{id}")
	public String selectById(@PathVariable("id") Integer itemId, Model m) {
		YarnItemBean bean = yarnService.findById(itemId);
		m.addAttribute("yarnData", bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg", itemImg);
		return "backend/yarn";
	}

	@PostMapping("yarn/createyarn")
	public String createItem(@ModelAttribute("yarnData") YarnItemBean bean, MultipartHttpServletRequest mrequest) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date current = new Date();
		String Date = sdFormat.format(current);
		bean.setAddDate(Date);
		bean = yarnService.persist(bean);
		yarnService.create(bean);
		
		Integer itemId = bean.getItemId();
		AllItemBean allItem =allItemService.findById(itemId);
		
		List<MultipartFile> files = mrequest.getFiles("img");
		for (int i = 0; i< files.size()-1;i++) {
			String imageFile = itemImgService.getRandomString(8);
			String fileName = files.get(i).getOriginalFilename();
			String extension ="";
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
				files.get(i).transferTo(savePathFile);
				imgBean.setImg(imageFile + "." + extension);
				imgBean.setAllItem(allItem);
				itemImgService.save(imgBean);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/backend/yarn";	
	}
	
	@PostMapping("yarn/{id}")
	public String updateYarnItemPage(@PathVariable ("id") Integer itemId, Model m) {
		YarnItemBean bean = yarnService.findById(itemId);
		m.addAttribute("yarnData",bean);
		List<ItemImgBean> itemImg = itemImgService.findByItemId(itemId);
		m.addAttribute("itemImg",itemImg);
		return "/backend/yarn";
	}

	@PostMapping("updateyarn")
	public String update(@ModelAttribute("yarnData")YarnItemBean bean, Model m) {
		yarnService.update(bean);
		Integer id = bean.getItemId();
		return "redirect:/backend/yarn/" + id;
	}
	
	@PostMapping("/deleteyarn")
	public String deleteById(ServletRequest request) {
		Integer itemId = Integer.parseInt(request.getParameter("itemId"));
		yarnService.deleteById(itemId);
		return "redirect:/backend/yarn";
	}
}
