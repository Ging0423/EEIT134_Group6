package loop.user.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import loop.order.model.OrderDataBean;
import loop.user.model.UsersBean;
import loop.user.model.UsersRepository;

@Service
public class UsersService {

	@Autowired
	private UsersRepository usersRepo;
	
	public long count() {
		return usersRepo.count();
	}
	
	public List<UsersBean> findAll() {
		return usersRepo.findAll();
	}
	
	public UsersBean findById(Integer userId) {
		Optional<UsersBean> op = usersRepo.findById(userId);
		return op.get();
	}
	
	public Optional<UsersBean> findByAccount(String account) {
		Optional<UsersBean> op = usersRepo.findByAccount(account);		
		return op;
	}
	//若帳號不是空的 回傳true(即帳號已存在, 重複
	public boolean isDuplicateAccount(String account) {
		if(!(usersRepo.findByAccount(account).isEmpty()))
			return true;
		else
			return false;
	}
	
	public Optional<UsersBean> findbyemail(String email) {
		Optional<UsersBean> op = usersRepo.findByemail(email);		
		return op;
	}
	
	public boolean isDuplicateEmail(String email) {
		if(!(usersRepo.findByemail(email).isEmpty()))
			return true;
		else
			return false;
	}
	
	public void save(UsersBean bean) {
		usersRepo.save(bean);
	}

	public void deleteById(Integer id) {
		usersRepo.deleteById(id);
	}
	
	public void delete(String[] array) {
		for(String i:array) {
			usersRepo.deleteById(Integer.parseInt(i));
		}	
	}
			

	public boolean isExistEmail(String mail) {
		Optional<UsersBean> opt = usersRepo.findByEmail(mail);
		if (opt.isEmpty()) {
			return false;
		} else
			return true;
	}

	public UsersBean findByEmail(String mail) {
		Optional<UsersBean> opt = usersRepo.findByEmail(mail);
		if (opt.isEmpty()) {
			return null;
		} else {
			return opt.get();
		}
	}

	public boolean isExistAccount(String account) {
		Optional<UsersBean> opt = usersRepo.findByAccount(account);
		if (opt.isEmpty()) {
			return false;
		} else
			return true;
	}

	public Optional<UsersBean> findByAccount(String account) {
		Optional<UsersBean> opt = usersRepo.findByAccount(account);
		return opt;
	}
}
