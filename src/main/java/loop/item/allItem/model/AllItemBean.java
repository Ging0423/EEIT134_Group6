package loop.item.allItem.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import loop.item.booksItem.model.BooksItemBean;
import loop.item.packageItem.model.PackageItemBean;
import loop.item.toolsItem.model.ToolsItemBean;
import loop.item.userItem.model.UserItemBean;
import loop.item.yarnItem.model.YarnItemBean;
@Component
@Entity
@Table(name = "allItem")
public class AllItemBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="itemId")
	private int itemId;
	
	@OneToOne(cascade=CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="itemId", referencedColumnName="itemId")
	private UserItemBean userItem;
	
	@OneToOne(cascade=CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="itemId", referencedColumnName="itemId")
	private YarnItemBean yarnItem;
	
	@OneToOne(cascade=CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="itemId", referencedColumnName="itemId")
	private ToolsItemBean toolsItem;
	
	@OneToOne(cascade=CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="itemId", referencedColumnName="itemId")
	private BooksItemBean booksItem;
	
	@OneToOne(cascade=CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="itemId", referencedColumnName="itemId")
	private PackageItemBean packageItem;
	
	public AllItemBean() {
		// TODO Auto-generated constructor stub
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId= itemId;
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

	public PackageItemBean getPackageItem() {
		return packageItem;
	}

	public void setPackageItem(PackageItemBean packageItem) {
		this.packageItem = packageItem;
	}

	
}
