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

public class CtoCItemDao {

	Context context;
	DataSource ds = null;

	public CtoCItemDao() {
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
			String sql = "select count(*) from CtoCItem";
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

	private static final String INSERT = "Insert into CtoCItem (itemId, memberId, name, qty, price, description, img) values (?, ?, ?, ?, ?, ?, ?)";

	public CtoCItemBean createItem(CtoCItemBean bean) {
		CtoCItemBean result = null;
		try (Connection conn = ds.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			stmt.setString(1, bean.getItemId());
			stmt.setString(2, bean.getMemberId());
			stmt.setString(3, bean.getName());
			stmt.setInt(4, bean.getQty());
			stmt.setInt(5, bean.getPrice());
			stmt.setString(6, bean.getDescription());
			stmt.setString(7, bean.getImg());
			int i = stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "Update CtoCItem  SET \"itemId \"= ? ,\"memberId\" = ?, "
			+ "\"name\"=?, \"qty\"=?, \"price\"=?, \"description\"=?, \"img\"=? where \"itemId\"=?";

	public String update(CtoCItemBean bean, String id) {
		try (Connection conn = ds.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setString(1, bean.getItemId());
			stmt.setString(2, bean.getMemberId());
			stmt.setString(3, bean.getName());
			stmt.setInt(4, bean.getQty());
			stmt.setInt(5, bean.getPrice());
			stmt.setString(6, bean.getDescription());
			stmt.setString(7, bean.getImg());
			stmt.setString(8, id);
			stmt.executeUpdate();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	private static final String DELETE = "DELETE FROM CtoCItem WHERE \"itemId\" = ?";

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

	private static final String SELECT_ALL = "SELECT * FROM ctocItem";

	public List<CtoCItemBean> selectAll() {
		List<CtoCItemBean> items = new ArrayList<>();
		try {
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/MemberDB");

			try (Connection connection = dataSource.getConnection();
					PreparedStatement stmt = connection.prepareStatement(SELECT_ALL);
					ResultSet rs = stmt.executeQuery();) {
				while (rs.next()) {
					CtoCItemBean bean = new CtoCItemBean();
					bean.setMemberId(rs.getString("memberId"));
					bean.setName(rs.getString("name"));
					bean.setItemId(rs.getString("itemId"));
					bean.setQty(rs.getInt("qty"));
					bean.setPrice(rs.getInt("price"));
					bean.setDescription(rs.getString("description"));
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

	

	public List<CtoCItemBean> search(String keyword, String select) {
		List<CtoCItemBean> items = new ArrayList<>();
		String SEARCH = "SELECT * FROM ctocItem where "+select+" LIKE '%"+keyword+"%'";
		try {
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/MemberDB");
			try (Connection connection = dataSource.getConnection();
					Statement stmt = connection.createStatement();
					ResultSet rs = stmt.executeQuery(SEARCH);) {
				while (rs.next()) {
					CtoCItemBean bean = new CtoCItemBean();
					bean.setMemberId(rs.getString("memberId"));
					bean.setName(rs.getString("name"));
					bean.setItemId(rs.getString("itemId"));
					bean.setQty(rs.getInt("qty"));
					bean.setPrice(rs.getInt("price"));
					bean.setDescription(rs.getString("description"));
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
