package proj.service;

import java.util.List;
import java.util.Random;

import org.hibernate.Session;

import proj.models.YarnItemBean;
import proj.models.YarnItemDao;

public class YarnItemService {
	YarnItemDao Dao;
	
	public YarnItemService(Session session) {
		this.Dao = new YarnItemDao(session);
	}
	public YarnItemService() {
		this.Dao = new YarnItemDao();
	}
//	public UserItemBean createItem(YarnItemBean bean) {
//		return Dao.createItem(bean);
//	}
//	
//	public String updateItem(YarnItemBean bean, String id) {
//		return Dao.update(bean, id);
//	}
//	
	public String deleteItem(String id) {
		return Dao.delete(id);
	}
	public String deleteMultiItem(String[] id) {
		return Dao.deleteMulti(id);
	}
	public String getRandomString(int length){
		String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random=new Random();
		StringBuffer sb=new StringBuffer();
		for(int i=0; i < length; i++){
		int number=random.nextInt(62);
		sb.append(str.charAt(number));
		}
		return sb.toString();
		}  
	
	public List<YarnItemBean> selectAll() {
		return Dao.selectAll();
	}
	
	public YarnItemBean selectById(int itemId) {
		return Dao.selectById(itemId);
	}
//	
//	public List<YarnItemBean> search(String keyword, String select) {
//		return Dao.search(keyword, select);
//	}
	
	
}
