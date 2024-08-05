/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class OrderContext extends DBContext.DBContext {

    public void insertOrder(int userID, String status, int payID, double amount) {
        try {
            String sql = """
                         INSERT INTO [dbo].[Order]
                                    ([user_ID]
                                    ,[order_status]
                                    ,[order_date]
                                    ,[pay_ID]
                                    ,[total_amount])
                              VALUES
                                    (?
                                    ,?
                                    ,GETDATE()
                                    ,?
                                    ,?)""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            stm.setString(2, status);
            stm.setInt(3, payID);
            stm.setDouble(4, amount);
            stm.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(OrderContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
    }
    
    public int getLastOrderID(){
        try {
            String sql = """
                         SELECT top 1 [order_ID] as id FROM [SWP].[dbo].[Order] order by order_ID desc
                         """;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(OrderContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public void insertOrderDetail(int orderID, int productID, int quantity, int price) {
        try {
            String sql = """
                         INSERT INTO [dbo].[Order_item]
                                    ([order_ID]
                                    ,[product_ID]
                                    ,[quantity]
                                    ,[price_unit])
                              VALUES
                                    (?,?,?,?)
                         """;
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderID);
            stm.setInt(2, productID);
            stm.setInt(3, quantity);
            stm.setInt(4, price);
            stm.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(OrderContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
    }

}
