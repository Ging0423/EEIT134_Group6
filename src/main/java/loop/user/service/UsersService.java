package loop.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.user.model.UsersBean;
import loop.user.model.UsersRepository;

@Service
@Transactional
public class UsersService {
    @Autowired
    private UsersRepository userRepository;

    public List<UsersBean> listUserAll(){
        return userRepository.findAll();
    }

    public  void saveUser(UsersBean userModel){
        userRepository.save(userModel);
    }

    public UsersBean findUserById(Integer id){
        return userRepository.findById(id).get();
    }

    public UsersBean findByUsername(String usrName){
        return userRepository.findByUserName(usrName);
    }

    public void deleteById(Integer id){
        userRepository.deleteById(id);
    }
}
