package com.abc.cinema.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author DON
 */
public class DbConnection {
    
    private static final String URL = "jdbc:mysql://localhost:3306/abc_cinema";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    
    public static Connection getConnection() throws SQLException {
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found", e);
        }
        
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
