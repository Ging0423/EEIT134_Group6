package proj.models;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name="userItem")
public class UserItemBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="itemId")
	private int itemId;
	
	@Column(name="userId")
	private int userId;
	
	@Column(name="itemName")
	private String itemName;
	
	@Column(name="itemDescription")
	private String itemDescription;
	
	@Column(name="qty")
	private int qty;
	
	@Column(name="price")
	private int price;
	
	@Column(name="img")
	private String img;
	
	@OneToOne(mappedBy = "userItem")	
	private AllItemBean allItem;
	
	public UserItemBean() {
		
	}

	public UserItemBean(int itemId, int userId, String itemName, String itemDescription, int qty, int price,
			String img, AllItemBean allItem) {
		super();
		this.itemId = itemId;
		this.userId = userId;
		this.itemName = itemName;
		this.itemDescription = itemDescription;
		this.qty = qty;
		this.price = price;
		this.img = img;
		this.allItem = allItem;
	}

	

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public AllItemBean getAllItem() {
		return allItem;
	}

	public void setAllItem(AllItemBean allItem) {
		this.allItem = allItem;
	}
	
	
	
	
}
