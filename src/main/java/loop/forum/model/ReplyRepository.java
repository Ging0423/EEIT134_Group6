package loop.forum.model;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReplyRepository extends JpaRepository<Reply, Integer> {

	long countByArticleid(int articleid);
	Page<Reply> findByArticleid(int articleid, Pageable pageable);
	List<Reply> findByArticleid(int articleid); 
	long countByAuthorid(int authorid);
	long countByReplydateGreaterThan(Date today);
	long countByReplydateBetween(Date today, Date tomorrow);
}
