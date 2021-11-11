package loop.item.packageItem.model;

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
@Table(name="packageItem")
public class PackageItemBean implements Serializable {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="itemId")
	private Integer itemId;
	
	@Column(name="itemName")
	private String itemName;
	
	@Column(name="itemDescription")
	private String itemDescription;

	@Column(name="addDate")
	private Date addDate;
	
	@Column(name="qty")
	private Integer qty;
	
	@Column(name="price")
	private Integer price;
	
	@OneToOne(mappedBy = "packageItem")
	private AllItemBean allItem;

	public PackageItemBean() {
		// TODO Auto-generated constructor stub
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
