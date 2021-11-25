package loop.item.toolsItem.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.item.toolsItem.model.ToolsItemBean;
import loop.item.toolsItem.model.ToolsItemRepository;

@Service
public class ToolsItemService {

	@Autowired
	private ToolsItemRepository toolsRepo;
	
	public void create(ToolsItemBean bean) {
		toolsRepo.save(bean);
	}
	
	public List<ToolsItemBean> findAll() {
		return toolsRepo.findAll();
	}
	
	public ToolsItemBean findById(int itemId) {
		Optional<ToolsItemBean> bean = toolsRepo.findById(itemId);
		return bean.get();
	}
	
	public ToolsItemBean update(ToolsItemBean bean) {
		return toolsRepo.save(bean);
	}
	
	public void deleteById(Integer id) {
		toolsRepo.deleteById(id);
	}

}
