package loop.backend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/backend")
public class BackendController {

	@GetMapping
	public String backendIndex(Model m) {
		return "backend/backend_index";
	}
}
