package loop.video.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import loop.user.model.UsersBean;

@Component
@Entity
@Table(name = "videoComment")
public class VideoCommentBean implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY.AUTO)
	private Integer id;
	
	private Integer videoId;
	
	private Integer userId;
	
	private String comment;
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId",insertable = false, updatable = false)
	private UsersBean users;
	
	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "videoId",insertable = false, updatable = false)
	private AllVideoBean allVideo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getVideoId() {
		return videoId;
	}

	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public UsersBean getUsers() {
		return users;
	}

	public void setUsers(UsersBean users) {
		this.users = users;
	}

	public AllVideoBean getAllVideo() {
		return allVideo;
	}

	public void setAllVideo(AllVideoBean allVideo) {
		this.allVideo = allVideo;
	}
	
	
}
