package loop.forum.model;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ReplyService {

	@Autowired
	private ReplyRepository rReps;
	
	public Reply createNewReply(Reply reply) {
		return rReps.save(reply);
	}
	
	public List<Reply> findAll() {
		return rReps.findAll();
	}
	
	public List<Reply> findAllByAuthorid(int authorid) {
		return rReps.findByAuthorid(authorid);
	}
	
	public Page<Reply> findAllByPage(Pageable pageable){
		return rReps.findAll(pageable);
	}

	public Page<Reply> findAllByPage(int articleid, Pageable pageable) {
		return rReps.findByArticleid(articleid, pageable);
	}
	
	public Page<Reply> findPageByAuthorid(int authorid, Pageable pageable){
		return rReps.findByAuthorid(authorid, pageable);
	}
	
	public void deleteReply(List<Reply> reply) {
		for (int i=0; i<reply.size(); i++) {
			rReps.delete(reply.get(i));
		}
	}
	
	public List<Reply> findByArticleid(int articleid){
		return rReps.findByArticleid(articleid);
	}
	
	public Reply updateReply(Reply reply){
		return rReps.save(reply);
	}
	
	public int countReplyAmountByCategoryidAndAuthorid(int authorid) {
		return (int)rReps.countByAuthorid(authorid);
	}

	public long countReplyAmountOfToday(Date today) {
		return rReps.countByReplydateGreaterThan(today);
	}


//	public Reply findById(int articleid) {
//		Optional<Article> op1 = rReps.findById(articleid);
//		
//		if(op1.isPresent()) {
//			return op1.get();
//		}
//		
//		return null;
//	}
	
//	public Optional<Article> findByAuthorid(int authorid){
//		return aReps.findbyA
//	}

	public long countReplyAmountBetweenDate(Date today, Date tomorrow) {
		return rReps.countByReplydateBetween(today, tomorrow);
	}

	public List<Reply> findByAuthorid(int parseInt) {
		return rReps.findByAuthorid(parseInt);
	}
}
