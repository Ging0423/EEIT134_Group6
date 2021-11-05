package loop.item.yarnItem.service;

import java.util.List;
import java.util.Random;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import loop.item.yarnItem.model.YarnItemBean;
import loop.item.yarnItem.model.YarnItemDao;

@Service
@Transactional
public class YarnItemService {
	
	@Autowired
	YarnItemDao Dao;

	public String getRandomString(Integer length) {
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(62);
			sb.append(str.charAt(number));
		}
		return sb.toString();
	}

	public List<YarnItemBean> selectAll() {
		return Dao.selectAll();
	}

	public YarnItemBean selectById(Integer itemId) {
		return Dao.selectById(itemId);
	}

}
