package helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	private static Connection con;

	public static Connection getConnection() {
		try {

			if (con == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");

				String url = "jdbc:mysql://localhost:3306/techblog";
				String user = "root";
				String password = "adnan@10";

				con = DriverManager.getConnection(url, user, password);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}
}
