package loop.forum.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import loop.forum.model.Article;
import loop.forum.model.ArticleService;

@Controller
@RequestMapping("/forum/newPost")
public class ArticleAddController {
	@Autowired
	private ArticleService aService;

	// 進入新增文章的頁面
	@GetMapping("")
	public String newPost() {
		return "/forum/newPost";
	}

	@PostMapping("/newArticleSuccess")
	@ResponseBody
	public String postSuccess(@RequestBody Article article) {
		article.setPostdate(new Date());
		article.setClickNum(0);
		article.setLikeNum(0);
		article.setShareNum(0);
		aService.createNewArticle(article);
		return "/forum/newArticleSuccess";
	}

	@PostMapping("/uploadimg")
	@ResponseBody
	public void uploadImg(@RequestParam("upload") MultipartFile image, HttpServletRequest request, HttpServletResponse response)
			throws IllegalStateException, IOException {
		String fileName = image.getOriginalFilename();

		String saveDirPath = request.getSession().getServletContext().getRealPath("/");
		String savePath = saveDirPath + fileName;
		File savePathFile = new File(savePath);
		image.transferTo(savePathFile);
		
		String json = "{\"url\": \"" + savePath + "\"}";
		
	}

}
