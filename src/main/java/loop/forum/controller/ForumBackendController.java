package loop.forum.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.print.attribute.standard.DateTimeAtCompleted;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
@RequestMapping("/backend/forum")
@SessionAttributes(names = {"totalPages"})
public class ForumBackendController {

	@Autowired
	private ArticleService aService;
	@Autowired
	private ReplyService rService;

	// 進入後台討論區主頁面
	@GetMapping("")
	public String mainForum(Model m) {
		Calendar todayCalendar = Calendar.getInstance();
		todayCalendar.setTime(new Date());
		todayCalendar.set(Calendar.HOUR_OF_DAY, 0);
		todayCalendar.set(Calendar.MINUTE, 0);
		todayCalendar.set(Calendar.SECOND, 0);
		Date today = todayCalendar.getTime();
		
		m.addAttribute("totalArticle", aService.countArticleAmountByCategoryid(0));
		m.addAttribute("todayArticle", aService.countArticleAmountOfToday(today));
		m.addAttribute("todayReply", rService.countReplyAmountOfToday(today));
		
		return "/backend/forum";
	}

	// 文章分頁生成
	@PostMapping("/{pageNo}")
	@ResponseBody
	public List<Article> processForumByPage(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize, Sort.by("articleid").descending());
		Page<Article> page = null;

		page = aService.findAllByPage(pageable);
		m.addAttribute("totalPages", page.getTotalPages());
			
		return page.getContent();
	}
}
