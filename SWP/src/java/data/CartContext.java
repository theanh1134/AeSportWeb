/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import java.sql.*;

/**
 *
 * @author Hoàng Sơn
 */
public class CartContext extends DBContext.DBContext {

    public int countProductInCart() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) as count"
                    + "  FROM [dbo].[Cart]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CartContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

        return count;

    }
}
