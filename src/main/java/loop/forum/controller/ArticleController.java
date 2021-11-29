package tw.JoyHsieh.forum.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.JoyHsieh.forum.model.Article;
import tw.JoyHsieh.forum.model.ArticleService;
import tw.JoyHsieh.forum.model.ReplyService;

@Controller
public class ArticleController {
	
	@Autowired
	private ArticleService aService;
	private ReplyService rService;
	
	//進入討論區主頁面
	@GetMapping("/forum")
	public String mainForum() {
		return "/forum/forummain";
	}
	
	//進入新增文章的頁面
	@GetMapping("/forum/newArticle")
	public String newPost() {
		return "/forum/newArticle";
	}
	
	@PostMapping("/forum/newArticleSuccess")
	@ResponseBody
	public String postSuccess(@RequestBody Article article) {
		article.setPostDate(new Date());
		article.setClickNum(0);
		article.setLikeNum(0);
		article.setShareNum(0);
		aService.createNewArticle(article);
		return "/forum/newArticleSuccess";
	}
	
	@PostMapping("/forum/uploadimg")
	public String processImage() {
		return "";
	}
	
	@PostMapping("/forum/{categoryid}/{pageNo}")
	@ResponseBody
	public List<Article> processForumByPage(@PathVariable("pageNo") int pageNo,@PathVariable ("categoryid") int categoryid, Model m){
		int pageSize = 30;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		
		Page<Article> page = aService.findAllByPage(pageable, categoryid);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		
		return page.getContent();
	}
	
	@PostMapping("/forum/article/{pid}")
	@ResponseBody
	public Article processArticleContent(@PathVariable("articleid") int articleid) {
		return aService.findById(articleid);
	}
	
    @GetMapping(value = "/forum/myArticle")
    public String getUsername() {
        Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println(user); // user
        return user;
    }
}
