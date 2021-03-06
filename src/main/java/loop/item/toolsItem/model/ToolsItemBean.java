package loop.item.toolsItem.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
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
@Table(name="toolsItem")
public class ToolsItemBean implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="itemId")
	private Integer itemId;
	
	@Column(name="itemName")
	private String itemName;
	
	@Column(name="specification")
	private String specification;
	
	@Column(name="itemDescription")
	private String itemDescription;
	
	@Column(name="addDate")
	private String addDate;
	
	@Column(name="qty")
	private Integer qty;
	
	@Column(name="price")
	private Integer price;
	
	@OneToOne(mappedBy = "toolsItem", cascade = CascadeType.ALL)
	private AllItemBean allItem;
	
	public ToolsItemBean() {
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

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
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

	public void setAddDate( String current) {
		this.addDate = current;
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