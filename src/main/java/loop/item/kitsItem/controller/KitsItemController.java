package loop.item.kitsItem.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import loop.item.kitsItem.model.KitsItemBean;
import loop.item.kitsItem.service.KitsItemService;

@Controller
public class KitsItemController {
	
	@Autowired
	private KitsItemService kitsService;
	
	@GetMapping("/items/kits")
	public String selectAll(Model m) {
	    List<KitsItemBean> bean = kitsService.findAll();
	    m.addAttribute("allItem", bean);
	    return "/items/kits";
	    }
	
	@GetMapping("/items/kits/create")
	public String createKitsItempage(Model m) {
		KitsItemBean bean = new KitsItemBean();
		m.addAttribute("kitsData", bean);
		return "/items/kitscreate";
	}
	
	@Autowired
	private KitsItemBean bean;
	
	@GetMapping("/items/kits/{id}")
	public String selectById(@PathVariable("id") int itemId, Model m) {
		bean = kitsService.findById(itemId);
		m.addAttribute("item", bean);
		return "items/kitsitem";
	}
	

}
