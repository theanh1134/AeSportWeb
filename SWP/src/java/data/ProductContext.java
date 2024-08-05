/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import Model.Category;
import Model.Color;
import Model.Discount;
import Model.Size;
import entity.ProductSizeColor;

import entity.SubCategory;
import entity.img;
import java.sql.*;
import entity.product;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hoàng Sơn
 */
public class ProductContext extends DBContext.DBContext {

    public ArrayList<product> getProductsonHomePage(String status) {
        ArrayList<product> list = new ArrayList<>();
        try {

            String sql = "SELECT *\n"
                    + "  FROM [dbo].[Product] p\n"
                    + "  join [dbo].[Home_Products] h\n"
                    + "  on p.product_ID= h.product_ID\n"
                    + "left join [dbo].[Discount] d\n"
                    + "on d.discount_ID= p.discount_ID"
                    + "  where p.status=? and h.home='true'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            ResultSet rs = stm.executeQuery();
            ImgContext imgDB = new ImgContext();
            while (rs.next()) {
                product p = new product();
                p.setProductID(rs.getInt("product_ID"));
                p.setProductName(rs.getString("product_Name"));
                p.setPrice(rs.getDouble("price"));
                ArrayList<img> listImg = imgDB.getImgsofProduct(rs.getInt("product_ID"));
                p.setImage(listImg);
                if ("sale".equals(status)) {
                    Discount d = new Discount();
                    d.setDiscount_ID(rs.getInt("discount_ID"));
                    d.setDiscount_Amount(rs.getInt("discount_amount"));
                    d.setStartDate(rs.getDate("start_date"));
                    d.setEndDate(rs.getDate("end_date"));
                    p.setDiscount(d);
                }

                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public product getProduct(int id) {
        product p = new product();
        try {
            String sql = "SELECT *\n"
                    + "                             FROM [dbo].[Product] p\n"
                    + "                              left join [dbo].[Discount] d\n"
                    + "                         on d.discount_ID = p.discount_ID\n"
                    + "	 left join  [dbo].[Subcategory] sc\n"
                    + "	on sc.Subcategory_ID= p.Subcategory_ID\n"
                    + "	 left join [dbo].[Category] ca\n"
                    + "	 on ca.category_ID= sc.category_ID\n"
                    + "                        where p.product_ID=?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                p.setProductID(rs.getInt("product_ID"));
                p.setProductName(rs.getString("product_Name"));
                p.setPrice(rs.getInt("price"));
                p.setStatus(rs.getString("status"));
                p.setDescription(rs.getString("description"));
                p.setQuantity_sold(rs.getInt("quantity_sold"));
                Discount d = new Discount();
                d.setDiscount_ID(rs.getInt("discount_ID"));
                d.setDiscount_Amount(rs.getInt("discount_amount"));
                SubCategory subCa = new SubCategory();
                subCa.setSubcategory_ID(rs.getInt("Subcategory_ID"));
                subCa.setSubcategory_Name(rs.getString("Subcategory_Name"));
                p.setSubCate(subCa);
                Category ca = new Category();
                ca.setCategory_ID(rs.getInt("category_ID"));
                ca.setCategory_Name(rs.getString("category_Name"));
                ca.setType(rs.getString("type"));
                p.setCate(ca);
                p.setDiscount(d);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public ArrayList<product> getproductByCondition(int Subcategory_ID, int category_ID, String type, String status) {
        ArrayList<product> list = new ArrayList<>();
        try {
            String sql = "SELECT p.product_ID,p.product_Name,p.price,d.discount_amount,d.discount_ID,b.Brand_ID,b.Brand_Name\n"
                    + "                 FROM [dbo].[Product] p\n"
                    + "               LEFT JOIN [dbo].[Subcategory] sc ON sc.Subcategory_ID = p.Subcategory_ID\n"
                    + "                LEFT JOIN [dbo].[Category] c ON c.Category_ID = sc.Category_ID\n"
                    + "                 LEFT JOIN [dbo].[Discount] d on d.discount_ID =p.discount_ID\n"
                    + "	 LEFT JOIN [dbo].[Home_Products] hp \n"
                    + "	 on hp.product_ID =p.product_ID\n"
                    + "	 LEFT JOIN [dbo].[brand] b\n"
                    + "	 on b.Brand_ID=p.brand_ID\n"
                    + "                 WHERE sc.Subcategory_ID = ?\n"
                    + "                   AND c.Category_ID = ?\n"
                    + "                     AND c.type = ?\n"
                    + "                  AND p.status = ?\n"
                    + "	AND hp.home='false';";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Subcategory_ID);
            stm.setInt(2, category_ID);
            stm.setString(3, type);
            stm.setString(4, status);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                product p = new product();
                p.setProductID(rs.getInt("product_ID"));
                p.setProductName(rs.getString("product_Name"));
                p.setPrice(rs.getDouble("price"));
                Discount d = new Discount();
                d.setDiscount_ID(rs.getInt("discount_ID"));
                d.setDiscount_Amount(rs.getInt("discount_amount"));
                p.setDiscount(d);
                list.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateProductonHome(int id, String status) {
        try {
            String sql = "UPDATE [dbo].[Home_Products]\n"
                    + "   SET [home] =?\n"
                    + " WHERE product_ID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<product> getproductsbyStatus(String status) {
        ArrayList<product> list = new ArrayList<>();
        try {
            String sqlString = "SELECT *\n"
                    + "                FROM [dbo].[Product] p      \n"
                    + "				left join  [dbo].[Subcategory] sc\n"
                    + "				on sc.Subcategory_ID= p.Subcategory_ID\n"
                    + "                left join [dbo].[Category] ca\n"
                    + "                   on ca.category_ID= sc.category_ID\n"
                    + "                   left  join [dbo].[Discount] d\n"
                    + "                 on d.discount_ID=p.discount_ID\n"
                    + "				 left join [dbo].[Home_Products] hp\n"
                    + "				 on hp.product_ID=p.product_ID\n"
                    + "\n"
                    + "                     where p.status=?";
            PreparedStatement stmPreparedStatement = connection.prepareStatement(sqlString);
            stmPreparedStatement.setString(1, status);
            ResultSet rs = stmPreparedStatement.executeQuery();
            while (rs.next()) {
                product p = new product();
                p.setProductID(rs.getInt("product_ID"));
                p.setProductName(rs.getString("product_Name"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity_sold(rs.getInt("quantity_sold"));
                SubCategory subCa = new SubCategory();
                subCa.setSubcategory_ID(rs.getInt("Subcategory_ID"));
                subCa.setSubcategory_Name(rs.getString("Subcategory_Name"));
                p.setSubCate(subCa);
                Category ca = new Category();
                ca.setCategory_ID(rs.getInt("category_ID"));
                ca.setCategory_Name(rs.getString("category_Name"));
                ca.setType(rs.getString("type"));
                p.setCate(ca);

                if ("sale".contains(status)) {
                    Discount d = new Discount();
                    d.setDiscount_ID(rs.getInt("discount_ID"));
                    d.setDiscount_Amount(rs.getInt("discount_amount"));
                    d.setStartDate(rs.getDate("start_date"));
                    d.setEndDate(rs.getDate("end_date"));
                    p.setDiscount(d);
                }

                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<product> getproductAllArrayListByCondition(int Subcategory_ID, int category_ID, String type, String status) {
        ArrayList<product> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "   FROM [dbo].[Product] p\n"
                    + "    LEFT JOIN [dbo].[Subcategory] sc ON sc.Subcategory_ID = p.Subcategory_ID\n"
                    + "     LEFT JOIN [dbo].[Category] c ON c.Category_ID = sc.Category_ID\n"
                    + "      LEFT JOIN [dbo].[Discount] d on d.discount_ID =p.discount_ID\n"
                    + "              	 LEFT JOIN [dbo].[Home_Products] hp\n"
                    + "                	 on hp.product_ID =p.product_ID\n"
                    + "                   LEFT JOIN [dbo].[brand] b\n"
                    + "                 	 on b.Brand_ID=p.brand_ID\n"
                    + "                                 WHERE sc.Subcategory_ID =?\n"
                    + "                                    AND c.Category_ID = ?\n"
                    + "                                    AND c.type = ?\n"
                    + "                                   AND p.status = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Subcategory_ID);
            stm.setInt(2, category_ID);
            stm.setString(3, type);
            stm.setString(4, status);
            ResultSet rs = stm.executeQuery();
            ImgContext i = new ImgContext();
            while (rs.next()) {
                product p = new product();
                p.setProductID(rs.getInt("product_ID"));
                p.setProductName(rs.getString("product_Name"));
                p.setPrice(rs.getDouble("price"));
                img img = new img();
                ArrayList<img> listImg = i.getImgsofProduct(rs.getInt("product_ID"));
                p.setImage(listImg);
                Discount d = new Discount();
                d.setDiscount_ID(rs.getInt("discount_ID"));
                d.setDiscount_Amount(rs.getInt("discount_amount"));
                d.setStartDate(rs.getDate("start_date"));
                d.setEndDate(rs.getDate("end_date"));
                p.setDiscount(d);
                list.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void deleteStatusProduct(int id) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET \n"
                    + "      [status] = 'normal'\n"
                    + "     \n"
                    + " WHERE [product_ID]=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateStatusProduct(int id, String status) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET \n"
                    + "      [status] = ?\n"
                    + "     \n"
                    + " WHERE [product_ID]=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            stm.setInt(2, id);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateDiscountProduct(int id, int discount) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET \n"
                    + "      [discount_ID] = ?\n"
                    + " WHERE product_ID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, discount);
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getLastIDDisCount() {
        int index = 0;
        try {
            String sql = "SELECT top 1 [discount_ID]\n"
                    + "      \n"
                    + "  FROM  [dbo].[Discount]\n"
                    + "  ORDER BY[discount_ID] DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                index = rs.getInt("discount_ID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return index;

    }

    public ArrayList<Size> getSizebyProductId(int id) {
        ArrayList<Size> list = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT s.size_ID, s.size_name\n"
                    + "FROM [dbo].[Size_Color] sc \n"
                    + "LEFT JOIN [dbo].[Size] s ON s.size_ID = sc.size_id\n"
                    + "WHERE sc.product_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Size s = new Size();
                s.setSize_ID(rs.getInt("size_ID"));
                s.setSize_Name(rs.getString("size_name"));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public ArrayList<Color> getColorbyProductId(int id) {
        ArrayList<Color> list = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT c.color_id,c.color_Name,c.color_code\n"
                    + "FROM [dbo].[Size_Color] sc \n"
                    + "LEFT JOIN [dbo].[Color] c\n"
                    + "on c.color_id =sc.color_id\n"
                    + "WHERE sc.product_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Color s = new Color();
                s.setColor_ID(rs.getInt("color_id"));
                s.setColor_Name(rs.getString("color_Name"));
                s.setCode(rs.getString("color_code"));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<product> getProductsbySubcategory(int subcategoryID) {
        ArrayList<product> list = new ArrayList<>();
        ImgContext imgDB = new ImgContext();
        String sql = "SELECT DISTINCT p.product_ID, "
                + "       p.product_name, "
                + "       p.price, "
                + "       p.discount_ID, "
                + "       d.discount_amount, "
                + "       d.discount_Name, "
                + "       d.start_date, "
                + "       d.end_date, "
                + "       p.description,"
                + "         p.status "
                + "FROM Product p "
                + "JOIN ImgProduct ip ON p.product_ID = ip.product_ID "
                + "LEFT JOIN Discount d ON d.discount_ID = p.discount_ID "
                + "WHERE p.Subcategory_ID = ?";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, subcategoryID);
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    product product = new product();
                    product.setProductID(rs.getInt("product_ID"));
                    product.setProductName(rs.getString("product_name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setStatus(rs.getString("status"));
                    ArrayList<img> listImg = imgDB.getImgsofProduct(rs.getInt("product_ID"));
                    product.setImage(listImg);

                    product.setDescription(rs.getString("description"));

                    Discount d = new Discount();
                    d.setDiscount_ID(rs.getInt("discount_ID"));
                    d.setDiscount_Amount(rs.getInt("discount_amount"));
                    d.setStartDate(rs.getDate("start_date"));
                    d.setEndDate(rs.getDate("end_date"));
                    product.setDiscount(d);
                    list.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
