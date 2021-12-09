package loop.item.allItem.model;

import java.io.Serializable;
import java.util.List;

public class ItemDisplay implements Serializable{
	
    private int itemId;
	
	private String itemName;
	
	private String img;
	
	private List<ItemImgBean> imgs;
	
	private int price;
	
	private int qty;

	public ItemDisplay() {
	}
	
	
	
	public ItemDisplay(int itemId, String itemName, List<ItemImgBean> imgs, int price, int qty) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.imgs = imgs;
		this.price = price;
		this.qty = qty;
	}



	public ItemDisplay(int itemId, String itemName, int price, int qty, String img) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.price = price;
		this.qty = qty;
		this.img = img;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;	
		
	}

	public ItemDisplay(int itemId, String itemName, String img, int price) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.img = img;
		this.price = price;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}



	public List<ItemImgBean> getImgs() {
		return imgs;
	}



	public void setImgs(List<ItemImgBean> imgs) {
		this.imgs = imgs;
	}

	
	
}
