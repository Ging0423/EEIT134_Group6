package tw.JoyHsieh.forum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.JoyHsieh.forum.model.Article;
import tw.JoyHsieh.forum.model.ArticleService;
import tw.JoyHsieh.forum.model.ReplyService;

@Controller
@RequestMapping("/forum")
public class ArticleContentController {
	@Autowired
	private ArticleService aService;
	@Autowired
	private ReplyService rService;
	
	//進入文章內容的頁面
	@GetMapping("/article/{articleid}")
	public String articleContent(@PathVariable("articleid") int articleid, Model m) {
		Article article = aService.findById(articleid);
		article.setClickNum(article.getClickNum()+1);
		aService.updateArticle(article);
		
		m.addAttribute("article", article);
		
		return "/forum/articleContent";
	}
	
	public Article addLikeNum(Article article) {
		int likeNum = article.getLikeNum();
		article.setLikeNum(likeNum+1);
		Article article_update = aService.updateArticle(article);
		System.out.println("addLikeNum Success");
		return article_update;
	}
	
	public Article addShareNum(Article article) {
		int shareNum = article.getShareNum();
		article.setShareNum(shareNum+1);
		Article article_update = aService.updateArticle(article);
		System.out.println("addShareNum Success");
		return article_update;
	}
	
	@PostMapping("/article/{articleid}")
	@ResponseBody
	public void processArticleContent(@PathVariable("articleid") int articleid, Model m) {
		Article article = aService.findById(articleid);
		Article article_update = addClickNum(article);
		m.addAttribute("title", article_update.getTitle());
	}
	
	public Article addClickNum(Article article) {
		int clickNum = article.getClickNum();
		article.setClickNum(clickNum+1);
		Article article_update = aService.updateArticle(article);
		System.out.println("addClickNum Success");
		return article_update;
	}
}
