package loop.forum.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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
	public String updateArticle(@PathVariable("articleid") int articleid, Model m) {
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
		m.addAttribute("totalPagesOfUser", page.getTotalPages());

		return page.getContent();
	}
		
	// 文章分頁生成
	@PostMapping("/type=reply/{pageNo}")
	@ResponseBody
	public List<Reply> processReplyForumByPage(@PathVariable("pageNo") int pageNo, Model m) {
		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
		Integer userId = bean.getUserId();
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);

		Page<Reply> page = null;
		page = rService.findPageByAuthorid(userId, pageable);
		
		int[] categoryList = new int[page.getContent().size()];
		int[] clickNumList = new int[page.getContent().size()];
		int[] replyNumList = new int[page.getContent().size()];
		String[] titleList = new String[page.getContent().size()];
		String[] replyNameList = new String[page.getContent().size()];
		String[] replyDateList = new String[page.getContent().size()];
		SimpleDateFormat DateFor = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		for (int i=0; i<page.getContent().size(); i++) {
			int articleid = page.getContent().get(i).getArticleid();
			Article article = aService.findById(articleid);
			categoryList[i] = article.getCategoryid();
			titleList[i] = article.getTitle();
			clickNumList[i] = article.getClickNum();
			replyNumList[i] = article.getReply().size();
			replyNameList[i] = article.getReply().get(replyNumList[i]-1).getUsers().getUserName();
			Date date = article.getReply().get(replyNumList[i]-1).getReplydate();
			String stringDate = DateFor.format(date);
			replyDateList[i] = stringDate;
		}	
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
	
	//	// 搜尋文章功能
//	@PostMapping("/search/{keyword}/{pageNo}")
//	@ResponseBody
//	public List<Article> searchArticleByPage(@PathVariable("keyword") String keyword,
//			@PathVariable("pageNo") int pageNo, Model m) {
//		int pageSize = 10;
//		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
//		Page<Article> page = null;
//
//		page = aService.findAllByKeyword(keyword, pageable);
//
//		m.addAttribute("totalPages", page.getTotalPages());
//		m.addAttribute("totalElements", page.getTotalElements());
//
//		return page.getContent();
//	}
}
