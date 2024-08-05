/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import entity.sport;
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
public class SportContext extends DBContext.DBContext {

    public ArrayList<sport> getSports() {
        ArrayList<sport> list = new ArrayList<>();
        try {
            String sql = "SELECT [Sport_ID]\n"
                    + "      ,[Sport_Name]\n"
                    + "  FROM [dbo].[Sport]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                sport b = new sport();
                b.setSport_Id(rs.getInt("Sport_ID"));
                b.setSport_Name(rs.getString("Sport_Name"));
                list.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
