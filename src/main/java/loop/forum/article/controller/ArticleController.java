package loop.forum.article.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ArticleController {
	
	@GetMapping("/forum")
	public String forumMain() {
		return "/forum/forum";
	}
	
	@GetMapping("/newArticle")
	public String newPost() {
		return "/forum/newArticle";
	}
}
