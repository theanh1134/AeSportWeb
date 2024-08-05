/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

import Model.UserAccount;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 *
 */
public class AccountDAO extends DBContext {

    public boolean UpdateProfile(UserAccount user) {
        String sql = "UPDATE UserAccounts SET full_name = ?, email = ?, phone_number = ?, address = ? where user_ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getFull_Name());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPhone_number());
            st.setString(4, user.getAddress());
            st.setInt(5, user.getUse_ID());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println(e);
        }
        return false;
    }

    public UserAccount CheckLogin(String userName, String password) {
        String sql = "SELECT * FROM [dbo].[UserAccounts] where username = ? AND password_hash = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                UserAccount user = new UserAccount();
                user.setUse_ID(rs.getInt("user_ID"));
                user.setPassword(rs.getString("password_hash"));
                user.setAddress(rs.getString("address"));
                user.setFull_Name(rs.getString("full_name"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setUserName(rs.getString("username"));
                user.setStatus(rs.getString("status"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int insertUserAccount(UserAccount u) {
        int newId = 0;
        try {
            String sql = "insert into [UserAccounts]([address],[password_hash],[username],[full_name],[email],[phone_number],[status],[dateCreate]) values(?,?,?,?,?,?,'none',?)";
            PreparedStatement st = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            st.setString(1, u.getAddress());
            st.setString(2, u.getPassword());
            st.setString(3, u.getUserName());
            st.setString(4, u.getFull_Name());
            st.setString(5, u.getEmail());
            st.setString(6, u.getPhone_number());
            st.setDate(7, u.getDateCreate());

            int affectedRows = st.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        newId = (int) generatedKeys.getLong(1);
                    } else {
                        throw new SQLException("Creating account failed, no ID obtained.");
                    }
                }
            }
            return newId;
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public boolean validateUserName(String userName) {
        String sql = "SELECT * FROM [dbo].[UserAccounts] where username = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void updateStatusAccount(int id) {
        try {
            String sql = "UPDATE [dbo].[UserAccounts]\n"
                    + "   SET \n"
                    + "      [status] = 'active'\n"
                    + "     \n"
                    + " WHERE user_ID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateUserAccount(String newpass, int userId) {
        try {
            String sql = " UPDATE [UserAccounts] SET [password_hash] = ? WHERE [user_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, newpass);
            st.setInt(2, userId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public int GetAccountByEmail(String email) {
        String sql = "SELECT * FROM [dbo].[UserAccounts] WHERE email = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("user_ID");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In ra stack trace để biết thêm chi tiết lỗi
        }
        return 0;
    }

    public String getAddress(int userId) {
        String address = null;
        String sql = "SELECT [address] FROM [dbo].[UserAddresses] WHERE [user_ID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                address = rs.getString("address");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return address;
    }

    public void change(String password, String userName) {
        String sql = "UPDATE [dbo].[UserAccounts] SET [password_hash] = ? WHERE [username]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, userName);
            st.executeUpdate(); // Use executeUpdate() for update operations
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    // Phương thức để lấy báo cáo đăng ký người dùng

    public Map<String, Integer> getAllUserRegistrationReport() {
        String sql = "SELECT dateCreate, COUNT(*) as registration_count FROM UserAccounts GROUP BY dateCreate";
        Map<String, Integer> report = new TreeMap<>(); // TreeMap để tự động sắp xếp theo key
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy"); // Định dạng ngày
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String date = rs.getString("dateCreate");
                String formattedDate = dateFormat.format(rs.getDate("dateCreate")); // Định dạng ngày
                report.put(formattedDate, rs.getInt("registration_count"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return report;
    }

    public int getRegistrationsToday() {
        String sql = "SELECT COUNT(*) FROM UserAccounts WHERE dateCreate = CAST(GETDATE() AS DATE)";
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getRegistrationsThisWeek() {
        String sql = "SELECT COUNT(*) FROM UserAccounts WHERE DATEPART(WEEK, dateCreate) = DATEPART(WEEK, GETDATE()) AND DATEPART(YEAR, dateCreate) = DATEPART(YEAR, GETDATE())";
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getRegistrationsThisMonth() {
        String sql = "SELECT COUNT(*) FROM UserAccounts WHERE DATEPART(MONTH, dateCreate) = DATEPART(MONTH, GETDATE()) AND DATEPART(YEAR, dateCreate) = DATEPART(YEAR, GETDATE())";
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

//lấy tất cả tài khoản
    public List<UserAccount> getAllUsers() {
        List<UserAccount> userList = new ArrayList<>();
        String sql = "SELECT * FROM UserAccounts";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    UserAccount user = new UserAccount(
                            rs.getInt("user_ID"),
                            rs.getString("address"),
                            rs.getString("password_hash"),
                            rs.getString("username"),
                            rs.getString("full_name"),
                            rs.getString("email"),
                            rs.getString("phone_number")
                    );
                    userList.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();

        // Test getRegistrationsToday
        int registrationsToday = dao.getRegistrationsToday();
        System.out.println("Registrations Today: " + registrationsToday);

        // Test getRegistrationsThisWeek
        int registrationsThisWeek = dao.getRegistrationsThisWeek();
        System.out.println("Registrations This Week: " + registrationsThisWeek);

        // Test getRegistrationsThisMonth
        int registrationsThisMonth = dao.getRegistrationsThisMonth();
        System.out.println("Registrations This Month: " + registrationsThisMonth);

        // Test getAllUsers
        List<UserAccount> userList = dao.getAllUsers();
        System.out.println("All Users:");
        for (UserAccount user : userList) {
            System.out.println(user);
        }
    }

}
