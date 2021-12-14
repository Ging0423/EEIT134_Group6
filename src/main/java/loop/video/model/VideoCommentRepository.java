package loop.video.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface VideoCommentRepository extends JpaRepository<VideoCommentBean, Integer> {

	@Query(value="from VideoCommentBean where videoId = ?1")
	List<VideoCommentBean> findByVideoId(Integer videoId);

	List<VideoCommentBean> findByUserId(Integer userId);

}
