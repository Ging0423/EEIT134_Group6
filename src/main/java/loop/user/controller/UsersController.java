package loop.user.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import loop.user.model.UsersBean;
import loop.user.service.UsersService;

@Controller
public class UsersController {

	private UsersService usersService;
	
	@Autowired
	public UsersController(UsersService usersService) {
		super();
		this.usersService = usersService;
	}
	
	@GetMapping("/joinmember")
	public String joinMember(Model m) {
		UsersBean bean = new UsersBean();
		m.addAttribute("usersData", bean);
		return "joinmember";
	}
	@PostMapping("joinmember")
	public String joinMember(@ModelAttribute("usersBean") UsersBean bean) {
		String password = new BCryptPasswordEncoder().encode(bean.getUserPassword());
		bean.setUserPassword(password);
		bean.setUserIdentity("1");
		Date current = new Date();
		bean.setRegisterDate(current);
		usersService.save(bean);
		return "redirect:/login";
// 	}
// 		@GetMapping("/updatemember")
// 	public String updateMember(Model m) {
// 		UsersBean bean = new UsersBean();
// 		m.addAttribute("usersData", bean);
// //		bean.setUserPassword();		
// //		usersService.save(bean);
// 		return "updatemember";
// 	}

	// @GetMapping("/users/{id}")
	// public ResponseEntity<UsersBean> get(@PathVariable(required = false) Integer id) {
	// 	try {
	// 		UsersBean product = usersService.findUserById(id);
	// 		return new ResponseEntity<UsersBean>(product, HttpStatus.OK);
	// 	} catch (NoSuchElementException e) {
	// 		return new ResponseEntity<UsersBean>(HttpStatus.NOT_FOUND);
	// 	}
	// }
// 列出所有的資料，回傳值為list
	// @GetMapping("/users")
	// public List<UsersBean> fetchUserList() {
	// 	return usersService.listUserAll();
	// }
	// //新增資料，傳入資料庫
	// @PostMapping("/users")
	// public void add(@RequestBody UsersBean user) {
	// 	usersService.saveUser(user);
	// }
	// //根據id刪除資料
	// @DeleteMapping("/users/{id}")
	// public void delete(@PathVariable Integer id) {
	// 	usersService.deleteById(id);
	// }

	// @PutMapping("/users/{id}")
	// public ResponseEntity<?> update(@RequestBody UsersBean putuser, @PathVariable Integer id) {
	// 	try {
	// 		UsersBean userBean = usersService.findUserById(id);
	// 		userBean.setEmail(putuser.getEmail());
	// 		userBean.setUserPassword(putuser.getUserPassword());
	// 		userBean.setUserName(putuser.getUserName());
	// 		usersService.saveUser(userBean);
	// 		return new ResponseEntity<>(HttpStatus.OK);
	// 	} catch (NoSuchElementException e) {
	// 		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	// 	}
	// }
}
