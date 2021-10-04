package proj.models;

import java.util.List;
import java.util.Random;

public class CtoCItemService {
	CtoCItemDao cDao;
	
	public CtoCItemService() {
		this.cDao = new CtoCItemDao();
	}
	public CtoCItemBean createItem(CtoCItemBean bean) {
		return cDao.createItem(bean);
	}
	
	public String updateItem(CtoCItemBean bean, String id) {
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
	
	public List<CtoCItemBean> selectAll() {
		return cDao.selectAll();
	}
	
	public List<CtoCItemBean> search(String keyword, String select) {
		return cDao.search(keyword, select);
	}
	
	
}
