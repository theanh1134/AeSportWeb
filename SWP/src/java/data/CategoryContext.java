/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import Model.Category;
import entity.SubCategory;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hoàng Sơn
 */
public class CategoryContext extends DBContext.DBContext {

    public ArrayList<Category> getCategorys(String type) {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String sql = "SELECT [category_ID]\n"
                    + "                   ,[category_Name]\n"
                    + "                    ,[type]\n"
                    + "               FROM [dbo].[Category]\n"
                    + "			   where type=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, type);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategory_ID(rs.getInt("category_ID"));
                c.setCategory_Name(rs.getString("category_Name"));
                c.setType(rs.getString("type"));
                list.add(c);

            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<SubCategory> getSubCategorys(int id) {
        ArrayList<SubCategory> list = new ArrayList<>();
        try {
            String sql = "SELECT [SubCategory_ID]\n"
                    + "                   ,[SubCategory_Name]\n"
                    + "                   FROM [dbo].[SubCategory] \n"
                    + "				   where category_ID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                SubCategory s = new SubCategory();
                s.setSubcategory_ID(rs.getInt("SubCategory_ID"));
                s.setSubcategory_Name(rs.getString("SubCategory_Name"));
                list.add(s);

            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
