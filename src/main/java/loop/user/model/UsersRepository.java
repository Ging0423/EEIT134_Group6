package loop.user.model;

import org.springframework.data.jpa.repository.JpaRepository;

//import java.lang.String;
//import loop.user.model.UsersBean;
//import java.util.List;
//撈取UsersBean, 即JavaBean<->DAO
public interface UsersRepository extends JpaRepository<UsersBean, Integer> {
	//UsersBean findByUserName(String username);
}
