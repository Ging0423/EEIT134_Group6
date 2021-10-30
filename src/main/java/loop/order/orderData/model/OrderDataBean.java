package loop.order.orderData.model;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import loop.order.orderItem.model.OrderItemBean;
import loop.user.model.UsersBean;

@Component
@Entity
@Table(name = "orderData")
public class OrderDataBean implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderId")
	private int orderId;

	@Column(name = "userId")
	private int userId;

	@Column(name = "recipient")
	private String recipient;

	@Column(name = "shippingAddress")
	private String shippingAddress;

	@Column(name = "tel")
	private String tel;

	@Column(name = "orderDate")
	private Date orderDate;

	@Column(name = "payState")
	private String payState;

	@Column(name = "orderState")
	private String orderState;

	@Column(name = "total")
	private int total;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "orderData", cascade = CascadeType.ALL)
	private Set<OrderItemBean> orderItem = new LinkedHashSet<OrderItemBean>();

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId", referencedColumnName = "userId",insertable = false, updatable = false)
	private UsersBean users;

	public OrderDataBean() {

	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getPayState() {
		return payState;
	}

	public void setPayState(String payState) {
		this.payState = payState;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Set<OrderItemBean> getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(Set<OrderItemBean> orderItem) {
		this.orderItem = orderItem;
	}

	public UsersBean getUsers() {
		return users;
	}

	public void setUsers(UsersBean users) {
		this.users = users;
	}

}
