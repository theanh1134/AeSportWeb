/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

import Model.Feedback;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOFeedback extends DBContext {

    public ArrayList<Feedback> list() {
        ArrayList<Feedback> fb = new ArrayList<>();

        try {
            String sql = "select UserAccounts.username, Feedback.detal, Feedback.img\n"
                    + "from Feedback \n"
                    + "join UserAccounts on Feedback.user_ID = UserAccounts.user_ID";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Feedback a = new Feedback();
                a.setUsername(rs.getString("username"));
                a.setDetal(rs.getString("detal"));
                a.setImg(rs.getString("img"));
                fb.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedback.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fb;
    }

    public List<Feedback> pagingFeedback(int index) {
        List<Feedback> list = new ArrayList<>();
        try {
            String sql = "select UserAccounts.username, Feedback.detal, Feedback.img\n"
                    + "from Feedback\n"
                    + "join UserAccounts on Feedback.user_ID = UserAccounts.user_ID\n"
                    + "order BY fe_ID\n"
                    + "OFFSET ? rows fetch next 5 rows only;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 5);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback a = new Feedback();
                a.setUsername(rs.getString("username"));
                a.setDetal(rs.getString("detal"));
                a.setImg(rs.getString("img"));
                list.add(a);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public void insertFeedback(int user_ID, String detal, String img) {
        String sql = "INSERT INTO [dbo].[Feedback]\n"
                + "           ([user_ID],[detal],[img])\n"
                + "     VALUES(?,?,?)";
        try (
                PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, user_ID);
            stm.setString(2, detal);
            stm.setString(3, img);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedback.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int gettotalfeedback() {
        try {
            String sql = "select COUNT(*) from Feedback";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Feedback> getFeedbacksByUsername(String username) throws Exception {
        List<Feedback> fb = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Feedback\n"
                    + "join UserAccounts on Feedback.user_ID = UserAccounts.user_ID \n"
                    + "WHERE UserAccounts.username LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + username + "%");
            try (
                    ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Feedback feedback = new Feedback();

                    feedback.setUsername(rs.getString("username"));
                    feedback.setDetal(rs.getString("detal"));
                    feedback.setImg(rs.getString("img"));
                    fb.add(feedback);
                }
            }
        } catch (SQLException e) {
        }
        return fb;
    }

    public List<Feedback> getFeedbackByProductId(int product_ID) {
        List<Feedback> feedbackList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Feedback\n"
                    + "JOIN UserAccounts ON Feedback.user_ID = UserAccounts.user_ID\n"
                    + "WHERE Feedback.product_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, product_ID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setUsername(rs.getString("username"));
                feedback.setDetal(rs.getString("detal"));
                feedback.setImg(rs.getString("img"));
                feedback.setStart(rs.getInt("start"));
                feedbackList.add(feedback);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedback.class.getName()).log(Level.SEVERE, null, ex);
        }
        return feedbackList;
    }

    public void saveFeedback(int use_ID, String detal, String start, String img) throws SQLException {
        String sql = "INSERT INTO [dbo].[Feedback]\n"
                + "           ([img]\n"
                + "           ,[detal]\n"
                + "           ,[user_ID]\n"
                + "           ,[start])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";

        try (
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, img);
            statement.setString(2, detal);
            statement.setInt(3, use_ID);
            statement.setString(4, start);
            statement.executeUpdate();
        }
    }
}
