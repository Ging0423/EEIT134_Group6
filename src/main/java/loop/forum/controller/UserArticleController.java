package loop.forum.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import loop.forum.model.Article;
import loop.forum.model.ArticleService;
import loop.forum.model.Reply;
import loop.forum.model.ReplyService;

@Controller
@RequestMapping("/forum/myforum")
public class UserArticleController {
	
	@Autowired
	private ArticleService aService;
	@Autowired
	private ReplyService rService;
	
	//進入我的文章主頁面
	@GetMapping("")
	public String mainForum(Model m) {
		
		//計算各類別的文章數量
		ArrayList<Long> articleAmount = new ArrayList<Long>();
		for (int i=0; i<=6; i++) {
			articleAmount.add(aService.countArticleAmountByCategoryidAndAuthorid(i, 1));
		}
		m.addAttribute("articleAmount", articleAmount);
		
		return "/forum/myforum";
	}
	
	//進入修改文章頁面
	@GetMapping("/update/{articleid}")
	public String updateArticlePage(@PathVariable("articleid") int articleid, Model m) {
		Article article = aService.findById(articleid);
		m.addAttribute("article", article);
		
		return "/forum/updateArticle";
	}
	
	// 文章分頁生成
	@PostMapping("/{authorid}/{categoryid}/{pageNo}")
	@ResponseBody
	public List<Article> processForumByPage(@PathVariable("authorid") int authorid, @PathVariable("categoryid") int categoryid,
			@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Article> page = null;

		if (categoryid == 0) {
			page = aService.findAllByPageUsingAuthorid(authorid, pageable);
		} else {
			System.out.println(authorid + "," + categoryid);
			page = aService.findAllByPage(authorid, categoryid, pageable);
		}
		
		System.out.println(page.getContent());
		
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		
		return page.getContent();
	}

	//刪除文章
	@PostMapping("/delete/{articleid}")
	@ResponseBody
	public void deleteArticle(@PathVariable("articleid") int articleid) {
		Article article = aService.findById(articleid);
		aService.deleteArticle(article);
		
		List<Reply> reply = rService.findByArticleid(articleid);
		rService.deleteReply(reply);
	}
	
	//優改文章
	@PostMapping("/updateArticleSuccess")
	@ResponseBody
	public void updateArticle(@RequestBody Article article) {
		System.out.println(article.getArticleid());
	}
}
