package proj.models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="orderData")
public class OrderDataBean implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="orderId")
	private int orderId;
	
	@Column(name="userId")
	private int userId;
	
	@Column(name="recipient")
	private String recipient;
	
	@Column(name="shippingAddress")
	private String shippingAddress;
	
	@Column(name="tel")
	private String tel;
	
	@Column(name="orderDate")
	private Date orderDate;
	
	@Column(name="payState")
	private String payState;
	
	@Column(name="orderState")
	private String orderState;
	
	@Column(name="total")
	private int total;
	
	

	public OrderDataBean() {
	}

	
	
}
