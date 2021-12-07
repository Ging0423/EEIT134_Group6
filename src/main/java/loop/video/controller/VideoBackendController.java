package loop.video.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import loop.video.model.AllVideoBean;
import loop.video.service.AllVideoService;

@Controller
@RequestMapping("/backend")
public class VideoBackendController {
	
	@Autowired
	private AllVideoService allVideoService;
	
	@GetMapping("/video")
	public String videoList(Model m) {
		List<AllVideoBean> list = allVideoService.findAll();
		m.addAttribute("allVideo", list);
		return "backend/video";
	}
	
	@GetMapping("/video/create")
	public String videoCreatePage(Model m) {
		AllVideoBean bean = new AllVideoBean();
		m.addAttribute("video", bean);
		return "backend/videoCreate";
	}
	@PostMapping("/video/create")
	public String videoCreate(@ModelAttribute("video") AllVideoBean allVideo, Model m) {
		allVideoService.save(allVideo);
		return "redirect:/backend/video";
	}

}
