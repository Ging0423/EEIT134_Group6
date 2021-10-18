package proj.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;
@Entity
@Table(name="orderData")
public class OrderDataBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String orderId;
	private String userId;
	private String orderDate;
	private String payState;
	private String orderState;
	private int total;

	public OrderDataBean() {
	}

	
	
}
