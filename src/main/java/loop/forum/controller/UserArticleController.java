package loop.forum.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONObject;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import loop.forum.model.Article;
import loop.forum.model.ArticleService;
import loop.forum.model.Reply;
import loop.forum.model.ReplyService;
import loop.user.model.UsersBean;
import loop.user.service.UsersService;

@Controller
@RequestMapping("/forum/myforum")
@SessionAttributes(names = { "isLogin", "totalPagesOfUser", 
		"totalPagesOfReply", "categoryList", "titleList",
		"replyAmount", "clickNumList", "replyNumList", "replyNameList", 
		"replyDateList"})
public class UserArticleController {

	@Autowired
	private ArticleService aService;
	@Autowired
	private ReplyService rService;
	@Autowired
	private UsersService uService;

	// 進入我的文章主頁面
	@GetMapping("")
	public String mainForum(Model m) {
		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
		Integer userId = bean.getUserId();

		// 計算各類別的文章數量
		int[] articleAmount = { 0, 0, 0, 0, 0, 0, 0 };
		for (int i = 1; i <= 6; i++) {
			articleAmount[i] = (int) aService.countArticleAmountByCategoryidAndAuthorid(i, userId);
			articleAmount[0] += articleAmount[i];
		}
		m.addAttribute("articleAmountOfUser", articleAmount);

		return "/forum/myforum";
	}

	// 進入我的回覆主頁面
	@GetMapping("/reply")
	public String replyForum(Model m) {
		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
		Integer userId = bean.getUserId();
		List<Reply> reply = rService.findAllByAuthorid(userId);
		List<Article> article = new ArrayList<Article>();
		for (int i=0; i<reply.size(); i++) {
			article.add(aService.findById(reply.get(i).getArticleid()));
		}
		
		// 計算各類別的文章數量
		int[] replyAmount = { 0, 0, 0, 0, 0, 0, 0 };
		replyAmount[0] = article.size();
		for (int i = 0; i < article.size(); i++) {
			int categoryid = article.get(i).getCategoryid();
			replyAmount[categoryid]++;
		}
		m.addAttribute("articleAmountOfUser", replyAmount);

		return "/forum/myforum_reply";
	}
	
	// 進入修改文章頁面
	@GetMapping("/update/{articleid}")
	public String updateArticlePage(@PathVariable("articleid") int articleid, Model m) {
		Article article = aService.findById(articleid);
		m.addAttribute("article", article);

		return "/forum/updateArticle";
	}

	// 文章分頁生成
	@PostMapping("/type=article/{categoryid}/{pageNo}")
	@ResponseBody
	public List<Article> processForumByPage(@PathVariable("categoryid") int categoryid, @PathVariable("pageNo") int pageNo, Model m) {
		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
		Integer userId = bean.getUserId();
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Article> page = null;
		if (categoryid == 0) {
			page = aService.findAllByPageUsingAuthorid(userId, pageable);
		} else {
			page = aService.findAllByPage(userId, categoryid, pageable);
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
		
		m.addAttribute("titleList", titleList);
		m.addAttribute("categoryList", categoryList);
		m.addAttribute("clickNumList", clickNumList);
		m.addAttribute("replyNumList", replyNumList);
		m.addAttribute("replyNameList", replyNameList);
		m.addAttribute("replyDateList", replyDateList);
		m.addAttribute("totalPagesOfReply", page.getTotalPages());
		m.addAttribute("replyAmount", page.getContent().size());
		return page.getContent();
	}

	// 刪除文章
	@PostMapping("/delete/{articleid}")
	@ResponseBody
	public void deleteArticle(@PathVariable("articleid") int articleid) {
		Article article = aService.findById(articleid);
		aService.deleteArticle(article);

		List<Reply> reply = rService.findByArticleid(articleid);
		rService.deleteReply(reply);
	}

	// 優改文章
	@PostMapping("/updateArticleSuccess")
	@ResponseBody
	public void updateArticle(@RequestBody Map<String, String> map, Model m) {
		int articleid = Integer.parseInt(map.get("articleid"));
		Article article = aService.findById(articleid);
		article.setCategoryid(Integer.parseInt(map.get("categoryid")));
		article.setTitle(map.get("title"));
		article.setContent(map.get("content"));
		article = aService.updateArticle(article);
	}
}
