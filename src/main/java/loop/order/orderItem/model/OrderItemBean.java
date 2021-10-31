package loop.order.orderItem.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import loop.item.allItem.model.AllItemBean;
import loop.order.orderData.model.OrderDataBean;

@Component
@Entity
@Table(name = "orderItem")
public class OrderItemBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	private int id;
	
	@Transient
	@Column(name = "orderId")
	private int orderId;

	@Transient
	@Column(name = "itemId")
	private int itemId;

	@Column(name = "qty")
	private int qty;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "itemId")
	private AllItemBean allItem;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "orderId")
	private OrderDataBean orderData;

	public OrderItemBean() {
		// TODO Auto-generated constructor stub
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
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

	public OrderDataBean getOrderData() {
		return orderData;
	}

	public void setOrderData(OrderDataBean orderData) {
		this.orderData = orderData;
	}

}
