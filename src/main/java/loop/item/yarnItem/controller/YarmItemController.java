package loop.item.yarnItem.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import loop.item.yarnItem.model.YarnItemBean;
import loop.item.yarnItem.service.YarnItemService;

@Controller
public class YarmItemController {

	@Autowired
	private YarnItemService service;
	
	@Autowired
	private YarnItemBean bean;
	@RequestMapping("/items/yarn")
	public String selectAll(Model m) {
		List<YarnItemBean> allItem = new ArrayList<YarnItemBean>();
		allItem = service.selectAll();
		m.addAttribute("allItem", allItem);
		return "/yarn";
	}
	@RequestMapping("/items/yarn/{id}")
	public String selectById(@PathVariable("id") int itemId, Model m) {
		YarnItemBean bean = service.selectById(itemId);
		m.addAttribute("item", bean);
		return "/yarnItem";
	}
	
	
}
