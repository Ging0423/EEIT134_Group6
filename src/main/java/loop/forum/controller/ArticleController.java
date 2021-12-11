package loop.forum.controller;

import java.util.ArrayList;
import java.util.List;

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
import loop.forum.model.Reply;
import loop.user.model.UsersBean;
import loop.user.service.UsersService;

@Controller
@RequestMapping("/forum")
@SessionAttributes({"totalPages", "totalElements", "replyName", "isLogin"})
public class ArticleController {
	
	@Autowired
	private ArticleService aService;
	@Autowired
	private UsersService uService;
	
	//進入討論區主頁面
	@GetMapping("")
	public String mainForum(Model m) {
		
		//計算各類別的文章數量
		ArrayList<Long> articleAmount = new ArrayList<Long>();
		for (int i=0; i<=6; i++) {
			articleAmount.add(aService.countArticleAmountByCategoryid(i));
		}
		m.addAttribute("articleAmount", articleAmount);
		
		System.out.println(m);
		
		return "/forum/forum";
	}
	
	// 文章分頁生成
		@PostMapping("/sortType={sortType}/{categoryid}/{pageNo}")
		@ResponseBody
		public List<Article> processForumByPage(@PathVariable("sortType") String sortType, @PathVariable("categoryid") int categoryid, @PathVariable("pageNo") int pageNo, Model m){
			int pageSize = 10;
			Pageable pageable = null;
			Page<Article> page = null;
			if(sortType.equals("replyid")) {
				pageable = PageRequest.of(pageNo-1, pageSize, Sort.Direction.DESC, "reply");
			}else {
				pageable = PageRequest.of(pageNo-1, pageSize, Sort.by(sortType).descending());
			}
			
			if(categoryid == 0) {
				page = aService.findAllByPage(pageable);
			} else {
				page = aService.findAllByPage(categoryid, pageable);
			}
			
			List<String> replyName = new ArrayList<String>();
			UsersBean users = null;
			for (int i=0; i<pageSize; i++) {
				if(page.getContent().get(i).getReply().isEmpty()) {
					users = uService.findById(page.getContent().get(i).getAuthorid());
					replyName.add(users.getUserName());
				}else {
					users = uService.findById(page.getContent().get(i).getReply().get(0).getAuthorid());
					replyName.add(users.getUserName());
				}
			}
			
			m.addAttribute("replyName", replyName);
			m.addAttribute("totalPages", page.getTotalPages());
			m.addAttribute("totalElements", page.getTotalElements());
			
			return page.getContent();
		}

		// 搜尋文章功能
		@PostMapping("/search/{categoryid}/{keyword}/{pageNo}")
		@ResponseBody
		public List<Article> searchArticleByPage(@PathVariable("keyword") String keyword,
				@PathVariable("categoryid") int categoryid, @PathVariable("pageNo") int pageNo, Model m) {
			int pageSize = 10;
			Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
			Page<Article> page = null;

			page = aService.findAllByKeyword(keyword, pageable);

			m.addAttribute("totalPages", page.getTotalPages());
			m.addAttribute("totalElements", page.getTotalElements());

			// 計算各類別的文章數量
			ArrayList<Long> articleAmount = new ArrayList<Long>();
			for (int i = 0; i <= 6; i++) {
				articleAmount.add(aService.countArticleAmountByKeywordAndCategoryid(keyword, i));
			}
			m.addAttribute("articleAmount", articleAmount);

			return page.getContent();
		}

	}
