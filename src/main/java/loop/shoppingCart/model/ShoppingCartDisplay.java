package loop.shoppingCart.model;

import java.io.Serializable;

import org.springframework.stereotype.Component;

public class ShoppingCartDisplay implements Serializable{
	
	private int itemId;
	
	private String itemName;
	
	private String img;
	
	private int price;
	
	private int qty;

	
	
	public ShoppingCartDisplay(int itemId, String itemName, String img, int price, int qty) {
		this.itemId = itemId;
		this.itemName = itemName;
		this.img = img;
		this.price = price;
		this.qty = qty;
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

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
	
	
}
