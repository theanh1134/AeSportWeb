/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

import Model.Address;
import Model.Category;
import Model.Color;
import Model.Discount;
import entity.Brand;
import Model.EmployeeAccount;
import Model.Feature;
import Model.ImgProduct;

import Model.OrderItem;
import Model.Product;
import Model.ProductSizeColor;
import Model.Role;
import Model.Size;
import Model.SubCategory;
import Model.UserAccount;

import Model.UserRole;
import entity.sport;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class AdminDAO extends DBContext {

// PRODUCT ===================================================================================================================================================
    // lấy ra tất cả ảnh của 1 product theo ID
    public ArrayList<ImgProduct> getImgProductByProductID(int pid) {
        ArrayList<ImgProduct> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[ImgProduct] where [product_ID]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ImgProduct ip = new ImgProduct(rs.getInt("img_ID"),
                        rs.getString("img_url"),
                        rs.getInt("product_ID")
                );
                list.add(ip);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // lấy tất cả product trong hệ thống
    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [Product]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("product_ID"),
                        rs.getInt("feedback_ID"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getString("status"),
                        rs.getInt("Sport_ID"),
                        rs.getString("product_Name"),
                        rs.getInt("brand_ID"),
                        rs.getInt("Inventory_number"),
                        rs.getInt("discount_ID"),
                        rs.getInt("Subcategory_ID"),
                        rs.getDouble("import_price"));
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // lấy tất cả productSizeColor theo ProductID
    public ArrayList<ProductSizeColor> getAllProductSizeColorByPID(int pID) {
        ArrayList<ProductSizeColor> list = new ArrayList<>();
        String sql = " SELECT * FROM [Size_Color] WHERE [product_ID] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductSizeColor psc = new ProductSizeColor(
                        rs.getInt("size_id"),
                        rs.getInt("color_id"),
                        rs.getInt("product_ID"),
                        rs.getInt("quantity"));
                list.add(psc);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // lấy ra 1 product theo tên
    public Product getProductByName(String name) {
        String sql = "SELECT * FROM [dbo].[Product] where [product_Name]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getInt("product_ID"),
                        rs.getInt("feedback_ID"),
                        rs.getInt("price"),
                        rs.getString("description"),
                        rs.getString("status"),
                        rs.getInt("Sport_ID"),
                        rs.getString("product_Name"),
                        rs.getInt("brand_ID"),
                        rs.getInt("Inventory_number"),
                        rs.getInt("discount_ID"),
                        rs.getInt("Subcategory_ID"),
                        rs.getInt("import_price"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // lấy ra 1 product theo tên
    public Product getProductByID(int id) {
        String sql = "SELECT * FROM [dbo].[Product] where [product_ID]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getInt("product_ID"),
                        rs.getInt("feedback_ID"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getString("status"),
                        rs.getInt("Sport_ID"),
                        rs.getString("product_Name"),
                        rs.getInt("brand_ID"),
                        rs.getInt("Inventory_number"),
                        rs.getInt("discount_ID"),
                        rs.getInt("Subcategory_ID"),
                        rs.getDouble("import_price"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Thêm 1 sản phẩm 
    public boolean insertProduct(Product p) {
        try {
            String sql = "insert into [Product]([price],[description],[status],[Sport_ID],[product_Name],[Brand_ID],[Subcategory_ID],[import_price]) values(?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setDouble(1, p.getPrice());
            st.setString(2, p.getDescription());
            st.setString(3, p.getStatus());
            st.setInt(4, p.getSportID());
            st.setString(5, p.getProductName());
            st.setInt(6, p.getBrandID());
            st.setInt(7, p.getSubcategoryID());
            st.setDouble(8, p.getImport_price());
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

    }

    // Thêm 1 ảnh vào sản phẩm
    public void insertImgProduct(String img, int productID) {
        try {
            String sql = "insert into [ImgProduct]([img_url], [product_ID]) values(?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, img);
            st.setInt(2, productID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // getLastInsertedProductId()
    public int getLastInsertedProductId() {
        int productId = 0;
        try {
            String sql = "SELECT TOP 1 [product_ID] FROM [SWP].[dbo].[Product] ORDER BY [product_ID] DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                productId = rs.getInt("product_ID");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return productId;
    }

    // thêm vào bảng Color_Size
    public void insertProduct_Color_Size(int colorID, int sizeID, int productID, int quantity) {
        try {
            String sql = "insert into [Size_Color]([color_id],[size_id],[quantity],[product_ID]) values(?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, colorID);
            st.setInt(2, sizeID);
            st.setInt(3, quantity);
            st.setInt(4, productID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // Update bảng Color_Size
    public void updateProductColorSize(int colorID, int sizeID, int productID, int quantity) {
        try {
            String sql = " UPDATE [Size_Color] SET [quantity] = ? WHERE [color_id] = ? and [size_id] = ? and [product_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, quantity);
            st.setInt(2, colorID);
            st.setInt(3, sizeID);
            st.setInt(4, productID);

            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // lấy 1 Color_Size bằng colorID, int sizeID, int productID
    public ProductSizeColor getProductSizeColorByID(int colorID, int sizeID, int productID) {
        String sql = "SELECT * FROM [dbo].[Size_Color] where [color_id]=? and [size_id] = ? and [product_ID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, colorID);
            st.setInt(2, sizeID);
            st.setInt(3, productID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ProductSizeColor psc = new ProductSizeColor(
                        rs.getInt("color_id"),
                        rs.getInt("size_id"),
                        rs.getInt("quantity"),
                        rs.getInt("product_ID")
                );
                return psc;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // update Số lượng sẳn phẩm trong kho khi thêm ;
    public void updateAmountProduct() {
        try {
            String sql = " UPDATE Product\n"
                    + "SET Inventory_number = (\n"
                    + "    SELECT SUM(quantity)\n"
                    + "    FROM Size_Color\n"
                    + "    WHERE Size_Color.product_ID = Product.product_ID\n"
                    + ");";
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // Chỉnh sửa sản phẩm
    public boolean updateProduct(Product p) {
        try {
            String sql = " UPDATE [Product] SET [price] = ?, [description] = ?,[status] = ?,[Sport_ID] = ?,[product_Name] = ?, [Brand_ID] = ?, [Subcategory_ID] = ?,[discount_ID] = ?, [import_price] = ? WHERE [product_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setDouble(1, p.getPrice());
            st.setString(2, p.getDescription());
            st.setString(3, p.getStatus());
            st.setInt(4, p.getSportID());
            st.setString(5, p.getProductName());
            st.setInt(6, p.getBrandID());
            st.setInt(7, p.getSubcategoryID());
            st.setInt(8, p.getDiscountID());
            st.setDouble(9, p.getImport_price());
            st.setInt(10, p.getProductID());
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    // xóa 1 sản phẩm 
    public void deleteProductByID(int productId) {

        try {
            deleteProductCart(productId);
            deleteProductHome(productId);
            deleteProductSizeColor(productId);
            deleteProductImg(productId);
            String sql = "delete from [Product] where [product_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa ảnh sản phẩm productHome
    public void deleteProductHome(int productId) {

        try {
            String sql = "delete from [Home_Products] where [product_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa ảnh sản phẩm productCart
    public void deleteProductCart(int productId) {

        try {
            String sql = "delete from [Cart] where [product_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa ảnh sản phẩm bằng pID
    public void deleteProductImg(int productId) {

        try {
            String sql = "delete from [ImgProduct] where [product_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa ảnh sản phẩm bằng imgID
    public void deleteProductImgByimgID(int imgID) {

        try {
            String sql = "delete from [ImgProduct] where [img_ID] = ? ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, imgID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa sizecolor sản phẩm 
    public void deleteProductSizeColor(int productId) {

        try {
            String sql = "delete from [Size_Color] where [product_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa sizecolor sản phẩm 
    public void deleteProductSizeColor(int colorID, int sizeID, int productID) {

        try {
            String sql = "delete from [Size_Color] where [product_ID] = ? AND [color_id] = ? AND [size_id] = ? ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setInt(2, colorID);
            st.setInt(3, sizeID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // Khiểm tra sản phẩm đang có trông order nào không
    public OrderItem getOrderItemByProductID(int id) {
        String sql = "SELECT * FROM [dbo].[Order_item] where [product_ID]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                OrderItem o = new OrderItem(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getFloat(4)
                );
                return o;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

// COLOR=====================================================================================================================================
    // Lấy ra tất cả màu của hệ thống
    public ArrayList<Color> getAllColor() {
        ArrayList<Color> list = new ArrayList<>();
        String sql = "SELECT * FROM [Color]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Color c = new Color(rs.getInt("color_id"),
                        rs.getString("color_Name"),
                        rs.getString("color_code"));
                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // lấy ra 1 Color theo tên ColorName
    public Color getColorByName(String name) {
        String sql = "SELECT * FROM [dbo].[Color] where [color_Name]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Color c = new Color(
                        rs.getInt(1),
                        rs.getString(2)
                );
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // lấy ra 1 Color theo tên ColorID
    public Color getColorByCID(int cID) {
        String sql = "SELECT * FROM [dbo].[Color] where [color_id]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Color c = new Color(
                        rs.getInt(1),
                        rs.getString(2)
                );
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // thêm 1 màu vào bẳng Color
    public void insertColor(String name, String code) {
        try {
            String sql = "insert into [Color]([color_Name], [color_code]) values(?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            st.setString(2, code);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa 1 màu by color_ID
    public void deleteColorByID(int colorID) throws Exception {

        try {
            String sql = "delete from [Color] where [color_id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, colorID);
            st.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }

// SIZE =====================================================================================================================================
    // Lấy ra tất cả kích cỡ của hệ thống
    public ArrayList<Size> getAllSize() {
        ArrayList<Size> list = new ArrayList<>();
        String sql = "SELECT * FROM [Size]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Size s = new Size(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));
                list.add(s);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // lấy ra 1 Size theo tên SizeName
    public Size getSizeByName(String name) {
        String sql = "SELECT * FROM [dbo].[Size] where [size_name]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Size s = new Size(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // lấy ra 1 Size theo tên SizeID
    public Size getSizeBySID(int sID) {
        String sql = "SELECT * FROM [dbo].[Size] where [size_ID]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Size s = new Size(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // thêm 1 thương hiệu vào bẳng Brand
    public void insertSize(String name, String type) {
        try {
            String sql = "insert into [Size]([size_name],[size_type]) values(?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            st.setString(2, type);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa 1 Size by size_ID
    public void deleteSizeByID(int sizeID) throws Exception {

        try {
            String sql = "delete from [Size] where [size_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sizeID);
            st.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }

// BRAND=====================================================================================================================================
    // Lấy ra tất cả thương hiệu của hệ thống
    public ArrayList<Brand> getAllBrand() {
        ArrayList<Brand> list = new ArrayList<>();
        String sql = "SELECT * FROM [Brand]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand(rs.getInt(1),
                        rs.getString(2));
                list.add(b);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // lấy ra 1 Brand theo tên brandName
    public Brand getBrandByName(String name) {
        String sql = "SELECT * FROM [dbo].[Brand] where [Brand_Name]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Brand b = new Brand(
                        rs.getInt(1),
                        rs.getString(2)
                );
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // thêm 1 thương hiệu vào bẳng Brand
    public void insertBrand(String name) {
        try {
            String sql = "insert into [Brand]([Brand_Name]) values(?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa 1 thương hiệu by Brand_ID
    public void deleteBrandByID(int brandID) throws Exception {

        try {
            String sql = "delete from [Brand] where [Brand_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, brandID);
            st.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }

// DISCOUNT=====================================================================================================================================
    // Lấy ra tất cả Discount của hệ thống
    public ArrayList<Discount> getAllDiscount() {
        ArrayList<Discount> list = new ArrayList<>();
        String sql = "SELECT * FROM [Discount]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discount d = new Discount(rs.getInt("discount_ID"),
                        rs.getInt("discount_amount"),
                        rs.getString("discount_Name"),
                        rs.getDate("start_date"),
                        rs.getDate("end_date")
                );
                list.add(d);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // lấy ra 1 Discount theo tên ID
    public Discount getDiscountByID(int dID) {
        String sql = "SELECT * FROM [dbo].[Discount] where [discount_ID]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, dID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Discount d = new Discount(rs.getInt("discount_ID"),
                        rs.getInt("discount_amount"),
                        rs.getString("discount_Name"),
                        rs.getDate("start_date"),
                        rs.getDate("end_date")
                );
                return d;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // lấy ra 1 Discount theo tên Name
    public Discount getDiscountByName(String name) {
        String sql = "SELECT * FROM [dbo].[Discount] where [discount_Name]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Discount d = new Discount(rs.getInt("discount_ID"),
                        rs.getInt("discount_amount"),
                        rs.getString("discount_Name"),
                        rs.getDate("start_date"),
                        rs.getDate("end_date")
                );
                return d;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // thêm 1 Discount
    public void insertDiscount(Discount newdiscount) throws Exception {
        try {
            String sql = "insert into [Discount]([discount_amount],[discount_Name],[start_date],[end_date]) values(?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, newdiscount.getDiscount_Amount());
            st.setString(2, newdiscount.getDiscount_Name());
            st.setDate(3, newdiscount.getStartDate());
            st.setDate(4, newdiscount.getEndDate());
            st.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }

    // Update 1 Discount
    public void updateDiscount(Discount d) throws Exception {
        try {
            String sql = " UPDATE [Discount] SET [discount_amount] = ?, [discount_Name] = ?, [start_date] = ?, [end_date] = ?  WHERE [discount_ID] = ? ";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, d.getDiscount_Amount());
            st.setString(2, d.getDiscount_Name());
            st.setDate(3, d.getStartDate());
            st.setDate(4, d.getEndDate());
            st.setInt(5, d.getDiscount_ID());
            st.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }

    // xóa 1 Discount by ID
    public void deleteDiscountByID(int dID) throws Exception {

        try {
            String sql = "delete from [Discount] where [discount_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, dID);
            st.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    // xóa 1 Discount khi hết thời hạn
    public void deleteExpiredDiscounts() throws Exception {
    try {
        String sql = "DELETE FROM [Discount] WHERE [end_date] < GETDATE()";
        PreparedStatement st = connection.prepareStatement(sql);
        st.executeUpdate();
    } catch (Exception e) {
        throw e;
    }
}


// SPORT =====================================================================================================================================
    // Lấy ra tất cả môn thể thao của hệ thống
    public ArrayList<sport> getAllSport() {
        ArrayList<sport> list = new ArrayList<>();
        String sql = "SELECT * FROM [Sport]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                sport s = new sport(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));
                list.add(s);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Lấy ra tất cả tên môn thể thao của hệ thống không giống nhau
    public ArrayList<String> getAllNameSport() {
        ArrayList<String> list = new ArrayList<>();
        String sql = "SELECT DISTINCT [Sport_Name] FROM [Sport]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Lấy ra môn thể thao bằng tên và clb
    public sport getSportByNameAndClb(String name, String clb) {
        String sql = "SELECT * FROM [dbo].[Sport] where [Sport_Name]=? AND [Clb_Name]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, clb);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                sport b = new sport(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Lấy ra môn thể thao bằng tên 
    public ArrayList<sport> getAllSportByName(String name) {
        ArrayList<sport> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Sport] where [Sport_Name]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                sport b = new sport(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));
                list.add(b);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // thêm 1 môn thể thao vào bẳng Sport
    public void insertSport(String name, String clb) {
        try {
            String sql = "insert into [Sport]([Sport_Name],[Clb_Name]) values(?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            st.setString(2, clb);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa 1 môn thể thao by sport_ID
    public void deleteSportByID(int sportID) throws Exception {

        try {
            String sql = "delete from [Sport] where [Sport_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sportID);
            st.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }

// CATEGORY =====================================================================================================================================
    // Lấy ra tất cả thể loại
    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM [Category]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));
                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Lấy ra tất cả kiểu trong bảng thể loại không giống nhau
    public ArrayList<String> getAllTypeCategory() {
        ArrayList<String> list = new ArrayList<>();
        String sql = "SELECT DISTINCT [type] FROM [Category]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Lấy ra thể loại bằng tên và type
    public Category getCategoryByNameAndType(String name, String type) {
        String sql = "SELECT * FROM [dbo].[Category] where [category_Name]=? AND [type]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, type);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category b = new Category(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Lấy ra thể loại bằng ID
    public Category getCategoryByID(int categoryID) {
        String sql = "SELECT * FROM [dbo].[Category] where [category_ID]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category b = new Category(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Lấy ra thể loại bằng Type
    public ArrayList<Category> getAllCategoryByType(String type) {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Category] where [type]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));
                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // thêm 1 thể loại vào bẳng Category
    public void insertCategory(String name, String type) {
        try {
            String sql = "insert into [Category]([category_Name],[type]) values(?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            st.setString(2, type);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa 1 thể loại by [category_ID]
    public void deleteCategoryByID(int categoryID) throws Exception {

        try {
            String sql = "delete from [Category] where [category_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            st.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }

// SUBCATEGORY =====================================================================================================================================
    // Lấy ra tất cả thể loại con
    public ArrayList<SubCategory> getAllSubCategory() {
        ArrayList<SubCategory> list = new ArrayList<>();
        String sql = "SELECT * FROM [Subcategory]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SubCategory c = new SubCategory(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3));
                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Lấy ra tất cả thể loại trong bảng thể loại con không giống nhau
    public ArrayList<Integer> getAllCategoryOfSubCategory() {
        ArrayList<Integer> list = new ArrayList<>();
        String sql = "SELECT DISTINCT [category_ID] FROM [Subcategory]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Lấy ra thể loại con bằng tên và categoryID
    public SubCategory getSubCategoryByNameAndCategoryID(String name, int categoryID) {
        String sql = "SELECT * FROM [dbo].[Subcategory] where [Subcategory_Name]=? AND [category_ID]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, categoryID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                SubCategory b = new SubCategory(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3)
                );
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Lấy ra thể loại con bằng ID 
    public SubCategory getSubCategoryByID(int ID) {
        String sql = "SELECT * FROM [dbo].[Subcategory] where [Subcategory_ID]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                SubCategory su = new SubCategory(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3)
                );
                return su;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // thêm 1 thể loại con vào bẳng SubCategory
    public void insertSubCategory(String name, int category_ID) {
        try {
            String sql = "insert into [Subcategory]([Subcategory_Name],[category_ID]) values(?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            st.setInt(2, category_ID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa 1 thể loại nhỏ by [subcategoryID]
    public void deleteSubCategoryByID(int subcategoryID) throws Exception {

        try {
            String sql = "delete from [Subcategory] where [Subcategory_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subcategoryID);
            st.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }

    // Lấy ra typeCategory của Subcategory by subcategory_Name
    public String getTypeCategoryBySubcategoryID(int SubCaID) {
        String sql = "SELECT c.type\n"
                + "FROM Subcategory s\n"
                + "JOIN Category c ON s.category_ID = c.category_ID\n"
                + "WHERE s.Subcategory_ID = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, SubCaID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String type = rs.getString(1);

                return type;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

// FEATURE========================================================================================================================================
    // Lấy ra tất cả chức năng của hệ thống
    public ArrayList<Feature> getAllFeature() {
        ArrayList<Feature> list = new ArrayList<>();
        String sql = "SELECT * FROM [Feature]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feature f = new Feature(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));
                list.add(f);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Lấy ra tất cả chức năng của 1 Role
    public ArrayList<Feature> getAllFeatureOfRole(int roleID) {
        ArrayList<Feature> list = new ArrayList<>();
        String sql = "SELECT * FROM [Role_Feature] WHERE [role_ID] =? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feature f = getFeatureByID(rs.getInt(1));
                list.add(f);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // lấy ra 1 Feature theo tên featureName
    public Feature getFeatureByName(String featureName) {
        String sql = "SELECT * FROM [dbo].[Feature] where [fu_Name]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, featureName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Feature feature = new Feature(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
                return feature;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // lấy ra 1 Feature theo tên featureID
    public Feature getFeatureByID(int featureID) {
        String sql = "SELECT * FROM [dbo].[Feature] where [fu_ID]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, featureID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Feature feature = new Feature(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
                return feature;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // thêm 1 Feature vào bẳng Feature
    public void insertFeature(String name, String url) {
        try {
            String sql = "insert into [Feature]([fu_Name],[url]) values(?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            st.setString(2, url);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // thêm 1 dữ liệu vào bẳng  RoleFeature
    public void insertRoleFeature(int feID, int roleID) {
        try {
            String sql = "insert into [Role_Feature]([fu_ID],[role_ID]) values(?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, feID);
            st.setInt(2, roleID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa tất dữ liêu trong bảng RoleFeature khi có roleID
    public void deleteRoleFeatureByID(int roleID) {

        try {
            String sql = "delete from [Role_Feature] where [role_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa 1 feature by fe_ID
    public void deleteFeatureByID(int feID) throws Exception {

        try {
            String sql = "delete from [Feature] where [fu_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, feID);
            st.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }

// USERACCOUNT==========================================================================================================================
    // Lấy ra tất cả tài khoản người dùng
    public ArrayList<UserAccount> getAllUserAccount() {
        ArrayList<UserAccount> list = new ArrayList<>();
        String sql = "SELECT UA.*\n"
                + "FROM [SWP].[dbo].[UserAccounts] UA\n"
                + "LEFT JOIN [SWP].[dbo].[UserRole] UR\n"
                + "ON UA.[user_ID] = UR.[user_ID]\n"
                + "WHERE  UR.[role_ID] = 6;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UserAccount b = new UserAccount(rs.getInt("user_ID"),
                        rs.getString("password_hash"),
                        rs.getString("username"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("img"),
                        rs.getString("status"),
                        rs.getDate("dateCreate"));
                list.add(b);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Lấy ra tất cả tài khoản nhân viên và admin
    public ArrayList<EmployeeAccount> getAllEmployeeAccount() {
        ArrayList<EmployeeAccount> list = new ArrayList<>();
        String sql = "SELECT UR.role_ID, UA.*\n"
                + "FROM [SWP].[dbo].[UserAccounts] UA\n"
                + "LEFT JOIN [SWP].[dbo].[UserRole] UR\n"
                + "ON UA.[user_ID] = UR.[user_ID]\n"
                + "WHERE UR.[role_ID] != 6;";  // roleID:6 = user

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                EmployeeAccount b = new EmployeeAccount(
                        rs.getInt("role_ID"),
                        rs.getInt("user_ID"),
                        rs.getString("password_hash"),
                        rs.getString("username"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("img"),
                        rs.getString("status"),
                        rs.getDate("dateCreate"));
                list.add(b);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Tìm kiếm tài khoản nguời dùng bằng fullName
    public ArrayList<UserAccount> searchUserAccount(String fullName) {
        ArrayList<UserAccount> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    UA.*\n"
                + "FROM \n"
                + "    [SWP].[dbo].[UserAccounts] UA\n"
                + "LEFT JOIN \n"
                + "    [SWP].[dbo].[UserRole] UR\n"
                + "ON \n"
                + "    UA.[user_ID] = UR.[user_ID]\n"
                + "WHERE \n"
                + "    UR.[user_ID] IS NULL\n"
                + "    AND UA.[full_name] LIKE ?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + fullName + "%");  // Properly set the parameter with wildcards
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UserAccount b = new UserAccount(rs.getInt("user_ID"),
                        rs.getString("password_hash"),
                        rs.getString("username"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("img"),
                        rs.getString("status"),
                        rs.getDate("dateCreate"));
                list.add(b);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Tìm kiếm tài khoản nhân viên bằng fullName
    public ArrayList<EmployeeAccount> searchEmployeeAccount(String fullName) {
        ArrayList<EmployeeAccount> list = new ArrayList<>();
        String sql = "SELECT UR.role_ID, UA.*\n"
                + "FROM [SWP].[dbo].[UserAccounts] UA\n"
                + "LEFT JOIN [SWP].[dbo].[UserRole] UR\n"
                + "ON UA.[user_ID] = UR.[user_ID]\n"
                + "WHERE UR.[user_ID] IS NOT NULL\n"
                + "AND UA.[full_name] LIKE ?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + fullName + "%");  // Properly set the parameter with wildcards
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                EmployeeAccount b = new EmployeeAccount(
                        rs.getInt("role_ID"),
                        rs.getInt("user_ID"),
                        rs.getString("password_hash"),
                        rs.getString("username"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("img"),
                        rs.getString("status"),
                        rs.getDate("dateCreate"));
                list.add(b);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Lấy ra 1 tài khoản người dùng bằng UserID
    public UserAccount getUserAccountByUserID(int UserID) {
        String sql = "SELECT * FROM [dbo].[UserAccounts] where [user_ID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, UserID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                UserAccount user = new UserAccount(rs.getInt("user_ID"),
                        rs.getString("password_hash"),
                        rs.getString("username"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("img"),
                        rs.getString("status"),
                        rs.getDate("dateCreate"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Lấy ra 1 tài khoản người dùng bằng userName
    public UserAccount getUserAccountByUserName(String UserName) {
        String sql = "SELECT * FROM [dbo].[UserAccounts] where username =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, UserName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                UserAccount user = new UserAccount(rs.getInt("user_ID"),
                        rs.getString("password_hash"),
                        rs.getString("username"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("img"),
                        rs.getString("status"),
                        rs.getDate("dateCreate"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Lấy ra 1 tài khoản người dùng bằng email
    public UserAccount getUserAccountByEmail(String email) {
        String sql = "SELECT * FROM [dbo].[UserAccounts] where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                UserAccount user = new UserAccount(rs.getInt("user_ID"),
                        rs.getString("password_hash"),
                        rs.getString("username"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("img"),
                        rs.getString("status"),
                        rs.getDate("dateCreate"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Chỉnh sửa người dùng khi có đối 1 tượng UserAccount
    public void updateUserAccount(UserAccount u, String address) {
        try {
            String sql = " UPDATE [UserAccounts] SET [password_hash] = ?, [username] = ?,[full_name] = ?,[email] = ?,[phone_number] = ?,[img] = ?,[address] = ? WHERE [user_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, u.getPassword());
            st.setString(2, u.getUserName());
            st.setString(3, u.getFull_Name());
            st.setString(4, u.getEmail());
            st.setString(5, u.getPhone_number());
            st.setString(6, u.getImg());
            st.setString(7, address);
            st.setInt(8, u.getUse_ID());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // Update Address by addressID
    public void updateAddress(Address address) {
        try {
            String sql = " UPDATE [Address] SET [address] = ?, [user_ID] = ? WHERE [address_id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, address.getAddress());
            st.setInt(2, address.getUserId());
            st.setInt(3, address.getAddressId());

            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa 1 tài khoản người dùng bằng UserID
    public void deleteUserAccountByUserID(int userId) {
        try {
            String sql = "delete from [UserAccounts] where [user_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa FeedBack 1 tài khoản người dùng bằng UserID
    public void deleteFeadBackByUserID(int userId) {
        try {
            String sql = "delete from [Feedback] where [user_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa Address 1 tài khoản người dùng bằng UserID
    public void deleteAddressByUserID(int userId) {
        try {
            String sql = "delete from [Address] where [user_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa Order 1 tài khoản người dùng bằng UserID
    public void deleteOrderByUserID(int userId) {
        try {
            String sql = "delete from [Order] where [user_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa 1 tài khoản nhân viên bằng UserID
    public void deleteEmployeeAccountByID(int userId) {

        try {
            deleteUserRole(userId);
            String sql = "delete from [UserAccounts] where [user_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // thêm 1 tài khoản người dùng
    public void insertUserAccount(UserAccount u, String address) {
        try {
            String sql = "insert into [UserAccounts]([password_hash],[username],[full_name],[email],[phone_number],[img],[status],[dateCreate],[address]) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, u.getPassword());
            st.setString(2, u.getUserName());
            st.setString(3, u.getFull_Name());
            st.setString(4, u.getEmail());
            st.setString(5, u.getPhone_number());
            st.setString(6, u.getImg());
            st.setString(7, u.getStatus());
            st.setDate(8, u.getDateCreate());
            st.setString(9, address);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // thêm 1 địa chỉ tài khoản người dùng
//    public void insertAddressUserAccount(String address, int user_ID) {
//        try {
//            String sql = "insert into [UserAccounts]([address],[user_ID]) values(?,?)";
//            PreparedStatement st = connection.prepareStatement(sql);
//
//            st.setString(1, address);
//            st.setInt(2, user_ID);
//            st.executeUpdate();
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//    }

    // getLastInsertedUserAccountId()
    public int getLastInsertedUserAccountId() {
        int user_Id = 0;
        try {
            String sql = "SELECT TOP 1 [user_ID] FROM [SWP].[dbo].[UserAccounts] ORDER BY [user_ID] DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                user_Id = rs.getInt("user_ID");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return user_Id;
    }

    // Lấy ra danh sách địa chỉ của 1 người dùng bằng user_ID
    public ArrayList<Address> getAddressByUserID(int userID) {
        ArrayList<Address> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Address] where [user_ID] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Address a = new Address(rs.getInt("address_id"),
                        rs.getString("address"),
                        rs.getInt("user_ID")
                );
                list.add(a);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Update Address by addressID
    public void updateStatusAccount(int uid, String status) {
        try {
            String sql = " UPDATE [UserAccounts] SET [status] = ? WHERE [user_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, status);
            st.setInt(2, uid);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

// ROLE==============================================================================================================================
    // lấy ra tất cả các Role
    public ArrayList<Role> getAllRole() {
        ArrayList<Role> list = new ArrayList<>();
        String sql = "SELECT * FROM [Role]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role r = new Role(rs.getInt(1),
                        rs.getString(2));
                list.add(r);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // thêm 1 role vào 1 UserAccount
    public void insertUserRole(int uID, int roleID) {
        try {
            String sql = "insert into [UserRole]([user_ID],[role_ID]) values(?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, uID);
            st.setInt(2, roleID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // Xoá role của account
    public void deleteUserRole(int uID) {

        try {
            String sql = "delete from [UserRole] where [user_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    // Kiểm tra 1 tài khoản là nhân viên hay người dùng bằng UserID
    public UserRole getUserRoleByUserID(int UserID) {
        String sql = "SELECT * FROM [dbo].[UserRole] where user_ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, UserID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                UserRole user = new UserRole(
                        rs.getInt(1),
                        rs.getInt(2)
                );
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // thêm 1 Role
    public void insertRole(String name) {
        try {
            String sql = "insert into [Role]([role_Name]) values(?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);

            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // xóa 1 Role by RoleID
    public void deleteRoleByID(int roleID) throws Exception {

        try {
            deleteUserRole(roleID);
            String sql = "delete from [Role] where [role_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            st.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }

    // lấy ra 1 role theo tên roleName
    public Role getRoleByName(String roleName) {
        String sql = "SELECT * FROM [dbo].[Role] where [role_Name]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, roleName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role role = new Role(
                        rs.getInt(1),
                        rs.getString(2)
                );
                return role;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // lấy ra roleName theo tên roleID
    public String getRoleNameByID(int roleID) {
        String sql = "SELECT * FROM [dbo].[Role] where [role_ID]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(2);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        AdminDAO dao = new AdminDAO();
        ArrayList<Product> u = dao.getAllProduct();

//        for (ImgProduct userAccount : u) {
//            System.out.println(userAccount);
//        }
//        System.out.println(dao.getSubCategoryByID(5));
////        Product p = new Product(10, "sfdsfds", "sfdsf", 5, "sdfsd", "fsdf", 3, 10, 7);
////        dao.insertProduct(p);
//
        ArrayList<ProductSizeColor> categories = dao.getAllProductSizeColorByPID(68);
        for (Product category : u) {
            System.out.println(category);
        }
//        }
//        System.out.println(dao.getUserAccountByUserID(3));
//        System.out.println(dao.getLastInsertedUserAccountId());
//            dao.deleteOrderByUserID(2);
//            dao.deleteAddressByUserID(2);
//            dao.deleteFeadBackByUserID(2);
//            dao.deleteUserAccountByUserID(2);
//dao.updateStatusAccount(2, "active");
//            System.out.println(dao.getProductSizeColorByID(1, 1, 33));
//            dao.updateProductColorSize(1, 1, 33, 50);
//        Product p = new Product(123, "", "none", 0, "Giay Cao", 0, 1, 0);
//        System.out.println(dao.insertProduct(p));
        System.out.println(dao.getDiscountByName("womanday"));
        try {
            dao.deleteSubCategoryByID(2);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
