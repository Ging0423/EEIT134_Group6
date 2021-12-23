package loop.forum.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public interface ArticleRepository extends JpaRepository<Article, Integer>{

	List<Article> findByCategoryid(int categoryid);
    List<Article> findByAuthorid(int authorid);
    
	Page<Article> findByCategoryid(int categoryid, Pageable pageable);
	Page<Article> findByAuthorid(int authorid, Pageable pageable);
	Page<Article> findByTitleLike(String keyword, Pageable pageable);
	Page<Article> findByCategoryidAndAuthorid(int authorid, int categoryid, Pageable pageable);
    
	long countByCategoryid(int categoryid);
	long countByCategoryidAndAuthorid(int categoryid, int authorid);
	
//	@Query("select count reply from Reply r left join r. tt")
//	long countReplyByArticleid(int articleid);

	long countByTitleLike(String keyword);
	long countByTitleLikeAndCategoryid(String keyword, int categoryid);
	long countByPostdateGreaterThan(Date today);
	long countByPostdateBetween(Date today, Date tomorrow);
	@Query(value = "SELECT top 1 authorid\r\n"
			+ "FROM ( SELECT authorid, COUNT(*) mycount \r\n"
			+ "FROM article \r\n"
			+ "GROUP BY authorid\r\n"
			+ ") as temp \r\n"
			+ "ORDER BY temp.mycount DESC", nativeQuery=true)
	int countMaxAuthor();

}

