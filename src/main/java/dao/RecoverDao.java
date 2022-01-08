package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import entities.User;

public class RecoverDao {
	private Connection con;

	public RecoverDao(Connection con) {
		this.con = con;
	}

	public boolean updatePassword(User user) {
		boolean updated = false;

		try {
			String query = "UPDATE users set password=? where email=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getPassword());
			pstmt.setString(2, user.getEmail());

			pstmt.executeUpdate();

			updated = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return updated;
	}

	public boolean userMatch(User user) {
		boolean match = false;

		try {

			String query = "select LOWER(name) as name, email from users";
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(query);

			while (res.next()) {
				if ((user.getName().equals(res.getString("name")))
						&& (user.getEmail().equals(res.getString("email")))) {
					match = true;
					break;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return match;
	}

	public boolean UserExist(String email) {

		boolean exist = false;

		try {

			String query = "select email from users";
			Statement stmt = con.createStatement();

			ResultSet res = stmt.executeQuery(query);

			while (res.next()) {
				if (email.equals(res.getString("email"))) {
					exist = true;
					break;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return exist;
	}
}
