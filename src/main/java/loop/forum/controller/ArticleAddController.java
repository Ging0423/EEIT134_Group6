package loop.forum.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import loop.forum.model.Article;
import loop.forum.model.ArticleService;
import loop.user.model.UsersBean;
import loop.user.service.UsersService;

@Controller
@RequestMapping("/forum/newPost")
@SessionAttributes(names = {"isLogin"})
public class ArticleAddController {
	@Autowired
	private ArticleService aService;
	@Autowired
	private UsersService userService;

	// 進入新增文章的頁面
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String newPost() {
		return "/forum/newPost";
	}

	@RequestMapping(value = "/newArticleSuccess", method = RequestMethod.POST)
	@ResponseBody
	public void postSuccess(@RequestBody Map<String, String> map, Model m) {
		Article article = new Article();
		article.setTitle(map.get("title"));
		article.setCategoryid(Integer.parseInt(map.get("categoryid")));
		article.setContent(map.get("content"));
		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
		Integer userId = bean.getUserId();
		article.setAuthorid(userId);
		article.setPostdate(new Date());
		article.setClickNum(0);
		article.setLikeNum(0);
		article.setShareNum(0);
		aService.createNewArticle(article);
	}

//	@PostMapping("/uploadimg")
//	@ResponseBody
//	public void uploadImg(@RequestParam("upload") MultipartFile image, HttpServletRequest request)
//			throws IllegalStateException, IOException {
//		String fileName = image.getOriginalFilename();
//
//		String saveDirPath = request.getSession().getServletContext().getRealPath("/");
//		String savePath = saveDirPath + fileName;
//		File savePathFile = new File(savePath);
//		image.transferTo(savePathFile);
//		
//		String json = "{\"url\": \"" + savePath + "\"}";
//		request.setAttribute("url", json);
//	}
}
