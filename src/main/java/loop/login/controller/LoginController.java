package loop.login.controller;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import loop.user.model.UsersBean;
import loop.user.service.UsersService;

public class LoginController {
	@Autowired
	UsersService usersService;

	// 列出所有的資料，回傳值為list
	@GetMapping("/login")
	public List<UsersBean> fetchUserList() {
		return usersService.listUserAll();
	}
	//新增資料，傳入資料庫
	@PostMapping("/users")
	public void add(@RequestBody UsersBean user) {
		usersService.saveUser(user);
	}
	//根據id刪除資料
	@DeleteMapping("/users/{id}")
	public void delete(@PathVariable Integer id) {
		usersService.deleteById(id);
	}

	@PutMapping("/users/{id}")
	public ResponseEntity<?> update(@RequestBody UsersBean putuser, @PathVariable Integer id) {
		try {
			UsersBean userBean = usersService.findUserById(id);
			userBean.setEmail(putuser.getEmail());
			userBean.setUserPassword(putuser.getUserPassword());
			userBean.setUserName(putuser.getUserName());
			usersService.saveUser(userBean);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (NoSuchElementException e) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@GetMapping("/users/{id}")
	public ResponseEntity<UsersBean> get(@PathVariable(required = false) Integer id) {
		try {
			UsersBean product = usersService.findUserById(id);
			return new ResponseEntity<UsersBean>(product, HttpStatus.OK);
		} catch (NoSuchElementException e) {
			return new ResponseEntity<UsersBean>(HttpStatus.NOT_FOUND);
		}
	}

}

