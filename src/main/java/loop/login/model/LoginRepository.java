package loop.login.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Modifying;
//import org.springframework.data.jpa.repository.Query;

import loop.user.model.UsersBean;

public interface LoginRepository extends JpaRepository<UsersBean, Integer> {
	/*比對資料庫*/
	public Optional<UsersBean> findByAccount(String account);
	
}
