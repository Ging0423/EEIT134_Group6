package loop.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import loop.login.service.LoginService;

@Controller
@SessionAttributes({ "isLogin" })
public class LoginController {

	private LoginService loginService;

	@Autowired
	public LoginController(LoginService loginService) {
		super();
		this.loginService = loginService;
	}

	@GetMapping("/login")
	public String loginFailurePage(@RequestParam(value = "failure", required = false) String account,String password, Model m) {
		try {
			if (!account.equals(null) || !password.equals(null)) {
				m.addAttribute("acerrorMsg", "帳號不可空白！");
				m.addAttribute("pwerrorMsg", "密碼不可空白！");
				return "login";
			}
//			if(!password.equals(null)) {
//				m.addAttribute("pwerrorMsg", "密碼不可空白！");
//				return "login";
//			}
		} catch (NullPointerException e) {
			return "login";
		}
		return "login";
	}

//	@GetMapping("/login")
//	public String loginFailurePage1(@RequestParam(value = "failure", required = false) String password, Model m) {
//		try {
//			if (!password.equals(null)) {
//				m.addAttribute("pwerrorMsg", "密碼不可空白！");
//				return "login";
//			}
//		} catch (NullPointerException e) {
//			return "login";
//		}
//		return "login";
//	}

	@GetMapping("/logout")
	public String logOut(HttpServletRequest request, HttpServletResponse response, SessionStatus status) {
		HttpSession session = request.getSession();
		// 清除session
		status.setComplete();
		session.invalidate();
		return "redirect:/";
	}

}
