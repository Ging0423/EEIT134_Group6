package loop.user.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.forum.model.Article;
import loop.forum.model.ArticleService;
import loop.forum.model.Reply;
import loop.forum.model.ReplyService;
import loop.order.model.OrderDataBean;
import loop.order.service.OrderDataService;
//import loop.order.model.OrderDataBean;
import loop.user.model.UsersBean;
import loop.user.model.UsersRepository;
import loop.video.model.VideoCommentBean;
import loop.video.service.VideoCommentService;

@Service
public class UsersService {

	@Autowired
	private UsersRepository usersRepo;
	
	@Autowired
	ArticleService articleService;

	@Autowired
	ReplyService replyService;
	
	@Autowired
	OrderDataService orderDataService;
	
	@Autowired
	VideoCommentService videoCommentService;
	
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
		Optional<UsersBean> op = usersRepo.findByEmail(email);		
		return op;
	}
	
	public boolean isDuplicateEmail(String email) {
		if(!(usersRepo.findByEmail(email).isEmpty()))
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
			List<Article> article = articleService.findByAuthorid(Integer.parseInt(i));
			for(Article a: article) {
				a.setUsers(null);
				articleService.updateArticle(a);
			}
			List<Reply> reply = replyService.findByAuthorid(Integer.parseInt(i));
			for(Reply r: reply) {
				r.setUsers(null);
				replyService.updateReply(r);
			}
			List<OrderDataBean> orderData = orderDataService.findByUserId(Integer.parseInt(i));
			for(OrderDataBean o: orderData) {
				o.setUsers(null);
				orderDataService.update(o);
			}
			List<VideoCommentBean> comment = videoCommentService.findByVideoId(Integer.parseInt(i));
			for(VideoCommentBean v: comment) {
				v.setUsers(null);
				videoCommentService.save(v);
			}
			deleteById(Integer.parseInt(i));
		}	
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
	
	public List<UsersBean> listDesc5() {
		return usersRepo.findTop5ByOrderByUserIdDesc();
	}

}
