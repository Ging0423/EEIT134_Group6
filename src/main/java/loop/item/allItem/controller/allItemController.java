package loop.item.allItem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class allItemController {
	@RequestMapping("/")
	public String index() {
		return "/index";
	}

}
