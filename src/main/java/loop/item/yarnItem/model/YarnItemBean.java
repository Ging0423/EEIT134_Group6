package loop.item.yarnItem.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import loop.item.allItem.model.AllItemBean;

@Component
@Entity
@Table(name="yarnItem")
public class YarnItemBean implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="itemId")
	private Integer itemId;
	
	@Column(name="itemName")
	private String itemName;
	
	@Column(name="material")
	private String material;
	
	@Column(name="size")
	private String size;
	
	@Column(name="color")
	private String color;
	
	@Column(name="itemDescription")
	private String itemDescription;
	
	@Column(name="addDate")
	private String addDate;
	
	@Column(name="qty")
	private Integer qty;
	
	@Column(name="price")
	private Integer price;
		
	@OneToOne(mappedBy = "yarnItem")
	private AllItemBean allItem;
	
	public YarnItemBean() {
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

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public AllItemBean getAllItem() {
		return allItem;
	}

	public void setAllItem(AllItemBean allItem) {
		this.allItem = allItem;
	}

}
