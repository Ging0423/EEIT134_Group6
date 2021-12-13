package loop.user.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.user.model.UsersBean;
import loop.user.model.UsersRepository;

@Service
public class UsersService {

	@Autowired
	private UsersRepository usersRepo;

	public UsersBean findById(Integer userId) {
		Optional<UsersBean> op = usersRepo.findById(userId);
		return op.get();
	}

	public void save(UsersBean bean) {
		usersRepo.save(bean);
	}

	public void deleteById(Integer id) {
		usersRepo.deleteById(id);
	}

	public boolean isExistEmail(String mail) {
		Optional<UsersBean> opt = usersRepo.findByEmail(mail);
		if (opt.isEmpty()) {
			return false;
		} else
			return true;
	}

	public Optional<UsersBean> findByEmail(String mail) {
		Optional<UsersBean> opt = usersRepo.findByEmail(mail);
		if (opt.isEmpty()) {
			return null;
		} else {
			return opt;
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
