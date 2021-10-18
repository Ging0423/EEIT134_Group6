package proj.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserItemDao {

	Context context;
	DataSource ds = null;

	public UserItemDao() {
		try {
			context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/MemberDB");
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

	private static final String INSERT = "Insert into userItem (itemId, userId, itemName, qty, price, itemDescription, img) values (?, ?, ?, ?, ?, ?, ?)";

	public UserItemBean createItem(UserItemBean bean) {
		UserItemBean result = null;
		try (Connection conn = ds.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			stmt.setInt(1, bean.getItemId());
			stmt.setInt(2, bean.getUserId());
			stmt.setString(3, bean.getItemName());
			stmt.setInt(4, bean.getQty());
			stmt.setInt(5, bean.getPrice());
			stmt.setString(6, bean.getItemDescription());
			stmt.setString(7, bean.getImg());
			int i = stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "Update userItem  SET \"itemId \"= ? ,\"userId\" = ?, "
			+ "\"itemName\"=?, \"qty\"=?, \"price\"=?, \"ItemDescription\"=?, \"img\"=? where \"itemId\"=?";

	public String update(UserItemBean bean, String id) {
		try (Connection conn = ds.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1, bean.getItemId());
			stmt.setInt(2, bean.getUserId());
			stmt.setString(3, bean.getItemName());
			stmt.setInt(4, bean.getQty());
			stmt.setInt(5, bean.getPrice());
			stmt.setString(6, bean.getItemDescription());
			stmt.setString(7, bean.getImg());
			stmt.setString(8, id);
			stmt.executeUpdate();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

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

	private static final String SELECT_ALL = "SELECT * FROM userItem";

	public List<UserItemBean> selectAll() {
		List<UserItemBean> items = new ArrayList<>();
		try {
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/MemberDB");

			try (Connection connection = dataSource.getConnection();
					PreparedStatement stmt = connection.prepareStatement(SELECT_ALL);
					ResultSet rs = stmt.executeQuery();) {
				while (rs.next()) {
					UserItemBean bean = new UserItemBean();
					bean.setUserId(rs.getInt("userId"));
					bean.setItemName(rs.getString("Itemname"));
					bean.setItemId(rs.getInt("itemId"));
					bean.setQty(rs.getInt("qty"));
					bean.setPrice(rs.getInt("price"));
					bean.setItemDescription(rs.getString("itemDescription"));
					bean.setImg(rs.getString("img"));
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

	

	public List<UserItemBean> search(String keyword, String select) {
		List<UserItemBean> items = new ArrayList<>();
		String SEARCH = "SELECT * FROM userItem where "+select+" LIKE '%"+keyword+"%'";
		try {
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/MemberDB");
			try (Connection connection = dataSource.getConnection();
					Statement stmt = connection.createStatement();
					ResultSet rs = stmt.executeQuery(SEARCH);) {
				while (rs.next()) {
					UserItemBean bean = new UserItemBean();
					bean.setUserId(rs.getInt("userId"));
					bean.setItemName(rs.getString("name"));
					bean.setItemId(rs.getInt("itemId"));
					bean.setQty(rs.getInt("qty"));
					bean.setPrice(rs.getInt("price"));
					bean.setItemDescription(rs.getString("itemDescription"));
					bean.setImg(rs.getString("img"));
					items.add(bean);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return items;
	}
}
