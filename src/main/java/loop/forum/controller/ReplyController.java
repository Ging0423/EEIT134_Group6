package loop.forum.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import loop.forum.model.Reply;
import loop.forum.model.ReplyService;
import loop.user.model.UsersBean;
import loop.user.service.UsersService;

@Controller
@RequestMapping("/forum/reply")
@SessionAttributes({"totalPages", "totalElements", "isLogin"})
public class ReplyController {
	@Autowired
	private ReplyService rService;
	@Autowired
	private UsersService uService;
	
	//新增回應
	@PostMapping("/newReply")
	@ResponseBody
	public Reply postReply(@RequestBody Reply reply) {
		reply.setReplydate(new Date());
		reply.setLikeNum(0);
		rService.createNewReply(reply);
		return reply;
	}
	
//	@PostMapping("/deleteReply")
//	@ResponseBody
//	public void deleteReply(@RequestBody Reply reply) {
//		rService.deleteReply(reply);
//	}
	
	@PostMapping("/{articleid}/{pageNo}")
	@ResponseBody
	public List<Reply> processForumByPage(@PathVariable("articleid") int articleid, @PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Reply> page = null;
		
		page = rService.findAllByPage(articleid, pageable);
		
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		
		return page.getContent();
	}
}
