package loop.item.yarnItem.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

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
	private Date addDate;
	
	@Column(name="qty")
	private Integer qty;
	
	@Column(name="price")
	private Integer price;
	
	
	@OneToOne(mappedBy = "yarnItem")
	private AllItemBean allItem;
	
	
	public YarnItemBean() {
		
	}


	public YarnItemBean(String itemName, String material, String size, String color, String itemDescription,
			Date addDate, Integer qty, Integer price) {
		super();
		this.itemName = itemName;
		this.material = material;
		this.size = size;
		this.color = color;
		this.itemDescription = itemDescription;
		this.addDate = addDate;
		this.qty = qty;
		this.price = price;
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


	public Date getAddDate() {
		return addDate;
	}


	public void setAddDate(Date addDate) {
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