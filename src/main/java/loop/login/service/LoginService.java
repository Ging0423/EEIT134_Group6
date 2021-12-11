package loop.login.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.login.model.LoginRepository;
import loop.user.model.UsersBean;

@Service
@Transactional
public class LoginService {

	@Autowired
	private LoginRepository repo;
	
	
	public Optional<UsersBean> findByAccount(String account) {
		Optional<UsersBean> op = repo.findByAccount(account);		
		return op;
	}
	/*比對資料庫*/
	public boolean isDuplicate(String account) {
		if(!(repo.findByAccount(account).isEmpty()))
			return true;
		else
			return false;
	}
	
}
