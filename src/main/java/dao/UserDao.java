package dao;

import java.lang.annotation.Retention;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

	public boolean saveUser(User user) {
		boolean saved = false;
		try {

			String query = "INSERT INTO users(name, email, password, about, gender) values(?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getAbout());
			pstmt.setString(5, user.getGender());

			pstmt.executeUpdate();

			saved = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return saved;
	}

	// user Exist or not
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

	// get user by user email and password (login)
	public User getUserByEmailAndPassword(String email, String password) {

		User user = null;

		try {

			String query = "select * from users where email=? and password=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);

			ResultSet res = pstmt.executeQuery();

			if (res.next()) {
				user = new User();

				user.setId(res.getInt("id"));
				user.setName(res.getString("name"));
				user.setEmail(res.getString("email"));
				user.setPassword(res.getString("password"));
				user.setAbout(res.getString("about"));
				user.setGender(res.getString("gender"));
				user.setrDate(res.getTimestamp("rDate"));
				user.setProfile(res.getString("profile"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	// update user
	public boolean updateUser(User user) {
		boolean updated = false;
		try {
			String query = "UPDATE users set name=?, password=?, about=?, profile=? where email=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getAbout());
			pstmt.setString(4, user.getProfile());
			pstmt.setString(5, user.getEmail());

			pstmt.executeUpdate();

			updated = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return updated;
	}

	// get user by id
	public User getUserById(int id) {
		User user = null;

		try {

			String query = "select * from users where id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			
			ResultSet res = pstmt.executeQuery();
			
			if(res.next()) {
				user = new User();
				user.setName(res.getString("name"));
				user.setProfile(res.getString("profile"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}
}
