/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import entity.img;
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
public class ImgContext extends DBContext.DBContext {

    public ArrayList<img> getImgsofProduct(int idPro) {
          ArrayList<img> list = new ArrayList<>();
        try {
          
            String sql = "SELECT [img_ID]\n"
                    + "      ,[img_url]\n"
         
                    + "  FROM [dbo].[ImgProduct]\n"
                    + "  where [product_ID]=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, idPro);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                img i= new img();
                i.setId(rs.getInt("img_ID"));
                i.setUrl(rs.getString("img_url"));
                list.add(i);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ImgContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  list;
    }

}
