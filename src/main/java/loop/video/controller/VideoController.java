package loop.video.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import loop.user.model.UsersBean;
import loop.user.service.UsersService;
import loop.video.model.AllVideoBean;
import loop.video.model.VideoCommentBean;
import loop.video.service.AllVideoService;
import loop.video.service.VideoCommentService;

@Controller
@RequestMapping("/video")
@SessionAttributes({ "isLogin" })
public class VideoController {
	
	@Autowired
	private AllVideoService allVideoService;
	
	@Autowired
	private VideoCommentService videoCommentService;
	
	@Autowired
	private UsersService usersService;
	
	@GetMapping("")
	public String videoList(Model m) {
		List<AllVideoBean> list = allVideoService.findAll();
		m.addAttribute("allVideo", list);
		return "video";
	}
	@GetMapping("/{id}")
	public String video(@PathVariable("id")Integer videoId, Model m) {
		AllVideoBean bean = allVideoService.findById(videoId);
		m.addAttribute("video", bean);
		List<VideoCommentBean> comment = videoCommentService.findByVideoId(videoId);
		m.addAttribute("comments", comment);
		return "videodetail";
	}
	@PostMapping("/comment")
	@ResponseBody
	public List<VideoCommentBean> comment(@RequestBody HashMap<String, String> map, Model m) {
		VideoCommentBean bean = new VideoCommentBean();
		UsersBean user = (UsersBean)m.getAttribute("isLogin");
		Integer userId = user.getUserId();
		Integer videoId = Integer.parseInt(map.get("videoId"));
		String comment = map.get("comment");
		bean.setAllVideo(allVideoService.findById(videoId));
		bean.setVideoId(videoId);
		bean.setComment(comment);
		bean.setUserId(userId);
		bean.setUsers(usersService.findById(userId));
		videoCommentService.save(bean);
		return videoCommentService.findByVideoId(videoId);
	}

}
