package tw.JoyHsieh.forum.model;

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
	
	public Article createNewArticle(Article article) {
		return aReps.save(article);
	}
	
	public List<Article> findAll() {
		return aReps.findAll();
	}
	
	public Page<Article> findAllByPage(Pageable pageable, int categoryid){
		return aReps.findAll(pageable);
	}

	public Article updateArticle(Article article){
		return aReps.save(article);
	}
	
	public void deleteArticle(Article article) {
		aReps.delete(article);
	}

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
}
