package loop.item.allItem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class allItemController {
	@GetMapping("/")
	public String index() {
		return "index";
	}

}
