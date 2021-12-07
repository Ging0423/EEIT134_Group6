package loop.video.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.video.model.AllVideoBean;
import loop.video.model.AllVideoRepository;

@Service
@Transactional
public class AllVideoService {
	
	private AllVideoRepository allVideoRepo;
	
	public void save(AllVideoBean bean) {
		allVideoRepo.save(bean);
	}
	
	public void delete(Integer videoId) {
		allVideoRepo.deleteByVideoId(videoId);
	}
	
	public void update(AllVideoBean bean) {
		allVideoRepo.save(bean);
	}
	
	public List<AllVideoBean> findAll(){
		return allVideoRepo.findAll();
	}

}
