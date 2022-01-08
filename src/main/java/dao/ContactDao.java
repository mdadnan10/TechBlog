package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import entities.Contact;

public class ContactDao {
	private Connection con;

	public ContactDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean Contacted(Contact contact) {
		boolean contacted = false;

		try {
			
			String query = "insert into contact(email, title, description, pic) values(?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, contact.getEmail());
			pstmt.setString(2, contact.getTitle());
			pstmt.setString(3, contact.getDescription());
			pstmt.setString(4, contact.getPic());
			
			pstmt.executeUpdate();

			contacted = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return contacted;
	}
}
