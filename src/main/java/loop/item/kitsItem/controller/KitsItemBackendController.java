package loop.item.kitsItem.controller;

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

import loop.item.kitsItem.model.KitsItemBean;
import loop.item.kitsItem.service.KitsItemService;

@Controller
@RequestMapping("/backend")
public class KitsItemBackendController {
	
	@Autowired
	private KitsItemService kitsService;
	
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
	public String selectById(@PathVariable("id")  Integer itemId, Model m) {
		KitsItemBean bean = kitsService.findById(itemId);
		m.addAttribute("kitsData", bean);
		return "backend/kits";
	}
	
	@PostMapping("kits/createkits")
	public String createItem(@ModelAttribute("kitsData") KitsItemBean bean) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date current = new Date();
		String Date = sdFormat.format(current);
		bean.setAddDate(Date);
		kitsService.create(bean);
		return "redirect:/backend/kits";
	}
	
	@PostMapping("/{id}")
	public String updateKitsItemPage(@PathVariable ("id") Integer itemId, Model m) {
		KitsItemBean bean = kitsService.findById(itemId);
		m.addAttribute("KitsData",bean);
		return "/backend/kits";
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
