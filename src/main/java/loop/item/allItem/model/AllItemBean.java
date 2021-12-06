package loop.item.allItem.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import loop.item.booksItem.model.BooksItemBean;
import loop.item.kitsItem.model.KitsItemBean;
import loop.item.toolsItem.model.ToolsItemBean;
import loop.item.userItem.model.UserItemBean;
import loop.item.yarnItem.model.YarnItemBean;
import loop.order.model.OrderItemBean;
import loop.shoppingCart.model.ShoppingCartBean;

@Component
@Entity
@Table(name = "allItem")
public class AllItemBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "itemId")
	private Integer itemId;

	@OneToOne(cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn(name = "itemId", referencedColumnName = "itemId")
	private UserItemBean userItem;

	@OneToOne(cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn(name = "itemId", referencedColumnName = "itemId")
	private YarnItemBean yarnItem;

	@OneToOne(cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn(name = "itemId", referencedColumnName = "itemId")
	private ToolsItemBean toolsItem;

	@OneToOne(cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn(name = "itemId", referencedColumnName = "itemId")
	private BooksItemBean booksItem;

	@OneToOne(cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn(name = "itemId", referencedColumnName = "itemId")
	private KitsItemBean kitsItem;

	@OneToMany(fetch = FetchType.LAZY, mappedBy="allItem", cascade = CascadeType.ALL )
	private Set<ShoppingCartBean> shoppingCart = new LinkedHashSet<ShoppingCartBean>();
	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy="allItem")
	private Set<OrderItemBean> orderItem = new LinkedHashSet<OrderItemBean>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy="allItem", cascade = CascadeType.ALL)
	private Set<ItemImgBean> itemImg = new LinkedHashSet<ItemImgBean>();


	public AllItemBean() {
		
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public UserItemBean getUserItem() {
		return userItem;
	}

	public void setUserItem(UserItemBean userItem) {
		this.userItem = userItem;
	}

	public YarnItemBean getYarnItem() {
		return yarnItem;
	}

	public void setYarnItem(YarnItemBean yarnItem) {
		this.yarnItem = yarnItem;
	}

	public ToolsItemBean getToolsItem() {
		return toolsItem;
	}

	public void setToolsItem(ToolsItemBean toolsItem) {
		this.toolsItem = toolsItem;
	}

	public BooksItemBean getBooksItem() {
		return booksItem;
	}

	public void setBooksItem(BooksItemBean booksItem) {
		this.booksItem = booksItem;
	}

	public KitsItemBean getKitsItem() {
		return kitsItem;
	}

	public void setKitsItem(KitsItemBean kitsItem) {
		this.kitsItem = kitsItem;
	}

	public Set<ShoppingCartBean> getShoppingCart() {
		return shoppingCart;
	}

	public void setShoppingCart(Set<ShoppingCartBean> shoppingCart) {
		this.shoppingCart = shoppingCart;
	}

	public Set<OrderItemBean> getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(Set<OrderItemBean> orderItem) {
		this.orderItem = orderItem;
	}

	public Set<ItemImgBean> getItemImg() {
		return itemImg;
	}

	public void setItemImg(Set<ItemImgBean> itemImg) {
		this.itemImg = itemImg;
	}
	
}
