package loop.user.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UsersRepository extends JpaRepository<UsersBean, Integer> {

	@Query(value="from UsersBean where userId = ?1")
	public Optional<UsersBean> findById(Integer userId);
}
