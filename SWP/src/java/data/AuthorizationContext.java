/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hoàng Sơn
 */
public class AuthorizationContext extends DBContext.DBContext {

    public String getRole(int id) {
        String result = null;
        try {
            String sql = "SELECT r.role_Name\n"
                    + "  FROM [dbo].[UserAccounts] ua\n"
                    + "  left join [dbo].[UserRole] ur\n"
                    + "  on ua.user_ID=ur.user_ID\n"
                    + "  left join [dbo].[Role] r\n"
                    + "  on r.role_ID=ur.role_ID\n"
                    + "  where ua.user_ID= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                result = rs.getString("role_Name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AuthorizationContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public int getRoleIDbyRoleName(String name) {
        int id = 0;
        try {
            String sql = "SELECT [role_ID]\n"
                    + "  FROM [dbo].[Role]\n"
                    + "  where [role_Name]=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                id = rs.getInt("role_ID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AuthorizationContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public ArrayList<String> getFeature(int role) {
        ArrayList<String> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "                    FROM  [dbo].[Role] r\n"
                    + "                \n"
                    + "	    left join \n"
                    + "[dbo].[Role_Feature] rf\n"
                    + "on rf.role_ID= r.role_ID\n"
                    + "left join [dbo].[Feature] f\n"
                    + "on f.fu_ID= rf.fu_ID\n"
                    + "where r.role_ID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, role);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("url"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AuthorizationContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }
}
