package loop.user.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.lang.String;
//import loop.user.model.UsersBean;
//import java.util.List;
@Repository
public interface UsersRepository extends JpaRepository<UsersBean, Integer> {
	UsersBean findByUserName(String username);
}
