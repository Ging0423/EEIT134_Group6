package proj.models;

import java.lang.reflect.Member;
import java.lang.AutoCloseable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ItemDao {

	Context context;

	public ItemDao() {
		try {
			context = new InitialContext();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<ItemBean> findAll() {
		String sql = "SELECT * FROM ctocItem";
		List<ItemBean> items = new ArrayList<>();
		try {
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/MemberDB");

			try (Connection connection = dataSource.getConnection();
					PreparedStatement stmt = connection.prepareStatement(sql);
					ResultSet rs = stmt.executeQuery();) {
				while (rs.next()) {
					ItemBean itemBean = new ItemBean();
					itemBean.setMemberId(rs.getString("memberId"));
					itemBean.setName(rs.getString("name"));
					itemBean.setItemId(rs.getString("itemId"));
					itemBean.setQty(rs.getInt("qty"));
					itemBean.setDescription(rs.getString("description"));
					itemBean.setImg(rs.getString("img"));
					items.add(itemBean);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return items;
	}

}
