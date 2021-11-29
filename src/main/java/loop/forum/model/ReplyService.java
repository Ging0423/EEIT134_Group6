package tw.JoyHsieh.forum.model;

import org.springframework.stereotype.Service;

@Service
public class ReplyService {
	private ReplyRepository rReps;
	
	public Reply findByArticleid(int articleic) {
		
	}
	
	public Reply findByAuthorid(int authorid) {
		
	}
	
	public Reply createNewReply(Reply reply) {
		return rReps.save(reply);
	}
	
	public Reply updateReply(Reply reply) {
		return rReps.save(reply);
	}
}
