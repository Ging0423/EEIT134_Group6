package loop.item.allItem.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="itemImg")
public class ItemImgBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY.AUTO)
	private Integer id;
	
	private String img;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="itemId")
	private AllItemBean allItem;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public AllItemBean getAllItem() {
		return allItem;
	}

	public void setAllItem(AllItemBean allItem) {
		this.allItem = allItem;
	}
	
	
}
