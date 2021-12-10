package loop.forum.model;

import java.util.List;
import java.util.Optional;

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
	
	public Page<Reply> findAllByPage(Pageable pageable){
		return rReps.findAll(pageable);
	}
	
	public void deleteReply(List<Reply> reply) {
		for (int i=0; i<reply.size(); i++) {
			rReps.delete(reply.get(i));
		}
	}
	
	public List<Reply> findByArticleid(int articleid){
		return rReps.findByArticleid(articleid);
	}
	
//	public Page<Reply> findAllByPage(Pageable pageable, int categoryid) {
//		List<Article> op1 = aReps.findByCategoryid(categoryid);
//		//return aReps.findByCategoryid(categoryid);
//		
//		return null;
//	}
	
	public Reply updateReply(Reply reply){
		return rReps.save(reply);
	}

	public Page<Reply> findAllByPage(int articleid, Pageable pageable) {
		return rReps.findByArticleid(articleid, pageable);
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

}
