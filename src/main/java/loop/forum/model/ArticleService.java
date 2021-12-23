package loop.forum.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ArticleService {

	@Autowired
	private ArticleRepository aReps;
	
	//新增文章
	public Article createNewArticle(Article article) {
		return aReps.save(article);
	}
	
	//取得所有文章
	public List<Article> findAll() {
		return aReps.findAll();
	}
	
	public Page<Article> findAllByPage(Pageable pageable){
		return aReps.findAll(pageable);
	}
	
	public Page<Article> findAllByPage(int categoryid, Pageable pageable) {
		return aReps.findByCategoryid(categoryid, pageable);
	}
	
	public Page<Article> findAllByPageUsingAuthorid(int authorid, Pageable pageable) {
		return aReps.findByAuthorid(authorid, pageable);
	}
	
	public Page<Article> findAllByPage(int authorid, int categoryid, Pageable pageable){
		return aReps.findByCategoryidAndAuthorid(authorid, categoryid, pageable);
	}
	
	//修改文章
	public Article updateArticle(Article article){
		return aReps.save(article);
	}
	
	//刪除文章
	public void deleteArticle(Article article) {
		aReps.delete(article);
	}
	
	//取得特定id的文章
	public Article findById(int articleid) {
		Optional<Article> op1 = aReps.findById(articleid);
		
		if(op1.isPresent()) {
			return op1.get();
		}
		
		return null;
	}
	
//	public Optional<Article> findByAuthorid(int authorid){
//		return aReps.findbyA
//	}
	
	public List<Article> findByCategoryid(int categoryid){
		return aReps.findByCategoryid(categoryid);
	}
	
	public long countArticleAmountByCategoryid(int categoryid) {
		if(categoryid != 0) {
			return aReps.countByCategoryid(categoryid);
		} else {
			return aReps.count();
		}
	}
	
	public long countArticleAmountByCategoryidAndAuthorid(int categoryid, int authorid) {
		if(categoryid != 0) {
			return aReps.countByCategoryidAndAuthorid(categoryid, authorid);
		} else {
			return aReps.count();
		}
	}

	public Page<Article> findAllByKeyword(String keyword, Pageable pageable) {
		String keyword_search = "%" + keyword + "%";
		return aReps.findByTitleLike(keyword_search, pageable);
	}	
	public Long countArticleAmountByKeywordAndCategoryid(String keyword, int categoryid) {
		String keyword_search = "%" + keyword + "%";
		if(categoryid != 0) {
			return aReps.countByTitleLikeAndCategoryid(keyword_search, categoryid);
		} else {
			return aReps.countByTitleLike(keyword_search);
		}
	}

	public long countArticleAmountOfToday(Date today) {
		return aReps.countByPostdateGreaterThan(today);
	}
	
	public long countArticleAmountBetweenDate(Date today, Date tomorrow) {
		return aReps.countByPostdateBetween(today, tomorrow);
	}
	
	public int findMostPostAuthor() {
		return aReps.countMaxAuthor();
	}
}
