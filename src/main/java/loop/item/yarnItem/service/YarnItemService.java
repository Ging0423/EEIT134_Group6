package loop.item.yarnItem.service;

import java.util.List;
import java.util.Random;

import javax.persistence.EntityManagerFactory;

import org.hibernate.SessionFactory;
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

//	private SessionFactory hibernateFactory;

//	@Autowired
//	public YarnItemService(EntityManagerFactory factory) {
//		if (factory.unwrap(SessionFactory.class) == null) {
//			throw new NullPointerException("factory is not a hibernate factory");
//		}
//		this.hibernateFactory = factory.unwrap(SessionFactory.class);
//	}

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
