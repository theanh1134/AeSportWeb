/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import DBContext.DBContext;
import entity.Blog;
import entity.Brand;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
  


/**
 *
 * @author Hoàng Sơn
 */
public class BrandContext extends DBContext {

    public ArrayList<Brand> getBrands() {
        ArrayList<Brand> list = new ArrayList<>();
        try {
            String sql = "SELECT [Brand_ID]\n"
                    + "      ,[Brand_Name]\n"
                    + "  FROM [dbo].[brand]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                    b.setId(rs.getInt("Brand_ID"));
                    b.setName(rs.getString("Brand_Name"));
                    list.add(b);
            }

 
        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
