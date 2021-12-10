package loop.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import loop.item.allItem.service.AllItemService;

@Controller
@RequestMapping("/backend")
public class BackendController {
	
	@Autowired
	private AllItemService allItemService;

	@GetMapping
	public String backendIndex(Model m) {
		return "backend/backend_index";
	}

	
}

