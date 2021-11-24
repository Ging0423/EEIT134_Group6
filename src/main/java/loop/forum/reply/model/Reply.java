package loop.forum.reply.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Controller;

@Controller
@Entity
@Table(name = "reply")
public class Reply {
	
	@Id @Column(name = "REPLYID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int replyid;
	
	@Column(name = "ARTICLEID")
	private int articleid;
	
	@Column(name = "CONTENT")
	private String content;
	
	@Column(name = "LIKENUM")
	private int likeNum;
	
	@Column(name = "AUTHORID")
	private int authorid;
	
	@Column(name = "REPLYDATE")
	private Date replyDate;

	public int getReplyid() {
		return replyid;
	}

	public void setReplyid(int replyid) {
		this.replyid = replyid;
	}

	public int getArticleid() {
		return articleid;
	}

	public void setArticleid(int articleid) {
		this.articleid = articleid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public int getAuthorid() {
		return authorid;
	}

	public void setAuthorid(int authorid) {
		this.authorid = authorid;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	
	
}
