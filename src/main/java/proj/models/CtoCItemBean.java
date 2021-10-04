package proj.models;

public class CtoCItemBean {
	private String itemId;
	private String memberId;
	private String name;
	private int qty;
	private int price;
	private String description;
	private String img;
	
	public CtoCItemBean() {
		
	}
	
	public CtoCItemBean(String itemId, String memberId, String name, int qty, int price, String description, String img) {
		this.itemId = itemId;
		this.memberId = memberId;
		this.name = name;
		this.price= price;
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
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
