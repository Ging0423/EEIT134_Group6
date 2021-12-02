package loop.item.allItem.model;

import java.io.Serializable;

public class ItemDisplay implements Serializable{
	
    private int itemId;
	
	private String itemName;
	
	private String img;
	
	private int price;

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

}
