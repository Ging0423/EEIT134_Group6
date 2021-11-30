package loop.item.allItem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({ "isLogin" })
public class allItemController {
	@GetMapping("/")
	public String index() {
		return "index";
	}

}
