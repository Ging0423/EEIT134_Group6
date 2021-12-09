package loop.video.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.video.model.AllVideoBean;
import loop.video.model.AllVideoRepository;

@Service
@Transactional
public class AllVideoService {
	
	@Autowired
	private AllVideoRepository allVideoRepo;
	
	public void save(AllVideoBean bean) {
		allVideoRepo.save(bean);
	}
	
	public void delete(Integer videoId) {
		allVideoRepo.deleteById(videoId);
	}
	
	public void update(AllVideoBean bean) {
		allVideoRepo.save(bean);
	}
	
	public List<AllVideoBean> findAll(){
		return allVideoRepo.findAll();
	}

	public AllVideoBean findById(Integer videoId) {
		Optional<AllVideoBean> opt = allVideoRepo.findById(videoId);
		if(opt.isEmpty()) {
			return null;
		}
		else
			return opt.get();
	}
}
