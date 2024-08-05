/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

import java.sql.*;

/**
 *
 * @author Hoàng Sơn
 */
public abstract class DBContext {

    protected Connection connection;

    public DBContext() {
        try {

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=SWP";
            String user = "sa";
            String password = "12345";
            connection = DriverManager.getConnection(url, user, password);
            
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
}
