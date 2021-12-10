package loop.user.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
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

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import loop.forum.model.Article;
import loop.forum.model.Reply;
import loop.order.model.OrderDataBean;
import loop.shoppingCart.model.ShoppingCartBean;
import loop.video.model.VideoCommentBean;

@Component
@Entity
@Table(name = "users")
public class UsersBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userId")
	private Integer userId;

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
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	private Date registerDate;
	
	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "users",cascade = CascadeType.ALL)
	private Set<OrderDataBean> orderData = new LinkedHashSet<OrderDataBean>();
	
	@JsonManagedReference
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "users",cascade = CascadeType.ALL)
	private Set<ShoppingCartBean> shoppingCart = new LinkedHashSet<ShoppingCartBean>();
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "users",cascade = CascadeType.ALL)
	private List<VideoCommentBean> videoComment = new ArrayList<VideoCommentBean>();
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "users",cascade = CascadeType.ALL)
	private List<Article> article = new ArrayList<Article>();
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "users",cascade = CascadeType.ALL)
	private List<Reply> reply = new ArrayList<Reply>();

	public UsersBean() {

	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
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

	
	
	public List<VideoCommentBean> getVideoComment() {
		return videoComment;
	}

	public void setVideoComment(List<VideoCommentBean> videoComment) {
		this.videoComment = videoComment;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UsersBean [userId=");
		builder.append(userId);
		builder.append(", account=");
		builder.append(account);
		builder.append(", userPassword=");
		builder.append(userPassword);
		builder.append(", userIdentity=");
		builder.append(userIdentity);
		builder.append(", userName=");
		builder.append(userName);
		builder.append(", email=");
		builder.append(email);
		builder.append(", tel=");
		builder.append(tel);
		builder.append(", userAddress=");
		builder.append(userAddress);
		builder.append(", registerDate=");
		builder.append(registerDate);
		builder.append(", orderData=");
		builder.append(orderData);
		builder.append(", shoppingCart=");
		builder.append(shoppingCart);
		builder.append("]");
		return builder.toString();
	}

	

}
