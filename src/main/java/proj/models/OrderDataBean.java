package proj.models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
@Entity
@Table(name="orderData")
public class OrderDataBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int orderId;
	private int userId;
	private String recipient;
	private String shippingAddress;
	private String tel;
	private Date orderDate;
	private String payState;
	private String orderState;
	private int total;

	public OrderDataBean() {
	}

	
	
}
