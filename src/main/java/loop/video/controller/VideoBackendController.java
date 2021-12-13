package loop.video.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import loop.video.model.AllVideoBean;
import loop.video.model.VideoCommentBean;
import loop.video.service.AllVideoService;
import loop.video.service.VideoCommentService;

@Controller
@RequestMapping("/backend")
@SessionAttributes({ "isLogin" })
public class VideoBackendController {
	
	@Autowired
	private AllVideoService allVideoService;
	
	@Autowired
	private VideoCommentService videoCommentService;
	
	@GetMapping("/video")
	public String videoList(Model m) {
		List<AllVideoBean> list = allVideoService.findAll();
		m.addAttribute("allVideo", list);
		return "backend/video";
	}
	
	@GetMapping("/video/{id}")
	public String videoInfo(@PathVariable("id") Integer videoId, Model m) {
		AllVideoBean bean = allVideoService.findById(videoId);
		m.addAttribute("video", bean);
		List<VideoCommentBean> comment = videoCommentService.findByVideoId(videoId);
		m.addAttribute("comments", comment);
		return "backend/videodetail";
	}
	
	@GetMapping("/video/create")
	public String videoCreatePage(Model m) {
		return "backend/videoCreate";
	}
	@PostMapping("video/create")
	public String videoCreate(ServletRequest request, Model m) {
		AllVideoBean bean = new AllVideoBean();
		bean.setHref(request.getParameter("href"));
		bean.setVideoDescription(request.getParameter("description"));
		bean.setVideoLink(request.getParameter("videoLink"));
		bean.setVideoName(request.getParameter("videoName"));
		allVideoService.save(bean);
		return "redirect:/backend/video";
	}
	@PostMapping("/video/{id}/deleteComment")
	@ResponseBody
	public List<VideoCommentBean> deleteComment(@RequestBody HashMap<String, String> map) {		
		Integer Id = Integer.parseInt(map.get("id"));
		videoCommentService.delete(Id);
		Integer VideoId = Integer.parseInt(map.get("videoId"));
		return videoCommentService.findByVideoId(VideoId);	
	}
	@PostMapping("/video/update")
	public String updateVideo(@ModelAttribute("video") AllVideoBean bean) {
		allVideoService.update(bean);
		return "redirect:/backend/video/"+bean.getVideoId();
	}
	@PostMapping("/video/delete")
	@ResponseBody
	public List<AllVideoBean> delete(@RequestBody HashMap<String, String> map) {
		Integer videoId = Integer.parseInt(map.get("videoId"));
		allVideoService.delete(videoId);
		return allVideoService.findAll();
	}
	
}
