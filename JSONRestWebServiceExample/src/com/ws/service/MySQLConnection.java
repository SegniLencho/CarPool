package com.ws.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnection {
	private static MySQLConnection instance = new MySQLConnection();
    public static final String URL = "jdbc:mysql://localhost/carpoolingdb";
    public static final String USER = "root";
    public static final String PASSWORD = "vertrigo";
    public static final String DRIVER_CLASS = "com.mysql.jdbc.Driver";
    
    private MySQLConnection() {
        try {
            //Step 2: Load MySQL Java driver
            Class.forName(DRIVER_CLASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
     
    private Connection createConnection() {
 
    	Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            System.out.println("ERROR: Unable to Connect to Database.");
            e.printStackTrace();
        }
        return connection;
    }   
     
    public static synchronized Connection getConnection() {
    	return instance.createConnection();
    }
}
