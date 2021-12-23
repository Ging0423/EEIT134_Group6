package loop.forum.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import loop.forum.model.Article;
import loop.forum.model.ArticleService;
import loop.forum.model.ReplyService;

@Controller
@RequestMapping("/forum/article")
@SessionAttributes(names = {"isLogin", "likeNum"})
public class ArticleContentController {
	@Autowired
	private ArticleService aService;
	@Autowired
	private ReplyService rService;
	
	//進入文章內容的頁面
	@GetMapping("/{articleid}")
	public String articleContent(@PathVariable("articleid") int articleid, Model m) {
		Article article = aService.findById(articleid);
		article.setClickNum(article.getClickNum()+1);
		aService.updateArticle(article);
		
		boolean checkLogin = false;
		
		if(m.getAttribute("isLogin") != null) {
			checkLogin = true;
		}
		
		SimpleDateFormat DateFor = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String article_date = DateFor.format(article.getPostdate());
		
		m.addAttribute("checkLogin", checkLogin);
		m.addAttribute("article", article);
		m.addAttribute("article_date", article_date);
		m.addAttribute("likeNum", article.getLikeNum());
		
		return "/forum/articleContent";
	}
	
//	@PostMapping("/{articleid}")
//	@ResponseBody
//	public void processArticleContent(@PathVariable("articleid") int articleid, Model m) {
//		Article article = aService.findById(articleid);
//		Article article_update = addClickNum(article);
//		m.addAttribute("title", article_update.getTitle());
//	}
	
	@GetMapping("/{articleid}/addLikeNum")
	public Article addLikeNum(@PathVariable("articleid") int articleid, Model m) {
		Article article = aService.findById(articleid);
		int likeNum = article.getLikeNum();
		article.setLikeNum(likeNum+1);
		Article article_update = aService.updateArticle(article);
		
		m.addAttribute("likeNum", article_update.getLikeNum());
		return article_update;
	}
	
	public Article addShareNum(Article article) {
		int shareNum = article.getShareNum();
		article.setShareNum(shareNum+1);
		Article article_update = aService.updateArticle(article);
		return article_update;
	}
	
	
	public Article addClickNum(Article article) {
		int clickNum = article.getClickNum();
		article.setClickNum(clickNum+1);
		Article article_update = aService.updateArticle(article);
		return article_update;
	}
}
