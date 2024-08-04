package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    // Static method to establish a database connection
    private static Connection conn;

    //making private connection accessible with the getter
    public static Connection getconn() {
        try {
            // Loading the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establishing a connection to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlyphones", "root", "root");

        } catch (Exception e) {
            // Printing stack trace if an exception occurs
            e.printStackTrace();
        }
        // Returning the established connection
        return conn;
    }
}
