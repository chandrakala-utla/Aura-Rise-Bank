package com.bank.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
            System.getenv("DB_URL");

    private static final String USERNAME =
            System.getenv("DB_USERNAME");

    private static final String PASSWORD =
            System.getenv("DB_PASSWORD");

    public static Connection getConnection() {

        Connection conn = null;

        try {

            Class.forName("org.postgresql.Driver");
            System.out.println("URL = " + URL);
            System.out.println("USERNAME = " + USERNAME);
            
            conn = DriverManager.getConnection(
                    URL,
                    USERNAME,
                    PASSWORD);

            conn.createStatement()
                .execute("SET TIME ZONE 'Asia/Kolkata'");

            System.out.println("Database Connected Successfully!");

        } catch (Exception e) {

            System.out.println("Database Connection Failed!");
            e.printStackTrace();
        }

        return conn;
    }
}