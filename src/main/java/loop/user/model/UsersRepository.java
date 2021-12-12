package loop.user.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

//import java.lang.String;
//import loop.user.model.UsersBean;
//import java.util.List;
//撈取UsersBean, 即JavaBean<->DAO
public interface UsersRepository extends JpaRepository<UsersBean, Integer> {
	
	@Query(value="from UsersBean where userId = ?1")
	public Optional<UsersBean> findById(Integer userId);

	@Query(value="from UsersBean where email = ?1")
	public Optional<UsersBean> findByEmail(String mail);
	
	@Query(value="from UsersBean where account = ?1")
	public Optional<UsersBean> findByAccount(String account);
}
