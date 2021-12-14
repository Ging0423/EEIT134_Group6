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

import loop.forum.model.Article;
import loop.forum.model.ArticleService;

@Controller
@RequestMapping("/forum")
public class ArticleController {
	
	@Autowired
	private ArticleService aService;
	
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
			
			m.addAttribute("totalPages", page.getTotalPages());
			m.addAttribute("totalElements", page.getTotalElements());
			return page.getContent();
		}
		
	private void setPages(Model m, int totalPages) {
		m.addAttribute("totalPages", totalPages);
		System.out.println(m);
	}

	//搜尋文章功能
	@PostMapping("/search/{keyword}/{pageNo}")
	@ResponseBody
	public List<Article> searchArticleByPage(@PathVariable("keyword") String keyword, @PathVariable("pageNo") int pageNo, Model model){
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Article> page = null;
		
		page = aService.findAllByKeyword(keyword, pageable);
		
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("totalElements", page.getTotalElements());

		return page.getContent();
	}

}
