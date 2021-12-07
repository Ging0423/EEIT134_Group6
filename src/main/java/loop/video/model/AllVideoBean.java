package loop.video.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "allVideo")
public class AllVideoBean implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY.AUTO)
	private Integer videoId;
	
	private String videoName;
	
	private String videoLink;
	
	private String videoDescription;
	
	private String href;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "allVideo",cascade = CascadeType.ALL)
	private List<VideoCommentBean> videoComment;

	public Integer getVideoId() {
		return videoId;
	}

	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}

	public String getVideoName() {
		return videoName;
	}

	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}

	public String getVideoLink() {
		return videoLink;
	}

	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}

	public String getVideoDescription() {
		return videoDescription;
	}

	public void setVideoDescription(String videoDescription) {
		this.videoDescription = videoDescription;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public List<VideoCommentBean> getVideoComment() {
		return videoComment;
	}

	public void setVideoComment(List<VideoCommentBean> videoComment) {
		this.videoComment = videoComment;
	}
	
	
}
