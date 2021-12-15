package loop.mail.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import loop.item.allItem.service.ItemImgService;
import loop.mail.service.EmailSenderServiceImpl;
import loop.user.model.UsersBean;
import loop.user.service.UsersService;


@Controller
public class MailController {
	
	@Autowired
	private	EmailSenderServiceImpl mailService;
	
	@Autowired
	private ServletContext  context	;
	
	@Autowired
	private ItemImgService itemImgService;
	
	@Autowired
	private UsersService usersService;
	
	@PostMapping("/forgetpassword/sendforget")
	@ResponseBody
	public boolean forgetPassword(Model model, HttpSession session, 
			@RequestBody String mail) {
		Optional<UsersBean> opt = usersService.findByEmail(mail);
		if(!(opt.isEmpty())) {
			Map<String, String> map = (Map<String, String>) session.getAttribute("randomCode");
			if (map == null) {
				map = new HashMap<>();
				session.setAttribute("randomCode", map);
			}
			String emailAddress = opt.get().getEmail();
			String random = itemImgService.getRandomString(10);
			map.put(random, emailAddress);
			System.out.println("send mail");
			String link = " https://loop.jp.ngrok.io/loop/forgetpassword/" + random;
			mailService.sendEmail(emailAddress, "loop忘記密碼", "請於30分鐘內按下列超連結: " + 
			        link);
			model.addAttribute("emailAddress", emailAddress);
			return true;
		}
		else {
			return false;
		}
	}
	
	@GetMapping("/forgetpassword")
	public String forgetPage (Model m) {
		return "forgetpassword";
	}
	
	@GetMapping("/forgetpassword/{random}")
	public String confirm(Model m, HttpSession session, 
			@PathVariable String random) {
		String result = null;
		Map<String, String> map = (Map<String, String>) session.getAttribute("randomCode");
		if (map == null) {
			result = "電子郵件地址認證失敗，不存在，請重新申請";
			m.addAttribute("result", result);
			return "changepassworderror";
		} else {
			String mail = map.get(random);
			m.addAttribute("mail", mail);
		}
		return "changepassword";
	}
	
	@PostMapping("/changepassword")
	public String changepassword (ServletRequest request, Model m) {
		String mail = request.getParameter("mail");
		String beforePassword = request.getParameter("password");
		String password = new BCryptPasswordEncoder().encode(beforePassword);
		
		UsersBean bean;
		try {
			bean = usersService.findByEmail(mail).get();
			bean.setUserPassword(password);
			usersService.save(bean);
		} catch (Exception e) {		
			e.printStackTrace();
			return "redirect:/";
		}	
		return "redirect:/";
	}
}
