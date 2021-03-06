//package loop.user.controller;
//
////import java.text.SimpleDateFormat;
////import org.springframework.util.SystemPropertyUtils;
//import java.util.Date;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//import loop.user.model.UsersBean;
//import loop.user.service.UsersService;
//
//@Controller
//@SessionAttributes({ "isLogin" })
//public class UsersController {
//
//	private UsersService usersService;
//
//	@Autowired
//	public UsersController(UsersService usersService) {
//		super();
//		this.usersService = usersService;
//	}
//
//	@GetMapping("/joinmember")
//	public String joinMember(Model m) {
//		UsersBean bean = new UsersBean();
//		m.addAttribute("usersData", bean);
//		return "joinmember";
//	}
//
//	@PostMapping("joinmember")
//	public String joinMember(@ModelAttribute("usersBean") UsersBean bean) {
//		String password = new BCryptPasswordEncoder().encode(bean.getUserPassword());
//		bean.setUserPassword(password);
//		bean.setUserIdentity("1");
//		Date current = new Date();
//		bean.setRegisterDate(current);
//		usersService.save(bean);
//		return "redirect:/login";
//	}
//
//	@GetMapping("/updatemember")
//	public String updateMember(Model m) {
//		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
//		m.addAttribute("usersData", bean);
//		return "updatemember";
//	}
//	//更新會員資料
//	@PostMapping("updatemember") 
//	public String update(@ModelAttribute("isLogin") UsersBean userBean, Model m, HttpServletRequest request,
//			HttpServletResponse response) {
//		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
//		String password = new BCryptPasswordEncoder().encode(bean.getUserPassword());
//		System.out.println(password);
//		bean.setUserIdentity("1");
//		Date current = new Date();
//		bean.setRegisterDate(current);
//		usersService.save(bean);
//		return "redirect:/login";
//	}
//
//	@DeleteMapping("/users/{id}")
//	public void delete(@PathVariable Integer id) {
//		usersService.deleteById(id);
//	}
//
//}

package loop.user.controller;

//import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import loop.user.model.UsersBean;
import loop.user.service.UsersService;

@Controller
@SessionAttributes({ "isLogin" })
public class UsersController {

	private UsersService usersService;

	@Autowired
	public UsersController(UsersService usersService) {
		super();
		this.usersService = usersService;
	}

	// 連結"關於"頁面
	@GetMapping("/about")
	public String about(Model m) {
		return "about";
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
	}

	// 新增會員資料的帳號比對
	@PostMapping("/joinmember/acisduplicate")
	@ResponseBody
	public boolean acisduplicate(Model model, HttpSession session, @RequestBody String account) {
		Optional<UsersBean> opt = usersService.findByAccount(account);
		if (!(opt.isEmpty())) {
			return true;
		} else {
			return false;
		}
	}
	
	@PostMapping("/joinmember/emisduplicate")
	@ResponseBody
	public boolean emisduplicate(Model model, HttpSession session, @RequestBody String email) {
		Optional<UsersBean> opt = usersService.findbyemail(email);
		if (!(opt.isEmpty())) {
			return true;
		} else {
			return false;
		}
	}

	@GetMapping("/updatemember")
	public String updateMember(Model m) {
		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
		m.addAttribute("usersData", bean);
		return "updatemember";
	}

	// 會員資料修改
	@PostMapping("updatemember")
	public String update(@ModelAttribute("usersData") UsersBean userBean, Model m, HttpServletRequest request,
			HttpServletResponse response) {
		UsersBean bean = (UsersBean) m.getAttribute("isLogin");
		String password = "";
		if(!userBean.getUserPassword().equals(bean.getUserPassword())) {
			password = new BCryptPasswordEncoder().encode(userBean.getUserPassword());
			userBean.setUserPassword(password);
		}
		userBean.setRegisterDate(bean.getRegisterDate());
		usersService.save(userBean);
		return "redirect:/updatemember";
	}
}
