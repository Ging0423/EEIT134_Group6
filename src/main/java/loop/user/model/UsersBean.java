package loop.user.model;

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
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import loop.order.orderData.model.OrderDataBean;
import loop.shoppingCart.model.ShoppingCartBean;

@Component
@Entity
@Table(name = "users")
public class UsersBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userId")
	private int userId;

	@Column(name = "account")
	private String account;

	@Column(name = "userPassword")
	private String userPassword;

	@Column(name = "userIdentity")
	private String userIdentity;

	@Column(name = "userName")
	private String userName;

	@Column(name = "email")
	private String email;

	@Column(name = "tel")
	private String tel;

	@Column(name = "userAddress")
	private String userAddress;

	@Column(name = "registerDate")
	private Date registerDate;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "users",cascade = CascadeType.ALL)
	private Set<OrderDataBean> orderData = new LinkedHashSet<OrderDataBean>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "users",cascade = CascadeType.ALL)
	private Set<ShoppingCartBean> shoppingCart = new LinkedHashSet<ShoppingCartBean>();

	public UsersBean() {

	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserIdentity() {
		return userIdentity;
	}

	public void setUserIdentity(String userIdentity) {
		this.userIdentity = userIdentity;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Set<OrderDataBean> getOrderData() {
		return orderData;
	}

	public void setOrderData(Set<OrderDataBean> orderData) {
		this.orderData = orderData;
	}

	public Set<ShoppingCartBean> getShoppingCart() {
		return shoppingCart;
	}

	public void setShoppingCart(Set<ShoppingCartBean> shoppingCart) {
		this.shoppingCart = shoppingCart;
	}

	@Override
	public String toString() {
		return "UsersBean [userId=" + userId + ", account=" + account + ", userPassword=" + userPassword
				+ ", userIdentity=" + userIdentity + ", userName=" + userName + ", email=" + email + ", tel=" + tel
				+ ", userAddress=" + userAddress + ", registerDate=" + registerDate + "]";
	}

}
