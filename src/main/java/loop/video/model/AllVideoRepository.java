package loop.video.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AllVideoRepository extends JpaRepository<AllVideoBean, Integer> {

	@Query(value="from AllVideoBean where videoId = ?1")
	void deleteByVideoId(Integer videoId);

}
