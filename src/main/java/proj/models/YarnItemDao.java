package proj.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.hibernate.Session;

public class YarnItemDao {

	Context context;
	DataSource ds = null;
	private Session session;

	public YarnItemDao() {
		try {
			context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/MemberDB");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public YarnItemDao(Session session) {
		try {
			this.session = session;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getItemId() {
		String id = "";
		try {
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/MemberDB");
			String sql = "select count(*) from userItem";
			try (Connection connection = dataSource.getConnection();
					PreparedStatement stmt = connection.prepareStatement(sql);
					ResultSet rs = stmt.executeQuery();) {
				rs.next();
				id = Integer.parseInt(rs.getString(1)) + 1 + "";
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

//	private static final String INSERT = "Insert into userItem (itemId, itemName,material,size, color, itemDescription, addDate, qty, price) values (?, ?, ?, ?, ?, ?, ?,?,?)";
//
//	public YarnItemBean createItem(YarnItemBean bean) {
//		YarnItemBean result = null;
//		try (Connection conn = ds.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
//			stmt.setInt(1, bean.getItemId());
//			stmt.setInt(2, bean.getUserId());
//			stmt.setString(3, bean.getItemName());
//			stmt.setInt(4, bean.getQty());
//			stmt.setInt(5, bean.getPrice());
//			stmt.setString(6, bean.getItemDescription());
//			stmt.setString(7, bean.getImg());
//			int i = stmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
//
//	private static final String UPDATE = "Update userItem  SET \"itemId \"= ? ,\"userId\" = ?, "
//			+ "\"itemName\"=?, \"qty\"=?, \"price\"=?, \"ItemDescription\"=?, \"img\"=? where \"itemId\"=?";
//
//	public String update(YarnItemBean bean, String id) {
//		try (Connection conn = ds.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
//			stmt.setInt(1, bean.getItemId());
//			stmt.setInt(2, bean.getUserId());
//			stmt.setString(3, bean.getItemName());
//			stmt.setInt(4, bean.getQty());
//			stmt.setInt(5, bean.getPrice());
//			stmt.setString(6, bean.getItemDescription());
//			stmt.setString(7, bean.getImg());
//			stmt.setString(8, id);
//			stmt.executeUpdate();
//			return "success";
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "";
//	}

	private static final String DELETE = "DELETE FROM userItem WHERE \"itemId\" = ?";

	public String delete(String id) {
		try (Connection conn = ds.getConnection(); PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			stmt.setString(1, id);
			stmt.executeUpdate();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public String deleteMulti(String[] id) {
		try (Connection conn = ds.getConnection(); PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			
			for(String i : id) {
				stmt.setString(1, i);
				stmt.executeUpdate();
			}
			
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	private static final String SELECT_ALL = "SELECT * FROM yarnItem";

	public List<YarnItemBean> selectAll() {
		List<YarnItemBean> items = new ArrayList<>();
		try {
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/MemberDB");

			try (Connection connection = dataSource.getConnection();
					PreparedStatement stmt = connection.prepareStatement(SELECT_ALL);
					ResultSet rs = stmt.executeQuery();) {
				while (rs.next()) {
					YarnItemBean bean = new YarnItemBean();
					bean.setItemId(rs.getInt("itemId"));
					bean.setItemName(rs.getString("itemName"));
					bean.setMaterial(rs.getString("material"));
					bean.setColor(rs.getString("color"));
					bean.setSize(rs.getString("size"));
					bean.setQty(rs.getInt("qty"));
					bean.setPrice(rs.getInt("price"));
					bean.setAddDate(rs.getDate("addDate"));
					bean.setItemDescription(rs.getString("itemDescription"));
					items.add(bean);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return items;
	}

	

//	public List<YarnItemBean> search(String keyword, String select) {
//		List<YarnItemBean> items = new ArrayList<>();
//		String SEARCH = "SELECT * FROM userItem where "+select+" LIKE '%"+keyword+"%'";
//		try {
//			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/MemberDB");
//			try (Connection connection = dataSource.getConnection();
//					Statement stmt = connection.createStatement();
//					ResultSet rs = stmt.executeQuery(SEARCH);) {
//				while (rs.next()) {
//					YarnItemBean bean = new YarnItemBean();
//					bean.setUserId(rs.getInt("userId"));
//					bean.setItemName(rs.getString("name"));
//					bean.setItemId(rs.getInt("itemId"));
//					bean.setQty(rs.getInt("qty"));
//					bean.setPrice(rs.getInt("price"));
//					bean.setItemDescription(rs.getString("itemDescription"));
//					bean.setImg(rs.getString("img"));
//					items.add(bean);
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return items;
//	}
	
	public YarnItemBean selectById(int itemId)
	{
		AllItemBean bean = new AllItemBean();
		YarnItemBean yarnBean = new YarnItemBean();
		bean = session.get(AllItemBean.class, itemId);
		yarnBean = bean.getYarnItem();
		
		
		return yarnBean;
	}
}
