package proj.models; 

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ItemBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private String itemId;
	private String memberId;
	private String name;
	private int qty;
	private int price;
	private String	description; 		
	private String img;	
				
	
	public ItemBean() {
	} 
	
	public ItemBean(String memberId, String name, String password, String address, String phone, Date birthday,
			Timestamp registerDate, double weight) {
		super();
		this.memberId = memberId;
		this.name = name;
		this.memberId = memberId;
		this.qty = qty;
		this.description = description;
		this.img = img;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	
}