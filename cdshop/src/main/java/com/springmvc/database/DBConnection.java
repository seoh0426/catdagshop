package com.springmvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
public static Connection getConnection() throws SQLException, ClassNotFoundException{
		
		Connection conn = null;
		
		String url="jdbc:mysql://localhost:3306/cdcdb?useSSL=false";
		System.out.println("url: " + url);
		String user = "root";
		System.out.println("root: " + user);
		String password = "1234";
		System.out.println("pw: " + password);
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		System.out.println("conn: " + conn);
		
		return conn;
	}
}
