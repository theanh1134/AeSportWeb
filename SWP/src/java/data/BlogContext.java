/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import DBContext.DBContext;
import entity.Blog;
import entity.CategoryBlog;
import entity.StatusBlog;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hoàng Sơn
 */
public class BlogContext extends DBContext {

    public void updateNumber_of_views(int id) {
        int numberViewer = 0;
        try {
            String sqlGetNumber_Viewr = "SELECT [number_of_views] FROM [dbo].[Blog] WHERE blog_ID=?";
            PreparedStatement stmGetViewNumber = connection.prepareStatement(sqlGetNumber_Viewr);
            stmGetViewNumber.setInt(1, id);
            ResultSet rsGetNumberView = stmGetViewNumber.executeQuery();
            if (rsGetNumberView.next()) {
                numberViewer = rsGetNumberView.getInt("number_of_views");
            }

            // Tăng số lượt xem lên 1 đơn vị
            numberViewer++;

            String sqlIncrease = "UPDATE [dbo].[Blog] SET [number_of_views] = ? WHERE blog_ID=?";
            PreparedStatement stmIncrease = connection.prepareStatement(sqlIncrease);
            stmIncrease.setInt(1, numberViewer);
            stmIncrease.setInt(2, id);
            stmIncrease.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Blog> getBlogs() {
        ArrayList<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "     FROM [dbo].[Blog] b\n"
                    + "      join [dbo].[Status_Blog] sb\n"
                    + "       on b.blog_ID=sb.blog_ID\n"
                    + "       join [dbo].[category_Blog] cb\n"
                    + "     on cb.category_Id= b.category_Id\n"
                    + "       where \n"
                    + "        sb.status='done'\n"
                    + "        and sb.type='add' or sb.status='reject'\n"
                    + "         and sb.type='delete'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setBlog_ID(rs.getInt("blog_ID"));
                b.setDetail(rs.getString("detail"));
                b.setDate(rs.getDate("date"));
                b.setTitle(rs.getString("Title"));
                b.setAuthorString(rs.getString("author"));
                b.setNumber_of_views(rs.getInt("number_of_views"));
                b.setImg(rs.getString("img"));
                CategoryBlog ca = new CategoryBlog();
                ca.setId(rs.getInt("category_Id"));
                ca.setName(rs.getString("category_Name"));
                b.setCa(ca);
                list.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Blog> getBlogsPaging(int index) {
        ArrayList<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT b.blog_ID,b.Title,b.date,b.img,b.detail,b.author,b.number_of_views\n"
                    + "                FROM [dbo].[Blog] b\n"
                    + "	join [dbo].[Status_Blog] sb\n"
                    + "				on b.blog_ID=sb.blog_ID\n"
                    + "                 where [stype] != 1\n"
                    + "				 and sb.status='done'\n"
                    + "				 and sb.type='add'\n"
                    + "                   order BY b.blog_ID\n"
                    + "                  OFFSET ? rows fetch next 6 rows only;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 6);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setBlog_ID(rs.getInt("blog_ID"));
                b.setDetail(rs.getString("detail"));
                b.setDate(rs.getDate("date"));
                b.setTitle(rs.getString("Title"));
                b.setImg(rs.getString("img"));
                b.setAuthorString(rs.getString("author"));
                b.setNumber_of_views(rs.getInt("number_of_views"));
                list.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Blog getBlog(int blogID) {
        Blog b = new Blog();
        try {

            String sql = "SELECT *\n"
                    + "  FROM [dbo].[Blog]\n"
                    + "  where blog_ID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, blogID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                b.setBlog_ID(rs.getInt("blog_ID"));
                b.setDetail(rs.getString("detail"));
                b.setDate(rs.getDate("date"));
                b.setTitle(rs.getString("Title"));
                b.setImg(rs.getString("img"));
                b.setAuthorString(rs.getString("author"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;

    }

    public void insertBlog(String title, String img, String detail, int category_Id, String author) {

        try {
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            String formattedDate = currentDate.format(formatter);

            // Parse the date
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            java.util.Date utilDate = sdf.parse(formattedDate);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

            // SQL insert statement
            String sql = "INSERT INTO [dbo].[Blog] "
                    + "([Title], [img], [date], [detail], [stype], [category_Id], [author]) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            // Create the PreparedStatement
            PreparedStatement stm = connection.prepareStatement(sql);

            // Set parameters
            stm.setString(1, title);
            stm.setString(2, img);
            stm.setDate(3, sqlDate);
            stm.setString(4, detail);
            stm.setInt(5, 0); // Example stype value
            stm.setInt(6, category_Id);
            stm.setString(7, author);

            // Execute the insert
            stm.executeUpdate();

            int index = getLastIDBlog();

            String sqlStatusBlog = "INSERT INTO [dbo].[Status_Blog] "
                    + "([blog_ID], [status] ,[type]) "
                    + "VALUES (?, 'pending', 'add')";

            PreparedStatement stm2 = connection.prepareStatement(sqlStatusBlog);
            stm2.setInt(1, index);

            stm2.executeUpdate();

        } catch (SQLException | ParseException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

    public int getLastIDBlog() {
        int index = 0;
        try {
            String sql = "SELECT top 1 [blog_ID]\n"
                    + "      \n"
                    + "  FROM [dbo].[Blog]\n"
                    + "  ORDER BY [blog_ID] DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                index = rs.getInt("blog_ID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return index;

    }

    public Blog getMainBlog() {
        Blog bl = new Blog();
        try {
            String sql = "SELECT [blog_ID]\n"
                    + "      ,[Title]\n"
                    + "      ,[img]\n"
                    + "      ,[date]\n"
                    + "      ,[detail]"
                    + ",[stype]\n"
                    + "  FROM [dbo].[Blog]\n"
                    + "  where stype= 1";
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                bl.setBlog_ID(rs.getInt("blog_ID"));
                bl.setDetail(rs.getString("detail"));
                bl.setDate(rs.getDate("date"));
                bl.setTitle(rs.getString("Title"));
                bl.setImg(rs.getString("img"));
                bl.setStype(rs.getInt("stype"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
            return null;

        }
        return bl;

    }

    public void updateMainBlog(int blogID_update) {

        try {
            Blog mainBlog = getMainBlog();

            String sql_dele = "UPDATE [dbo].[Blog]"
                    + "SET [stype]=0"
                    + "WHERE blog_ID=?";
            PreparedStatement stm_dele = connection.prepareStatement(sql_dele);
            stm_dele.setInt(1, mainBlog.getBlog_ID());
            stm_dele.executeUpdate();

            String sql_update = "UPDATE [dbo].[Blog]"
                    + "SET [stype]=1"
                    + "WHERE blog_ID=?";
            PreparedStatement stm_update = connection.prepareStatement(sql_update);
            stm_update.setInt(1, blogID_update);
            stm_update.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

    public void updateBlog(int Blog_ID, String title, String img, String detail, int caID) {

        try {
            String sql_update = "UPDATE [dbo].[Blog] \n"
                    + "   SET [Title] = ?\n"
                    + "      ,[img] = ?\n"
                    + "      ,[detail] = ?\n"
                    + ",        [category_Id]=?"
                    + "    \n"
                    + " WHERE blog_ID=?";

            PreparedStatement stm_update = connection.prepareStatement(sql_update);
            stm_update.setString(1, title);
            stm_update.setString(2, img);
            stm_update.setString(3, detail);
            stm_update.setInt(4, caID);
            stm_update.setInt(5, Blog_ID);
            stm_update.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

    public ArrayList<CategoryBlog> getCategorysBlog() {
        ArrayList<CategoryBlog> list = new ArrayList<>();
        try {
            String sql = "SELECT [category_Id]\n"
                    + "      ,[category_Name]\n"
                    + "  FROM [dbo].[category_Blog]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CategoryBlog b = new CategoryBlog();

                b.setId(rs.getInt("category_Id"));
                b.setName(rs.getString("category_Name"));
                list.add(b);

            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Blog> getBlogsByCategory(int category_id) {
        ArrayList<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT b.blog_ID,b.Title,b.img,b.date,b.detail,cb.category_Name,b.category_Id\n"
                    + "  FROM [dbo].[Blog] b \n"
                    + "  join [dbo].[category_Blog] cb\n"
                    + "  on b.category_Id = cb.category_Id\n"
                    + "	where b.category_Id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, category_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setBlog_ID(rs.getInt("blog_ID"));
                b.setDetail(rs.getString("detail"));
                b.setDate(rs.getDate("date"));
                b.setTitle(rs.getString("Title"));
                b.setImg(rs.getString("img"));
                CategoryBlog ca = new CategoryBlog();
                ca.setId(rs.getInt("category_Id"));
                ca.setName(rs.getString("category_Name"));
                b.setCa(ca);
                list.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Blog> getRequestBlog(String type, String status) {
        ArrayList<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT b.blog_ID,b.Title,b.date,b.img,b.detail,b.author,b.number_of_views,cb.category_Id,cb.category_Name\n"
                    + "                              FROM [dbo].[Blog] b\n"
                    + "                 		join [dbo].[Status_Blog] sb\n"
                    + "               			on b.blog_ID=sb.blog_ID\n"
                    + "               join \n"
                    + "               [dbo].[category_Blog] cb\n"
                    + "              on b.category_Id=cb.category_Id\n"
                    + "                             where [stype] != 1\n"
                    + "                		 and sb.status=?\n"
                    + "                  			 and sb.type=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, status);

            stm.setString(2, type);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                CategoryBlog ca = new CategoryBlog();
                ca.setId(rs.getInt("category_Id"));
                ca.setName(rs.getString("category_Name"));
                b.setCa(ca);
                b.setBlog_ID(rs.getInt("blog_ID"));
                b.setDetail(rs.getString("detail"));
                b.setDate(rs.getDate("date"));
                b.setTitle(rs.getString("Title"));
                b.setImg(rs.getString("img"));
                b.setAuthorString(rs.getString("author"));
                b.setNumber_of_views(rs.getInt("number_of_views"));
                list.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateStatusBlog(int Blog_ID, String status, String type) {
        LocalDateTime now = LocalDateTime.now();
        Timestamp sqlTimestamp = Timestamp.valueOf(now);

        try {
            String sql_update = "UPDATE [dbo].[Status_Blog]\n"
                    + "   SET \n"
                    + "      [status] =?\n"
                    + "      ,[type] = ?\n"
                    + ",[time]=?"
                    + " WHERE blog_ID=?";

            PreparedStatement stm_update = connection.prepareStatement(sql_update);
            stm_update.setString(1, status);
            stm_update.setString(2, type);
            stm_update.setTimestamp(3, sqlTimestamp);
            stm_update.setInt(4, Blog_ID);
            stm_update.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

    public int getNumberRequest(String type) {
        int number = 0;
        try {
            String sql = "SELECT COUNT(*) as count\n"
                    + "  FROM [dbo].[Status_Blog] sb\n"
                    + "  where sb.status='pending' and sb.type=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, type);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                number = rs.getInt("count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return number;
    }

    public ArrayList<Blog> getHistoryRequestBlog(String type, String status) {
        ArrayList<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT   *\n"
                    + "           FROM [dbo].[Blog] b\n"
                    + "    join [dbo].[Status_Blog] sb\n"
                    + "        on b.blog_ID=sb.blog_ID\n"
                    + "                          join \n"
                    + "                             [dbo].[category_Blog] cb\n"
                    + "                           on b.category_Id=cb.category_Id"
                    + "                             where [stype] != 1\n"
                    + "                		 and sb.status !=?\n"
                    + "                  			 and sb.type=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            stm.setString(2, type);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                CategoryBlog ca = new CategoryBlog();
                StatusBlog sb = new StatusBlog();
                ca.setId(rs.getInt("category_Id"));
                ca.setName(rs.getString("category_Name"));
                b.setCa(ca);

                sb.setStatus(rs.getString("status"));

                Timestamp sqlTimestamp = rs.getTimestamp("time");
                sb.setTime(sqlTimestamp);

                sb.setType(rs.getString("type"));
                b.setStatusBlog(sb);
                b.setBlog_ID(rs.getInt("blog_ID"));
                b.setDetail(rs.getString("detail"));
                b.setDate(rs.getDate("date"));
                b.setTitle(rs.getString("Title"));
                b.setImg(rs.getString("img"));
                b.setAuthorString(rs.getString("author"));
                b.setNumber_of_views(rs.getInt("number_of_views"));
                list.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }



}
