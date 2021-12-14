package loop.video.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.video.model.VideoCommentBean;
import loop.video.model.VideoCommentRepository;

@Service
@Transactional
public class VideoCommentService {

	@Autowired
	VideoCommentRepository videoCommentRepo;
	
	public List<VideoCommentBean> findByVideoId(Integer videoId) {
		return videoCommentRepo.findByVideoId(videoId);
	}
	
	public void save(VideoCommentBean bean) {
		videoCommentRepo.save(bean);
	}
	
	public void delete(Integer id) {
		videoCommentRepo.deleteById(id);
	}
	
	public List<VideoCommentBean> findByUserId(Integer userId) {
		return videoCommentRepo.findByUserId(userId);
	}
}
