package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/gesusers?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
	private static final String USER = "root";
	private static final String PASSWORD = "";

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Driver MySQL introuvable. Ajoutez mysql-connector-j-*.jar dans WEB-INF/lib", e);
		}
	}

	public static Connection get() throws SQLException {
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}
}
