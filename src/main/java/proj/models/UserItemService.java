package proj.models;

import java.util.List;
import java.util.Random;

public class UserItemService {
	UserItemDao cDao;
	
	public UserItemService() {
		this.cDao = new UserItemDao();
	}
	public UserItemBean createItem(UserItemBean bean) {
		return cDao.createItem(bean);
	}
	
	public String updateItem(UserItemBean bean, String id) {
		return cDao.update(bean, id);
	}
	
	public String deleteItem(String id) {
		return cDao.delete(id);
	}
	public String deleteMultiItem(String[] id) {
		return cDao.deleteMulti(id);
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
	
	public List<UserItemBean> selectAll() {
		return cDao.selectAll();
	}
	
	public List<UserItemBean> search(String keyword, String select) {
		return cDao.search(keyword, select);
	}
	
	
}
