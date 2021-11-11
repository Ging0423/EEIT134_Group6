package loop.shoppingCart.model;

import java.io.Serializable;

import org.springframework.stereotype.Component;

public class ShoppingCartDisplay implements Serializable{
	
	private int itemId;
	
	private String itemName;
	
	private String img;
	
	private int price;
	
	private int qty;

	
	
	public ShoppingCartDisplay(Integer itemId, String itemName, String img, Integer price, Integer qty) {
		this.itemId = itemId;
		this.itemName = itemName;
		this.img = img;
		this.price = price;
		this.qty = qty;
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
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

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}
	
	
}
