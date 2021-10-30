package loop.shoppingCart.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import loop.item.allItem.model.AllItemBean;
import loop.user.model.UsersBean;

@Component
@Entity
@Table(name = "shoppingCart")
public class ShoppingCartBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "userId")
	private int userId;

	@Column(name = "itemId")
	private int itemId;

	@Column(name = "qty")
	private int qty;

	@Autowired
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "itemId", referencedColumnName = "itemId",insertable = false, updatable = false)
	private AllItemBean allItem;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId", referencedColumnName = "userId",insertable = false, updatable = false)
	private UsersBean users;

	public ShoppingCartBean() {

	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public AllItemBean getAllItem() {
		return allItem;
	}

	public void setAllItem(AllItemBean allItem) {
		this.allItem = allItem;
	}

	public UsersBean getUsers() {
		return users;
	}

	public void setUsers(UsersBean users) {
		this.users = users;
	}

}
